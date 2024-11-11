# REI3 development & testing dockerfile - do not use in production
# Prepared by Gabriel Herbert (Lean Softworks GmbH)
FROM ubuntu:24.10

ARG r3_db_host
ARG r3_db_name
ARG r3_db_user
ARG r3_db_pass
ARG r3_os_arch
ARG r3_version
ARG im_policy

# setup environment
# * Create directories: App + data 
# * Install dependencies: ImageMagick, Ghostscript, PostgreSQL-Client, root CAs
# * Enable PDF processing for ImageMagick
RUN bash -c 'mkdir -p /opt/r3/data/{certificates,files,temp,transfer}' \
	&& apt-get update \
	&& apt-get install imagemagick ghostscript postgresql-client ca-certificates -y \
	&& update-ca-certificates \
	&& if [ -f $im_policy ] ; then sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/g' $im_policy ; else echo no file $im_policy ; fi

# setup REI3 proper
# * Extract files from official package: Binary + config template
# * Overwrite config settings: DB hostname, web server port
# * Set permissions
# * Delete release package
WORKDIR /opt/r3
ADD https://rei3.de/downloads/REI3_${r3_version}_${r3_os_arch}_linux.tar.gz .
RUN tar -xvf REI3_${r3_version}_${r3_os_arch}_linux.tar.gz r3 config_template.json \
	&& sed -i "s/localhost/${r3_db_host}/g" config_template.json \
	&& sed -i "s/443/80/g" config_template.json \
	&& sed -i "s/\"name\": \"app\"/\"name\": \"${r3_db_name}\"/g" config_template.json \
	&& sed -i "s/\"user\": \"app\"/\"user\": \"${r3_db_user}\"/g" config_template.json \
	&& sed -i "s/\"pass\": \"app\"/\"pass\": \"${r3_db_pass}\"/g" config_template.json \
	&& chmod 755 r3 && chmod 644 config_template.json \
	&& rm REI3_${r3_version}_${r3_os_arch}_linux.tar.gz

# run REI3 on HTTP
EXPOSE 80
CMD ["/opt/r3/r3", "-run", "-http", "-config", "/opt/r3/data/config.json"]

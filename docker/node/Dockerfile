FROM node
RUN apt-get update
#RUN apt-get install libnss3-dev libatk-bridge2.0-dev libx11-xcb1 libdrm-dev libxkbcommon-dev libgtk-3-dev libasound2-dev --yes

WORKDIR /var/www

# Add user for  application
#RUN groupadd -g 1000 www
#RUN useradd -u 1000 -ms /bin/sh -g www www
# Copy existing application directory permissions
#COPY --chown=www:www . /var/www
# Change current user to www
#USER www

#RUN npm install
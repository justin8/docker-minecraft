FROM justin8/archlinux
MAINTAINER justin@dray.be

RUN pacman -Syq --noprogressbar --noconfirm java-runtime-headless

# Placing a 'conf.override' file in the /minecraft mount will 
# override any default settings. Missing settings will use defaults.
# Use the conf.defaults file for examples of all possible settings
VOLUME "/minecraft"

EXPOSE 8080 9090
ADD conf.defaults /conf.defaults
ADD start.sh /start.sh

CMD /start.sh

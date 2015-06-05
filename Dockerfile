FROM justin8/archlinux
MAINTAINER justin@dray.be

RUN pacman -Syq --noprogressbar --noconfirm java-runtime-headless libcups fontconfig && pacman -Scc

# Placing a 'conf.override' file in the /minecraft mount will 
# override any default settings. Missing settings will use defaults.
# Use the conf.defaults file for examples of all possible settings
VOLUME "/minecraft"

EXPOSE 25565
ADD conf.defaults /conf.defaults
ADD start.sh /start.sh

CMD /start.sh

FROM alpine
MAINTAINER justin@dray.be

RUN apk add --update openjdk8-jre
RUN apk info openjdk8-jre | grep -om1 '[0-9].[0-9.a-z-]*' > /version

VOLUME "/minecraft"

EXPOSE 25565
ADD conf.defaults /conf.defaults
ADD entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh

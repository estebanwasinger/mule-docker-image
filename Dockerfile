FROM hypriot/rpi-java

MAINTAINER esteban.wasinger@mulesoft.com

RUN cd ~ && wget http://s3.amazonaws.com/MuleEE/mule-ee-distribution-standalone-3.7.0.zip --no-check-certificate && echo "3387821b1d94d2d2dfc1f6192eaca132 mule-ee-distribution-standalone-3.7.0.zip" | md5sum -c

RUN cd /opt && unzip ~/mule-ee-distribution-standalone-3.7.0.zip && rm ~/mule-ee-distribution-standalone-3.7.0.zip && ln -s /opt/mule-enterprise-standalone-3.7.0 /opt/mule

RUN cd /opt/mule/apps && wget https://dl.dropboxusercontent.com/u/21504155/retrieve-mule-app-zip-2.zip --no-check-certificate && rm -rf default

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081
EXPOSE 8082

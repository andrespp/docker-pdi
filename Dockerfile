#https://github.com/zhicwu/docker-pdi-ce 
FROM openjdk:8
MAINTAINER Andre Pereira andrespp@gmail.com

# Set Environment Variables
ENV PDI_VERSION=7.1 PDI_BUILD=7.1.0.0-12 \
	PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/data-integration \
	KETTLE_HOME=/data-integration 

# Download PDI
RUN wget --progress=dot:giga http://downloads.sourceforge.net/project/pentaho/Data%20Integration/${PDI_VERSION}/pdi-ce-${PDI_BUILD}.zip \
	&& unzip -q *.zip \
	&& rm -f *.zip \
	&& mkdir /jobs

# Aditional Drivers
WORKDIR $KETTLE_HOME

RUN wget https://downloads.sourceforge.net/project/jtds/jtds/1.3.1/jtds-1.3.1-dist.zip \
	&& unzip jtds-1.3.1-dist.zip -d lib/ \
	&& rm jtds-1.3.1-dist.zip

# First time run
RUN pan.sh -file ./plugins/platform-utils-plugin/samples/showPlatformVersion.ktr \
	&& kitchen.sh -file samples/transformations/files/test-job.kjb

VOLUME /jobs

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]

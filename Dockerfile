FROM resin/armv7hf-debian

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install wget && \
    mkdir -p /opt/domoticz && \
    cd /opt/domoticz && \
	wget https://releases.domoticz.com/releases/release/domoticz_linux_armv7l.tgz && \
	tar xvfz domoticz_linux_armv7l.tgz && \
	rm domoticz_linux_armv7l.tgz && \
	apt-get clean all && \
    	rm -r /var/lib/apt/lists/*

RUN [ "cross-build-end" ]  

EXPOSE 80
ENTRYPOINT ["/opt/domoticz/domoticz"]
CMD ["-www", "80", "-dbase", "/var/domoticz/domoticz.db", "-log", "/var/log/domoticz.log", "-loglevel", "1"]


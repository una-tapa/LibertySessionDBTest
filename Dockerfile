# Liberty Dockerfile Sample
# This is to test SessionDB configuration


##########################################
# Get the latest websphere-liberty
##########################################
FROM  websphere-liberty

##########################################
# Copy test program (All credit to Takakiyo-san) 
##########################################
ADD testServer.zip /opt/ibm

##########################################
# If any patch needs to be applied, uncomment. 
# ADD 17002-wlp-archive-TFPIxxxx.jar /opt/ibm
##########################################

##########################################
# Change workdir 
##########################################
WORKDIR /opt/ibm

##########################################
# Become root 
# Install unzip 
# Unzip testServer.xip 
##########################################
USER root
RUN apt-get update
RUN apt-get install unzip 
RUN apt-get cleanup 
RUN unzip testServer.zip

##########################################
# In case this needs to be run on ICP, make sure to add..
# USER 1001
# Add needs to have flag --chown=1001:0
##########################################

##########################################
# Apply patch 
# RUN java -jar 17002-wlp-archive-TFPISession.jar --installLocation wlp --suppressInfo
##########################################

##########################################
# Add properties to activate WELD code 
##########################################
Add bootstrap.properties /opt/ibm/wlp/usr/servers/test1

##########################################
# If playing with server.xml, "Add" should drop the filename from destination to overwrite. 
##########################################
Add server.xml /opt/ibm/wlp/usr/servers/test1

##########################################
# Overwrite the default command defined in the Liberty Docker image
##########################################
CMD [ "bash" ]
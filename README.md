### About this repo

This repository contains Docker file.  It creates image to test websphere-liberty SessionDB function, especially for CDI @SessionScoped beans. It helps us see how updated object is saved to the database for various Session Database configuration, 

The test program is by Takakiyo-san (https://github.com/takakiyo)
Its configuration contains weld property by Ben (https://github.com/benjamin-confino) 
PH00738    (https://www-01.ibm.com/support/docview.wss?uid=swg1PH00738) 

Session Database config reference.   https://www.ibm.com/support/knowledgecenter/en/SSEQTP_liberty/com.ibm.websphere.liberty.autogen.base.doc/ae/rwlp_config_httpSessionDatabase.html


### Build
```
docker build -t ben-takakiyosan .
```

### Execution
```
docker run -it -p 1234:9080 -p 1235:9443 ben-takakiyosan 
```

### Test - Starting server (Inside the docker container) 
```
cd /opt/ibm/wlp/bin
server run test1
```

### Test - Access app from browser to make updates to the CDI object. 
```
http://(docker-host):1234/SessionUpdateTest/
```

### Get trace
```
docker cp (container_name):/logs/trace.log trace.log
```

### Clean up
```
docker ps -a  //to look for container_name
docer rm (container_name)
docker rmi ben-takakiyosan
```

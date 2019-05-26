### About this repo

This repository contains a Docker file, which creates an image to test websphere-liberty SessionDB function. 

The application creates CDI @SessionScoped Bean that is set to the current timestamp. 
The session is configured with derby database. 

By accessing following application URL 
   http://(docker-host:port)/SessionUpdateTest 
we can update the @SesscionScoped object when we want to update. 

The docker container lets us see if the updated object is written out to the database as expected. 
We can change session db config especially with ONLY_UPDATED_ATTRIBUTES, and either END_OF_SERVLET_SERVICE/TIME_BASED_WRITE to 
make sure the updated value makes it into database. 

The test program is by Takakiyo-san (https://github.com/takakiyo)

bootstrap.properties contains a weld property introduced by Ben (https://github.com/benjamin-confino) 
Details can be found here ->  PH00738    (https://www-01.ibm.com/support/docview.wss?uid=swg1PH00738) 

Session Database config reference (KC)
https://www.ibm.com/support/knowledgecenter/en/SSEQTP_liberty/com.ibm.websphere.liberty.autogen.base.doc/ae/rwlp_config_httpSessionDatabase.html


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

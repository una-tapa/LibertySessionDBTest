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

### Test - Access app from browser
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
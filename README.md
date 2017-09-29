# Build

    java-jmx-in-docker-sample-app>./mvnw package
    java-jmx-in-docker-sample-app>docker build -t java-jmx-in-docker-sample-app:latest .
    
    
# docker-machine on windows
Here the docker-machine on windows is sitting 
    
    java-jmx-in-docker-sample-app>docker run -e "HOST=192.168.99.100" -p 30000:30000 -p 5005:5005  java-jmx-in-docker-sample-app:latest

Expected output

    + set -e
    + '[' -z 192.168.99.100 ']'
    + export JMX_PORT=30000
    + JMX_PORT=30000
    + java -Dsun.management.jmxremote.level=FINEST -Dsun.management.jmxremote.handlers=java.util.logging.ConsoleHandler -Djava.util.logging.ConsoleHandler.level=FINEST -Dcom.sun.management.jmxremote.local
    .only=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=30000 -Dcom.sun.management.jmxremote.rmi.port=30000 -Djava.rm
    i.server.hostname=192.168.99.100 -jar /opt/app/app.jar
    10:11:19.613 [main] INFO  com.github.cstroe.loopapp.Main - Waiting ... 0
    10:11:24.649 [main] INFO  com.github.cstroe.loopapp.Main - Waiting ... 10
    
    
## Jconsole

    jconsole 192.168.99.100:30000
   
Success!      



# docker on Linux EC2 host
Here the linux host machhine private ip address is 10.101.85.182 

[ec2-user@ip-10-101-85-182 java-jmx-in-docker-sample-app-master]$ docker run -e "HOST=10.101.85.182" -p 30000:30000 -p 5005:5005  java-jmx-in-docker-sample-app:latest

Expected output

    + set -e
    + '[' -z 10.101.85.182 ']'
    + export JMX_PORT=30000
    + JMX_PORT=30000
    + java -Dsun.management.jmxremote.level=FINEST -Dsun.management.jmxremote.handlers=java.util.logging.ConsoleHandler -Djava.util.logging.ConsoleHandler.level=FINEST -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=30000 -Dcom.sun.management.jmxremote.rmi.port=30000 -Djava.rmi.server.hostname=10.101.85.182 -jar /opt/app/app.jar
    10:53:49.479 [main] INFO  com.github.cstroe.loopapp.Main - Waiting ... 0
    10:53:54.483 [main] INFO  com.github.cstroe.loopapp.Main - Waiting ... 10
    10:53:59.484 [main] INFO  com.github.cstroe.loopapp.Main - Waiting ... 20
    10:54:04.486 [main] INFO  com.github.cstroe.loopapp.Main - Waiting ... 30
    10:54:09.488 [main] INFO  com.github.cstroe.loopapp.Main - Waiting ... 40

## Jconsole

    jconsole 10.101.85.182:30000
   
Success!      


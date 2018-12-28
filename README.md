##Github
https://github.com/sylvievdb/spring-boot-with-docker

###Tutorial
https://spring.io/guides/gs/spring-boot-docker/

##Spring boot applicatie opstarten zonder docker
java -jar target/spring-boot-with-docker.1.0-SNAPSHOT.jar --server.port=8090

##Opzetten docker met chocolatey
https://hemanshubhojak.com/2016/05/11/settingup-docker-windows-chocolatey.html

##Maven Wrapper
Maven wrapper zorgt ervoor dat maven niet moet aanwezig zijn op je classpath. Indien maven niet aanwezig is zal 
deze geïnstalleerd worden door de wrapper.
Onderstaande installeert maven wrapper

_mvn -N io.takari:maven:wrapper_

##Build docker container met Maven
_eval $(docker-machine env springboot)_

Ervoor zorgen dat de voor het opstarten van de docker container niet via de vdab proxy wordt gegaan: 
_export no_proxy=$(docker-machine ip springboot)_

_./mvnw install dockerfile:build_

##TNSLSNR.EXE bezet poort 8080
Dit is een onderdeel van de oracle database. Onderstaande commmando's passen de poort aan.

_C:\>sqlplus /nolog_

_SQL> connect_
Enter user-name: system
_Enter password: <enter password if will not be visible>_

_SQL> Exec DBMS_XDB.SETHTTPPORT(3010); [Assuming you want to have HTTP going to this port]    
PL/SQL procedure successfully completed._

_SQL>quit_

##Opstarten applicatie via docker
docker run -d -p 8090:8090 --name springboot -t sylvievdb/spring-boot-with-docker
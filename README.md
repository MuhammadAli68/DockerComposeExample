# DockerComposeExample
+This repository demonstrates deployment of multiple containers using docker-compose.
+There are 2 Dockerfile:
- Main
  - Dockerfile # Belongs to web application
  - db
      - Dockerfile # Belongs to database

+This project deploys expressjs web server and postgreSQL database server.
# Breakdown of docker-compose.yml
+ ### Web Application
![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/918480fb-aa52-4d33-8ef9-32ca2845af1d)

  - Uses Dockerfile for web application; specified by the "build" key
  - The "replicas" key specifies the number of containers of web that will be deployed which in out case is 3. This has been done to demonstrate scaling
  - The "ports" does not include any port mapping. This is to leave port mapping to docker daemon otherwise there are conflicts at build time
  - The "depends on" key prevents the web server containers to be built before the db server.
+ ### DB Server
![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/be1c3774-a0a9-47dc-8c20-7748aba5ec9b)

   - Uses the Dockerfile present inside the db folder
   - The Dockerfile copies a backup shell script into /usr/local/bin and runs it to set a backup schedule of db. The shell script is specified by the "args" key.
   - The "environment" key specify the database that will be used by our web application, the user and the password for accessing the database.
   - Under the "volumes" key the 2 volumes "db-data" and the "db-backups" are being attached. The "db-data" holds the database data persistnentlt and the "db-backup" holds the sheduled backups of the database.

# Building Docker Compose Project
+ Run the following command
  - <code>docker-compose up --scale web=3</code>
  - Output:
    

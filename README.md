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
   - The Dockerfile copies a backup shell script into /usr/local/bin and runs it to take a backup of db. The shell script is specified by the "args" key.
   - The "environment" key specify the database that will be used by our web application, the user and the password for accessing the database.
   - Under the "volumes" key the 2 volumes "db-data" and the "db-backups" are being attached. The "db-data" holds the database data persistnentlt and the "db-backup" holds the backups of the database.

# Building Docker Compose Project
+ Run the following command
  - <code>docker-compose up --scale web=3</code>
  - Output:
    <code>
    PS C:\Users\M.Ali\Desktop\DockerComposeExample> docker-compose up --scale web=3
[+] Running 7/4
 ✔ Network dockercomposeexample_default      Created                                                                                                                                        0.0s 
 ✔ Volume "dockercomposeexample_db-data"     Created                                                                                                                                        0.0s 
 ✔ Volume "dockercomposeexample_db-backups"  Created                                                                                                                                        0.0s 
 ✔ Container dockercomposeexample-db-1       Created                                                                                                                                        0.0s 
 ✔ Container dockercomposeexample-web-3      Created                                                                                                                                        0.0s 
 ✔ Container dockercomposeexample-web-1      Created                                                                                                                                        0.1s 
 ✔ Container dockercomposeexample-web-2      Created                                                                                                                                        0.1s 
Attaching to dockercomposeexample-db-1, dockercomposeexample-web-1, dockercomposeexample-web-2, dockercomposeexample-web-3
dockercomposeexample-db-1   | The files belonging to this database system will be owned by user "postgres".
dockercomposeexample-db-1   | This user must also own the server process.
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | The database cluster will be initialized with locale "en_US.utf8".
dockercomposeexample-db-1   | The default database encoding has accordingly been set to "UTF8".
dockercomposeexample-db-1   | The default text search configuration will be set to "english".
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | Data page checksums are disabled.
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | fixing permissions on existing directory /var/lib/postgresql/data ... ok
dockercomposeexample-db-1   | creating subdirectories ...
dockercomposeexample-db-1   | ok
dockercomposeexample-db-1   | selecting dynamic shared memory implementation ... posix
dockercomposeexample-db-1   | selecting default max_connections ...
dockercomposeexample-db-1   | 100
dockercomposeexample-db-1   | selecting default shared_buffers ...
dockercomposeexample-db-1   | 128MB
dockercomposeexample-db-1   | selecting default time zone ... 
dockercomposeexample-db-1   | Etc/UTC
dockercomposeexample-db-1   | creating configuration files ...
dockercomposeexample-db-1   | ok
dockercomposeexample-db-1   | running bootstrap script ...
dockercomposeexample-db-1   | ok
dockercomposeexample-db-1   | performing post-bootstrap initialization ... 
dockercomposeexample-web-1  | App listening at http://localhost:3000
dockercomposeexample-web-2  | App listening at http://localhost:3000
dockercomposeexample-db-1   | ok
dockercomposeexample-db-1   | syncing data to disk ... 
dockercomposeexample-web-3  | App listening at http://localhost:3000
dockercomposeexample-db-1   | ok
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | Success. You can now start the database server using:
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   |     pg_ctl -D /var/lib/postgresql/data -l logfile start
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | initdb: warning: enabling "trust" authentication for local connections
dockercomposeexample-db-1   | initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb.
dockercomposeexample-db-1   | waiting for server to start....
dockercomposeexample-db-1   | 2023-08-18 20:34:46.602 UTC [49] LOG:  starting PostgreSQL 15.4 (Debian 15.4-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bitdockercomposeexample-db-1   | 2023-08-18 20:34:46.606 UTC [49] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
dockercomposeexample-db-1   | 2023-08-18 20:34:46.618 UTC [52] LOG:  database system was shut down at 2023-08-18 20:34:46 UTC
dockercomposeexample-db-1   | 2023-08-18 20:34:46.625 UTC [49] LOG:  database system is ready to accept connections
dockercomposeexample-db-1   |  done
dockercomposeexample-db-1   | server started
dockercomposeexample-db-1   | CREATE DATABASE
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/init.sql
dockercomposeexample-db-1   | CREATE SCHEMA
dockercomposeexample-db-1   | CREATE TABLE
dockercomposeexample-db-1   | INSERT 0 1
dockercomposeexample-db-1   | INSERT 0 1
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | waiting for server to shut down...2023-08-18 20:34:46.883 UTC [49] LOG:  received fast shutdown request
dockercomposeexample-db-1   | .
dockercomposeexample-db-1   | 2023-08-18 20:34:46.888 UTC [49] LOG:  aborting any active transactions
dockercomposeexample-db-1   | 2023-08-18 20:34:46.890 UTC [49] LOG:  background worker "logical replication launcher" (PID 55) exited with exit code 1
dockercomposeexample-db-1   | 2023-08-18 20:34:46.890 UTC [50] LOG:  shutting down
dockercomposeexample-db-1   | 2023-08-18 20:34:46.895 UTC [50] LOG:  checkpoint starting: shutdown immediate
dockercomposeexample-db-1   | 2023-08-18 20:34:46.975 UTC [50] LOG:  checkpoint complete: wrote 932 buffers (5.7%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.017 s, sync=0.049 s, total=0.085 s; sync files=306, longest=0.014 s, average=0.001 s; distance=4245 kB, estimate=4245 kB
dockercomposeexample-db-1   | 2023-08-18 20:34:46.979 UTC [49] LOG:  database system is shut down
dockercomposeexample-db-1   |  done
dockercomposeexample-db-1   | server stopped
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | PostgreSQL init process complete; ready for start up.
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 
dockercomposeexample-db-1   | 2023-08-18 20:34:47.008 UTC [1] LOG:  starting PostgreSQL 15.4 (Debian 15.4-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
dockercomposeexample-db-1   | 2023-08-18 20:34:47.009 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
dockercomposeexample-db-1   | 2023-08-18 20:34:47.009 UTC [1] LOG:  listening on IPv6 address "::", port 5432
dockercomposeexample-db-1   | 2023-08-18 20:34:47.015 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
dockercomposeexample-db-1   | 2023-08-18 20:34:47.026 UTC [67] LOG:  database system was shut down at 2023-08-18 20:34:46 UTC
dockercomposeexample-db-1   | 2023-08-18 20:34:47.034 UTC [1] LOG:  database system is ready to accept connections
    </code>
![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/d8e1e238-e6be-4922-ab5f-11a9f35a0f55)
+ In the docker client click on one of the port mappings of the web servers. This will open the browser on the url http://localhost:PORT
+ The web server has 2 pages. http://localhost:PORT/ and http://localhost:PORT/new-feature
+ The following shows output of both pages:
  ![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/5c1e6805-15b5-4f18-8a57-65ced815a4e2)
  ![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/a76710ed-b052-415c-981b-287603afc647)
+ Similarly we can open The other web servers to show scaling:
  - ![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/18c948a6-2894-4d22-b6e9-372c019043d1)
  - ![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/22f408ad-5840-4c59-9c44-b2e97eef9353)
+ Head over to docker client and then volumes. There you will see 2 volumes named db-data and db-backups
  ![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/4b49df59-1cfc-46b5-b6c9-555a6938d421)
+ The db-data holds the database data persistently
  ![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/6e02bafb-7404-49fb-89ed-2de28bdc2e1b)
+ The db-backups holds the backups of the database. Please note that this backup has to be created manually after executing the executable shell file at "/usr/local/bin/backup.sh". Therefore the backup is not present initially.
  ![image](https://github.com/MuhammadAli68/DockerComposeExample/assets/57432644/5eb1fa2d-6489-480e-9a68-ab4afc5bc6e6)
+ To create a manual backup of database:
  - Open terminal in db server.
  - Go to /usr/local/bin by using command "cd /usr/local/bin".
  - Then run command "ls" to check if backup.sh is present.
  - After verifying, run command to execute "bash backup.sh".
  - This will prompt you for providing the password. It is the same password as in the environment variables specified for accessing the database. you can copy it from the docker-compose.yml file.
  - After providing the password, backup is created. You can go to "/backups" directory using the command "cd /backups" to check presence of backup.


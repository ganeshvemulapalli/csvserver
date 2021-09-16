# Commads executed as part of the section Part I.
    ```sh
    docker run -d --name csvserver infracloudio/csvserver:latest

    docker logs csvserver

    sh gencsv.sh
    docker run -d -v $(pwd)/inputFile:/csvserver/inputdata --name csvserver infracloudio/csvserver:latest

    docker exec -it csvserver /bin/bash

    docker ps

    docker rm -f csvserver

    docker run -dp 9393:9300 -v $(pwd)/inputFile:/csvserver/inputdata -e CSVSERVER_BORDER=Orange --name csvserver infracloudio/csvserver:latest
    ```

# Instructions
  - Install Docker and docker-compose on your machine and run following commands,
    ```sh
    docker pull infracloudio/csvserver:latest
    docker pull prom/prometheus:v2.22.0
    ```
  - Clone this repository to your machine..
  - Use `bash` shell for all the operations, other shells like ksh, fish etc might cause unknown issues.
  - `cd` into the `solution` directory, and perform all the below steps from that directory.
    ```sh
    sh gencsv.sh
    docker run -dp 9393:9300 -v $(pwd)/inputFile:/csvserver/inputdata -e CSVSERVER_BORDER=Orange --name csvserver infracloudio/csvserver:latest
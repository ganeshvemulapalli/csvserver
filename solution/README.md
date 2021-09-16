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

# Instructions for running csvserserver container with docker run command
  - Install Docker and docker-compose on your machine and run following commands,
    ```sh
    docker pull infracloudio/csvserver:latest
    docker pull prom/prometheus:v2.22.0
    ```
  - Clone this repository to your machine.
  - Use `bash` shell for all the operations, other shells like ksh, fish etc might cause unknown issues.
  - `cd` into the `solution` directory, and perform all the below steps from that directory.
  - `gencsv.sh` if run without any arguments will create inputFile with 10 csv entries.
  - `gencsv.sh` if run with any argument (must be a non zero, positive integer), will create the same number of entries.
  - For example, the below will create inputFile with 100 csv entries
    ```sh
    sh gencsv.sh 100
    ```
    ```sh
    sh gencsv.sh
    docker run -dp 9393:9300 -v $(pwd)/inputFile:/csvserver/inputdata -e CSVSERVER_BORDER=Orange --name csvserver infracloudio/csvserver:latest
    ```
    The csvserver aplication will be accessible at http://localhost:9393

# Instructions for running csvserserver and prometheus containers with docker-compose.yml
  - Install Docker and docker-compose on your machine and run following commands,
    ```sh
    docker pull infracloudio/csvserver:latest
    docker pull prom/prometheus:v2.22.0
    ```
  - Clone this repository to your machine..
  - `cd` into the `solution` directory, and perform all the below steps from that directory.
    ```sh
    sh gencsv.sh
    docker-compose up
    ```
    The csvserver aplication will be accessible at http://localhost:9393
    The prometheus aplication will be accessible at http://localhost:9090
    Type csvserver_records in the query box of Prometheus. Click on Execute and then switch to the Graph tab.
    It should show a straight line graph with value 10(or the no of entries available in csvserver application) (consider shrinking the time range to 5m).
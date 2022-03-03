FROM amazonlinux:latest

WORKDIR /usr/test-scripts
COPY setup.sh .
RUN chmod +x ./setup.sh
RUN ./setup.sh

COPY testscripts.tar .
RUN tar -xvf testscripts.tar

COPY dockerversion.txt .

ENV DB2HOME=/root/go/src/github.com/ibmdb/clidriver
ENV IBM_DB_HOME=/root/go/src/github.com/ibmdb/clidriver
ENV CGO_CFLAGS=-I/root/go/src/github.com/ibmdb/clidriver/include
ENV CGO_LDFLAGS=-L/root/go/src/github.com/ibmdb/clidriver/lib
ENV LD_LIBRARY_PATH=/root/go/src/github.com/ibmdb/clidriver/lib:$LD_LIBRARY_PATH
ENV PATH=/root/nodejs/bin:$PATH

RUN npm install --unsafe-perm ibm_db

RUN node connect.js > node-result.txt
RUN go run connect.go > go-result.txt
RUN python3 connect.py > python-result.txt
RUN python3 emailtest.py






















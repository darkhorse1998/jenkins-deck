FROM kong/deck

RUN kong/deck --kong-addr http://172.23.144.1:8001 ping
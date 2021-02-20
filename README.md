# docker-xeams
Xeams eXtended Email And Messaging Server inside a container

#### Ports exposed
```
25/tcp
110/tcp
143/tcp
5272/tcp
```

#### Volumes
```
/opt/Xeams
```

_No params at the moment! Install directory_ `/opt/Xeams` _is constant!_

#### Run example
```
docker run -v $PWD/xeamsdata:/opt/Xeams -p 5272:5272 --name docker-xeams-container-name docker-xeams-image-name
```

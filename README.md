# xlrelease

```
XLR_VERSION=5.0.0
docker run \
    -p 5516:5516 \
    -v /data/xlrelease:/xl-server \
    --name=xlrelease \
    mjvdende/xlrelease:${XLR_VERSION}
```


### default username and password
    username: admin
    password: password

# xlrelease

```
XLR_VERSION=5.0.0
docker run \
    -p 80:5516 \
    -v /data/xlrelease:/opt/xl-release-${XLR_VERSION}-server \
    --name=xlrelease \
    mjvdende/xlrelease:${XLR_VERSION}
```

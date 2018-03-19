

## alpine-hass

```bash
docker run -d --name=hass -v /docker/hass:/config -v /etc/localtime:/etc/localtime:ro --net=host mkuhlmann/alpine-hass
```

```bash
docker run -d --name=hass -v /docker/hass:/config -v /etc/localtime:/etc/localtime:ro -p 8123:8123 mkuhlmann/alpine-hass
```


# ngnix-chrome-supervisord

Container contains html to pdf conversion service with chromium browser.

It runs supervisord with 2 processes:
- zenika/alpine-chrome with headless chromium browser listening on internal port 9222
- nodejs/express service to expose API listening on port 9223


nodejs/express service taken from  https://github.com/ahmedshabib/html-to-pdf-node-chrome

Public docker image: euknyaz/ngnix-chrome-supervisord:latest

# Build Image

```sh
build.sh 
```

# Run image in debug mode
```sh
run.sh
```

# Test

```sh
# run container in background
docker-compose up -d 
# run test script to convert html to pdf on the fly
sh test.sh
# or 
curl http://localhost:9223 \
  -H 'accept: application/json, text/plain, */*' \
  -H 'content-type: application/json' \
  --data-binary '{"content":"<p>Hello World</p>"}' \
  > test.pdf
```

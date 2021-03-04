curl http://localhost:9223 \
  -H 'accept: application/json, text/plain, */*' \
  -H 'content-type: application/json' \
  --data-binary '{"content":"<p>Hello World</p>"}' \
  > test.pdf

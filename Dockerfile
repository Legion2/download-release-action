FROM alpine

RUN apk add jq curl

COPY entrypoint.sh /entrypoint.sh
COPY gh-dl-release /gh-dl-release

ENTRYPOINT ["/entrypoint.sh"]

FROM alpine

LABEL "com.github.actions.name"="Download GitHub Release"
LABEL "com.github.actions.description"="Download the sources from Github Releases and extract it into a directory"
LABEL "com.github.actions.icon"="download"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/Legion2/download-release-action"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

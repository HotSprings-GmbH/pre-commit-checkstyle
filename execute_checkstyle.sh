#!/bin/bash

VERSION=$1
RELEASE_URL="https://api.github.com/repos/checkstyle/checkstyle/releases?per_page=100"
CHECKSTYLE_FOLDER=/src/.pre-commit/
CHECKSTYLE_JAR=$CHECKSTYLE_FOLDER/checkstyle-$VERSION.jar

mkdir -p $CHECKSTYLE_FOLDER


if [ -z "$VERSION" ]; then
  VERSION=$(curl https://api.github.com/repos/checkstyle/checkstyle/releases/latest | jq ".tag_name" | sed -r "s/.*e-(.*)\"/\1/")
  echo "No version provided, using latest version=\"$VERSION\""
fi


if test -f "$CHECKSTYLE_JAR"; then
  echo "$CHECKSTYLE_JAR exists."
else
  echo "Downloading checkstyle"
  VERSION_FOUND=$(curl -s $RELEASE_URL | jq ".[] | .assets[] | .browser_download_url" | grep "\-$VERSION/")
  if [ -z "$VERSION_FOUND" ]; then
    echo "$VERSION is could not found within the last 100 releases"
    exit 1
  else
    echo $VERSION_FOUND | xargs curl -L -o $CHECKSTYLE_JAR
  fi

fi

java -jar $CHECKSTYLE_JAR ${@:2}

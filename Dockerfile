FROM node:alpine

ENV PKG eslint-config-airbnb

RUN apk update && apk add --no-cache \
    curl \
    && npm install -g eslint \
    && npm info "$PKG@latest" peerDependencies --json \
    | command sed 's/[\{\},]//g ; s/: /@/g' \
    | xargs npm install -g "$PKG@latest" \

# Make a copy of Drupal core's .eslintrc.json.
RUN curl --silent --show-error -o ~/.eslintrc.json http://cgit.drupalcode.org/drupal/plain/core/.eslintrc.json

WORKDIR /app

CMD ["eslint", "."]
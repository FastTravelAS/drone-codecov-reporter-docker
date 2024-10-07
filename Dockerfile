FROM python:3.9-alpine

RUN apk add --no-cache gcc g++ musl-dev python3-dev

RUN pip install codecov-cli

WORKDIR /app

RUN mkdir -p /app/coverage

CMD ["codecovcli", "--help"]

FROM python:3.9-alpine AS builder

RUN apk add --no-cache gcc g++ musl-dev python3-dev

RUN pip install codecov-cli

RUN mkdir -p /app/coverage

FROM python:3.9-alpine

COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin/codecovcli /usr/local/bin/codecovcli

WORKDIR /app

RUN mkdir -p /app/coverage

CMD ["codecovcli", "--help"]

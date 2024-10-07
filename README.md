# Codecov Docker Image for Drone CI

This Docker image is designed to simplify the process of uploading code coverage reports to Codecov when using Drone CI. It's based on Python 3.9 Alpine and includes the necessary dependencies to run the Codecov CLI tool.

## Features

- Python 3.9 Alpine base image
- Pre-installed Codecov CLI
- Optimized for use with Drone CI

## Usage

### Dockerfile

The Dockerfile in this repository creates an image with the Codecov CLI pre-installed:

### Drone CI Configuration

To use this image in your Drone CI pipeline, add a step similar to the following in your `.drone.yml` file:

```yaml
steps:
  - name: codecov-report
    image: fasttravel/codecov-reporter-drone:latest
    commands:
      - codecovcli upload-process --disable-search -t $CODECOV_TOKEN -n 'job'-$DRONE_BUILD_NUMBER -f <coverage report file name>
    volumes:
      - name: coverage
        path: /drone/src/coverage
    environment:
      CODECOV_TOKEN:
        from_secret: codecov_token
    when:
      status:
        - success
```

## License

This project is licensed under the MIT License.


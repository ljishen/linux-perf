[![Build Status](https://travis-ci.org/ljishen/linux-perf.svg?branch=master)](https://travis-ci.org/ljishen/linux-perf)


# Linux Perf in Docker Container

perf is a Performance analysis tools for Linux. Now is available using `docker run`.


## Supported Tags

- [`4.9`](debian/Dockerfile), [`latest`](debian/Dockerfile)
- [`4.9-python3`](debian-python3/Dockerfile)


## Supported Architectures

[`amd64`](update.sh), [`arm64v8`](update.sh)


## Example Usage

```bash
docker run --rm --cap-add SYS_ADMIN ljishen/perf stat sleep 2
```

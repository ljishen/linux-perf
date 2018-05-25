[![Build Status](https://travis-ci.org/ljishen/linux-perf.svg?branch=master)](https://travis-ci.org/ljishen/linux-perf)


# Linux Perf in Docker Container

perf is a Performance analysis tools for Linux. Now is available using `docker run`.


## Supported Tags

- [`latest`](https://github.com/ljishen/linux-perf/tree/master/debian), [`4.9`](https://github.com/ljishen/linux-perf/tree/master/debian)
- [`4.9-python3`](https://github.com/ljishen/linux-perf/tree/master/debian-python3)


## Supported Architectures

`amd64`, `arm64v8`


## Example Usage

```bash
docker run --rm --cap-add SYS_ADMIN ljishen/perf stat sleep 2
```

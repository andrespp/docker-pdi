Docker Pentaho Data Integration
===============================

# Introduction

DockerFile for Pentaho Data Integration (a.k.a kettel / PDI) (https://sourceforge.net/projects/jasperserver/)

This image is based on `openjdk:8`.

PDI version on `latest` tag is `7.1`, build `7.1.0.0-12`. Check `tags` for more recent image versions under development.

This image is intendend to allow execution os PDI transformations and jobs throught command line. Neihter the UI (`Spoon`)  or the PDI server (`Carter`) are used on this image 

# Quick start

The easiest way to try this image is via docker compose:

## Basic Syntax

```
$ docker container run --rm pdi


Usage:	/entrypoint.sh COMMAND

Pentaho Data Integration (PDI)

Options:
  runj filename		Run job file
  runt filename		Run transformation file
  help		        Print this help
```

## Running Transformations

```
$ ls
dim_clifor.ktr

$ docker container run --rm -v $(pwd):/jobs pdi runt sample/dummy.ktr
```

## Running Jobs 

```
$ ls
dim_clifor.ktr

$ docker container run --rm -v $(pwd):/jobs pdi runj  sample/dummy.ktr
```

# Environment variables

This image uses several environment variables in order to control its behavior, and some of them may be required

| Environment variable | Default value | Note |
| -------------------- | ------------- | -----|
| TODO | none | |
| PDI\_VERSION | 7.1 | |
| |  | |

# Issues

If you have any problems with or questions about this image, please contact me
through a [GitHub issue](https://github.com/andrespp/docker-pdi/issues).


Docker Pentaho Data Integration
===============================

# Introduction

DockerFile for [Pentaho Data Integration](https://sourceforge.net/projects/pentaho/) (a.k.a kettel / PDI)

This image is intendend to allow execution os PDI transformations and jobs throught command line. Neihter the UI (`Spoon`)  or the PDI server (`Carter`) are available on this image.

# Quick start

## Basic Syntax

```
$ docker container run --rm andrespp/pdi

Usage:	/entrypoint.sh COMMAND

Pentaho Data Integration (PDI)

Options:
  runj filename		Run job file
  runt filename		Run transformation file
  help		        Print this help
```

## Running Transformations

```
$ docker container run --rm -v $(pwd):/jobs andrespp/pdi runt sample/dummy.ktr
```

## Running Jobs

```
$ docker container run --rm -v $(pwd):/jobs andrespp/pdi runj  sample/dummy.kjb
```

## Custom `kettle.properties`

In order to use a custom `kettle.properties`, you need to leave the file available in `/jobs/kettle.properties`.

```bash
$ # Custom properties in $(pwd)/kettle.properties
$ docker container run --rm -v $(pwd):/jobs andrespp/pdi runj  sample/dummy.kjb
```

# Environment variables

This image uses several environment variables in order to control its behavior, and some of them may be required

| Environment variable | Default value | Note |
| -------------------- | ------------- | -----|
| PDI\_VERSION | 7.1 | |
| |  | |

# Issues

If you have any problems with or questions about this image, please contact me
through a [GitHub issue](https://github.com/andrespp/docker-pdi/issues).


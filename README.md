<p align="center">
  <img
    src="https://raw.githubusercontent.com/EnvModelling/EnvModelling/main/images/environmental-modelling-banner.png"
    alt="Environmental Modelling"
    width="100%">
</p>

Computational models and practical exercises used in environmental science
teaching at **The University of Manchester**.

These repositories support two course units:

- **EART22001 – Environmental Modelling**
- **EART60071 – Measuring and Predicting 2**

The practicals introduce students to numerical modelling using Python and
Fortran, including ordinary differential equations, atmospheric parcel
models, pollutant dispersion, cloud and precipitation modelling, and
dynamical fluid models.

## Course pages

### EART22001 – Environmental Modelling

[Teaching materials and practicals](https://uom-maul1609.github.io/paul.connolly.webpages/teaching/eart22001/eart22001_course2.html)

| Topic | Repository |
|---|---|
| Approximate numerical methods | [approximate-methods-practical](https://github.com/EnvModelling/approximate-methods-practical) |
| Solar-system dynamics | [solar-system-model](https://github.com/EnvModelling/solar-system-model) |
| Atmospheric parcel and cloud microphysics | [bin-microphysics-model](https://github.com/EnvModelling/bin-microphysics-model) |
| Gaussian plume air-quality modelling | [gaussian-plume-model-practical](https://github.com/EnvModelling/gaussian-plume-model-practical) |
| Clouds and orographic precipitation | [simple-cloud-model](https://github.com/EnvModelling/simple-cloud-model) |
| Cartesian shallow-water modelling | [shallow-water-model-practical](https://github.com/EnvModelling/shallow-water-model-practical) |
| Shallow-water modelling on a sphere | [shallow-water-model-on-sphere](https://github.com/EnvModelling/shallow-water-model-on-sphere) |

### EART60071 – Measuring and Predicting 2

[Teaching materials and practicals](https://uom-maul1609.github.io/paul.connolly.webpages/teaching/eart60071/eart60071_course.html)

This unit uses a subset of the models above:

| Topic | Repository |
|---|---|
| Approximate numerical methods | [approximate-methods-practical](https://github.com/EnvModelling/approximate-methods-practical) |
| Atmospheric parcel and cloud microphysics | [bin-microphysics-model](https://github.com/EnvModelling/bin-microphysics-model) |
| Gaussian plume air-quality modelling | [gaussian-plume-model-practical](https://github.com/EnvModelling/gaussian-plume-model-practical) |
| Clouds and orographic precipitation | [simple-cloud-model](https://github.com/EnvModelling/simple-cloud-model) |
| Shallow-water modelling | [shallow-water-model-practical](https://github.com/EnvModelling/shallow-water-model-practical) |

## Research-led teaching

Several of the models used here are teaching versions of models also used
for research. Where appropriate, the repositories are maintained as forks
of the corresponding research repositories, preserving the connection
between the teaching model and its research development.

The teaching versions are configured and documented for the practical
exercises used in these course units.


## Running the models

### University modelling server

The practical classes normally run the models on a University Linux server.
Students connect using SSH, edit model inputs or source files, run the models
from the command line, and retrieve model output for analysis.

Access to the University modelling server is restricted to the University
campus network. You can therefore connect to the server from a personal
computer while on campus, but you cannot normally connect to it from home.

For practical classes and assessed work, follow the instructions on the
relevant course page and practical sheet.

### Working off campus with Docker

This repository also provides a Docker environment for running the models
locally on your own computer. It provides a consistent Linux environment
containing the compilers, Python packages, scientific libraries and other
software used by the models.

This is particularly useful if you want to practise the practical exercises
or experiment with the models away from campus. The local environment
supports the same SSH/SFTP-style workflow used with the University modelling
server, so you can practise connecting to a Linux system, working at the
command line, compiling and running models, and handling model output.

Once the Docker environment has been installed and the required images and
model repositories have been downloaded, running the models locally does not
require access to the University modelling server.

**For practical classes:** use the University modelling server as described
in the practical instructions.

**For independent practice:** you can use the University modelling server
while on campus or the Docker environment on a suitable personal computer.

The container supports both `linux/amd64` and `linux/arm64`.

## Quick start

### 1. Install Docker

Install Docker for your operating system. See the
[platform-specific installation guides](#installation-guides) below.

Check that Docker and Docker Compose are available:

```bash
docker --version
docker compose version
```

### 2. Get EnvModelling

```bash
git clone https://github.com/EnvModelling/EnvModelling.git
cd EnvModelling
```

Alternatively, download this repository as a ZIP file from GitHub and extract it.

### 3. Download and start the environment

```bash
docker compose pull
docker compose up -d
```

### 4. Connect using SSH

```bash
ssh -p 2022 student@localhost
```

Password:

```text
envmodelling
```

This password is deliberately simple because the supplied Compose
configuration exposes SSH only on `localhost`. Do not reuse it for other
systems.

After logging in you should start in:

```text
/home/student/work
```

or, equivalently:

```text
~/work
```

### 5. Clone the model you need

Clone model repositories **from inside `~/work`**. For example:

```bash
git clone https://github.com/EnvModelling/shallow-water-model-on-sphere.git
cd shallow-water-model-on-sphere
```

Then follow the relevant practical sheet or model README.

## Your files and persistent storage

> **Important:** Keep model repositories, model output and other work inside
> `~/work`.

Inside the container, `~/work` is mapped to:

```text
EnvModelling/student_work/
```

on your computer. Files there remain available when the container is stopped,
updated or replaced.

Files saved elsewhere inside the container are not intended to be persistent
and may be lost when the container is replaced.

## Stopping, restarting and updating

Leave the SSH session with:

```bash
exit
```

Stop the environment:

```bash
docker compose down
```

Start it again:

```bash
docker compose up -d
```

Update to the latest published environment:

```bash
docker compose pull
docker compose down
docker compose up -d
```

Files in `student_work/` are retained.

## SSH and SFTP

The local environment deliberately supports SSH and SFTP so that the workflow
is similar to the University modelling server.

```bash
ssh -p 2022 student@localhost
```

```bash
sftp -P 2022 student@localhost
```

See [`docs/ssh-sftp.md`](docs/ssh-sftp.md) for further guidance.

## Graphical applications and X11

X11 support is included for models and utilities that use graphical windows.
The host computer may require additional software or configuration.

See [`docs/x11.md`](docs/x11.md).

X11 is not required simply to retrieve model output: files in `~/work` are
also directly available in `student_work/` on the host computer.

## Installation guides

- [Windows](docs/windows.md)
- [macOS – Apple Silicon](docs/mac-apple-silicon.md)
- [macOS – Intel](docs/mac-intel.md)
- [Linux](docs/linux.md)
- [Chromebook](docs/chromebook.md)

The Docker image provides the same modelling environment across these
platforms; installation and optional X11 setup differ by operating system.


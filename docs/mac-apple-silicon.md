# EnvModelling on macOS --- Apple Silicon

This guide is for Macs with an Apple Silicon processor (M1, M2, M3, M4
or later). EnvModelling provides a native ARM64 Linux container.

The University modelling server remains the environment used in
practical classes. Docker is useful for practising the same modelling
workflow away from campus.

## 1. Install Docker Desktop

Install **Docker Desktop for Mac with Apple silicon** using the official
Docker instructions:

https://docs.docker.com/desktop/setup/install/mac-install/

Start Docker Desktop and wait until Docker is running.

You do **not** need to install Docker Engine separately.

## 2. Check Docker

Open **Terminal** and run:

``` bash
docker --version
docker compose version
```

Both should report version information.

You can check the architecture of your Mac with:

``` bash
uname -m
```

An Apple Silicon Mac normally reports `arm64`.

## 3. Get EnvModelling

``` bash
git clone https://github.com/EnvModelling/EnvModelling.git
cd EnvModelling
```

Alternatively, download the repository as a ZIP file from GitHub and
extract it.

## 4. Start EnvModelling

From the `EnvModelling` directory:

``` bash
docker compose pull
docker compose up -d
```

Check:

``` bash
docker compose ps
```

## 5. Connect using SSH

``` bash
ssh -p 2022 student@localhost
```

Password:

``` text
envmodelling
```

The first connection may ask you to accept the SSH host key.

You should arrive automatically in:

``` text
/home/student/work
```

Check with:

``` bash
pwd
```

## 6. Keep your work in `~/work`

**Always keep model repositories, output and other work in `~/work`.**

Inside Docker:

``` text
/home/student/work
```

is the same shared directory as:

``` text
EnvModelling/student_work
```

on your Mac.

For example:

``` bash
cd ~/work
git clone https://github.com/EnvModelling/shallow-water-model-on-sphere.git
```

Files in this directory survive container updates and replacement.

## 7. Stop, restart and update

Leave SSH:

``` bash
exit
```

Stop:

``` bash
docker compose down
```

Restart:

``` bash
docker compose up -d
```

Update:

``` bash
docker compose pull
docker compose down
docker compose up -d
```

Your `student_work` files are retained.

## Graphical applications

Most figures and animations written into `~/work` can simply be opened
from the Mac `student_work` folder.

For Linux graphical applications such as `ncview`, X11 is also
supported. On macOS this requires **XQuartz**. See [X11](x11.md).

For file transfer using the same workflow as the University server, see
[SSH and SFTP](ssh-sftp.md).

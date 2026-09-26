# EnvModelling on Linux

This guide runs EnvModelling using Docker Engine and the Docker Compose
plugin.

The University modelling server remains the environment used in
practical classes. Docker provides a local environment for independent
practice and research use.

## 1. Install Docker Engine

Use Docker's official installation instructions for your Linux
distribution:

https://docs.docker.com/engine/install/

Choose your distribution from that page and install **Docker Engine**
together with the **Docker Compose plugin**.

Avoid copying installation commands intended for a different Linux
distribution or release.

## 2. Check Docker

Run:

``` bash
docker --version
docker compose version
```

Also check that Docker can run a container using the test described in
Docker's installation instructions.

Depending on how Docker has been configured on your system, Docker
commands may require `sudo`. Docker's official post-installation
documentation explains how to allow a non-root user to run Docker:

https://docs.docker.com/engine/install/linux-postinstall/

Be aware that membership of the Docker group gives a user significant
privileges on the computer.

## 3. Get EnvModelling

``` bash
git clone https://github.com/EnvModelling/EnvModelling.git
cd EnvModelling
```

## 4. Start the environment

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

You should arrive in:

``` text
/home/student/work
```

## 6. Persistent work

Keep all model repositories and output in:

``` text
~/work
```

This maps to:

``` text
EnvModelling/student_work
```

on the Linux host.

For example:

``` bash
cd ~/work
git clone https://github.com/EnvModelling/shallow-water-model-on-sphere.git
```

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

Files in `student_work` are retained.

See [SSH and SFTP](ssh-sftp.md) for file transfer and [X11](x11.md) for
optional graphical applications.

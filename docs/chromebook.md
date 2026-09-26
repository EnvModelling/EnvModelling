# EnvModelling on Chromebook

Docker can be used on some Chromebooks through the Chromebook **Linux
development environment**, but support depends on the Chromebook model,
processor, available storage and any restrictions applied by the
organisation managing the device.

For this reason, Chromebook support should be treated as an optional
route rather than something that will work on every Chromebook.

## 1. Check whether Linux is available

In ChromeOS settings, look for the option to enable the **Linux
development environment**.

If the option is unavailable, or is disabled by an administrator, you
will not be able to use this Docker setup on that Chromebook.

Make sure the Linux environment has enough free disk space for Docker,
the EnvModelling image, model repositories and model output.

## 2. Open the Linux terminal

After enabling Linux, open the **Terminal** application.

Check the processor architecture:

``` bash
uname -m
```

Common results are:

``` text
x86_64
```

for Intel/AMD systems, or:

``` text
aarch64
```

for ARM64 systems.

EnvModelling publishes container images for both AMD64 and ARM64.

## 3. Install Docker Engine

Use the official Docker Engine installation documentation:

https://docs.docker.com/engine/install/

The Linux environment on many Chromebooks is Debian-based. Check the
operating system before following Debian instructions:

``` bash
cat /etc/os-release
```

Use the Docker instructions that match the distribution actually
reported by your Chromebook.

You need Docker Engine and the Docker Compose plugin.

## 4. Check Docker

``` bash
docker --version
docker compose version
```

## 5. Get EnvModelling

``` bash
git clone https://github.com/EnvModelling/EnvModelling.git
cd EnvModelling
```

## 6. Start EnvModelling

``` bash
docker compose pull
docker compose up -d
```

Check:

``` bash
docker compose ps
```

## 7. Connect

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

## 8. Keep your work in `~/work`

Keep model repositories and model output in:

``` text
~/work
```

This maps to the `student_work` directory in your EnvModelling checkout
and survives container replacement.

## Limitations

Chromebooks vary substantially. A University-managed device may prevent
Linux or Docker from being enabled, and some devices may have
insufficient memory or storage for larger model runs.

If Docker cannot be used on your Chromebook, use the University
modelling server while on campus.

Graphical X11 applications on ChromeOS require additional setup and are
not necessary for the basic modelling workflow. Where possible, view
generated files through the shared `student_work` directory instead.

See [SSH and SFTP](ssh-sftp.md) for the command-line file-transfer
workflow.

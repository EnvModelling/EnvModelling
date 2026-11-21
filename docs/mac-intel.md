# EnvModelling on macOS --- Intel

This guide is for Macs with an Intel processor. EnvModelling provides an
AMD64/x86-64 Linux container for these systems.

The University modelling server remains the environment used in
practical classes. Docker is useful for practising the modelling
workflow away from campus.

## 1. Check that your Mac can run the current Docker Desktop

Docker's supported macOS versions and hardware requirements change over
time. Check the current requirements before installing:

https://docs.docker.com/desktop/setup/install/mac-install/

Older Intel Macs may be unable to run a currently supported Docker
Desktop/macOS combination.

## 2. Install Docker Desktop

If your Mac meets the current requirements, install **Docker Desktop for
Mac with Intel chip** using the official instructions above.

Start Docker Desktop and wait until Docker is running.

You do **not** need to install Docker Engine separately.

## 3. Check Docker

Open **Terminal**:

``` bash
docker --version
docker compose version
```

An Intel Mac normally reports `x86_64` for:

``` bash
uname -m
```

## 4. Download EnvModelling

You do **not** need Git installed on macOS to use EnvModelling.

**Option 1 — Download ZIP (recommended for beginners)**

1. Visit [EnvModelling on GitHub](https://github.com/EnvModelling/EnvModelling).
2. Click the green **Code** button and select **Download ZIP**.
3. Extract the ZIP file. The extracted folder is normally named `EnvModelling-main`.
4. Open **Terminal** in the extracted folder (the folder containing `compose.yaml`).

**Option 2 — Clone with Git**

If you already have Git installed, open Terminal and run:

```bash
git clone https://github.com/EnvModelling/EnvModelling.git
cd EnvModelling
```

Git users can later run `git pull` to update the configuration files.

Whichever option you choose, run the Docker commands below **from the folder containing `compose.yaml`**. ZIP users need to download a fresh ZIP if the configuration files change; `docker compose pull` updates the Docker image only.

## 8. Start EnvModelling

```bash
docker compose pull
docker compose up -d
```

Check:

```bash
docker compose ps
```

## 8. Connect

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

## 8. Persistent work

Keep all model repositories and output in:

``` text
~/work
```

This is shared with the Mac directory:

``` text
EnvModelling/student_work
```

For example:

``` bash
cd ~/work
git clone https://github.com/EnvModelling/shallow-water-model-on-sphere.git
```

Files there survive container replacement.

## 8. Stop, restart and update

``` bash
exit
```

Then on the Mac:

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

See [SSH and SFTP](ssh-sftp.md) for file transfer and [X11](x11.md) for
optional graphical applications.

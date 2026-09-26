# EnvModelling on Windows

This guide sets up the local EnvModelling environment on a Windows
computer. It is useful for practising the modelling practicals away from
campus.

The University modelling server remains the environment used in
practical classes. Docker gives you a local Linux environment with a
similar SSH/SFTP workflow.

## 1. Install Docker Desktop

Install **Docker Desktop for Windows** from the official Docker
documentation:

https://docs.docker.com/desktop/setup/install/windows-install/

Docker Desktop normally uses **WSL 2** (Windows Subsystem for Linux).
Follow the Docker installer if it asks you to enable or update WSL 2,
and restart Windows if requested.

You do **not** need to install Docker Engine separately.

After installation, start Docker Desktop and wait until it reports that
Docker is running.

## 2. Check Docker

Open **PowerShell** or **Windows Terminal** and run:

``` powershell
docker --version
docker compose version
```

Both commands should report version information.

## 3. Get EnvModelling

If Git is installed:

``` powershell
git clone https://github.com/EnvModelling/EnvModelling.git
cd EnvModelling
```

If you do not have Git, download the EnvModelling repository as a ZIP
file from GitHub, extract it, and open PowerShell or Windows Terminal in
the extracted `EnvModelling` folder.

## 4. Start EnvModelling

From the `EnvModelling` folder:

``` powershell
docker compose pull
docker compose up -d
```

The first download can take some time because the image contains the
compilers, scientific libraries, Python packages and other software
needed by the models.

Check that the container is running:

``` powershell
docker compose ps
```

## 5. Connect using SSH

Windows includes an SSH client on most current installations. Connect
with:

``` powershell
ssh -p 2022 student@localhost
```

When asked for the password, enter:

``` text
envmodelling
```

The first time you connect, SSH may ask whether you trust the host key.
Check that you are connecting to `localhost` on port `2022`, then accept
it.

You should arrive in:

``` text
/home/student/work
```

Check with:

``` bash
pwd
```

## 6. Keep your work in `~/work`

**Always keep cloned model repositories, model output and other work in
`~/work`.**

This directory is shared with:

``` text
EnvModelling\student_work
```

on Windows. Files in this directory remain when the Docker container is
stopped, updated or replaced.

For example, from the SSH session:

``` bash
cd ~/work
git clone https://github.com/EnvModelling/shallow-water-model-on-sphere.git
```

Do not rely on files stored elsewhere inside the container being
retained after a container replacement.

## 7. Stop and restart

Leave SSH:

``` bash
exit
```

Then, in PowerShell from the `EnvModelling` folder:

``` powershell
docker compose down
```

Start it again with:

``` powershell
docker compose up -d
```

Your files in `student_work` are retained.

## 8. Update the environment

From the `EnvModelling` folder:

``` powershell
docker compose pull
docker compose down
docker compose up -d
```

## SFTP and graphical applications

See [SSH and SFTP](ssh-sftp.md) for file-transfer instructions.

Some graphical Linux programs require X11. See [X11](x11.md) if a
practical specifically requires this. Most generated figures and
animations can instead be opened directly from the Windows
`student_work` folder.

## Troubleshooting

If `docker` is not recognised, make sure Docker Desktop is installed and
running, then close and reopen PowerShell or Windows Terminal.

If Docker reports a WSL problem, follow the current Docker Desktop/WSL
instructions linked above.

If SSH cannot connect, check:

``` powershell
docker compose ps
```

and make sure the `envmodelling` container is running.

# SSH and SFTP

EnvModelling deliberately supports SSH and SFTP so that the local Docker
workflow resembles working on the University modelling server.

## SSH into the local environment

Start EnvModelling first:

``` bash
docker compose up -d
```

Then connect:

``` bash
ssh -p 2022 student@localhost
```

Password:

``` text
envmodelling
```

The SSH port is exposed only on `localhost` by the supplied
`compose.yaml`. The password is intended only for this local teaching
environment and must not be reused elsewhere.

After login you should start in:

``` text
/home/student/work
```

Check with:

``` bash
pwd
```

## Persistent work

`/home/student/work` (or `~/work`) is mapped to the `student_work`
directory in your EnvModelling checkout.

Keep model repositories and model output there. Files stored elsewhere
inside the container may be lost when the container is replaced.

## SFTP

Connect with:

``` bash
sftp -P 2022 student@localhost
```

Note that SFTP uses an uppercase `-P`.

Useful commands include:

  Command           Meaning
  ----------------- -----------------------------------
  `pwd`             Show the current remote directory
  `lpwd`            Show the current local directory
  `ls`              List remote files
  `lls`             List local files
  `cd directory`    Change remote directory
  `lcd directory`   Change local directory
  `get filename`    Download a file
  `put filename`    Upload a file
  `exit`            Leave SFTP

For example:

``` text
sftp> cd work
sftp> ls
sftp> get output.nc
sftp> exit
```

For the local Docker environment, SFTP is useful for practising the same
workflow used with the University server. Because `~/work` is also a
shared host directory, you can alternatively access those files directly
through `student_work`.

## First connection and host keys

On the first SSH/SFTP connection, you may be asked to accept the
server's host key.

The Docker setup stores its SSH host keys persistently. Normally you
therefore accept the key once and subsequent connections recognise the
same local environment.

If the local host key has deliberately been regenerated and SSH reports
that the identification has changed, remove the old `localhost:2022`
entry with:

``` bash
ssh-keygen -R "[localhost]:2022"
```

Then reconnect and accept the new key after confirming that you are
connecting to your local EnvModelling container.

## SSH with X11 forwarding

Where X11 has been configured on the host, connect using:

``` bash
ssh -X -p 2022 student@localhost
```

See [X11](x11.md) for host-specific requirements.

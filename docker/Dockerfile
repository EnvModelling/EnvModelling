# syntax=docker/dockerfile:1

FROM ubuntu:22.04

LABEL org.opencontainers.image.title="EnvModelling"
LABEL org.opencontainers.image.description="Environmental modelling environment for teaching and research"
LABEL org.opencontainers.image.source="https://github.com/EnvModelling/EnvModelling"

ENV DEBIAN_FRONTEND=noninteractive

# ----------------------------------------------------------------------
# Scientific computing and research environment
# ----------------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    bash-completion \
    build-essential \
    ca-certificates \
    curl \
    ffmpeg \
    gfortran \
    git \
    htop \
    imagemagick \
    ipython3 \
    libgeos-dev \
    libnetcdf-dev \
    libnetcdff-dev \
    make \
    mpich \
    libmpich-dev \
    cm-super \
    dvipng \
    nano \
    ncview \
    netcdf-bin \
    openssh-client \
    openssh-server \
    python3 \
    python3-matplotlib \
	python3-mpltoolkits.basemap \
	python3-mpltoolkits.basemap-data \
    python3-netcdf4 \
    python3-numpy \
    python3-pandas \
    python3-pip \
    python3-tk \
    python3-tqdm \
    sudo \
    texlive \
    texlive-latex-extra \
    tkdiff \
    vim \
    x11-apps \
    xauth \
    && rm -rf /var/lib/apt/lists/*

# ----------------------------------------------------------------------
# SSH / SFTP
# ----------------------------------------------------------------------
RUN mkdir -p /run/sshd

# Create a single local user.
RUN useradd --create-home --shell /bin/bash student \
    && mkdir -p /home/student/work \
    && chown -R student:student /home/student \
    && usermod -aG sudo student

# SSH is retained because SSH/SFTP form part of the teaching workflow,
# and X11 forwarding is useful for advanced/research use.
RUN printf '%s\n' \
    'X11Forwarding yes' \
    'X11UseLocalhost yes' \
    'PasswordAuthentication yes' \
    'PermitRootLogin no' \
    >> /etc/ssh/sshd_config

# Local-container teaching account.
# SSH will later be bound to localhost by Docker Compose.
RUN echo 'student:envmodelling' | chpasswd

# ----------------------------------------------------------------------
# Student/research workspace
# ----------------------------------------------------------------------
WORKDIR /home/student/work

EXPOSE 22

# Run the SSH server in the foreground so that it remains the
# container's main process.
COPY docker/entrypoint.sh /usr/local/bin/envmodelling-entrypoint
RUN chmod +x /usr/local/bin/envmodelling-entrypoint

CMD ["/usr/local/bin/envmodelling-entrypoint"]

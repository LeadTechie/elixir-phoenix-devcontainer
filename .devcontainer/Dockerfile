FROM elixir:1.17

WORKDIR /workdir

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN apt-get update \
  && apt-get install -y curl git nodejs npm inotify-tools build-essential \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new

RUN git clone https://github.com/asdf-vm/asdf.git /home/$USERNAME/.asdf --branch v0.14.1
RUN echo '. "/home/$USERNAME/.asdf/asdf.sh"' >> /home/$USERNAME/.bashrc
RUN echo '. "/home/$USERNAME/.asdf/completions/asdf.bash"' >> /home/$USERNAME/.bashrc

# Install Fly CLI
RUN curl -L https://fly.io/install.sh | sh
RUN ln -s /root/.fly/bin/fly /usr/local/bin/fly

CMD ["iex"]

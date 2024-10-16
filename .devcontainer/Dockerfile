FROM elixir:1.17

WORKDIR /workdir

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# create user for USERNAME
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

# needed for elixir lsp
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install curl git  2>&1 

# install nodejs
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install nodejs 2>&1 

# needed for filesystem watcher
RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install inotify-tools 2>&1 

RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

RUN echo '. \"$$HOME/.asdf/asdf.sh\"' >> ~/.bashrc
RUN echo '. \"$$HOME/.asdf/completions/asdf.bash\"' >> ~/.bashrc

CMD ["iex"]

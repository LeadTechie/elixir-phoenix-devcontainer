FROM elixir:1.17

WORKDIR /workdir

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# create user for USERNAME
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

# install nodejs
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install nodejs 2>&1 


RUN su ${USERNAME} -c "mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new"

CMD ["iex"]

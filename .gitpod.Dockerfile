FROM gitpod/workspace-full
# Make runc's proc mount work again https://github.com/gitpod-io/gitpod/issues/5124#issuecomment-897048987
RUN curl -o olderrunc -L https://github.com/opencontainers/runc/releases/download/v1.0.0-rc93/runc.amd64 && chmod 755 olderrunc
RUN sudo rm /usr/bin/runc && sudo cp olderrunc /usr/bin/runc
RUN sudo apt-get -qq update && sudo apt-get install -y zsh && sudo chsh -s $(which zsh)
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes && echo 'eval "$(starship init zsh)"' > .zshrc
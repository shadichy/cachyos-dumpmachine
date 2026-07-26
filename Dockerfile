FROM ghcr.io/shadichy/cachyos-ci:latest

# Install paru and sudo
RUN pacman -Sy --noconfirm 7zip

# Cleanup
RUN rm -rf makeapex apex-install
RUN yes | paru -Scc
RUN rm -rf .cache /var/cache/pacman/pkg/*

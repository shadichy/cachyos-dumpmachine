FROM ghcr.io/shadichy/cachyos-ci:latest

# Install paru and sudo
RUN pacman -Sy --noconfirm 7zip android-tools e2fsprogs paru sudo

# Cleanup
RUN yes | pacman -Scc
RUN rm -rf .cache /var/cache/pacman/pkg/*

# Create a builder user for AUR packages
RUN useradd -m builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder

# Switch to builder user
USER builder
WORKDIR /home/builder

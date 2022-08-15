FROM archlinux:latest

COPY . /rose

WORKDIR /rose

RUN pacman -Syu --noconfirm

RUN pacman -S make pkgconf gcc --noconfirm

RUN pacman -S webkit2gtk-5.0 --noconfirm

RUN make 



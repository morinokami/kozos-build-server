FROM ubuntu:18.04

RUN apt-get update && apt-get install -y wget bzip2 gcc make patch unzip

RUN wget https://ftp.gnu.org/gnu/binutils/binutils-2.19.1.tar.bz2
RUN tar jxvf binutils-2.19.1.tar.bz2
RUN cd binutils-2.19.1 && ./configure --target=h8300-elf --disable-nls --disable-werror && make && make install

ADD ./patch /patch
RUN wget https://ftp.gnu.org/gnu/gcc/gcc-3.4.6/gcc-3.4.6.tar.gz
RUN tar xvzf gcc-3.4.6.tar.gz
RUN patch gcc-3.4.6/gcc/collect2.c patch/collect2.patch
RUN patch gcc-3.4.6/gcc/config/h8300/h8300.c patch/h8300.patch
RUN cd gcc-3.4.6 && ./configure --target=h8300-elf --disable-nls --disable-threads --disable-shared --enable-languages=c && make && make install

RUN wget https://osdn.net/dl/kz-h8write/kz_h8write-v0.2.1.zip
RUN unzip kz_h8write-v0.2.1.zip
RUN cd /PackageFiles/src && make && cp kz_h8write /usr/local/bin

CMD ["bash"]


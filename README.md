# vsftpd-2.3.4-container
Alpine Linux based container image with a vulnerable version of vsftpd-2.3.4 for use in cybersecurity training environments. Supports both amd64 and armv8 architectures.

## Changes to source code

Downloaded official source code from: https://security.appspot.com/downloads/vsftpd-2.3.4.tar.gz

The official source release of 2.3.4 (above link) doesn't have the vulnerable backdoor and I couldn't find an official source for it.

However I did find another Github user's repo with the infected version: https://github.com/nikdubois/vsftpd-2.3.4-infected/commit/e084c9543947d9509ea74731adca427418604cc2 which I've incorporated into `str.c` and `sysdeputil.c` in order to make it exploitable using msf. 

Other changes are made to source to make it build with the Alpine C library, [musl](https://en.m.wikipedia.org/wiki/Musl), in the Dockerfile during container image build.

## Use my published image from docker hub

```
docker run --name vsftpd-2.3.4 -it clintmint/vsftpd-2.3.4:1.0 sh -c "start-vsftpd && sh"
```

## Exploiting with msf

```
msfconsole
use exploit/unix/ftp/vsftpd_234_backdoor
set RHOSTS 172.17.0.2
exploit
````

## Docker build & run

```
git clone https://github.com/clintmint/vsftpd-2.3.4-container.git
cd vsftpd-2.3.4-container
docker build -t <docker-hub-username>/vsftpd-2.3.4:1.0 . --no-cache
docker run --name vsftpd-2.3.4 -it <docker-hub-username>/vsftpd-2.3.4:1.0 sh -c "start-vsftpd && sh"
```

## Multi-architecture build and push for linux/amd64 (Intel/AMD CPUs) and linux/arm64 (for Macs using M1 chip)

```
docker login
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 --push -t <docker-hub-username>/vsftpd-2.3.4:1.0 . --no-cache
```

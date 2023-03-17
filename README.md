# vsftpd-2.3.4-container
Alpine Linux based container image with a vulnerable version of vsftpd-2.3.4 for use in cybersecurity training environments. Supports both amd64 and armv8 architectures. 

Downloaded official source code from: https://security.appspot.com/downloads/vsftpd-2.3.4.tar.gz

Note that the official release of 2.3.4 (above link) doesn't have the vulnerable backdoor and I couldn't find an official source for it.

However I did find another Github user's repo with the infected version: https://github.com/nikdubois/vsftpd-2.3.4-infected/commit/e084c9543947d9509ea74731adca427418604cc2

Other changes were made to the source to make it build with the Alpine C library but most of the changes are done in the Dockerfile.

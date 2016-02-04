# hmb3150 patch code

copy the original firmware in the directory 'Rebuild'
run /Tmp/./decomp     -> this decompress the firmware
run /mhdpatch/./patch   -> this patch the firmware
run /Tmp/./comp   -> compress the firmware

You must be root to run correctly the patch !

Be carefull ! the  hyundai reboot if there is no network. (i have to fix this!)

My Hyundai 3150 Recorder for DVB-T with IPKG, FTP server, SSH,Stunnel, Dropbear, aria2c, email.

Don't forget to complete the file :

in passwd  :  replace the password for root and other user with encrypted password
in msmtrpr :  place the correct email after "from", place the correct user, and password
in hook.sh : place your email after the "mutt -s" command 

The packages can be installed only if the directory /tmp/hdd/root/opt exist !!!
create it manually. 

usefull package to install with the command > ipkg install name of package

packages at : http://ipkg.nslu2-linux.org/feeds/optware/oleg/cross/stable/

aria2 - 1.12.1-1 - A utility for downloading files. The supported protocols are HTTP(S), FTP, BitTorrent  (DHT, PEX, MSE/PE), and Metalink.
bzip2 - 1.0.6-1 - Very high-quality data compression program
c-ares - 1.7.4-1 - C library that performs DNS requests and name resolves asynchronously
cyrus-sasl - 2.1.23-2 - Provides client or server side authentication (see RFC 2222).
cyrus-sasl-libs - 2.1.23-2 - Provides client or server side authentication (see RFC 2222).
dropbear - 0.52-5 - Lightweight SSH client and server system
gnutls - 2.6.5-1 - GNU Transport Layer Security Library.
libdb - 4.2.52-3 - Berkeley DB Libraries
libesmtp - 1.0.6-1 - libESMTP is a library to manage posting electronic mail using SMTP to a preconfigured Mail Transport Agent (MTA).
libgcrypt - 1.5.0-1 - GNU cryptography libray, needed by gnutls
libgpg-error - 1.10-1 - Error handling library for libgcrypt
libgsasl - 1.6.1-1 - GNU SASL command line utility.
libidn - 1.21-1 - GNU Libidn is an implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domai
libtasn1 - 2.9-1 - ASN.1 structure parser library.
libuclibc++ - 0.2.2-9 - C++ standard library designed for use in embedded systems
libxml2 - 2.7.8-1 - Libxml2 is the XML C parser and toolkit developed for the Gnome project.
lynx - 2.8.6-1 - A text browser for the World Wide Web
msmtp - 1.4.26-1 - msmtp is an SMTP client.
mutt - 1.5.17-1 - text mode mail client
ncurses - 5.7-1 - NCurses libraries
ncursesw - 5.7-1 - NCurses libraries with wide char support
openssl - 0.9.7m-5 - Openssl provides the ssl implementation in libraries libcrypto and libssl, and is needed by many other applications and librari
psmisc - 22.13-1 - A set of some small useful utilities that use the proc filesystem.
rdate - 1.4-2 - Using RFC868, retrieves a remote date and time and sets the local time
readline - 6.1-2 - The GNU Readline library provides a set of functions for use by applications that allow users to edit command lines as they are
sqlite - 3.7.3-1 - SQLite is a small C library that implements a self-contained, embeddable, zero-configuration SQL database engine.
stunnel - 4.26-2 - SSL encryption wrapper for all kinds of servers
vsftpd - 2.3.4-1 - ftp daemon with an emphasis on speed and security
zlib - 1.2.5-1 - zlib is a library implementing the 'deflate' compression system.

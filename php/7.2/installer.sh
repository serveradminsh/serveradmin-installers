#!/usr/bin/env bash
#+----------------------------------------------------------------------------+
#+ ServerAdmin PHP 7.2.x Auto-Installer for Ubuntu
#+----------------------------------------------------------------------------+
#+ Author:      Jonathan Tittle
#+ Copyright:   2017 ServerAdmin.sh and Jonathan Tittle
#+ GitHub:      https://github.com/serveradminsh/serveradmin-installers
#+ Issues:      https://github.com/serveradminsh/serveradmin-installers/issues
#+ License:     GPL v3.0
#+ OS:          Ubuntu 16.04, Ubuntu 16.10
#+ Release:     1.0.0
#+ Website:     https://serveradmin.sh
#+----------------------------------------------------------------------------+
clear

#+----------------------------------------------------------------------------+
#+ Check current users ID. If user is not 0 (root), exit.
#+----------------------------------------------------------------------------+
if [ "${EUID}" != 0 ];
then
    echo "ServerAdmin PHP Auto-Installer should be executed as the root user."
    exit
fi

phpPackages="php7.2-cli php7.2-dev php7.2-fpm php7.2-bcmath php7.2-bz2 php7.2-common php7.2-curl php7.2-gd php7.2-gmp php7.2-imap php7.2-intl php7.2-json php7.2-mbstring php7.2-mysql php7.2-readline php7.2-recode php7.2-soap php7.2-sqlite3 php7.2-xml php7.2-xmlrpc php7.2-zip php7.2-opcache php7.2-xsl"

if ls -U /etc/apt/sources.list.d | grep ondrej > /dev/null 2>&1;
then
    echo "PHP Repository already exists. Updating/Syncing packages and then exiting."
    apt-get update
    exit;
else
    apt-get update \
    && apt-get -y upgrade \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get -y install ${phpPackages}
fi
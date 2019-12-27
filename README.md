# Pico CMS deployment shell script

[Pico CMS](https://github.com/picocms/Pico) is a stupidly simple, blazing fast, flat file CMS

Easily launch virtual machine with Pico CMS on popular hosting providers like DO, Linode, Vultr etc.. The script install **PHP 7.4** (packages from deb.sury.org) + **NGINX** (from official repo, stable version) + **[Composer](https://github.com/composer/composer)** and last version of **Pico CMS**.  

## How to 

1. Create **Debian** or **Ubuntu** virtual machine (I tested it on Linode and Vultr Debian 8, 9, 10 and Ubuntu 18.04 succesfully)
2. Better, you should install all updates: sudo apt update and sudo apt upgrade
3. Choose what you want to get: *Just Pico* installation or Pico CMS with [my Mondrian theme](https://github.com/codeandmedia/pico_mondrian)
4. Execute (be careful and add sudo if necessary):

## Just Pico CMS 

```bash
wget -qO- https://raw.githubusercontent.com/codeandmedia/pico_deploy/master/pico.sh | bash
```

## Pico CMS and Mondrian theme

```bash
wget -qO- https://raw.githubusercontent.com/codeandmedia/pico_deploy/master/pico_mondrian.sh | bash
```

At the end your VM is going to restart. After reboot Pico CMS will be available on **/var/www** and ready to your content :) 

## Notes

+ Nginx configs you may see in this repo. Nginx logs are off. It works on HTTP 1.1 (TBA "how to achieve HTTPS with Let's encrypt")
+ PHP configs is default

*Do not hesitate to create issues if something goes wrong*

# Developer Machine Setup With Ansible

Trying to setup necessary and useful tools via ansible mainly aimed for MAC. Also including Debian Distribution.

## Setup
* Iterm
* Git
* ZSH

Points:
    * Based on OS_FAMILY variable we can use specific package manager
        - Code available under file /libexec/lib/python2.7/site-packages/ansible/module_utils/facts.py

Resources:
* [Unify package installation](http://serverfault.com/questions/587727/how-to-unify-package-installation-tasks-in-ansible)

```
OS_FAMILY = dict(
    RedHat = 'RedHat', Fedora = 'RedHat', CentOS = 'RedHat', Scientific = 'RedHat',
    SLC = 'RedHat', Ascendos = 'RedHat', CloudLinux = 'RedHat', PSBM = 'RedHat',
    OracleLinux = 'RedHat', OVS = 'RedHat', OEL = 'RedHat', Amazon = 'RedHat',
    XenServer = 'RedHat', Ubuntu = 'Debian', Debian = 'Debian', Raspbian = 'Debian', SLES = 'Suse',
    SLED = 'Suse', openSUSE = 'Suse', SuSE = 'Suse', Gentoo = 'Gentoo', Funtoo = 'Gentoo',
    Archlinux = 'Archlinux', Mandriva = 'Mandrake', Mandrake = 'Mandrake',
    Solaris = 'Solaris', Nexenta = 'Solaris', OmniOS = 'Solaris', OpenIndiana = 'Solaris',
    SmartOS = 'Solaris', AIX = 'AIX', Alpine = 'Alpine', MacOSX = 'Darwin',
    FreeBSD = 'FreeBSD', HPUX = 'HP-UX'
)
```

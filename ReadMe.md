# Developer Machine Setup With Ansible

Trying to setup necessary and useful tools via ansible mainly aimed for MAC. Also including Debian Distribution.

## Setup
* Iterm
* Git
* ZSH
* Emacs
* Sublime Text

## Points

- Based on OS_FAMILY variable we can use specific package manager    
- This information we can find it in facts.py code, located in `/libexec/lib/python2.7/site-packages/ansible/module_utils/facts.py`

## Use Ansible Playbook For Vagrant Provisioning

Add the following configuration to vagrant file for provisioning the vagrant box.
```
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook_location/base.yml"
    ansible.inventory_path = "ansible_host_file_location/ansible_hosts"
    ansible.limit = "all"
  end
```
- `vagrant up` or `vagrant provision` 'll do the job.

Run the playbook with required variables by setting it in one of the following way.

- vars_files
- roles/vars/main.yml
- via commandline pass with -e parameter 

## Resources:
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

* [Ansible Variable Preferences](https://github.com/edx/configuration/wiki/Ansible-variable-conventions-and-overriding-defaults)

* [Mac Yosemite Vagrant Box](https://github.com/AndrewDryga/vagrant-box-osx)

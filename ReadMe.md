# Developer Machine Setup With Ansible

Sets up necessary and useful tools via ansible mainly aimed for MAC.

## Setup

* Iterm2
* Git
* ZSH
* Emacs
* Sublime Text
* Intellij

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


## Custom Configuration .*rc files:

I've custom Paths, custom aliases for project tools/location, custom functions, loading tools eg: load, android specific rc files, docker etc.

An example i've

```
function kill_procs {
    name=$1
    changed_pattern="[${name:0:1}]${name:1:${#name}}"
    echo $changed_pattern
    ps aux | grep "$changed_pattern" | awk '{print $2}' | xargs kill- 9
}

```

which kills process based on regex. [ Need to kill process lot of time :) ]

which is checked-in in git:bitbucket, and i clone it in `$ZSH_CUSTOM`, alternately to custom folder by setting up `my_configs_path`.

enable it by setting `sync_custom_config` to True, and `custom_config_repo` to your git repository location.


## Variables Used:
  # Paths in local Ansible
  - templates_path
  - installables_path
  # location in remote where installation happens
  - download_location
  - applications_location
  - evernote_download_url
  - sublime_url
  - intellij_url

Currently the above variables are defined in files [locations.yml](https://github.com/dineshkumar-cse/Ansible-Provision/blob/master/cookbooks/vars/locations.yml) and [main.yml](https://github.com/dineshkumar-cse/Ansible-Provision/blob/master/cookbooks/vars/main.yml).

In these var files the following ENVIRONMENT_VARIABLE's are referenced.

  - DEVSETUP_ANSIBLE_DIR
  - DOWNLOAD_LOCATION # set it to any folder / alternately `$TMP`
  - MY_ZSH_CUSTOM_FOLDER by default zsh considers $HOME/.oh-my-zsh/custom, or you can use custom folder by pointing `$ZSH_CUSTOM` to that.

Run the playbook with required variables by setting it in one of the following way.

- vars_files
- roles/vars/main.yml
- via commandline pass with -e parameter

## Setup Local Machine

To setup your local machine, run the following command in the cloned git repo directory.

```
ansible-playbook -i 'localhost', cookbooks/base.yml -c local # optionally pass -vvv to see verbose output.
````



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

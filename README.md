Nibelheim
===

This is a replacement for deprecated [Midgar](https://github.com/ndoit/midgar).

You need vagrant and virtual box installed to start.

You will also need to be able to ssh to github from you Mac.

---

You will need to [install Ansible](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-on-mac-osx).
Because our development team consists of only mac developers, this installation
will feature installation steps for Mac OSX. At least version 2.2 for the
community role in the next step.

If you have problems for this step for upgrading, there is a known issue
with mac osx security settings not letting Ansible update to latest 2.2 version.
[See here](https://github.com/ansible/ansible/issues/13116#issuecomment-239844113)

The command that I have seen work when upgrading is
`sudo pip install --ignore-installed --upgrade ansible`

---

Next you will need to install an Ansible community role for rvm
[rvm_io.ruby](https://galaxy.ansible.com/rvm_io/ruby/) which will
handle our ruby installs and rvm install.

The command for this is `ansible-galaxy install rvm_io.ruby`

---

Next install is VirtualBox guest additions. These enable file sharing between
the guest and host machines. There are several ways to do this. The easiest
being the vagrant-vbguest plugin.

#### [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)

This is the easiest install, and involves only running one command

```
vagrant plugin install vagrant-vbguest
```

#### Manual Install

The other way is to do it manually. The versions in this doc is 5.1.22, it must
match your virtualbox version. Consequently, every time you upgrade virtualbox,
you must also upgrade the guest additions.
```
# Remember the guest additions must be installed on your guest machine.
wget http://download.virtualbox.org/virtualbox/5.1.22/VBoxGuestAdditions_5.1.22.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_5.1.22.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_5.1.22.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
```
---

Once you have the environment setup, the next thing should be to clone this git
repo and `vagrant up`

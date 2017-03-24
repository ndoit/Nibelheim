Nibelheim
===

This is a replacement for deprecated [Midgar](https://github.com/ndoit/midgar).

You need vagrant and virtual box installed to start.

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

Once you have the environment setup, the next thing should be to clone this git
repo and `vagrant up`

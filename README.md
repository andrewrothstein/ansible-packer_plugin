andrewrothstein.packer_plugin
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-packer_plugin.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-packer_plugin)

Helper for install packer plugins.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.packer_plugin
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>

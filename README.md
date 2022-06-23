# ansible-mac

> macOS Monteray 12.3.1

## Prerequisites

Setup [SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Usage
```sh
git clone git@github.com:dohjon/dotfiles.git $HOME/dotfiles && cd dotfiles
chmod u+x ./install.sh && ./install.sh
```

## Helpers

Only run task with <tag>
```sh
# ansible-playbook playbook.yml --tags <tag>
ansible-playbook playbook.yml --tags zsh,git
```

Validate playbook 
```sh
ansible-playbook --syntax-check <file>
```

Perform dry run on playbook 
```sh
ansible-playbook -C <file>
```

Check changes to default configuration (ansible.cfg)
```sh
ansible-config dump --only-changed
```

Inventory overview 
```sh
ansible-inventory --graph --vars
```

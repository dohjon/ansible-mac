# ansible-mac

> macOS Monteray 12.3.1

## Usage
```sh
git clone git@github.com:dohjon/dotfiles.git $HOME/dotfiles && cd dotfiles
chmod u+x ./install.sh && ./install.sh
```

## Helpers

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

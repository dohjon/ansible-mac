# ansible-mac

> macOS Monteray 12.3.1

## python setup

developer tools
```sh
xcode-select --install
```

upgrade pip
```sh
python3 -m pip install --upgrade pip
```

install ansible
```sh
python3 -m pip install --user ansible
```

path to ansible (optionaly add to path)
```sh
$(python3 -m site --user-base)/bin/ansible
```

## homebrew setup

developer tools
```sh
xcode-select --install
```

[homebrew](https://brew.sh/)
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

[ansible](https://ansible.com)
```sh
brew install ansible
ansible --version
```

## Usage
Run playbook 
```sh
ansible-playbook <file> --ask-become-pass
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

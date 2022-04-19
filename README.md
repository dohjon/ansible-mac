# ansible-mac

> macOS Monteray 12.3.1

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

## 

Validate playbook 
```sh
ansible-playbook --syntax-check <file>
```

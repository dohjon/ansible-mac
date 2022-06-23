# ansible-mac

> macOS Monteray 12.3.1

## Prerequisites

Setup see [SSH](#SSH) section

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

## SSH
> Some flags are macos specific

[docs.github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

Create new SSH key
```sh
ssh-keygen -t ed25519 -C "email@domain or comment"
```

Configure ssh/config to use/point to new SSH key
```sh
IdentityFile ~/.ssh/<REDACTED>
```

Start ssh agent if it is not already running
```sh
eval "$(ssh-agent -s)"
```

Add SSH key to ssh-agent and keychain (macos)
```sh
ssh-add --apple-use-keychain ~/.ssh/<REDACTED>
```

Test which public key is used (troubleshooting) 
```sh
ssh -T git@github.com
ssh -T git@github-work.com
# List fingerprints of currently loaded keys
ssh-add -l
# Delete all currently loaded keys from the ssh-agent
ssh-add -D
```

(Other) if the [repo was not cloned](https://gist.github.com/oanhnn/80a89405ab9023894df7?permalink_comment_id=4025383#gistcomment-4025383])

```sh
git config core.sshCommand "ssh -i ~/.ssh/<REDACTED> -F /dev/null"
```

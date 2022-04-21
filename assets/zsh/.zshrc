---
- name: Setup development environment
  hosts: localhost
  connection: local
  become: false
  gather_facts: false

  pre_tasks:
    - name: Check for homebrew executable
      stat:
        path: /opt/homebrew/bin/brew
      register: result

    - name: Install homebrew
      shell: NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      become_method: sudo
      when:
        not result.stat.exists

  tasks:

    - name: Install brew package(s)
      homebrew:
        update_homebrew: true
        name: "{{ item }}"
        state: present
      with_items:
        - git
        - zsh
        - zsh-syntax-highlighting
        - zsh-autosuggestions
        - bat
        - tree
        - tldr
        - ansible
        - shellcheck
        - vim
        - nvim
        - starship

    - name: Install brew cask(s)
      homebrew_cask:
        update_homebrew: true
        name: "{{ item }}"
        state: present
      with_items:
        - visual-studio-code
        - google-chrome

    - name: Create gitlab directory
      file:
        path: ~/projects/gitlab
        state: directory
        mode: '0755'

    - name: Create github directory
      file:
        path: ~/projects/github
        state: directory
        mode: '0755'

    - name: Copy .zprofile to ~/.zprofile
      copy:
        src: ./assets/zsh/.zprofile
        dest: ~/.zprofile

    - name: Copy .zshrc to ~/.zshrc
      copy:
        src: ./assets/zsh/.zshrc
        dest: ~/.zshrc

    - name: Copy .gitconfig
      copy:
        src: ./assets/git/.gitconfig
        dest: ~/.gitconfig

    - name: Copy .gitcommit
      copy:
        src: ./assets/git/.gitcommit
        dest: ~/.gitcommit

    - name: Copy .gitignore_global
      copy:
        src: ./assets/git/.gitignore_global
        dest: ~/.gitignore_global

    - name: Copy init.vim
      copy:
        src: ./assets/nvim/init.vim
        dest: ~/init.vim

    - name: Create starship directory
      file:
        path: ~/.config/starship
        state: directory
        mode: '0755'

    - name: Copy starship.toml
      copy:
        src: ./assets/starship/starship.toml
        dest: ~/.config/starship/starship.toml

    - osx_defaults:
        domain: /Library/Preferences/com.apple.SoftwareUpdate
        key: AutomaticCheckEnabled
        type: int
        value: 1
      become_method: sudo

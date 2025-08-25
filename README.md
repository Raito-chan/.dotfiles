# Installing the dotfiles

First download and install the rcm from the AUR. 

```bash
yay -S rcm
```

Then clone this repo into you home directory.

```bash
git clone https://github.com/Raito-chan/.dotfiles.git
```

Then run the rcup command to create simlinks of for the dotfiles in your home direcotory.

```bash
rcup
```

This will prompt you if you want to overwrite each individual file for which you alreayd have a config. You can skill the check and overwrite by doing:

```bash
rcup -f
```

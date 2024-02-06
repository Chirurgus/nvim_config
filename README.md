# Neovim configuration

On Windows the configuration files are located in `~/AppData/Local/nvim`.

The installation can be done by first cloning this repository, and then
installing the package manager nvim-plug.

```{powershell}
# Copy this repository
git clone https://github.com/Chirurgus/nvim_config.git ~/AppData/Local/nvim
# Install vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

Now install all the plugins by opening Neovim and running `:PlugInstall`.

Good to go !

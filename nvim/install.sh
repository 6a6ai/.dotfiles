
#!/usr/bin/env bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/lua/my_inits

# link files
for f in `find -E . -regex '.*\.(vim|lua)'`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/.dotfiles/nvim/$f ~/.config/nvim/$f
done


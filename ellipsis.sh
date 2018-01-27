#!/usr/bin/env bash

pkg.link() {
  case $(os.platform) in
    osx)
      fs.link_file "platforms/osx/init.vim" "$HOME/.config/nvim/init.vim"
      fs.link_file "platforms/osx/bundle" "$HOME/.config/nvim/bundle"
      ;;
    linux)
      fs.link_file "platforms/common/init.vim" "$HOME/.config/nvim/init.vm"
      fs.link_file "platforms/common/bundle" "$HOME/.config/nvim/bundle"
      ;;
  esac
}

pkg.install() {
  git submodule init
  git submodule update
}

pkg.pull() {
  git.pull

  nvim +PluginClean! +PluginInstall! +qall
}

pkg.unlink() {
  rm "$HOME/.config/nvim"

  hooks.unlink
}

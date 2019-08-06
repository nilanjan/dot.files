# PYENV setting 
status --is-interactive; and source (pyenv init -|psub)

# Emacs
# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# FISH SHELL
set -U fish_key_bindings fish_vi_key_bindings
function fish_title
    true
end
set -U fish_color_param 0x399ecc

# SHELL INTEGRATION
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Aliases
. $HOME/.config/fish/aliases.fish

# Spacevim
set -gx PATH $HOME/.SpaceVim/bin $PATH

# JAVA
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home

# PYENV
set pyenv ~/.pyenv/shims/
set -gx PATH $pyenv $PATH 
set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/sqlite/lib"
set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/sqlite/include"

# ANACONDA
#set -x PATH $HOME/anaconda/bin $PATH

#C/C++
set -x C_INCLUDE_PATH /usr/include:/usr/local/include:/System/Library/Frameworks/Carbon.framework/Headers:/System/Library/Frameworks/Cocoa.framework/Headers
set -x CPLUS_INCLUDE_PATH /usr/include:/usr/local/include:/System/Library/Frameworks/Carbon.framework/Headers:/System/Library/Frameworks/Cocoa.framework/Headers

#BOOST
set -x BOOST_ROOT /usr/local/Cellar/boost/1.64.0_1
set -x LD_LIBRARY_PATH /usr/local/lib:$BOOST_ROOT/lib $LD_LIBRARY_PATH

# ARTIST SIM
set -x LD_LIBRARY_PATH $HOME/Projects/artist/build/debug/func $LD_LIBRARY_PATH
set -x DYLD_LIBRARY_PATH $HOME/Projects/artist/build/debug/func $DYLD_LIBRARY_PATH
#export PYTHONPATH=$HOME/Projects/artist/build/debug/func:/usr/local/lib/python2.7/site-packages

# VULKAN
set -x VULKAN_SDK_VERSION "1.1.92.0"
set -x VULKAN_ROOT_LOCATON $HOME/Workspace/graphics/sw/vulkansdk
set -x VULKAN_SDK $HOME/Workspace/graphics/sw/vulkansdk/macOS
set -x PATH $VULKAN_SDK/bin $PATH
set -x DYLD_LIBRARY_PATH $VULKAN_SDK/lib $DYLD_LIBRARY_PATH
set -x VK_ICD_FILENAMES $VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json
set -x VK_LAYER_PATH $VULKAN_SDK/etc/vulkan/explicit_layer.d

# GO
set -x GOPATH $HOME/Workspace/go

# ZLIB
set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH /usr/local/opt/zlib/lib/pkgconfig
set -gx LDFLAGS $LDFLAGS -L/usr/local/opt/zlib/lib
set -gx CPPFLAGS $CPPFLAGS -I/usr/local/opt/zlib/include
# Old stuff
# For compilers to find zlib you may need to set:
# --- set -x LDFLAGS $LDFLAGS -L/usr/local/Cellar/zlib/lib
# --- set -x CPPFLAGS $CPPFLAGS -I/usr/local/Cellar/zlib/include

# For pkg-config to find zlib you may need to set:
# --- set -x PKG_CONFIG_PATH $PKG_CONFIG_PATH /usr/local/Cellar/zlib/lib/pkgconfig

# CARGO
set -x PATH $PATH $HOME/.cargo/bin

# Clang from homebrew
set -gx PATH $PATH /usr/local//Cellar/llvm/8.0.0_1/bin

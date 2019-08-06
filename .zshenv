
#Set variables first

export LS_COLORS=dxfxcxdxbxegedabagacad

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# ---> PATH of SpaceVim
export PATH=$HOME/.SpaceVim/bin:$PATH

# ---> JAVA
case `uname` in
  Darwin)
    # commands for OS X go here
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
  ;;
  Linux)
    # commands for Linux go here
  ;;
esac

# ---> PATH and variable for PYENV
export PATH=:$PATH
export PYENV=~/.pyenv/shims/
export PATH=$PYENV:$PATH 
export LDFLAGS=$LDFLAGS:"-L/usr/local/opt/sqlite/lib"
export CPPFLAGS=$CPPFLAGS:"-I/usr/local/opt/sqlite/include"

# ---> PATH and variable for C/C++ 
export C_INCLUDE_PATH=/usr/include:/usr/local/include:/System/Library/Frameworks/Carbon.framework/Headers:/System/Library/Frameworks/Cocoa.framework/Headers
export CPLUS_INCLUDE_PATH=/usr/include:/usr/local/include:/System/Library/Frameworks/Carbon.framework/Headers:/System/Library/Frameworks/Cocoa.framework/Headers

# ---> BOOST
export BOOST_ROOT=/usr/local/Cellar/boost/1.64.0_1
export LD_LIBRARY_PATH=/usr/local/lib:$BOOST_ROOT/lib:$LD_LIBRARY_PATH

# ---> ARTIST SIM
export LD_LIBRARY_PATH=$HOME/Projects/artist/build/debug/func:$LD_LIBRARY_PATH
case `uname` in
  Darwin)
    # commands for OS X go here
    export DYLD_LIBRARY_PATH=$HOME/Projects/artist/build/debug/func:$DYLD_LIBRARY_PATH
  ;;
  Linux)
    # commands for Linux go here
  ;;
esac

# ---> VULKAN
export VULKAN_SDK_VERSION="1.1.92.0"
export VULKAN_ROOT_LOCATON=$HOME/Workspace/graphics/sw/vulkansdk
case `uname` in
  Darwin)
    # commands for OS X go here
    export VULKAN_SDK=$HOME/Workspace/graphics/sw/vulkansdk/macOS
    export DYLD_LIBRARY_PATH=$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH
  ;;
  Linux)
    # commands for Linux go here
  ;;
esac
export PATH=$VULKAN_SDK/bin:$PATH
export VK_ICD_FILENAMES=$VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d

# ---> GO
export GOPATH=$HOME/Workspace/go

# ---> ZLIB
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/zlib/lib/pkgconfig
export LDFLAGS=$LDFLAGS:"-L/usr/local/opt/zlib/lib"
export CPPFLAGS=$CPPFLAGS:"-I/usr/local/opt/zlib/include"

# ---> CARGO
export PATH=$PATH:$HOME/.cargo/bin

# ---> CLANG for Homebrew
export PATH=$PATH:/usr/local//Cellar/llvm/8.0.0_1/bin

# Setup command search path (only system basic path)
#   System default setting path:
#   Mac OS X (Refer to "/etc/paths", "/etc/paths.d/*")
#     /usr/bin
#     /bin
#     /usr/sbin
#     /sbin
#     /usr/local/bin
#     /usr/X11/bin
# Keep only the first occurrence of each duplicated value.
typeset -U path

# Complete Messages.
case "$-" in
    *i*) # interactive shell
        echo "Loading .zshenv completed!!"
esac

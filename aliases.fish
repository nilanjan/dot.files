# Quick edits
alias ea 'nvim ~/.config/fish/aliases.fish'
alias ef 'nvim ~/.config/fish/config.fish'
alias eg 'nvim ~/.gitconfig'
alias ev 'nvim ~/.vimrc'
alias es 'nvim ~/bin/autosort'
alias et 'nvim ~/.tmux.conf'

alias vim-norc 'nvim -u NORC'
alias vim-none 'nvim -u NONE'

set LS_COLORS dxfxcxdxbxegedabagacad

alias n='nsight'
alias vi='nvim'
alias df='df -kTh'
alias du='du -kh'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias h='history'
alias j='jobs -l'
alias tree='tree -Csu'
#alias ls='ls -hFG'
alias ls='exa -hFG'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep -n -r --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -l --group-directories-first'
alias la='ls -Al'
alias l='ls -CF'
alias c='clear'
alias ml='matlab &'
alias mk='make'
alias cd.. 'cd ..'
alias md 'mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias lt='ls -ltr'
alias lx='ls -lXB'
alias lk='ls -lSr'
alias u='users'
alias mc='make clean'
alias f='finger -s'
alias e='exit'
alias xt='xterm -geometry 80x64 -fa Menlo -fs 9 -sb -rightbar &'
alias xc='open -a xcode'
alias lime='open -a Sublime\ Text'
alias ff='find . -name'
alias artist='cd $HOME/Projects/artist'
alias em='emacs -nw'

function timestamp
    python -c 'import time; print(int(time.time()))'
end

#alias df 'command df -m'
alias j jobs
alias su 'command su -m'

function lsd -d 'List only directories (in the current dir)'
    command ls -d */ | sed -Ee 's,/+$,,'
end

# Colorized cat (will guess file type based on contents)
alias ccat 'pygmentize -g'

alias g git
alias x 'tig HEAD'
alias xx 'tig --exclude=production --exclude="*/production" --exclude=canary --exclude="*/canary" --branches'
alias xxa 'tig --exclude=production --exclude="*/production" --exclude=canary --exclude="*/canary" --all'
alias xxaa 'tig --all'
alias notes 'rg "TODO|HACK|FIXME|OPTIMIZE"'

alias m make
#alias mm 'make run'

function da -d "Allow or disallow .envrc after printing it."
    echo "------------------------------------------------"
    cat .envrc
    echo "------------------------------------------------"
    echo "To allow, hit Return."
    read answer
    direnv allow
end

function def -d "Quickly jump to place where a function, method, or variable is defined"
    va "^\s*(def\s+$argv|$argv\s*[=])"
end

function vimff
    vim (ffind -tf $argv)
end

function f
    git ls-tree -r --name-only HEAD
end

function vf
    f | fzf | xargs -o vim
end

function va
    set pattern $argv[1]
    if test (count $argv) -gt 1
        set argv $argv[2..-1]
    else
        set argv
    end

    function to_safe
        sed -E -e 's/[\\][=]/__EQ__/g' -e 's/[\\][<]/__LT__/g' -e 's/[\\][>]/__GT__/g'
    end

    function to_unsafe_rg
        sed -E -e 's/__LT__/</g' -e 's/__GT__/>/g' -e 's/__EQ__/=/g'
    end

    function to_unsafe_vim
        sed -E -e 's/__LT__/[<]/g' -e 's/__GT__/[>]/g' -e 's/__EQ__/[=]/g'
    end

    set rg_pattern (echo $pattern | to_safe | sed -E -e 's/[<>]/\\\\b/g' | to_unsafe_rg)
    set vim_pattern (echo $pattern | to_safe | sed -E -e 's,([/=]),\\\\\1,g' -e 's,.*,/\\\\v&,' | to_unsafe_vim)
    rg -l --smart-case --null $rg_pattern -- $argv ^/dev/null | xargs -0 -o vim -c $vim_pattern
end

function vc
    if git modified -q $argv
        vim (git modified $argv | sed -Ee 's/^"(.*)"$/\1/')
    else
        echo '(nothing changed)'
    end
end

function vca
    if git modified -qi
        vim (git modified -i | sed -Ee 's/^"(.*)"$/\1/')
    else
        echo '(nothing changed)'
    end
end

function vci
    if git modified -qi
        vim (begin; git modified -i; git modified; end | sort | uniq -u | sed -Ee 's/^"(.*)"$/\1/')
    else
        echo '(nothing changed)'
    end
end

alias vch 'vc head'
alias vch1 'vc head~1'
alias vch2 'vc head~2'

function vu
    if git modified -u $argv
        vim (git modified -u $argv | sed -Ee 's/^"(.*)"$/\1/')
    else
        echo 'no files with conflicts'
    end
end

function vw
    vim (which "$argv")
end

function vconflicts -d 'Opens all files with merge conflict markers in Vim'
    va '^(\<{7}|\>{7}|\={7})([ ].*)?$'
end

function vflow -d 'Opens all files with Flow issues in Vim'
    flow | grep -Ee '^Error --' | rev | cut -d' ' -f1 | rev | cut -d: -f1 | sort -u | xargs -o vim
end

# alias git hub
alias gti git
alias a 'git amend --allow-empty --no-verify'
alias gb 'git recent-branches 2.days.ago'
alias ggco 'git switch'
alias fl 'clear; and flow-limit'

function git-search
    git log -S"$argv" --pretty=format:%H | map git show 
end

function cleanpycs
    find . -name '.git' -prune -o -name '__pycache__' -delete
    find . -name '.git' -prune -o -name '*.py[co]' -delete
end

function cleanorigs
    find . '(' -name '*.orig' -o -name '*.BACKUP.*' -o -name '*.BASE.*' -o -name '*.LOCAL.*' -o -name '*.REMOTE.*' ')' -print0 | xargs -0 rm -f
end

function cleandsstores
    find . -name '.DS_Store' -exec rm -f '{}' ';'
end

alias json 'prettify-json'
alias map 'xargs -n1'
alias collapse "sed -e 's/  */ /g'"
alias cuts 'cut -d\ '

# Directories {{{

function cdff --description "cd's into the current front-most open Finder window's directory"
    cd (ff $argv)
end

function ff
    echo '
    tell application "Finder"
        if (1 <= (count Finder windows)) then
            get POSIX path of (target of window 1 as alias)
        else
            get POSIX path of (desktop as alias)
        end if
    end tell
    ' | osascript -
end

function take
    set -l dir $argv[1]
    mkdir -p $dir; and cd $dir
end
alias cx 'chmod +x'
alias 'c-x' 'chmod -x'

# }}}

function colorize-pboard
    if test (count $argv) -gt 0
        set lang $argv[1]
    else
        set lang 'python'
    end
    pbpaste | strip-indents | color-syntax | pbcopy
end

function color-syntax
    if test (count $argv) -gt 0
        set lang $argv[1]
    else
        set lang 'python'
    end
    pygmentize -f rtf -l $lang
end

function wtf -d "Print which and --version output for the given command"
    for arg in $argv
        echo $arg: (which $arg)
        echo $arg: (sh -c "$arg --version")
    end
end


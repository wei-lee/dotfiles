export JAVA_HOME=/Library/Java/Home

alias e101-digger-ubuntu-01='ssh hadmin@e101-digger-ubuntu-01.feedhenry.net'
alias e101-digger-ubuntu-02='ssh hadmin@e101-digger-ubuntu-02.feedhenry.net'
alias e101-digger-ubuntu-03='ssh hadmin@e101-digger-ubuntu-03.feedhenry.net'
alias e101-digger-ubuntu-04='ssh hadmin@e101-digger-ubuntu-04.feedhenry.net'
alias e101-digger-macos-01='ssh hadmin@e101-digger-macos-01.feedhenry.net'
alias e101-digger-macos-02='ssh hadmin@e101-digger-macos-02.feedhenry.net'
alias e101-digger-windows-01='ssh hadmin@e101-digger-windows-01.feedhenry.net'
alias e101-digger-windows-02='ssh hadmin@e101-digger-windows-02.feedhenry.net'
alias e103-stg-digger-ubuntu-01='ssh hadmin@e103-stg-digger-ubuntu-01.feedhenry.net'
alias e103-stg-digger-ubuntu-02='ssh hadmin@e103-stg-digger-ubuntu-02.feedhenry.net'
alias e103-stg-digger-ubuntu-03='ssh hadmin@e103-stg-digger-ubuntu-03.feedhenry.net'
alias e103-stg-digger-ubuntu-04='ssh hadmin@e103-stg-digger-ubuntu-04.feedhenry.net'
alias e103-stg-digger-macos-01='ssh hadmin@e103-stg-digger-macos-01.feedhenry.net'
alias e103-stg-digger-macos-02='ssh hadmin@e103-stg-digger-macos-02.feedhenry.net'
alias e103-stg-digger-windows-01='ssh hadmin@e103-stg-digger-windows-01.feedhenry.net'
alias e103-stg-digger-windows-02='ssh hadmin@e103-stg-digger-windows-02.feedhenry.net'
alias e103-stg-digger-windows-03='ssh hadmin@e103-stg-digger-windows-03.feedhenry.net'
alias u101-digger-ubuntu-01='ssh hadmin@u101-digger-ubuntu-01.feedhenry.net'
alias u101-digger-ubuntu-02='ssh hadmin@u101-digger-ubuntu-02.feedhenry.net'
alias u101-digger-ubuntu-03='ssh hadmin@u101-digger-ubuntu-03.feedhenry.net'
alias u101-digger-ubuntu-04='ssh hadmin@u101-digger-ubuntu-04.feedhenry.net'
alias u101-digger-ubuntu-05='ssh hadmin@u101-digger-ubuntu-05.feedhenry.net'
alias u101-digger-ubuntu-06='ssh hadmin@u101-digger-ubuntu-06.feedhenry.net'
alias u101-digger-macos-01='ssh hadmin@u101-digger-macos-01.feedhenry.net'
alias u101-digger-macos-02='ssh hadmin@u101-digger-macos-02.feedhenry.net'
alias u101-digger-macos-03='ssh hadmin@u101-digger-macos-03.feedhenry.net'
alias u101-digger-macos-04='ssh hadmin@u101-digger-macos-04.feedhenry.net'
alias u101-digger-windows-01='ssh hadmin@u101-digger-windows-01.feedhenry.net'
alias u101-digger-windows-02='ssh hadmin@u101-digger-windows-02.feedhenry.net'
alias e101-digman-01='ssh hadmin@e101-digman-01.feedhenry.net'
alias e101-digman-02='ssh hadmin@e101-digman-02.feedhenry.net'
alias e101-stg-digman-01='ssh hadmin@e101-stg-digman-01.feedhenry.net'
alias e101-stg-digman-02='ssh hadmin@e101-stg-digman-02.feedhenry.net'
alias u101-digman-01='ssh hadmin@u101-digman-01.feedhenry.net'
alias u101-digman-02='ssh hadmin@u101-digman-02.feedhenry.net'

alias fhdev='ssh hadmin@192.168.33.10'
alias svn-tunnel='ssh wli@amz1gen2.feedhenry.net -f -N -L 55180:127.0.0.1:80'
alias fdc1dyno1='ssh hadmin@fdc1dyno1.feedhenry.net'
alias fdc1dyno2='ssh hadmin@fdc1dyno2.feedhenry.net'
alias stgpool1='ssh hadmin@e103-stg-pooled-01.feedhenry.net'
alias stgpool2='ssh hadmin@e103-stg-pooled-02.feedhenry.net'

alias msg01='ssh hadmin@e102-msg-01.feedhenry.net'
alias bob='ssh hadmin@bob.feedhenry.net'




###-begin-fhc-completion-###
#
# fhc command completion script
#
# Installation: fhc completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: fhc completion > /usr/local/etc/bash_completion.d/fhc
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if complete &>/dev/null; then
  _fhc_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           fhc completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _fhc_completion fhc
elif compctl &>/dev/null; then
  _fhc_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       fhc completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _fhc_completion fhc
fi
###-end-fhc-completion-###

export PATH=$PATH:"/Applications/Google Chrome.app"

export EDITOR='subl -w'

source ~/.git-completion.bash
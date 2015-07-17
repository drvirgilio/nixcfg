{ config, pkgs, ... } :
{
  config.programs.bash.enableCompletion = true;
  config.programs.bash.promptInit = ''
    # Provide a nice prompt
    PROMPT_COLOR="1;31m"
    let $UID && PROMPT_COLOR="1;32m"
    PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\n\\$\[\033[0m\] "
    if test "$TERM" = "xterm"; then
    PS1="\[\033]2;\h:\u:\w\007\]$PS1"
    fi
  '';
}

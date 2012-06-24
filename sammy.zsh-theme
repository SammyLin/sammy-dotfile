# change your machine name
MACHINE="Sammy"

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));

    echo "(${hours_since_last_commit}h${minutes_since_last_commit}m | ";
}
function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    # echo "("${ref#refs/heads/}") ";
    echo "${ref#refs/heads/}) ";
}
PROMPT='%{$fg_bold[yellow]%} ⚡%{$fg_bold[green]%}%p %{$fg[cyan]%} %2~ %{$fg_bold[blue]%}$(git_since_last_commit)%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

RPROMPT='[%F{green}%T%f]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

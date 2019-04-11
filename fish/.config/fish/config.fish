set fish_greeting ""

set -gx PATH ~/.gem/ruby/2.6.0/bin $PATH

alias c "clear"
alias vim "/usr/bin/nvim"

function fuck
    eval command sudo $history[1]
end

function doco
    docker-compose $argv
end

alias stop_docker_containers "docker stop (docker ps -a -q)"
alias remove_docker_containers "docker rm (docker ps -a -q)"
alias delete_docker_images "docker rmi -f (docker images -a -q)"

function current_branch
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3-8
end

function fco -d "Fuzzy-find and checkout a branch. Sorted on most recently checked out."
	git reflog --grep-reflog="checkout:" -n 500 | sed 's/^.* to //' | sed 's/ to .*$/  /' | cat -n | sort -k2 -k1n | uniq -f1 | sort -k1n | cut -f 2- | fzf-tmux +s --reverse --inline-info --prompt 'λ ' | xargs git checkout
end

alias gst "git status"
alias master "git checkout master"
alias pull_master "git checkout master; git pull; git checkout -"
alias rebase_onto_master "git pull --rebase origin master"
alias force_pull "git fetch --all; git reset --hard origin/(current_branch)"
alias force_push "git push --force-with-lease origin (current_branch)"

alias gg "lazygit"

eval (python -m virtualfish)
source ~/.config/fish/config_local.fish

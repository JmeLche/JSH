# JSH macOS prompt

autoload -Uz colors && colors

jsh_git() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return
  git branch --show-current 2>/dev/null
}

jsh_prompt() {
  local code=$?
  local branch="$(jsh_git)"

  local ok="%F{green}🟢✓%f"
  local fail="%F{red}🔴✗${code}%f"
  local result="$ok"
  (( code != 0 )) && result="$fail"

  PROMPT=$'%F{green}🟢 JmeLche%f  %F{magenta}👤 %n%f  %F{cyan}🌐 %m%f  %F{cyan}%D{%H:%M:%S}%f\n%F{green}📁 %~%f'

  [[ -n "$branch" ]] && PROMPT+="  %F{blue}🌿 ${branch}%f"

  PROMPT+="  ${result}"$'\n'"%F{yellow}❯%f "
}

precmd_functions+=(jsh_prompt)

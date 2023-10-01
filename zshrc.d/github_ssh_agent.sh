# Autostart ssh-agent
sshkeys=( ~/.ssh/github_key )

valid=0
for i in "${!sshkeys[@]}" ; do 
    if test -f "${sshkeys[i]}"; then 
		valid=1
	else
        unset 'sshkeys[i]'
    fi 
done
if [[ $valid = 0 ]]; then 
	echo "No valid keys"
    return
fi 
unset valid 

env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent -a ~/.ssh/agent.sock >| "$env")
    . "$env" >| /dev/null ; }

    agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
fi
if [ $agent_run_state -gt 0 ]; then
	for sshkey in "${sshkeys[@]}"; do
		ssh-add $sshkey
	done
fi

unset env


# Kill active ssh-agent

if [ ! -z "$SSH_AGENT_PID" ]
then
   ssh-agent -k
fi

plugins=(
  git
  ruby
  rake
  rbenv
  rails
  docker
  python
)

source ~/.aliases

# Go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# GCloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Istio
export PATH="$PATH:/Users/mbrizeno/istio-1.0.3/bin"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# NVM setup
export NVM_DIR="/Users/mbrizeno/.nvm"
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# JEnv setup
export PATH="HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

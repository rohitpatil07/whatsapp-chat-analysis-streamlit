#!/bin/bash

install_dependencies(){
  echo "**************** Installing Dependencies ***********************"
  echo "LOG : Updating packages"
  sudo apt update -y 
  sudo apt upgrade -y
  echo "LOG : Installing docker compose"
  
  # Remove any existing docker-compose version
  sudo apt remove docker-compose -y
  
  # Install latest docker-compose
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  
  echo "LOG : Installation Successfully"
  
  # Verify installation
  echo "LOG : docker compose version : "
  docker-compose --version
}

clone_repo(){
  echo "**************** Cloning Repo ***********************"
  git clone "https://github.com/rohitpatil07/whatsapp-chat-analysis-streamlit.git"
  echo "LOG : Repo Cloned"
}

build(){
  echo "**************** Building Image ***********************"
  #docker build -t chatanalysis .
  echo "LOG : Image built"
}

deploy(){
  echo "**************** Deploying Image ***********************"
  docker-compose up -d
  echo "LOG : Application should be running port 8501"
}

install_dependencies
clone_repo

#Change to repo directory
echo "LOG : Changing to Working Directory"
cd whatsapp-chat-analysis-streamlit

build
deploy

#!/bin/zsh

#Update Server OS
function update-os {
  sudo apt-get -y update && \
  sudo apt-get -y upgrade && \
  sudo apt-get -y autoremove && \
  sudo apt-get -y autoclean && \
  sudo apt-get -y full-upgrade && \
  sudo do-release-upgrade
}

#Update Permissions On Media Directories / Files
function update-media-permissions {
  base_dir=/mnt
  media_dirs=(movies_0-k movies_l-s movies_t-z tv videos)

  find ${base_dir}/* -type d -exec chmod 700 '{}' \;

  for dir in ${media_dirs}; do
    echo -n "Refreshing ${dir}..."
  
    find ${base_dir}/${dir} -type f -exec sh -c 'sudo chattr -i "${1}" && chmod 400 "${1}" && sudo chattr +i "${1}"' _ '{}' \;

    echo "Done."
  done
}

printf "Server Update: $(date)\n\n"

printf "Updating O/S:\n\n"
update-os

printf "\nUpdating Media Permissions:\n\n"
update-media-permissions


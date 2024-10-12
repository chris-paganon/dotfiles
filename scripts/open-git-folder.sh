#!/bin/bash

find ~/Documents -type d -iname '.git' -not -path '*/backups/*' | fzf | xargs -I x0 sh -c 'path=x0; cleaned_path=${path%/*}; code ${cleaned_path}; echo "Opened ${cleaned_path} in vscode"'
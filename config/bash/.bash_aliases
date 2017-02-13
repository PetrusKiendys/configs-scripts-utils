########################
### General aliases
########################

# Clear console
alias cls="clear"

# Unzip and replace all .gz files in current folder
# NOTE: Implemented as a function because otherwise it's being evaluated at bash startup
gz-all() {
    gunzip `ls *.gz`
}

# Get the CWD during script execution
alias get-cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Convert symlink to hardlink
alias sym2hard="find -type l -exec bash -c 'ln -f \"$(readlink -m \"$0\")\" \"$0\"' {} \;"

########################
### git aliases
########################
# FIX: not working

# Show when a file was added (default format)
alias __gitcustom_whenadded="git log --diff-filter=A --format=%aI --follow -- $1 | tail -1"

# Show when a file was added (custom format)
alias __gitcustom_whenadded-customformat="git log --diff-filter=A --format=%aD --follow -- $1 | tail -1 | date +\"%Y-%m-%d %H:%M\" -f -"

# Show when a file was modified (default format)
alias __gitcustom_whenchanged="git log --diff-filter=M --format=%aI --follow -- $1 | tail -1"

# Show when a file was modified (custom format)
alias __gitcustom_whenchanged-customformat="git log --diff-filter=M --format=%aD --follow -- $1 | tail -1 | date +\"%Y-%m-%d %H:%M\" -f -"

########################
### Docker aliases
########################

# Remove all (non-running) containers
alias docker-utils-containers-rm-all="docker ps -aq | xargs docker rm"

# Remove all descendant containers
alias docker-utils-containers-rm-descendant="~/scripts/utils/docker-utils-containers-rm-descendant.sh"

# Remove all untagged images
alias docker-utils-images-rmi-untagged="~/scripts/utils/docker-utils-images-rmi-untagged.sh"

# List containers in a more compact format
alias docker-utils-ps-compact="docker ps --format \"table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}\""

# Remove all dangling volumes
alias docker-utils-volumes-rm-dangling="docker volume rm `docker volume ls -f 'dangling=true' | awk '{print $2}' | sed -n '1!p'`"

# Remove all volumes
alias docker-utils-volumes-rm-all="docker volume rm `docker volume ls | awk '{print $2}' | sed -n '1!p'`"

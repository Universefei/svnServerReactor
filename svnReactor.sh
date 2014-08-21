#!/usr/bin/env bash

# =============================================================================
# Variables
# =============================================================================

pathWithFilename=$1
listenPort=$2


# =============================================================================
# Functions
# =============================================================================

function prompt()
{
}


# =============================================================================
# Logic
# =============================================================================

set x

# <1> Check if installed subversion
which svnserve &> /dev/null
if [[ $? != 0 ]];then
    echo "Make sure subversion installed before running this executable"
    # terminate scripte if not installed subversion
    # TODO:if detect not installed svn, promt if install it.
    exit 1
fi

# <2> Create SVN Repo
svnadmin create $1 ||
{
    echo "create repo error"
    exit 1
}

# <3> Set up to launch server once OS startup

# <4> Start server
svnserve -d --listen-port ${listenPort} -r ${pathWithFilename} ||
{
    echo "start svnserve error"
    exit 1
}


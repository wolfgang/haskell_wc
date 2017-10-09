#!/bin/bash
stack build
[ "$?" != "0" ] && exit $?
stack exec wc -- $*

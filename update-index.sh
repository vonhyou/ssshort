#!/bin/bash

redirect_list=$(sh make-list.sh)

sed -i "s|<div id='list'></div>|<div id='list'>$redirect_list</div>|" index.html


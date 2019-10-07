#!/bin/bash

trap control_c INT

function control_c() {
    printf "\e[91mTest interrupted.\e[0m\n"
    exit 1
}

templates=`find templates -name "*.yml"`

for template in $templates
do
    printf "Checking $template: "
    if aws cloudformation validate-template --template-body file://$template 1> /dev/null
    then
        printf "\e[92mOK\e[0m\n"
    else
        printf "\e[91mFAILED\e[0m\n"
        exit 1
    fi
done
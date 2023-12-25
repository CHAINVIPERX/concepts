#!/bin/bash


name=""
wishes="Hi!"

usage(){
    echo "Usage :: $(basename $0) -n <name> -w <wishes>"
    echo "Options ::"
    echo "-n, specify the name"
    echo "-w, specify the wishes"
    echo "-h, For help"
}
while getopts ":h:n:w:" opt;
do
    case $opt in
        n) name="$OPTARG";;
        w) wishes="$OPTARG";;
        h) usage;exit ;;
        \?) echo "Invalid Option ::$OPTARG" >&2; usage;exit;;
        :) usage;exit ;;   
    esac
done

if [ -z "$name" ];
then
    echo "ERROR:: -n and - w are mandaory"
    usage
    exit 1
fi
echo "${name} is a human"
echo "${wishes} is a wish"
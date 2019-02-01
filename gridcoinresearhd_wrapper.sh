#!/bin/bash

GRC_CMD='gridcoinresearchd -rpcuser=$GRC_USERNAME -rpcpassword=$GRC_PASSWD'

case $1 in

c|cmd)
	$GRC_CMD "${@:2}"
	;;

l)
	clear
	tail -f -n 40 ~/.GridcoinResearch/debug.log
	clear
	;;

pc|p)
	ps -e | grep gridcoin
	;;

ps|k)
	$GRC_CMD stop
	echo Stopping gridcoinresearchd
	ps -e | grep gridcoin
	;;

pk|kx)
	killall gridcoinresearchd
	echo Forcing gridcoinresearchd stop
	ps -e | grep gridcoin
	;;

h|height)
	while true ; do
		$GRC_CMD getblockcount
		sleep 1
	done
	;;
	
b|balance)
	$GRC_CMD getbalance
	;;

a|address)
	$GRC_CMD listaddressgroupings
	;;

*)
	echo "gridcoinresearchd wrapper"
	echo "Usage: grc [options]"
	echo ""
	echo "options:"
	echo -e "\tc\tCommand redirect: gridcoinresearchd (commands entered)"
	echo -e "\tl\tLog view"
	echo -e "\tpc\tProcess Check"
	echo -e "\tps\tProcess Stop(exit)"
	echo -e "\tpk\tProcess Kill(force stop)"
	echo -e "\th\tget Height(blockcount)"
	echo -e "\tb\tget Balance"
	echo -e "\ta\tget Addresses"
	echo ""
	;;

esac

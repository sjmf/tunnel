#!/bin/bash
#if ! ifconfig wlan0 | grep -q "inet addr:"; then
if ! ping -c1 8.8.8.8; then
	ifdown --force wlan0 &&
	ifup --force wlan0 &&
	echo Wifi reset on: `date` 
else
	echo Wifi is up: `date`
fi

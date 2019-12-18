#!/bin/sh

NEXT='next'
PREV='prev'

# Check if i'm at home
if [[ $(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}') == *u* ]]; then 
  NEXT='next'
  PREV='prev'
fi

if [[ $1 == 'next' ]]; then
  yabai -m window --display $NEXT; yabai -m display --focus $NEXT
else
  yabai -m window --display $PREV; yabai -m display --focus $PREV
fi

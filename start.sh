#!/bin/bash
# 微信小游戏外挂
# 发传单
producer=(972 2005)
consumer=(
	# 小费
	'430,585'

	# 点菜
	'385,800'
	'660,800'
	'940,800'

	'385,1150'
	'660,1150'
	'940,1150'

	# 收钱
#	'125,870'
#	'425,970'
#	'700,970'
#	'975,970'

#	'425,1330'
#	'700,1330'
#	'975,1330'

#	'425,1625'
#	'500,1835'
)

function random_range() {
    local beg=$1
    local end=$2
    echo $((RANDOM % ($end - $beg) + $beg))
}

function click() {
	x=$(($1 + $(random_range -10 10)))
	y=$(($2 + $(random_range -10 10)))
	echo $x $y
	sendevent /dev/input/event1 3 57 62818
	sendevent /dev/input/event1 1 330 1
	sendevent /dev/input/event1 1 325 1
	sendevent /dev/input/event1 3 53 $x
	sendevent /dev/input/event1 3 54 $y
	sendevent /dev/input/event1 3 48 5
	sendevent /dev/input/event1 0 0 0
	sendevent /dev/input/event1 3 57 4294967295
	sendevent /dev/input/event1 1 330 0
	sendevent /dev/input/event1 1 325 0
	sendevent /dev/input/event1 0 0 0
}

while
do
	for c in ${consumer[*]}
	do
		click $(echo $c | cut -d "," -f1) $(echo $c | cut -d "," -f2)
	done

	for i in `seq 1 160`
	do 
		click ${producer[0]} ${producer[1]}
	done
	sleep 0.1
done
#!/bin/sh

PATH_SCRIPT='/Users/armel/Dropbox/RRFTracker_Web/back/RRFTracker.py'
PATH_LOG='/Users/armel/WebRoot/armel/RRF'
PATH_PID='/tmp'

case "$1" in
    start)
        echo "Starting RRFTracker: RRF"
        nohup python $PATH_SCRIPT --room RRF --log-path $PATH_LOG > $PATH_PID/RRFTracker_RRF.log 2>&1 & echo $! > $PATH_PID/RRFTracker_RRF.pid
        echo "Starting RRFTracker: TECHNIQUE"
        nohup python $PATH_SCRIPT --room TECHNIQUE --log-path $PATH_LOG > $PATH_PID/RRFTracker_TECHNIQUE.log 2>&1 & echo $! > $PATH_PID/RRFTracker_TECHNIQUE.pid
        echo "Starting RRFTracker: BAVARDAGE"
        nohup python $PATH_SCRIPT --room BAVARDAGE --log-path $PATH_LOG > $PATH_PID/RRFTracker_BAVARDAGE.log 2>&1 & echo $! > $PATH_PID/RRFTracker_BAVARDAGE.pid
        echo "Starting RRFTracker: INTERNATIONAL"
        nohup python $PATH_SCRIPT --room INTERNATIONAL --log-path $PATH_LOG > $PATH_PID/RRFTracker_INTERNATIONAL.log 2>&1 & echo $! > $PATH_PID/RRFTracker_INTERNATIONAL.pid
        ;;
    stop) 
        echo "Stopping RRFTracker: RRF"
        kill `cat $PATH_PID/RRFTracker_RRF.pid`
        echo "Stopping RRFTracker: TECHNIQUE"
        kill `cat $PATH_PID/RRFTracker_TECHNIQUE.pid`
        echo "Stopping RRFTracker: BAVARDAGE"
        kill `cat $PATH_PID/RRFTracker_BAVARDAGE.pid`
        echo "Stopping RRFTracker: INTERNATIONAL"
        kill `cat $PATH_PID/RRFTracker_INTERNATIONAL.pid`
        ;;
    esac
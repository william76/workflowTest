#!/usr/bin/env bash
#
# Generate a bunch of test issues for testing the autocloser action.
#

#for (( i=1; i<=30; ++i)); do
#    echo "gh issue create --title='Test Issue ${thedate:?} ${i:?}' --body='Test Issue'"
#    #gh issue create --title="Test Issue ${thedate:?} ${i:?}" --body="Test Issue"
#done

delay_min=86
delay_max=864

# 86400 : seconds in 1 day
time_limit=86400

START=`date +%s`
while [ $(( $(date +%s) - ${time_limit:?} )) -lt $START ]; do
    delay_secs=$(( $RANDOM % (${delay_max} - ${delay_min}) + ${delay_min}+1 ))

    thedate=$(date +"%Y-%m-%d")
    thetime=$(date +"%H:%M:%S")

    echo "gh issue create --title='Test Issue ${thedate:?} @ ${thetime:?}' --body='Test Issue'"
    gh issue create \
        --title="Test Issue ${thedate:?} @ ${thetime:?}" \
        --body="This issue is for testing the auto-closer tool"

    # delay
    echo "sleep $delay_secs"
    START_DELAY=`date +%s`
    while [ $(( $(date +%s) - ${delay_secs:?} )) -lt $START_DELAY ]; do
        sleep 10
        printf "."
    done
    printf "\n"
    printf "\n"

done

echo ""
echo "Done."
echo ""



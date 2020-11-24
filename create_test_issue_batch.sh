#!/usr/bin/env bash
#
# Generate a bunch of test issues for testing the autocloser action.
#

#for (( i=1; i<=30; ++i)); do
#    echo "gh issue create --title='Test Issue ${thedate:?} ${i:?}' --body='Test Issue'"
#    #gh issue create --title="Test Issue ${thedate:?} ${i:?}" --body="Test Issue"
#done

# use 86..864 to generate between 100-1000 issues per day.
delay_min=10
delay_max=60

# 86400 : seconds in 1 day
#  3600 : seconds in 1 hour
time_limit=3600

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



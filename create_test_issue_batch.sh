#!/usr/bin/env bash
#
# Generate a bunch of test issues for testing the autocloser action.
#

#for (( i=1; i<=30; ++i)); do
#    echo "gh issue create --title='Test Issue ${thedate:?} ${i:?}' --body='Test Issue'"
#    #gh issue create --title="Test Issue ${thedate:?} ${i:?}" --body="Test Issue"
#done

delay_min=60
delay_max=3600

for (( i=1; i<= 100; ++i)); do
    delay_secs=$(( $RANDOM % (${delay_max} - ${delay_min}) + ${delay_min}+1 ))
    
    thedate=$(date +"%Y-%m-%d")
    echo "gh issue create --title='Test Issue ${thedate:?} ${i:?}' --body='Test Issue'"
    gh issue create --title="Test Issue ${thedate:?} ${i:?}" --body="Test Issue"
    
    echo "sleep $delay_secs"
    sleep ${delay_secs}
done



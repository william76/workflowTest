#!/usr/bin/env bash
#
# Generate a bunch of test issues for testing the autocloser action.
#


thedate=$(date +"%Y-%m-%d")

for (( i=1; i<=30; ++i)); do
    echo "gh issue create --title='Test Issue ${thedate:?} ${i:?}' --body='Test Issue'"
    gh issue create --title="Test Issue ${thedate:?} ${i:?}" --body="Test Issue"
done




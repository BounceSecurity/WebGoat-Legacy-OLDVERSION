#!/bin/bash

# Note that this does not run pro rules to avoid having to do semgrep login

sudo apt-get install -y aha

declare -a StringArray=("--force-color -o semgrep_results.txt" "--sarif -o semgrep_results.sarif" "--json -o semgrep_results.json"  "--vim -o semgrep_results.vim")

for outFormat in "${StringArray[@]}"
do
  semgrep --oss-only --config "p/gitlab" --config p/java --config r/contrib.owasp.java --metrics='off' --severity='WARNING' --severity='ERROR'  $outFormat 
done

cat semgrep_results.txt | aha --black > semgrep_results.html

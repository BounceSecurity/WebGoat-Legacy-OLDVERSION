#!/bin/bash

# Note that this does not run pro rules to avoid having to do semgrep login

declare -a StringArray=("--no-force-color -o semgrep_results.txt" "--sarif -o semgrep_results.sarif" "--json -o semgrep_results.json"  )

for outFormat in "${StringArray[@]}"
do
  semgrep --verbose --oss-only --config p/java --config r/contrib.owasp.java --config r/generic --include='*.java' --metrics='off' --severity='WARNING' --severity='ERROR' $outFormat 
done

cat semgrep_results.txt | sed 's/\x1b\[[0-9;]*m//g' > semgrep_results.clean.txt
rm semgrep_results.txt
mv semgrep_results.clean.txt semgrep_results.txt
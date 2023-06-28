#!/bin/bash

declare -a StringArray=("-o semgrep_results.txt" "--sarif -o semgrep_results.sarif" "--json -o semgrep_results.json"  )

for outFormat in "${StringArray[@]}"
do
  semgrep --verbose --config p/java --config r/contrib.owasp.java --config r/generic --include='*.java' --metrics='off' --severity='WARNING' --severity='ERROR' $outFormat 
done
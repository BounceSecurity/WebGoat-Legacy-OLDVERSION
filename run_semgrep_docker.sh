#!/bin/bash

# Note that this does not run pro rules to avoid having to do semgrep login

docker run -v ${PWD}:/src returntocorp/semgrep semgrep --verbose --config p/java --config r/contrib.owasp.java --config r/generic --include='*.java' --metrics='off' --severity='WARNING' --severity='ERROR' -o '/src/semgrep_results.txt'

docker run -v ${PWD}:/src returntocorp/semgrep semgrep --verbose --config p/java --config r/contrib.owasp.java --config r/generic --include='*.java' --metrics='off' --severity='WARNING' --severity='ERROR' -o '/src/semgrep_results.sarif' --sarif

docker run -v ${PWD}:/src returntocorp/semgrep semgrep --verbose --config p/java --config r/contrib.owasp.java --config r/generic --include='*.java' --metrics='off' --severity='WARNING' --severity='ERROR' -o '/src/semgrep_results.json' --json
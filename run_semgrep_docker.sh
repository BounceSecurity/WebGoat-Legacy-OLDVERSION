#!/bin/bash

# Note that this does not run pro rules to avoid having to do semgrep login

sudo apt-get install -y aha

docker run -v ${PWD}:/src returntocorp/semgrep semgrep --oss-only --config p/java --config r/contrib.owasp.java --metrics='off' --severity='WARNING' --severity='ERROR' --exclude-rule java.lang.security.audit.active-debug-code-printstacktrace.active-debug-code-printstacktrace --force-color -o '/src/semgrep_results.txt'

docker run -v ${PWD}:/src returntocorp/semgrep semgrep --oss-only --config p/java --config r/contrib.owasp.java --metrics='off' --severity='WARNING' --severity='ERROR' --exclude-rule java.lang.security.audit.active-debug-code-printstacktrace.active-debug-code-printstacktrace -o '/src/semgrep_results.sarif' --sarif

docker run -v ${PWD}:/src returntocorp/semgrep semgrep --oss-only --config p/java --config r/contrib.owasp.java --metrics='off' --severity='WARNING' --severity='ERROR' --exclude-rule java.lang.security.audit.active-debug-code-printstacktrace.active-debug-code-printstacktrace -o '/src/semgrep_results.json' --json

cat semgrep_results.txt | aha --black > semgrep_results.html
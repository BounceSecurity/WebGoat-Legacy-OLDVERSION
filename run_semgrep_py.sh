semgrep scan --verbose --config p/java --config r/contrib.owasp.java --config r/generic --include='*.java' --metrics='off' --severity='WARNING' --severity='ERROR' -o 'semgrep_results.txt'

semgrep scan --verbose --config p/java --config r/contrib.owasp.java --config r/generic --include='*.java' --metrics='off' --severity='WARNING' --severity='ERROR' -o 'semgrep_results.sarif' --sarif


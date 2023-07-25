#!/bin/bash

# Note that this does not run pro rules to avoid having to do semgrep login

sudo apt-get install -y aha

declare -a StringArray=("--force-color -o semgrep_results.txt" "--sarif -o semgrep_results.sarif" "--json -o semgrep_results.json"  "--vim -o semgrep_results.vim")

for outFormat in "${StringArray[@]}"
do
  semgrep --oss-only --config "p/gitlab" --config p/java --config r/contrib.owasp.java --metrics='off' --severity='WARNING' --severity='ERROR' \
  --exclude-rule gitlab.find_sec_bugs.INFORMATION_EXPOSURE_THROUGH_AN_ERROR_MESSAGE-1 \
  --exclude-rule gitlab.eslint.detect-object-injection \
  --exclude-rule gitlab.eslint.detect-non-literal-regexp \
  --exclude-rule gitlab.find_sec_bugs.CUSTOM_INJECTION-2 \
  --exclude-rule gitlab.eslint.detect-object-injection \
  --exclude-rule gitlab.find_sec_bugs.SQL_INJECTION_SPRING_JDBC-1.SQL_INJECTION_JPA-1.SQL_INJECTION_JDO-1.SQL_INJECTION_JDBC-1.SQL_NONCONSTANT_STRING_PASSED_TO_EXECUTE-1 \
  --exclude-rule gitlab.find_sec_bugs.SQL_INJECTION_SPRING_JDBC-1.SQL_INJECTION_JPA-1.SQL_INJECTION_JDO-1.SQL_INJECTION_JDBC-1.SQL_NONCONSTANT_STRING_PASSED_TO_EXECUTE-1.SQL_INJECTION-1.SQL_INJECTION_HIBERNATE-1.SQL_INJECTION_VERTX-1.SQL_PREPARED_STATEMENT_GENERATED_FROM_NONCONSTANT_STRING-1 \
  --exclude-rule gitlab.eslint.detect-eval-with-expression \
  --exclude-rule gitlab.find_sec_bugs.CUSTOM_INJECTION-1 \
  --exclude-rule gitlab.find_sec_bugs.SERVLET_PARAMETER-1.SERVLET_CONTENT_TYPE-1.SERVLET_SERVER_NAME-1.SERVLET_SESSION_ID-1.SERVLET_QUERY_STRING-1.SERVLET_HEADER-1.SERVLET_HEADER_REFERER-1.SERVLET_HEADER_USER_AGENT-1 \
  --exclude-rule gitlab.find_sec_bugs.TRUST_BOUNDARY_VIOLATION-1 \
  --exclude-rule gitlab.find_sec_bugs.XSS_SERVLET-2.XSS_SERVLET_PARAMETER-1 \
  $outFormat 
done

cat semgrep_results.txt | aha --black > semgrep_results.html

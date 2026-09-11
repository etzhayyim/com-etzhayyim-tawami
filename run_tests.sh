#!/usr/bin/env bash
# 撓 tawami — clj-native test runner (babashka).
set -uo pipefail
cd "$(dirname "$0")"

SUITES=(
  "test/tawami/methods/test_tawami_edn.cljk"
  "test/tawami/methods/test_analyze.cljk"
  "test/tawami/methods/test_kotoba.cljk"
  "test/tawami/methods/test_autorun.cljk"
  "test/tawami/methods/test_claim.cljk"
)

fail=0
for s in "${SUITES[@]}"; do
  echo "== $s =="
  if bb --classpath src:test "$s"; then :; else echo "FAILED: $s"; fail=1; fi
done
exit $fail

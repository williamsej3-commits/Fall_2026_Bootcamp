#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPORT_TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
REPORT_DIR="$ROOT_DIR/reports/run_$REPORT_TIMESTAMP"

TARGET_HOST="${1:-localhost}"
LOG_FILE="$ROOT_DIR/logs/server.log"

mkdir -p "$REPORT_DIR"

echo "LIVE SERVER DIAGNOSTIC TOOL"
echo "==========================="
echo "Report directory: $REPORT_DIR"
echo "Target host: $TARGET_HOST"
echo

run_step() {
    step_name="$1"
    output_file="$2"
    shift 2

    echo "Running: $step_name"

    if "$@" > "$output_file" 2>&1
    then
        echo "Status: PASS"
    else
        echo "Status: FAIL"
    fi

    echo "Output: $output_file"
    echo
}

run_step \
    "Python system info check" \
    "$REPORT_DIR/system_info.txt" \
    python3 "$ROOT_DIR/diagnostics/python/system_info.py"

run_step \
    "Python resource check" \
    "$REPORT_DIR/resource_check.txt" \
    python3 "$ROOT_DIR/diagnostics/python/resource_check.py"

run_step \
    "Python log scan" \
    "$REPORT_DIR/log_scan.txt" \
    python3 "$ROOT_DIR/diagnostics/python/log_scan.py" "$LOG_FILE"

run_step \
    "Shell disk snapshot" \
    "$REPORT_DIR/disk_snapshot.txt" \
    bash "$ROOT_DIR/diagnostics/shell/disk_snapshot.sh" "$ROOT_DIR"

run_step \
    "Shell network check" \
    "$REPORT_DIR/network_check.txt" \
    bash "$ROOT_DIR/diagnostics/shell/network_check.sh" "$TARGET_HOST"

echo "Diagnostic run complete."
echo "Reports saved in:"
echo "$REPORT_DIR"

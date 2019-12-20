#!/bin/sh
set -e

if [ "$#" -lt 0 ]; then
    echo "Usage: $(basename $0) [optional bazel args] BAZEL_BUILD_ARGUMENTS"
    exit 1
fi

bazel build --experimental_action_listener=//tools/actions:generate_compile_commands_listener $*
python3 ./tools/actions/generate_compile_commands_json.py
exit 0

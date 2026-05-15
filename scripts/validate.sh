#!/usr/bin/env bash
set -euo pipefail

mapfile -t files < <(find clusters bundles pipelines releases approvals -type f \( -name "*.yaml" -o -name "*.yml" \) 2>/dev/null | sort)

ruby -e 'require "yaml"; ARGV.each { |file| YAML.load_stream(File.read(file)) }' "${files[@]}"

echo "Hub config YAML syntax parsed successfully."

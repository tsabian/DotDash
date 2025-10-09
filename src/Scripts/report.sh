#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$script_dir/../build/test_reports"

echo "📊 Gerando relatório HTML dos testes..."
echo "🔎 Procurando por arquivos .xcresult em build/test_reports..."
find $root_dir -type d -name "*.xcresult" -print0 | 
while IFS= read -r -d '' file; do
    echo "Found .xcresult at $file";
    if command -v xchtmlreport >/dev/null 2>&1; then
        filenamewithoutextension=$(basename "$file" .xcresult)
        path="$root_dir/$filenamewithoutextension"
        echo "Generating report for $filenamewithoutextension"
        mkdir -p $path
        xchtmlreport "$file" --output "$path"
        echo "✅ Relatório HTML gerado em $path"
    else
        echo "❌ xchtmlreport não está instalado. Por favor, instale-o para gerar relatórios HTML."
    fi
done

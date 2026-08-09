#!/bin/bash
OUTPUT="/vol1/1000/github/images/map.json"
echo "{" > "$OUTPUT"
first=true
find wallpapers -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sort | while read -r file; do
    path_clean=${file#wallpapers/}
    url="https://cdn.jsdelivr.net/gh/kssku/images@main/$file"
    [ "$first" = true ] && first=false || echo "," >> "$OUTPUT"
    echo "  \"$path_clean\": \"$url\"" >> "$OUTPUT"
done
echo "}" >> "$OUTPUT"
echo "✅ 映射表已生成: $OUTPUT"

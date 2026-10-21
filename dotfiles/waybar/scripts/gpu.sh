#!/usr/bin/env bash
# Waybar custom module: NVIDIA utilisation, VRAM and temperature as JSON

read -r util used total temp < <(
    nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total,temperature.gpu \
        --format=csv,noheader,nounits | tr -d ','
)

class=""
if (( util >= 90 )); then class="critical"; elif (( util >= 70 )); then class="warning"; fi

printf '{"text":"󰢮  %s%%","tooltip":"GPU %s%%\\nVRAM %s / %s MiB\\nTemp %s°C","class":"%s","percentage":%s}\n' \
    "$util" "$util" "$used" "$total" "$temp" "$class" "$util"

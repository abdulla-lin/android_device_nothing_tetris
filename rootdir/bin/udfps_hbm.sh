#!/system/bin/sh
HBM_NODE="/sys/panel_feature/hbm_mode"
BL_CUR="/sys/devices/platform/mtk-leds/leds/lcd-backlight/brightness"
BL_MAX="/sys/devices/platform/mtk-leds/leds/lcd-backlight/max_brightness"

# Try enable local HBM if supported; fallback to global
if [ -w "$HBM_NODE" ]; then
    # 1=LHBM (if supported); if not, 2=GHBM
    echo 1 > "$HBM_NODE" || echo 2 > "$HBM_NODE"
fi

if [ -r "$BL_MAX" ] && [ -w "$BL_CUR" ]; then
    MAX=$(cat "$BL_MAX")
    # Target ~60% of max
    TARGET=$(( MAX * 60 / 100 ))
    echo "$TARGET" > "$BL_CUR"
fi

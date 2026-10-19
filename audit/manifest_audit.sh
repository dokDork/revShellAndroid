#!/bin/bash
# manifest_audit.sh — analisi sicurezza AndroidManifest
# Uso: ./manifest_audit.sh <percorso/app.apk>

APK="$1"
TMPDIR="/tmp/manifest_audit_$$"

[ -z "$APK" ] && { echo "Uso: $0 <app.apk>"; exit 1; }

echo "[*] Decompilazione in corso..."
apktool d "$APK" -o "$TMPDIR" -f -q 2>/dev/null
MANIFEST="$TMPDIR/AndroidManifest.xml"

echo ""
echo "══════════════════════════════"
echo " IDENTITÀ E SDK"
echo "══════════════════════════════"
grep -oP '(?<=package=")[^"]+' "$MANIFEST" | xargs -I{} echo "  Package        : {}"
grep -oP 'android:versionCode="\K[^"]+' "$MANIFEST" | xargs -I{} echo "  versionCode    : {}"
grep -oP 'android:versionName="\K[^"]+' "$MANIFEST" | xargs -I{} echo "  versionName    : {}"
grep -oP 'android:minSdkVersion="\K[^"]+' "$MANIFEST" | xargs -I{} echo "  minSdkVersion  : {}"
grep -oP 'android:targetSdkVersion="\K[^"]+' "$MANIFEST" | xargs -I{} echo "  targetSdkVersion: {}"

echo ""
echo "══════════════════════════════"
echo " FLAG DI SICUREZZA"
echo "══════════════════════════════"
for flag in debuggable allowBackup usesCleartextTraffic; do
    val=$(grep -oP "android:$flag=\"\K[^\"]+(?=\")" "$MANIFEST")
    [ -n "$val" ] && echo "  [!] $flag = $val" || echo "      $flag = non dichiarato"
done
grep -oP 'android:networkSecurityConfig="\K[^"]+' "$MANIFEST" | \
    xargs -I{} echo "  [i] networkSecurityConfig: {}"

echo ""
echo "══════════════════════════════"
echo " COMPONENTI EXPORTED"
echo "══════════════════════════════"
grep -n 'exported="true"' "$MANIFEST" | while IFS= read -r line; do
    echo "  $line"
done

echo ""
echo "══════════════════════════════"
echo " PERMESSI RICHIESTI"
echo "══════════════════════════════"
grep 'uses-permission' "$MANIFEST" | \
    grep -oP 'android:name="\K[^"]+' | \
    sed 's/^/  /'

echo ""
echo "══════════════════════════════"
echo " NETWORK SECURITY CONFIG"
echo "══════════════════════════════"
NSC=$(grep -oP 'android:networkSecurityConfig="@xml/\K[^"]+' "$MANIFEST")
NSC_FILE="$TMPDIR/res/xml/${NSC}.xml"
if [ -f "$NSC_FILE" ]; then
    grep -n 'src="user"\|cleartextTrafficPermitted="true"' "$NSC_FILE" | \
        sed 's/^/  [!] riga /'
else
    echo "  File network_security_config non trovato"
fi

rm -rf "$TMPDIR"

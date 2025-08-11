#!/usr/bin/env bash
set -euo pipefail
npm ci || npm install
npm run build
npx cap add android || true
npx cap copy
cd android
./gradlew assembleDebug
./gradlew bundleRelease
echo "APK: app/build/outputs/apk/debug/app-debug.apk"
echo "AAB: app/build/outputs/bundle/release/app-release.aab"

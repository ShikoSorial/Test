\
@echo off
npm ci || npm install
if %errorlevel% neq 0 exit /b %errorlevel%
npm run build
if %errorlevel% neq 0 exit /b %errorlevel%
npx cap add android || echo Android already added
npx cap copy
cd android
gradlew.bat assembleDebug
if %errorlevel% neq 0 exit /b %errorlevel%
gradlew.bat bundleRelease
if %errorlevel% neq 0 exit /b %errorlevel%
echo APK: app\build\outputs\apk\debug\app-debug.apk
echo AAB: app\build\outputs\bundle\release\app-release.aab

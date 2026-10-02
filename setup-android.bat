@echo off
chcp 65001 >nul
REM ============================================================
REM 🕌 Noor-AI - Script d'installation et de build APK (Windows)
REM ============================================================
REM Double-cliquez sur ce fichier pour lancer l'installation.
REM ============================================================

echo.
echo ╔══════════════════════════════════════════════════╗
echo ║                                                  ║
echo ║   🕌  Noor-AI - Installation Android (APK)      ║
echo ║                                                  ║
echo ║   بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ         ║
echo ║                                                  ║
echo ╚══════════════════════════════════════════════════╝
echo.

REM Vérifier Node.js
echo 🔍 Vérification de Node.js...
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js n'est pas installé !
    echo    Téléchargez-le sur : https://nodejs.org
    pause
    exit /b 1
)
echo    ✅ Node.js trouvé
node --version

REM Vérifier Java
echo 🔍 Vérification de Java...
where java >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Java n'est pas installé !
    echo    Téléchargez JDK 17 sur : https://adoptium.net
    pause
    exit /b 1
)
echo    ✅ Java trouvé
java --version

echo.
echo 📦 Installation des dépendances npm...
call npm install

echo.
echo 📦 Installation de Capacitor...
call npm install @capacitor/core @capacitor/cli @capacitor/android
call npm install @capacitor/splash-screen @capacitor/status-bar @capacitor/keyboard @capacitor/local-notifications @capacitor/app @capacitor/haptics

echo.
echo 🔨 Build de l'application web...
call npm run build

echo.
echo 🤖 Configuration de Capacitor...
if not exist "android" (
    call npx cap add android
)

echo.
echo 🔄 Synchronisation des fichiers...
call npx cap sync android

echo.
echo ╔══════════════════════════════════════════════════╗
echo ║                                                  ║
echo ║   ✅ Installation terminée avec succès !         ║
echo ║                                                  ║
echo ║   Prochaines étapes :                            ║
echo ║                                                  ║
echo ║   1. Ouvrir dans Android Studio :                ║
echo ║      npx cap open android                        ║
echo ║                                                  ║
echo ║   2. Dans Android Studio :                       ║
echo ║      Build → Build APK(s)                        ║
echo ║                                                  ║
echo ║   3. L'APK sera dans :                           ║
echo ║      android\app\build\outputs\apk\debug\        ║
echo ║                                                  ║
echo ╚══════════════════════════════════════════════════╝
echo.
pause

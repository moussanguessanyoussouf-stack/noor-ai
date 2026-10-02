#!/bin/bash
# ============================================================
# 🕌 Noor-AI - Script d'installation et de build APK
# ============================================================
# Ce script automatise l'installation de Capacitor et la
# préparation du projet pour la génération de l'APK Android.
#
# Utilisation :
#   chmod +x setup-android.sh
#   ./setup-android.sh
# ============================================================

set -e

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║                                                  ║"
echo "║   🕌  Noor-AI - Installation Android (APK)      ║"
echo "║                                                  ║"
echo "║   بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ         ║"
echo "║                                                  ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# Vérifier Node.js
echo "🔍 Vérification de Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js n'est pas installé !"
    echo "   Téléchargez-le sur : https://nodejs.org"
    exit 1
fi
echo "   ✅ Node.js $(node --version)"

# Vérifier Java
echo "🔍 Vérification de Java..."
if ! command -v java &> /dev/null; then
    echo "❌ Java n'est pas installé !"
    echo "   Téléchargez JDK 17 sur : https://adoptium.net"
    exit 1
fi
echo "   ✅ Java $(java --version | head -1)"

# Vérifier Android SDK
echo "🔍 Vérification du SDK Android..."
if [ -z "$ANDROID_HOME" ]; then
    echo "⚠️  ANDROID_HOME n'est pas défini."
    echo "   L'APK ne pourra pas être généré sans Android SDK."
    echo "   Installez Android Studio : https://developer.android.com/studio"
    echo ""
    read -p "   Continuer quand même ? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo "   ✅ ANDROID_HOME = $ANDROID_HOME"
fi

echo ""
echo "📦 Installation des dépendances npm..."
npm install

echo ""
echo "📦 Installation de Capacitor..."
npm install @capacitor/core @capacitor/cli @capacitor/android
npm install @capacitor/splash-screen @capacitor/status-bar @capacitor/keyboard @capacitor/local-notifications @capacitor/app @capacitor/haptics

echo ""
echo "🔨 Build de l'application web..."
npm run build

echo ""
echo "🤖 Configuration de Capacitor..."
if [ ! -d "android" ]; then
    npx cap add android
fi

echo ""
echo "🔄 Synchronisation des fichiers..."
npx cap sync android

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║                                                  ║"
echo "║   ✅ Installation terminée avec succès !         ║"
echo "║                                                  ║"
echo "║   Prochaines étapes :                            ║"
echo "║                                                  ║"
echo "║   1. Ouvrir dans Android Studio :                ║"
echo "║      npx cap open android                        ║"
echo "║                                                  ║"
echo "║   2. Dans Android Studio :                       ║"
echo "║      Build → Build APK(s)                        ║"
echo "║                                                  ║"
echo "║   3. L'APK sera dans :                           ║"
echo "║      android/app/build/outputs/apk/debug/        ║"
echo "║                                                  ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

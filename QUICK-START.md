# 🚀 Démarrage Rapide - Noor-AI vers APK

## ⚡ En 5 étapes simples

### 1️⃣ Installer les prérequis
- [Node.js](https://nodejs.org) (v18+)
- [Android Studio](https://developer.android.com/studio)
- [GitHub Desktop](https://desktop.github.com)

### 2️⃣ Cloner le projet
```bash
# Via GitHub Desktop : File → Clone Repository → URL
# URL : https://github.com/VOTRE_USERNAME/noor-ai.git
```

### 3️⃣ Lancer le script d'installation
**Windows** : Double-cliquez sur `setup-android.bat`  
**Mac/Linux** : `chmod +x setup-android.sh && ./setup-android.sh`

### 4️⃣ Générer l'APK
```bash
npx cap open android
```
Puis dans Android Studio : **Build → Build APK(s)**

### 5️⃣ Publier sur GitHub
Dans GitHub Desktop :
1. Écrivez un message de commit
2. Cliquez sur **Commit**
3. Cliquez sur **Push origin**
4. Créez une Release sur GitHub.com et attachez l'APK

---

## 📁 Fichiers importants

| Fichier | Rôle |
|---------|------|
| `setup-android.bat` | Script d'installation Windows |
| `setup-android.sh` | Script d'installation Mac/Linux |
| `GUIDE-APK.md` | Guide complet détaillé |
| `capacitor.config.json` | Config Capacitor (Android) |
| `public/manifest.json` | Config PWA |
| `public/sw.js` | Service Worker (hors-ligne) |
| `.github/workflows/build-apk.yml` | CI/CD GitHub Actions |

---

## 🤖 Alternative : GitHub Actions (Automatique)

Si vous configurez GitHub Actions, l'APK sera généré **automatiquement** à chaque push !

1. Poussez le code sur GitHub
2. Allez dans l'onglet **Actions** de votre dépôt
3. Le workflow "Build Android APK" se lance
4. Téléchargez l'APK depuis les **Artifacts**

---

## ❓ Problèmes courants

**"SDK location not found"** → Définissez `ANDROID_HOME`  
**"JAVA_HOME not set"** → Installez JDK 17  
**Gradle échoue** → `cd android && ./gradlew clean`

Voir [GUIDE-APK.md](GUIDE-APK.md) pour plus de détails.

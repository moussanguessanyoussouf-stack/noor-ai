# 🕌 Noor-AI - Application de Récitation Coranique avec IA

> Compagnon intelligent pour la récitation et la mémorisation du Saint Coran avec correction vocale par Intelligence Artificielle.

![Noor-AI](https://img.shields.io/badge/Version-1.0.0-emerald)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Web-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Fonctionnalités

- 📖 **Mushaf Numérique** - Lecture du Coran avec calligraphie arabe et traduction française
- 🎙️ **Correction IA** - Écoute active avec feedback visuel en temps réel (vert = correct, rouge = erreur)
- 🧠 **Mode Mémorisation** - Test cache-cache pour vérifier votre mémorisation
- 🎧 **Écoute Audio** - Récitations de Qaris célèbres avec synchronisation du texte
- 🔍 **Recherche** - Par mot-clé ou par thème
- 🌙 **3 Thèmes** - Sombre, Clair, Sépia
- 📴 **Mode Hors-ligne** - PWA installable, fonctionne sans internet
- 🔖 **Marque-pages** - Sauvegarde de la dernière page lue

## 📱 Installation

### Option 1 : PWA (Web App Installable)
1. Ouvrez le site dans Chrome/Edge sur Android
2. Appuyez sur "Ajouter à l'écran d'accueil"
3. L'app s'installe comme une application native

### Option 2 : APK Android (via Capacitor)
Voir le guide ci-dessous pour générer l'APK.

---

## 🔨 Guide : Générer l'APK avec GitHub Desktop

### Prérequis
- [Node.js](https://nodejs.org/) v18+ installé
- [Android Studio](https://developer.android.com/studio) installé
- [GitHub Desktop](https://desktop.github.com/) installé
- Un compte [GitHub](https://github.com)

---

### Étape 1 : Cloner le projet avec GitHub Desktop

1. Ouvrez **GitHub Desktop**
2. Cliquez sur **File → Clone Repository** (ou `Ctrl+Shift+O`)
3. Sélectionnez l'onglet **URL**
4. Entrez l'URL du dépôt : `https://github.com/VOTRE_USERNAME/noor-ai.git`
5. Choisissez le dossier local où cloner le projet
6. Cliquez sur **Clone**

### Étape 2 : Installer les dépendances

Ouvrez un terminal dans le dossier du projet et exécutez :

```bash
# Installer les dépendances npm
npm install

# Installer Capacitor et ses plugins
npm install @capacitor/core @capacitor/cli @capacitor/android
npm install @capacitor/splash-screen @capacitor/status-bar @capacitor/keyboard @capacitor/local-notifications

# Initialiser Capacitor (si pas déjà fait)
npx cap init "Noor-AI" "com.noorai.app" --web-dir=dist
```

### Étape 3 : Builder l'application web

```bash
npm run build
```

Cela génère le dossier `dist/` avec les fichiers web optimisés.

### Étape 4 : Ajouter la plateforme Android

```bash
# Ajouter la plateforme Android
npx cap add android

# Synchroniser les fichiers web avec le projet Android
npx cap sync android
```

### Étape 5 : Ouvrir dans Android Studio

```bash
npx cap open android
```

Android Studio s'ouvre avec le projet Android.

### Étape 6 : Générer l'APK dans Android Studio

1. Dans Android Studio, attendez que la synchronisation Gradle se termine
2. Allez dans **Build → Build Bundle(s) / APK(s) → Build APK(s)**
3. Attendez la compilation (quelques minutes)
4. Cliquez sur **locate** dans la notification pour trouver l'APK
5. L'APK se trouve dans : `android/app/build/outputs/apk/debug/app-debug.apk`

### Étape 7 : Signer l'APK pour la release (optionnel)

Pour une version signée (release) :

1. **Générer une clé de signature** :
```bash
keytool -genkey -v -keystore noor-ai-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias noor-ai
```

2. **Dans Android Studio** :
   - Allez dans **Build → Generate Signed Bundle / APK**
   - Sélectionnez **APK**
   - Entrez le chemin vers le fichier `.jks` et le mot de passe
   - Sélectionnez **release**
   - Cliquez sur **Finish**

3. L'APK signé sera dans : `android/app/build/outputs/apk/release/app-release.apk`

---

### Étape 8 : Publier sur GitHub avec GitHub Desktop

1. Ouvrez **GitHub Desktop**
2. Vous verrez les fichiers modifiés
3. En bas à gauche :
   - **Summary** : `v1.0.0 - Release APK`
   - **Description** : `Première version de Noor-AI avec correction IA`
4. Cliquez sur **Commit to main**
5. Cliquez sur **Push origin** pour envoyer sur GitHub
6. (Optionnel) Créez une **Release** :
   - Allez sur votre dépôt GitHub dans le navigateur
   - Cliquez sur **Releases → Create a new release**
   - Tag : `v1.0.0`
   - Ajoutez l'APK en pièce jointe
   - Cliquez sur **Publish release**

---

## 📂 Structure du projet

```
noor-ai/
├── public/
│   ├── manifest.json          # PWA Manifest
│   ├── sw.js                  # Service Worker (offline)
│   └── icons/                 # Icônes de l'app
├── src/
│   ├── App.tsx                # Application principale
│   ├── data/
│   │   └── quran.ts           # Données coraniques
│   ├── index.css              # Styles globaux
│   └── main.tsx               # Point d'entrée
├── capacitor.config.json      # Configuration Capacitor
├── index.html                 # HTML principal
├── package.json               # Dépendances
├── README.md                  # Ce fichier
└── GUIDE-APK.md              # Guide détaillé APK
```

## 🛠️ Technologies

- **Frontend** : React + TypeScript + Vite
- **Styling** : Tailwind CSS
- **PWA** : Service Worker + Manifest
- **Mobile** : Capacitor (Android)
- **Données** : Tanzil.net (texte coranique)

## 📋 Roadmap

- [ ] Intégration API de reconnaissance vocale coranique (Whisper-Arabic)
- [ ] Synchronisation audio texte réelle
- [ ] Plus de sourates (Coran complet)
- [ ] Système de comptes utilisateurs
- [ ] Statistiques de progression
- [ ] Mode groupe pour les classes
- [ ] Intégration des règles de Tajweed complètes

## 📄 Licence

MIT License - Voir le fichier LICENSE pour plus de détails.

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request.

## 📞 Contact

Pour toute question : contact@noor-ai.app

---

<div align="center">
  <b>بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ</b>
  <br><br>
  Fait avec ❤️ pour la Oumma
</div>

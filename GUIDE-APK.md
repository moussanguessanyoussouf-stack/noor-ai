# 📱 Guide Complet : Créer l'APK Noor-AI avec GitHub Desktop

Ce guide vous accompagne étape par étape pour transformer le projet web Noor-AI en une application Android (APK) installable, puis la publier sur GitHub via GitHub Desktop.

---

## 📋 Table des matières
1. [Prérequis](#prérequis)
2. [Installation de l'environnement](#installation)
3. [Cloner le projet avec GitHub Desktop](#cloner)
4. [Installer les dépendances](#dependances)
5. [Configurer Capacitor](#capacitor)
6. [Générer l'APK](#generer-apk)
7. [Publier sur GitHub](#publier)
8. [Résolution de problèmes](#problemes)

---

## 1. Prérequis <a name="prérequis"></a>

Avant de commencer, assurez-vous d'avoir installé :

| Outil | Version | Lien |
|-------|---------|------|
| **Node.js** | v18+ | https://nodejs.org |
| **Android Studio** | Latest | https://developer.android.com/studio |
| **GitHub Desktop** | Latest | https://desktop.github.com |
| **Java JDK** | 17 | https://adoptium.net |
| **Git** | 2.30+ | https://git-scm.com |

### Vérifier les installations

Ouvrez un terminal et exécutez :
```bash
node --version     # Doit afficher v18.x.x ou supérieur
npm --version      # Doit afficher 9.x.x ou supérieur
java --version     # Doit afficher 17.x
git --version      # Doit afficher 2.30+
```

### Configurer Android Studio

1. Ouvrez Android Studio
2. Allez dans **Tools → SDK Manager**
3. Installez :
   - **SDK Platforms** → Android 13 (API 33) ou supérieur
   - **SDK Tools** → Android SDK Build-Tools
   - **SDK Tools** → Android SDK Command-line Tools
4. Notez le chemin du SDK (ex: `C:\Users\VOTRE_NOM\AppData\Local\Android\Sdk`)

### Configurer les variables d'environnement

**Windows** (Panneau de configuration → Variables d'environnement) :
```
ANDROID_HOME = C:\Users\VOTRE_NOM\AppData\Local\Android\Sdk
JAVA_HOME = C:\Program Files\Java\jdk-17
```

Ajoutez au PATH :
```
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools
%JAVA_HOME%\bin
```

**Mac/Linux** (dans `~/.bashrc` ou `~/.zshrc`) :
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
export PATH=$PATH:$ANDROID_HOME/platform-tools:$JAVA_HOME/bin
```

---

## 2. Cloner le projet avec GitHub Desktop <a name="cloner"></a>

### Étape 2.1 : Créer le dépôt sur GitHub

1. Allez sur https://github.com/new
2. Nom du dépôt : `noor-ai`
3. Description : `Application de récitation coranique avec correction IA`
4. Cochez **Public** (ou Private selon votre choix)
5. Cochez **Add a README file**
6. Cliquez sur **Create repository**

### Étape 2.2 : Cloner avec GitHub Desktop

1. Ouvrez **GitHub Desktop**
2. Cliquez sur **File → Clone Repository** (ou `Ctrl+Shift+O` / `Cmd+Shift+O`)
3. Onglet **GitHub.com** → sélectionnez votre dépôt `noor-ai`
4. **Local Path** : choisissez le dossier où vous voulez cloner (ex: `C:\Projects\noor-ai`)
5. Cliquez sur **Clone**

### Étape 2.3 : Copier les fichiers du projet

Copiez tous les fichiers de ce projet dans le dossier cloné :
- `src/`
- `public/`
- `index.html`
- `package.json`
- `capacitor.config.json`
- etc.

---

## 3. Installer les dépendances <a name="dependances"></a>

### Étape 3.1 : Ouvrir le terminal

Dans GitHub Desktop :
1. Cliquez sur **Repository → Open in Command Prompt** (Windows) ou **Open in Terminal** (Mac)

Ou ouvrez manuellement un terminal dans le dossier du projet.

### Étape 3.2 : Installer les packages

```bash
# Installer les dépendances de base
npm install

# Installer Capacitor (framework pour wrapper l'app web en APK)
npm install @capacitor/core @capacitor/cli

# Installer la plateforme Android
npm install @capacitor/android

# Installer les plugins Capacitor utiles
npm install @capacitor/splash-screen
npm install @capacitor/status-bar
npm install @capacitor/keyboard
npm install @capacitor/local-notifications
npm install @capacitor/app
npm install @capacitor/haptics
```

### Étape 3.3 : Builder le projet web

```bash
npm run build
```

Vérifiez que le dossier `dist/` a été créé avec les fichiers HTML/CSS/JS.

---

## 4. Configurer Capacitor <a name="capacitor"></a>

### Étape 4.1 : Initialiser Capacitor

```bash
npx cap init "Noor-AI" "com.noorai.app" --web-dir=dist
```

### Étape 4.2 : Ajouter la plateforme Android

```bash
npx cap add android
```

Cela crée le dossier `android/` avec le projet Android natif.

### Étape 4.3 : Synchroniser les fichiers

```bash
npx cap sync android
```

Cette commande copie les fichiers web dans le projet Android et synchronise les plugins.

### Étape 4.4 : Vérifier la configuration

Ouvrez `capacitor.config.json` et vérifiez :
```json
{
  "appId": "com.noorai.app",
  "appName": "Noor-AI",
  "webDir": "dist",
  "server": {
    "androidScheme": "https"
  }
}
```

---

## 5. Générer l'APK <a name="generer-apk"></a>

### Méthode A : Via Android Studio (Recommandée)

#### Étape 5A.1 : Ouvrir dans Android Studio

```bash
npx cap open android
```

Android Studio s'ouvre avec le projet.

#### Étape 5A.2 : Attendre la synchronisation Gradle

- Android Studio télécharge automatiquement les dépendances
- Cela peut prendre 5-10 minutes la première fois
- Vérifiez la barre de progression en bas

#### Étape 5A.3 : Configurer le SDK

Si Android Studio demande de configurer le SDK :
1. Cliquez sur **Configure**
2. Sélectionnez le chemin du SDK Android
3. Cliquez sur **OK**

#### Étape 5A.4 : Builder l'APK Debug

1. Menu : **Build → Build Bundle(s) / APK(s) → Build APK(s)**
2. Attendez la compilation
3. Cliquez sur **locate** dans la notification
4. L'APK se trouve dans : `android/app/build/outputs/apk/debug/app-debug.apk`

#### Étape 5A.5 : Tester sur un appareil

**Option 1 : Émulateur**
1. Dans Android Studio : **Tools → Device Manager**
2. Créez un appareil virtuel (ex: Pixel 6)
3. Lancez l'émulateur
4. Glissez-déposez l'APK sur l'émulateur

**Option 2 : Appareil physique**
1. Activez le **Mode Développeur** sur votre téléphone Android
2. Activez le **Débogage USB**
3. Connectez le téléphone par USB
4. Dans Android Studio, sélectionnez votre appareil
5. Cliquez sur le bouton **Run** (▶️)

### Méthode B : Via ligne de commande

```bash
# APK Debug
cd android
./gradlew assembleDebug

# L'APK est dans : android/app/build/outputs/apk/debug/app-debug.apk
```

### Méthode C : APK Signé (Release)

Pour publier sur le Play Store ou distribuer :

#### Créer une clé de signature
```bash
keytool -genkey -v -keystore noor-ai-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias noor-ai
```
(Mémorisez le mot de passe !)

#### Dans Android Studio
1. **Build → Generate Signed Bundle / APK**
2. Sélectionnez **APK**
3. Choisissez le fichier `.jks` et entrez le mot de passe
4. Sélectionnez **release**
5. Cochez **V1 (Jar Signature)** et **V2 (Full APK Signature)**
6. Cliquez sur **Finish**

---

## 6. Publier sur GitHub avec GitHub Desktop <a name="publier"></a>

### Étape 6.1 : Créer un fichier .gitignore

Créez un fichier `.gitignore` à la racine :
```
node_modules/
dist/
android/.gradle/
android/app/build/
android/capacitor-android/build/
*.jks
*.keystore
local.properties
.idea/
.DS_Store
```

### Étape 6.2 : Commiter avec GitHub Desktop

1. Ouvrez **GitHub Desktop**
2. Sélectionnez le dépôt `noor-ai`
3. Vous verrez la liste des fichiers modifiés
4. En bas à gauche :
   - **Summary** : `v1.0.0 - Première version de Noor-AI`
   - **Description** : 
     ```
     - Mushaf numérique avec traduction
     - Mode correction IA (écoute active)
     - Mode mémorisation cache-cache
     - Écoute audio avec synchronisation
     - PWA installable
     - Support hors-ligne
     ```
5. Cliquez sur **Commit to main**

### Étape 6.3 : Push vers GitHub

1. Cliquez sur **Push origin** (ou `Ctrl+P` / `Cmd+P`)
2. Les fichiers sont envoyés sur GitHub

### Étape 6.4 : Créer une Release avec l'APK

1. Allez sur votre dépôt dans le navigateur : `https://github.com/VOTRE_USERNAME/noor-ai`
2. Cliquez sur **Releases** (à droite)
3. Cliquez sur **Create a new release**
4. Remplissez :
   - **Tag** : `v1.0.0` (cliquez sur "Create new tag")
   - **Title** : `Noor-AI v1.0.0 - Première version`
   - **Description** : Liste des fonctionnalités
5. Cliquez sur **Attach binaries** et sélectionnez votre fichier APK
6. Cliquez sur **Publish release**

Vos utilisateurs pourront maintenant télécharger l'APK directement depuis la page Releases !

---

## 7. Mise à jour de l'application

Pour chaque mise à jour :

```bash
# 1. Modifier le code source
# 2. Builder
npm run build

# 3. Synchroniser avec Android
npx cap sync android

# 4. Générer le nouvel APK dans Android Studio
# Build → Build APK

# 5. Commiter avec GitHub Desktop
# 6. Créer une nouvelle Release sur GitHub
```

---

## 8. Résolution de problèmes <a name="problemes"></a>

### Erreur : "SDK location not found"
```bash
# Créer le fichier local.properties dans android/
echo "sdk.dir=/chemin/vers/android/sdk" > android/local.properties
```

### Erreur : "JAVA_HOME not set"
Définissez la variable d'environnement JAVA_HOME pointant vers votre JDK 17.

### Erreur Gradle : "Could not resolve..."
```bash
cd android
./gradlew clean
cd ..
npx cap sync android
```

### L'APK ne s'installe pas
- Vérifiez que "Sources inconnues" est activé sur le téléphone
- Pour Android 8+ : Autoriser l'installation depuis le navigateur/fichier

### Le texte arabe ne s'affiche pas correctement
- Vérifiez que la police Amiri est bien chargée
- Testez dans un navigateur moderne (Chrome, Firefox)

### Capacitor sync échoue
```bash
# Supprimer et réajouter
rm -rf android
npx cap add android
npx cap sync android
```

---

## 📞 Support

Si vous rencontrez des problèmes :
1. Consultez la documentation Capacitor : https://capacitorjs.com/docs
2. Vérifiez les issues GitHub du projet
3. Ouvrez une issue sur le dépôt

---

<div align="center">
  <b>بارك الله فيكم</b>
  <br>
  <i>Qu'Allah vous bénisse</i>
</div>

# 🗂️ Guide d’Utilisation de l’Application de Gestion de Planning

## 📘 Description
Cette application **Flutter** pour bureau permet la **gestion des enseignants**, la **saisie des vœux**, ainsi que la **génération automatique du planning** avec possibilité d’**exportation au format PDF**.

---

## ⚙️ Installation et Démarrage

### Pour les membres du jury :

1. **Accéder au Drive partagé**
   - Utilisez le lien suivant :  
     🔗 [Dossier Google Drive](https://drive.google.com/drive/folders/1Xshb2z9RYbqEyFl72Bks-FgIJ5Lqa1O9?usp=drive_link)
   - L’accès est déjà accordé aux membres du jury.  
   - Le dossier contient :
     - Un dossier **`data`** avec les fichiers **Excel nécessaires** pour les enseignants, vœux et examens.  
     - Une **vidéo de démonstration** présentant l’utilisation complète de l’application.  
     - Le fichier **`planning_system_equipe_9.zip`** contenant l’application prête à l’emploi.

2. **Télécharger l’application**
   - Téléchargez le fichier **`planning_system_equipe_9.zip`** depuis le Drive.  
   - Extrayez le contenu du fichier ZIP.

3. **Lancer l’application**
   - Ouvrez le dossier **`Release`**.  
   - Double-cliquez sur **`planning_system.exe`**.  
   - L’application se lancera automatiquement.

> 💡 **Remarque :** Aucune installation de Flutter ni d’autre dépendance n’est nécessaire pour cette méthode.

---

## 🔗 Dépôt GitHub

Le code source complet du projet est disponible sur GitHub :  
🔗 [https://github.com/assil-mathlouthi/Planning-System](https://github.com/assil-mathlouthi/Planning-System)

---

## 🔐 Authentification

Pour accéder à l’application, utilisez les identifiants suivants :

- **Email :** admin@isi.com  
- **Mot de passe :** 14082001

---

## 🧭 Navigation dans l’Application

L’interface principale comporte **quatre pages** accessibles via la barre de navigation latérale :

---

### 1. 🧑‍🏫 Page « Enseignants »

Cette section permet la **gestion des informations des enseignants**.

#### 📋 Paramétrage du nombre de séances par grade
Au-dessus du tableau, un conteneur permet de **modifier le nombre de séances par grade**.  
Pour **faire défiler horizontalement** cette liste, **maintenez la touche `SHIFT`** enfoncée tout en **utilisant la molette de la souris**.

#### 📂 Importation d’un fichier Excel
- **Format requis :** colonnes → *Nom, Prénom, Email, Grade, Participe, Nombre d’heures, Actions*  
- Cliquez sur **« Importer Excel »** pour sélectionner votre fichier.  
- Les données s’affichent automatiquement dans le tableau.

#### ⚙️ Actions disponibles :
- Modifier les informations d’un enseignant.  
- Supprimer un enseignant.  
- Exporter les données à l’aide du bouton **« Télécharger Modèle »**.

---

### 2. 📄 Page « Vœux »

Cette page permet la **gestion des vœux des enseignants**.

#### Importation d’un fichier Excel
- **Format requis :** colonnes → *Nom, Prénom, Session, Semestre, Jour, Séance, Actions*  
- Structure similaire à celle de la page « Enseignants ».  
- Permet de **visualiser les préférences** de chaque enseignant.

---

### 3. ⚙️ Page « Génération »

Cette page prépare la **génération automatique du planning**.

#### Fichiers Excel requis :
*(Tous disponibles dans le dossier “data” du Drive partagé)*  
- **Enseignants** : liste complète des enseignants.  
- **Vœux** : préférences de planning.  
- **Examens** : calendrier des sessions d’examens.

#### Processus :
1. Importez les trois fichiers Excel.  
2. Vérifiez la validité des données.  
3. Cliquez sur **« Générer le planning »**.  
4. Patientez durant le traitement : un **message de succès** s’affichera.  
5. Naviguez ensuite vers la **page Planning** pour consulter le résultat.

---

### 4. 🗓️ Page « Planning »

Affiche le planning final organisé en **deux onglets** :

#### 🔹 Onglet « Par Séance »
- Vue globale du planning organisée par créneaux horaires.  
- Permet une **vue d’ensemble** de toutes les sessions.

#### 🔹 Onglet « Par Enseignant »
- Planning individuel pour chaque enseignant.

#### Fonctionnalités :
- **Téléchargement PDF :**
  1. Sélectionnez un enseignant.  
  2. Cliquez sur **« Télécharger PDF »**.  
  3. Le fichier est sauvegardé localement sur votre ordinateur.

---

## 🛠️ Support et Assistance

En cas de problème technique :

1. Vérifiez le **format des fichiers Excel** (les fichiers de test se trouvent dans le dossier *data* du Drive).  
2. Assurez-vous que **tous les champs requis** sont correctement remplis.  
3. Si le problème persiste, contactez l’administrateur système :

**Contact :**  
📧 assil.mathlouthi@etudiant-isi.utm.tn  

---

**Version :** 1.0  
**Dernière mise à jour :** 20/10/2025  

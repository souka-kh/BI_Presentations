# 🐘 MindsDB : L'IA au Cœur de Vos Données

**MindsDB** est une solution d'intelligence artificielle conçue pour simplifier l'intégration de l'IA directement dans vos bases de données existantes.

---

### 📌 Objectifs

La présentation vise à éclairer les points suivants concernant MindsDB :

* **Simplifier l'intégration de l'IA en Business Intelligence (BI)** : MindsDB rend l'IA accessible directement depuis les bases de données, permettant aux professionnels de la BI qui maîtrisent déjà le SQL d'utiliser la puissance de l'IA sans compétences avancées en Machine Learning.
* **Démocratiser le Machine Learning (ML)** : MindsDB a pour mission de rendre le ML facile d'accès pour les utilisateurs dont les données résident dans une base de données. Il élimine la nécessité d'une extraction et transformation de données (ETL) complexe en permettant la formation et le déploiement de modèles directement au sein de la base de données.
* **Transformer l'accès aux données en entreprise** : MindsDB se positionne comme une solution d'AGI (Artificial General Intelligence) qui connecte et unifie des données à l'échelle du pétaoctet, facilitant la prise de décision informée en temps réel à l'échelle de l'entreprise. Il permet des interactions en langage naturel avec les données, rendant l'analyse rapide et intuitive même pour les utilisateurs non spécialisés.
* **Présenter l'architecture et les fonctionnalités clés** : Comprendre le cœur de MindsDB, basé sur ses trois capacités fondamentales – **Connecter, Unifier, Répondre** – et le concept d'**AI Tables** et **AutoML**.
* **Illustrer des cas d'utilisation concrets** : Démontrer comment MindsDB peut être appliqué pour des tâches telles que la prédiction des ventes, l'analyse de sentiment client et la détection de fraudes, en intégrant des prédictions intelligentes directement dans les flux BI.

---

### 🛠️ Prérequis

Pour explorer MindsDB et reproduire la démonstration, vous aurez besoin de :

* **Docker** : C'est le moyen le plus rapide et recommandé pour installer et exécuter le serveur MindsDB localement.
  * Assurez-vous que Docker Desktop est installé et en cours d'exécution sur votre machine.
* **Connaissances de base en SQL** : MindsDB s'intègre nativement avec SQL, permettant de créer et d'interroger des modèles comme s'il s'agissait de tables SQL.
* **Fichiers de données (CSV, etc.)** : Pour importer des données et entraîner des modèles, comme le `sales_data.csv`  (will be loaded later) utilisé dans la démonstration.

---

### 🚀 Instructions

Suivez ces étapes pour mettre en place MindsDB et commencer à explorer ses capacités :

1. **Installation de MindsDB via Docker :**

   * Ouvrez votre terminal ou invite de commande.
   * Exécutez les commandes suivantes pour télécharger et lancer l'image Docker de MindsDB :
     ```bash
     docker pull mindsdb/mindsdb
     docker run -p 47334:47334 -p 47335:47335 mindsdb/mindsdb
     ```
   * Une fois lancé, l'interface web de MindsDB sera accessible à l'adresse : `http://localhost:47334`.
2. **Importation des Données :**

   * Depuis l'interface web de MindsDB, cliquez sur le bouton "Add..." ou la section dédiée à l'importation de fichiers.
   * **Glissez-déposez un fichier `.csv`** (par exemple, le fichier `sales_data.csv` utilisé dans la présentation) ou utilisez l'option d'importation par URL.
   * Chaque fichier importé deviendra une table dans une base de données appelée `files`.
3. **Exploration et Compréhension des Données :**

   * MindsDB vous redirigera vers un éditeur SQL intégré. Vous pouvez y interroger vos données importées.
   * Pour voir toutes les tables importées :
     ```sql
     SHOW TABLES FROM files;
     ```
   * Pour visualiser les premières lignes de votre table `sales_data` et comprendre ses colonnes (par exemple, `Order Date`, `Ship Date`, `Ship Mode`, `Segment`, `Category`, `Sales`) :
     ```sql
     SELECT `Order Date`, `Ship Date`, `Ship Mode`, Segment, Category, Sales FROM files.sales_data LIMIT 5;
     ```
4. **Entraînement d'un Modèle de Prédiction (Création d'une AI Table) :**

   * Utilisez la commande `CREATE PREDICTOR` (ou `CREATE MODEL`) pour entraîner automatiquement un modèle de Machine Learning. Ce modèle encapsule le ML dans une table virtuelle appelée "AI Table".
   * Exemple pour prédire les ventes (`Sales`) :
     ```sql
     CREATE PREDICTOR mindsdb.predict_sales
     FROM files
     (SELECT `Order Date`, `Ship Date`, `Ship Mode`, Segment, Category, Sales FROM sales_data)
     PREDICT Sales;
     ```
   * MindsDB s'occupera automatiquement de l'ingénierie des caractéristiques et sélectionnera le meilleur modèle via AutoML (Lightwood par défaut).
5. **Faire une Prédiction :**

   * Une fois le modèle entraîné, vous pouvez l'interroger comme une table SQL pour obtenir des prédictions.
   * Exemple de requête de prédiction :
     ```sql
     SELECT Sales_confidence, Sales_explain
     FROM mindsdb.predict_sales
     WHERE `Order Date` = '28/03/2019' AND
           `Ship Date` = '31/03/2019' AND
           `Ship Mode` = 'First Class' AND
           Segment = 'Consumer' AND
           Category = 'Furniture';
     ```
   * Le résultat inclura la prédiction (`predicted_value`) et un niveau de confiance (`Sales_confidence`).

N'hésitez pas à explorer la documentation de MindsDB pour des cas d'utilisation plus avancés et des intégrations avec d'autres sources de données ou moteurs d'IA !

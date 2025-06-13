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

## 🛠️ Prérequis
### Techniques
- Python 3.8+
- Docker
- SQL (notions de base)
- Navigateur Web (Chrome, Firefox...)

### Connaissances
- Notions de base en Business Intelligence
- Concepts fondamentaux en apprentissage supervisé (régression)

## 🚀 Instructions d'utilisation

### 1. Setup de l’environnement
#### Option A : Utiliser Docker (recommandé)
- Installer Docker : https://www.docker.com/products/docker-desktop  
- Lancer MindsDB :
```bash

docker pull mindsdb/mindsdb
docker run -p 47334:47334 -p 47335:47335 mindsdb/mindsdb
```
- Accéder à MindsDB : http://localhost:47334

> Installer `pyarrow` et `lightwood` si nécessaire :
```bash

docker exec -it <container_id> /bin/bash
pip install pyarrow
pip install lightwood
```

#### Option B : Utiliser MindsDB Cloud
- Créer un compte gratuit :

### 2. Importer les données
- Uploader `sales_data.csv` via l’interface GUI
- Vérifier la structure dans `files.sales_data`

### 3. Créer un prédicteur
```sql
CREATE PREDICTOR mindsdb.predict_sales
FROM files
    (SELECT `Order Date`, `Ship Date`, `Ship Mode`, Segment, Category, Sales FROM sales_data)
PREDICT Sales;
```

### 4. Lancer une prédiction
```sql
SELECT Sales_confidence, Sales_explain
FROM mindsdb.predict_sales
WHERE `Order Date` = '28/03/2019'
  AND `Ship Date` = '31/03/2019'
  AND `Ship Mode` = 'First Class'
  AND Segment = 'Consumer'
  AND Category = 'Furniture';
```

### 5. Résultat attendu
- Le modèle prédit un montant de vente ≈ 292.72 $ avec un taux de confiance de 80%.

## 📊 Contenu
- **Slides** : Présentation expliquant le contexte, l’approche et les résultats.
- **Démo** : Fichier SQL complet avec les requêtes exécutées sur MindsDB.
- **Données** : Fichier `sales_data.csv` utilisé pour l'entraînement du modèle.

## 🔗 Ressources complémentaires
- 📹 [Vidéo d’introduction à MindsDB](https://youtu.be/D_BoVJeDGLw)
- 📚 [Documentation officielle](https://docs.mindsdb.com/mindsdb-connect)
- 📦 [DockerHub MindsDB](https://hub.docker.com/r/mindsdb/mindsdb)

## 👥 Auteur(s)
- **Nom** : Imade El-hilali & Abdessamad Misdak  

- **Promotion** : Master Big Data & IA – 2024/2026

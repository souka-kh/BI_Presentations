# Prédiction des ventes avec MindsDB

## 📌 Résumé
Cette présentation explore comment utiliser MindsDB pour prédire le montant des ventes à partir des caractéristiques des commandes. L’objectif est de démontrer l’usage de l’IA automatisée pour la Business Intelligence à travers un cas d’usage concret.

## 🎯 Objectifs d'apprentissage
- Comprendre le fonctionnement d’un AutoML tel que MindsDB.
- Être capable de créer un prédicteur sur un jeu de données réel.
- Savoir interpréter les résultats d’un modèle prédictif dans un contexte commercial.

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

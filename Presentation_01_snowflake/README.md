# ❄️ Snowflake : La Plateforme Cloud Data au Cœur de Votre Écosystème de Données

**Snowflake** est une plateforme de données cloud native conçue pour unifier vos données, analyses et charges de travail d'IA dans un environnement sécurisé et scalable.

---

### 📌 Objectifs

La présentation vise à éclairer les points suivants concernant Snowflake :

* **Simplifier l'intégration des données en Business Intelligence (BI)** : Snowflake rend les données accessibles directement depuis une plateforme cloud unifiée, permettant aux professionnels de la BI qui maîtrisent déjà le SQL d'exploiter la puissance du cloud data warehouse sans compétences avancées en infrastructure.
* **Démocratiser le Cloud Data Warehousing** : Snowflake a pour mission de rendre l'analyse de données à grande échelle facile d'accès pour les utilisateurs dont les données sont distribuées sur différents systèmes. Il élimine la nécessité d'une infrastructure complexe on-premise en permettant le stockage et l'analyse directement dans le cloud.
* **Transformer l'accès aux données en entreprise** : Snowflake se positionne comme une solution de Data Cloud qui connecte et unifie des données à l'échelle du pétaoctet, facilitant la prise de décision informée en temps réel à l'échelle de l'entreprise. Il permet des requêtes haute performance et le partage sécurisé des données, rendant l'analyse rapide et collaborative même pour les équipes distribuées.
* **Présenter l'architecture et les fonctionnalités clés** : Comprendre le cœur de Snowflake, basé sur ses trois piliers fondamentaux – Stockage, Calcul, Services Cloud – et le concept de Virtual Warehouses et Data Sharing.
* **Illustrer des cas d'utilisation concrets** : Démontrer comment Snowflake peut être appliqué pour des tâches telles que l'analyse des ventes en temps réel, la consolidation de données multi-sources et l'optimisation des performances analytiques, en intégrant des analyses intelligentes directement dans les flux BI.

## 🛠️ Prérequis
### Techniques
- SQL (connaissances intermédiaires)
- Navigateur Web (Chrome, Firefox, Safari...)
- Python/R (optionnel pour Snowpark)
- Notions de cloud computing

### Connaissances
- Notions de base en Business Intelligence
- Concepts fondamentaux des entrepôts de données (Data Warehouse)

## 🚀 Instructions d'utilisation

### 1. Setup de l’environnement
#### Option A :  Utiliser Snowflake Trial (recommandé)
- Créer un compte gratuit : https://signup.snowflake.com/
- Choisir votre fournisseur cloud (AWS, Azure, GCP)
- Accéder à Snowsight : https://app.snowflake.com/

- Configurer l'environnement initial :
```sql
-- Créer un entrepôt virtuel
CREATE OR REPLACE WAREHOUSE DEMO_WH WITH
  WAREHOUSE_SIZE = 'X-SMALL'
  AUTO_SUSPEND = 300
  AUTO_RESUME = TRUE;
```


#### Option B : Utiliser Snowflake Cloud
- Créer un compte gratuit :
    https://trial.snowflake.com

### 2. Importer les données
- Uploader `sales_data.csv` via l’interface Snowsight
- Vérifier la structure dans `SALES_DATABASE.PUBLIC.SALES_DATA`

### 3. Créer un modèle analytique
```sql
CREATE OR REPLACE TABLE SALES_ANALYTICS AS
SELECT 
    ORDER_DATE,
    SHIP_DATE,
    SHIP_MODE,
    SEGMENT,
    CATEGORY,
    SALES
FROM SALES_DATABASE.PUBLIC.SALES_DATA
WHERE ORDER_DATE IS NOT NULL;
```

### 4.  Lancer une analyse
```sql
SELECT 
    CATEGORY,
    AVG(SALES) as AVG_SALES,
    SUM(SALES) as TOTAL_SALES,
    COUNT(*) as ORDER_COUNT
FROM SALES_DATABASE.PUBLIC.SALES_ANALYTICS
WHERE ORDER_DATE = '2019-03-28'
  AND SHIP_DATE = '2019-03-31'
  AND SHIP_MODE = 'First Class'
  AND SEGMENT = 'Consumer'
  AND CATEGORY = 'Furniture';
```

### 5. Résultat attendu
- La plateforme analyse les données avec une performance optimisée grâce à l'architecture cloud-native de Snowflake.

## 📊 Contenu
- **Slides** : Présentation expliquant le contexte, l'approche et les résultats.
- **Démo** : Fichier SQL complet avec les requêtes exécutées sur Snowflake.
- **Données** : Fichier `sales_data.csv`  utilisé pour l'analyse des données.

## 🔗 Ressources complémentaires
- 📹 [Vidéo d'introduction à Snowflake](https://www.youtube.com/c/SnowflakeInc)
- 📚 [Documentation officielle](https://docs.snowflake.com/)
- 🎓 [Snowflake University](https://learn.snowflake.com/en/)


## 👥 Auteur(s)
- **Nom** : Aouni Hamza & E L Hamdouni Yassine 

- **Promotion** : Master Big Data & IA – 2024/2026
⚡ Real-Time Analytics : L’Analyse des Données en Temps Réel
L’analyse en temps réel permet de traiter et d’exploiter les données immédiatement après leur génération, afin de prendre des décisions rapides et pertinentes. Elle est utilisée dans de nombreux domaines comme la finance, l’IoT, la cybersécurité, ou encore le e-commerce.

📌 Objectifs
Cette présentation vise à :

Comprendre le concept de Real-Time Analytics : découvrir les différences entre analyse par lots (batch) et analyse en temps réel, ainsi que les bénéfices de cette dernière.

Explorer les cas d’usage : surveillance des capteurs IoT, détection de fraudes en direct, recommandations personnalisées immédiates, etc.

Analyser l’architecture typique d’un pipeline temps réel : ingestion, traitement, stockage, visualisation.

Découvrir les outils technologiques utilisés : Kafka, Flink, Elasticsearch, Kibana, Python, Docker, etc.

Mettre en œuvre une démonstration pratique : à travers un système complet de monitoring de température en temps réel.

🛠️ Prérequis
Techniques
Connaissances de base en ligne de commande

Notions de conteneurisation (Docker)

Python 3.8+

Navigateur Web

Environnement Windows ou Linux

Connaissances
Bases en Data Engineering

Concepts de flux de données (streaming)

Compréhension de l’architecture Kafka / Flink / Elasticsearch

🚀 Instructions d'utilisation
1. Lancer l’environnement
Exécuter le script PowerShell suivant :

powershell
Copier
Modifier
.\launch_system.ps1
⚠️ Vérifiez que Docker est bien installé et lancé avant.

2. Surveiller l’état du système
Une fois lancé, plusieurs interfaces seront disponibles :

Dashboard IoT : http://localhost:8000

Kibana : http://localhost:5601

Flink UI : http://localhost:8081

Elasticsearch : http://localhost:9200

3. Génération et traitement de données
Des données de température simulées sont produites toutes les 2 secondes.

Les alertes (dépassement de seuil) sont détectées en temps réel.

Les résultats sont visualisables sur le tableau de bord ou dans Kibana.

📊 Contenu
Slides : Présentation complète du concept de Real-Time Analytics, de l’architecture, des cas d’usage, et du projet technique.

Script : Fichier launch_system.ps1 qui déploie toute l’architecture automatiquement.

Code Python :

simulate.py : génère les données IoT.

simple_alerts.py : traite les données et génère les alertes.

start_dashboard.py : serveur Flask pour afficher les alertes.

Docker : fichier docker-compose.yml pour lancer Kafka, Zookeeper, Elasticsearch, Flink, Kibana.

🔗 Ressources complémentaires
📘 Apache Kafka Documentation

🔧 Apache Flink

📊 Elasticsearch & Kibana

🎥 Vidéo explicative sur l’architecture streaming, (à insérer si disponible)

👥 Auteur(s)
Nom : Khodder Soukaina, Ourrais Souad
Promotion : Master Big Data & IA – 2024/2026


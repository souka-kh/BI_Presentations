# 🤝 Guide de Contribution - BI Presentations

Merci de contribuer à notre repository collaboratif ! Ce guide vous explique comment participer efficacement.

## 📋 Processus de Contribution

### 1. Préparation
```bash
# Cloner le repository
git clone https://github.com/hamzaaouni/BI_Presentations.git
cd BI_Presentations

# Créer une branche pour votre présentation
git checkout -b presentation/[votre-sujet]
```

### 2. Organisation de votre contribution

#### Structure obligatoire :
```
Presentation_[N°]_[VotreSujet]/
├── slides/
│   └── presentation.pdf         # Format PDF recommandé
├── demo/
│   ├── main.ipynb              # Démonstration principale
│   ├── requirements.txt        # Dépendances Python
│   └── scripts/                # Scripts auxiliaires
├── data/
│   ├── sample_data.csv         # Données d'exemple (<50MB)
│   └── data_sources.md         # Sources et descriptions
├── docs/
│   ├── references.md           # Bibliographie
│   └── appendix.pdf            # Documents complémentaires
└── README.md                   # Fiche descriptive (OBLIGATOIRE)
```

### 3. Rédaction du README.md
Votre README.md doit contenir :

```markdown
# [Titre de votre présentation]

## 📌 Résumé
Bref résumé de votre sujet (2-3 lignes)

## 🎯 Objectifs d'apprentissage
- Objectif 1
- Objectif 2
- Objectif 3

## 🛠️ Prérequis
### Techniques
- Python 3.8+
- Pandas, Numpy
- [Autres outils]

### Connaissances
- Notions de base en BI
- [Autres prérequis]

## 🚀 Instructions d'utilisation
1. Étape par étape
2. Comment exécuter la démo
3. Résultats attendus

## 📊 Contenu
- **Slides** : [Description du contenu]
- **Démo** : [Description de la démonstration]
- **Données** : [Description des datasets]

## 🔗 Ressources complémentaires
- [Liens utiles]
- [Documentation]

## 👥 Auteur(s)
- **Nom** : [Votre nom]
- **Promotion** : [Année]
- **Contact** : [Email optionnel]
```

## 📝 Standards de Qualité

### Code
- ✅ Code commenté et documenté
- ✅ Notebooks avec markdown explicatif
- ✅ Variables et fonctions nommées clairement
- ✅ Gestion des erreurs

### Données
- ✅ Fichiers < 50MB (sinon utiliser Git LFS)
- ✅ Formats standards (CSV, JSON, Excel)
- ✅ Documentation des sources
- ✅ Données anonymisées si nécessaire

### Documentation
- ✅ README.md complet et structuré
- ✅ Instructions claires et testées
- ✅ Capture d'écran si pertinente
- ✅ Références bibliographiques

## 🔄 Processus de Review

### Avant de soumettre
- [ ] Structure respectée
- [ ] README.md complet
- [ ] Code testé et fonctionnel
- [ ] Fichiers < 50MB
- [ ] Pas de données sensibles

### Soumission
```bash
# Ajouter vos fichiers
git add .
git commit -m "feat: ajout présentation [SUJET]"
git push origin presentation/[votre-sujet]

# Créer une Pull Request
# Titre : "Présentation [N°] - [SUJET]"
# Description : Résumé du contenu
```

### Review par les pairs
- 📋 Vérification de la structure
- 🧪 Test de la démo
- 📖 Relecture de la documentation
- ✅ Validation avant merge

## 🚫 Ce qu'il faut éviter

❌ **Fichiers interdits :**
- Mots de passe ou clés API
- Données personnelles
- Fichiers > 50MB sans Git LFS
- Formats propriétaires non documentés

❌ **Pratiques déconseillées :**
- Commit directement sur main
- Code non commenté
- Liens brisés
- Instructions incomplètes

## 🆘 Besoin d'aide ?

### Contacts
- **Coordinateur** : [NOM] - [email]
- **Support technique** : [Créer une issue]

### Ressources
- [Guide Git pour débutants](https://git-scm.com/book)
- [Markdown Guide](https://www.markdownguide.org/)
- [Jupyter Best Practices](https://jupyter.org/documentation)

## 🏆 Reconnaissance

Toutes les contributions sont valorisées ! Les contributeurs seront :
- ✨ Mentionnés dans le README principal
- 🎖️ Référencés dans leur présentation
- 🤝 Reconnus par la communauté

---

*Merci de faire de ce repository une ressource précieuse pour tous ! 🙏*

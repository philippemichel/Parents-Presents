# Parents-Présents

Questionnaires sur le ressenti des parents en pédiatrie — deux versions selon le parcours de soins, avec analyse descriptive des échelles de Likert.

## Description

Cette étude s'intéresse au ressenti des parents présents auprès de leur enfant hospitalisé en pédiatrie. Deux versions du questionnaire ont été élaborées selon le parcours :

- **Hospitalisation conventionnelle (HC)** : pédiatrie générale (hospitalisations programmées ou non)
- **Urgences pédiatriques (URG)** : consultation aux urgences pédiatriques

### Échelle de Likert (5 points)

| Score | Signification          |
|-------|------------------------|
| 1     | Pas du tout d'accord   |
| 2     | Plutôt pas d'accord    |
| 3     | Sans opinion           |
| 4     | Plutôt d'accord        |
| 5     | Tout à fait d'accord   |

### Items communs aux deux versions (q1–q8)

| Code | Item |
|------|------|
| q1   | Je me sens anxieux/se concernant l'état de santé de mon enfant |
| q2   | Je me sens bien informé(e) par l'équipe médicale |
| q3   | Je fais confiance à l'équipe médicale |
| q4   | Je me sens impliqué(e) dans la prise en charge de mon enfant |
| q5   | Je comprends les traitements administrés à mon enfant |
| q6   | Je me sens soutenu(e) par l'équipe soignante |
| q7   | J'ai pu exprimer librement mes inquiétudes |
| q8   | L'environnement hospitalier me met à l'aise |

### Items spécifiques HC (q9–q10)

| Code | Item |
|------|------|
| q9   | Je me sens préparé(e) à la sortie de mon enfant |
| q10  | La durée d'hospitalisation me semble adaptée |

### Items spécifiques URG (q9_urg–q10_urg)

| Code     | Item |
|----------|------|
| q9_urg   | J'estime que la prise en charge a été rapide |
| q10_urg  | J'ai reçu des informations claires lors de l'attente |

## Structure du projet

```
Parents-Presents/
├── _quarto.yml          # Configuration du site Quarto
├── index.qmd            # Introduction & import des données
├── questionnaire.qmd    # Analyse descriptive des Likert
├── import.R             # Script d'import des données
├── datas/               # Données (non versionnées)
│   ├── questionnaire_hc.ods   # Données questionnaire HC
│   └── questionnaire_urg.ods  # Données questionnaire URG
└── docs/                # Site généré (non versionné)
```

## Analyse

L'analyse est purement descriptive :
- Distribution des réponses item par item
- Graphiques en barres empilées des échelles de Likert
- Tableau des scores moyens par item
- Comparaison HC vs URG sur les items communs

## Technologies

- **R** avec Quarto (site web)
- Librairies : `tidyverse`, `gtsummary`, `labelled`, `baseph`, `kableExtra`, `colorspace`, `visdat`, `readODS`, `janitor`

# Edelsten

## Edelsten : pierre précieuse en Norvégien

### Descriptif projet

Cette application a pour but de référencer un catalogue de pierres précieuses et semi-précieuses.
Comme pour wikipédia, la communauté améliore son contenue et sa fiabilité.
Edelsten sera composée de deux sections :

- une liste de pierres,
- une partie "personnelle" où l'utilisateur pourra éditer ses articles sur le thème des pierres, et ses ressentis.

Il y aura une barre de recherche pour trouver une pierre selon plusieurs paramètres : le nom, la couleur, l’aspect, l’effet, la typologie moléculaire, la propriété recherchée.

L’application prendra la forme d’un grimoire. Pour chaque pierre il y aura un premier aperçu sur le grimoire, avec une image de la pierre à l’état brut, son nom en gros et une rapide description.

Ensuite, pour compléter le grimoire, une section sera dédier à l'utilisateur où il en aura la pleine propriété, où il pourra écrire ses notes, ses propres pages du grimoire, un coin où il peut écrire ses pensées, ses constatations, ses formules, ses expériences. L'utilisateur aura la possibilité de connecter l'application à son compte google drive, pour sauvegarder ses pages du grimoire sur le cloud.

### Descriptif technique

#### système d'authentification

- firebase
- des rôles (administrateur / utilisateur)

#### système de recherche de pierres

- autocomplétion
- filtrage par caractéristique

#### affichage des pierres

- L’apparence brut,
- Les apparences dérivés (polie, collier, bague),
- Les propriétés de la pierre,
- Les chakras sur lesquels la pierre agit (chakras du cœur, de la gorge, etc…),
- L’expérience ressentie avec chaque pierre,
- L’étymologie du nom,
- La provenance de la pierre, les mines, où en trouver en nature
- L’histoire de la pierre (Son utilisation dans certaine tribu/civilisation),
- Sa dureté
- Etc...

#### système de gestion de la communauté

- gestion des commentaires sur une pierre
  - commentaire débattre / partager
  - commentaire constructif pour l'article
- système de votes
- remonter les informations aux administrateurs pour modification de l'article
- un administrateur peut créer un article non existant pour le publier

#### espace personnel

- ajouter la pierre dans ses favoris
- espace d'édition personnel (prise de note libre)
  - possibilité de lier à un tag d'un article (possibilité de le rendre public => ajout aux commentaires)
  - organisation libre de son espace personnel sous forme de dossier / fichier
  
### Fonctionnalités futures

L'application proposera des anecdotes, des petites comptines, des histoires qui font réfléchir/méditer, ou encore des références à des films ou des livres en fonction des recherches effectuées. Une phrase du jour, composée de bonnes paroles,de citations ou encore d'expressions de films, auteurs et acteurs apparaîtra sur la page d'accueil.

Enfin, on pourra accéder à un dictionnaire de langage dans le but de comprendre la définition de certains mots "techniques" comme chakras, multi-dimensions, auras, univers, etc.

# EDELSTEN APPLICATION FLUTTER

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

test

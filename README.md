# Edelsten

Edelsten : pierre préciseuse en Norvégien

Descriptif projet :

Le but étant de faire une application mobile qui permette de référencer un catalogue de pierre précieuse et semi-précieuse.
Cette appli est a but communautaire, comme pour wikipédia, la communauté améliore son contenue et sa fiabilité.
L'appli sera composé de deux sections, une partie liste de pierre et une autre personnelle à l'utilisateur lui permettant d'éditer ses articles sur le thème des pierres, de ces ressentis ou meme de sa vie quotidienne.

Il y aura une barre de recherche pour trouver une pierre selon plusieurs paramètres : le nom, la couleur, l’aspect, l’effet, la typologie moléculaire, la propriété recherché. L’application prendra la forme d’un grimoire. Pour chaque pierre il y aura un premier aperçu sur le grimoire, avec une image de la pierre à l’état brut, son nom en gros et une rapide description comme son utilisation principale.

Ensuite, pour compléter le grimoire, une section sera dédier à l'utilisateur où il en aura la pleine propriété, où il poura écrire ses notes, ses propres pages du grimoire, un coin ou il peut écrire ses pensées, ses constatations, ses formules, ses expérience. L'utilisateur aura la possibilité de connecté l'application à son compte google drive, pour savegarder ses pages du grimoire sur le cloud.


descriptif technique :

système d'authentification 
- firebase
- des rôles (administrateur / utilisateur)

système de recherche d'article de pierre:
- autocomplétion
- filtrage par caractéristique

affichage des articles :
- L’apparence brut,
- Les apparences dérivés (polie, collier, bague),
- Les propriétés de la pierre,
- Les chakras sur lesquels la pierre agit (chakras du cœur, de la gorge, etc…),
- L’expérience ressentie avec chaque pierre,
- L’étymologie du nom,
- La provenance de la pierre, les mines, où en trouver en nature
- L’histoire de la pierre (Son utilisation dans certaine tribu/civilisation),
- Sa durété
- Etc...

système de gestion de la communauté :
- gestion des commentaires sur un article
  - commentaire débatre / patager
  - commentaire constructif pour l article
- système de vote
- remonter les informations aux administrateurs pour modification de l article
- un administrateur peut créer un article non existant pour le publier

espace personnel :
- mise en favory d'article
- espace d'édition personnel (prise de note libre)
  - possibilité de lié à un tag d'un article (possibilité de le rendre public => ajoutera aux commentaire)
  - organisation libre de son espace personnel sous forme de dossier / fichier
  

Feature future :

L'application proposera des anectodes, des petites comptines, des histoires qui font réfléchir/méditer, ou encore des références à des films ou des livres en fonction des recherches effectué. Et aura sur sa page d'acceuil, une phrase du jour composé de bonne parole, de citation ou encore d'expression de film, auteur et acteur.

Et enfin, elle permettra d'autres choses comme un accès à un dictionnaire du langage, pour savoir un peu quoi correspond à quoi, ici je vais pouvoir parler des chakras, des multidimensions, des auras, de l'univers, etc (très très gros sujet).

# game-3-project
mini game

THE MAGIC WORLD
Création de l'algorithme d’un mini jeu vidéo
 
DESCRIPTION DU PROJET
Le jeu se déroule dans un monde enchanté.
Deux équipes constituées de trois personnages sont à la recherche
d’un trésor caché.
À la découverte de ce trésor va s’enchainer une série de combats jusqu’à la mort de tous les personnages d’une même équipe.
Lors de ces combats vont apparaître des coffres magiques et des potions permettant aux héros de surprendre leurs adversaires.
L’équipe possédant encore un ou plusieurs personnages en vie gagne la bataille et récupère le trésor.

SPÉCIFICITÉS DEMANDÉES
Au début de la partie, chaque joueur va constituer son équipe en choisissant parmi plusieurs types de personnages.
Combattant : L'attaquant classique. Un bon guerrier ! Mage : Son talent ? Soigner les membres de son équipe. Colosse : Imposant et très résistant, mais il ne fera pas bien mal
Nain : Sa hache infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.
Chaque équipe doit avoir 3 personnages (peu importe le type).
Les personnages doivent être nommés par les joueurs. Leur nom doit être unique parmi les personnages de la partie.
Le personnage "Combattant" démarre avec 100 points de vie et une épée qui ôte 10 points à son adversaire.
AUTRES SPÉCIFICITÉS DEMANDÉES
Choisir un personnage de son équipe
Choisir un personnage de l'équipe adverse à attaquer ou un personnage de sa propre équipe à soigner dans le cas du Mage.
Lors des combats :
Un coffre apparaît devant le personnage, il l'ouvre et... il s'équipe d'une nouvelle arme !
Choisir un personnage de son équipe
Choisir un personnage de l'équipe adverse à attaquer ou un personnage de sa propre équipe à soigner dans le cas du Mage.
Lors des combats :
Un coffre apparaît devant le personnage, il l'ouvre et... il s'équipe d'une nouvelle arme !

 DÉROULEMENT DU JEU
1)  Noms des 2 joueurs
2)  Créations des 2 équipes
3)  Phases de combats et bonus aléatoires
4)  Mort de 3 personnages d’une même équipe
5)  Récompense du gagnant
èFin du Jeu

 EXPLICATIONS DU CODE
•  Les classes Game et Player sont les classes principales.
•  Les différentes classes de personnages telles que les classes Fighter, Magus, Colossus et Dwarf héritent de la classe Character. Les personnages bonus en héritent également, (WalkingDead et GiantDwarf).
•  Les différentes classes d’armes telles que les classes Sword, MagicHealing, Hammer et Axe héritent de la classe Weapon. Les armes bonus en héritent également (Grenade, MagicPotion, MagicMushroom et Bite )
•  La classe UniqueName, permet de vérifier si le nom d’un des personnages nommés n’est pas déjà utilisé.
•  La fonction playGame() va être la fonction principalement utilisée. Elle appelle 4 fonctions importantes : gameRules() settingUpTheGame() createYourTeam() battle().
•  La fonction settingUpTheGame() va permettre de nommer les joueurs grâce à la fonction readLine intégrée dans la fonction nameYourPlayer(), qui elle, retourne un objet de la classe Player.

FONCTIONNEMENT DU CODE
 Le fichier main.swift permet la lecture de l’application.
•  Il permet de boucler sur la fonction playGame() de la classe Game, tant que la fonction PlayerLost est fausse.
Lorsqu'un des joueurs perd, c’est à dire que ses trois personnages son morts, la fonction playerLost() devient vraie.
La boucle s’arrête : c’est la fin du jeu.
•  La fonction playerLost détermine le joueur perdant. En comptant le nombre de personnages vivants dans le tableau de personnages vivants
(arrayCharacter), elle va retourner un booléens et afficher le joueur gagnant. Si le tableau de arrayCharacter.count == 0 alors le joueur a perdu.


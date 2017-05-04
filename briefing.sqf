// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

player createDiarySubject ["changelog","ChangeLog"];

player createDiaryRecord 
["changelog", 
	["Changelog serveur", 
		"
			
			
			<img image='textures\briefing.jpg'>
			
			
/*			

Version Stable 006 :
Ajout/Création : D'un nouveau paramètre pour le temps de vente au marché (fichier concerné : configuration_du_farming_pour_vendre.sqf; vendre_le_farming_marche.sqf ; mise_a_jour_informations_farming_marche.sqf ; compilation_farming.sqf) !
Ajout/Création : Nombre max de soins par kit de soins avant qu'il soit supprimé (fichier concerné : init_config_sfp.sqf ; compilation_revive.sqf ; configuration_du_serveur.sqf) !
Amélioration : Script optimisation (fichier concerné : optimisation_by_maxou_sfp.sqf) !
Correction : Sur certaines conditions, le script météo pouvait s'arreter (meteo_sfp_serveur.sqf) !
Correction : Après un respawn ou une mort, le réglage de la vitesse de votre personnage n'etaient plus appliqué (revive_onrespawn_civilian.sqf) !
Correction : Heure serveur du à la nouvelle DLL, 1 heure du matin etait concidérée comme 25 heures ... (heure_serveur.sqf ; s_serverGather.sqf ; init_config.sqf) !
Correction : Choix des missions DIR (choix_mission_dir.sqf) !


Version Stable 005 :
Modification : Déplacement d'une commande MULTI (initServer.sqf et init.sqf) !
Amélioration : Script nettoyage du serveur (nettoyage_du_serveur.sqf) !
Amélioration : Plus de backup forcé lorsque vous êtes en véhicule (évite perte de controle) (securite_menu_quitter.sqf) !


Version Stable 004 :
Ajout/Création : Du paramètre sfp_config_prix_saut_parachute au fichier init_config !
Ajout/Création : Du paramètre sfp_config_liste_des_armes_coffre_d_armes au fichier init_config !
Ajout/Création : Du paramètre sfp_config_armes_interdiction_effet au fichier init_config !
Correction : Du a la derniere maj d'arma, des utilisateurs non déconnecté (fichier concerné supprimer_weapons_deco.sqf et init.sqf)  !
Correction : Du tp SARL AUTOECOLE lorsque vous n'êtes pas whitlist !
Correction : La protection des coffres forts ne fonctionnait plus !
Correction : Du trigger SARL CARSHOP !


Version Stable 003 :
Ajout/Création : Du paramètre sfp_config_heure_gmt au fichier init_config !
Correction : Sauvegarde auto école (fichier concerné c_savePlayerToServer + c_serverSaveRelay)!
Correction : Du message que vous n'utilisez pas taskforce (ecran noir) (fichier concerné initPlayerLocal) !
Correction : Du a la derniere maj d'arma, des utilisateurs non déconnecté (fichier concerné supprimer_weapons_deco.sqf)  !
Correction : Du décallage de l'heure (fichier concerné s_serverGather.sqf + init_config (sfp_config_heure_gmt)) !


Version Stable 002 :
Correction : Crash arma lors d'un degat sur un véhicule !


Version Stable 001 :
Ajout : Au fichier init_config la valeur sfp_config_liste_des_plantes_illegale, pour synchroniser le type des plantes illégales !
Ajout : Au fichier init_config la valeur sfp_config_listes_des_vehicules_avec_reserve_eau, pour synchroniser les types de véhicules pompiers qui ont la possibilité de recevoir une reserve d'eau !
Amélioration : Refonte du script des chiens d'attaques gendarmes (vitesse,groupe,position,vehicule, etc etc du à l'incompatibilité d'arma depuis la création) !
Amélioration : Diverses de scripts pour le DEV !
MAJ : Diverses de scripts !
Correction : De certains accents (é) pas prit en charge par arma !
Correction : Des points de spawn des gardes à vues !


Version Beta 003 :
Modification : Suite beta publique, l'admin à maintenant sa propre sauvegarde !
Correction : Fix de l'heure au format GMT !
Correction : La maladie ne ce lancait seulement que sur l'admin du serveur !
Correction : La protection des inventaires ne ce lancait que sur l'admin du serveur !



Version Beta 1.01 :
Ajout : Au fichier init_config la valeur sfp_config_listes_des_vehicules_pompiers, pour synchroniser les types de véhicules pompiers (gyrophares, sirenes, etc) !
Ajout : Au fichier init_config la valeur sfp_config_tresor_type, pour le type de trésor à rechercher !
Ajout : Au fichier init_config la valeur sfp_config_tresor_montant_argent_gagne, pour le montant gagné lorsque le trésor est trouvé !
Ajout : Au fichier init_config la valeur sfp_config_tresor_temps, pour le temps de lancement du script de trésor !
Ajout : Au fichier init_config la valeur sfp_config_tresor_distance, pour la distance MAX ou peut ce trouver le trésor par rapport au marqueur !
Modification : Quand vous désactivez les astuces ecrans (l'impots, le salaire, et le RSA ne seront plus prit en compte) !
Modification : Refonte du script de recherche du trésor !
Modification : De l'initialisation du code des messages d'astuces a l'écran !
Correction : Sur le message d'indication du trésor trouvé (pas de lancement) !
Correction : De la direction de spawn des véhicules pompiers !
Correction : De certains véhicules pompiers qui n'etaient pas compatible réservoir d'eau !
Correction : Des barrières à la SARL POMPIER !
Correction : De l'hélico taxi !
Correction : De la pose des barrière de sécurité gendarmerie !
Suppression/Mise A Jour : Des addons de la mission !
MAJ : Diverses de scripts !



Version Beta 1.00 :
Ajout/Création : Nouvelle DLL pour afficher l'heure windows !
Ajout/Création : Nouveau script pour convertir l'heure des dll !
Ajout/Création : Nouveaux scripts pour afficher dans les RPT si le serveur est bien configuré !
Ajout/Création : Nouveau script pour afficher les secondes windows dans l'heure !
Ajout : Nouvelles DLL serveur !
Modification : Lorsqu'un gendarme ouvre le menu des amendes, xx euros etait affichés suite à décision d'anciennes maj !
Modification : Script du taser (+ rapide) !
Mise A Jour : La mission est maintenant compatible 64 bits !
Correction : Du script d'achat de maisons (refonte du script) !
Correction : Du menu de la mission marine qui n'apparaissait plus lorsque celle ci etait faite deux fois !
Correction : Un ecran noir persistant pouvait apparaitre après votre chargement de sauvegarde !
Correction : "Le véhicule à bien été déclaré à votre nom" n'avait pas d'accent en jeu !
Correction : Le texte de la tablette pour la position de centrage n'affiché pas de bon caractere !
Correction : A coté du point éboueur, le menu kérosène apparaissaient !
Correction : Menu boutique habits dédoublé dans la gendarmerie de Pyrgos !
Correction : Lors d'une banderole staff, le HUD etait affiché par dessus !
Suppression : D'anciennes DLL serveur !
Suppression : Historique serveur du script de nettoyage en jeu !


Version 2003 :
Ajout/Création : D'un nouveau paramètre à la tablette pour afficher ou non, la mini carte au HUD !
Modification : Nouveau réglage automatique de la mini carte au HUD suivant la vitesse !
Correction : De l'entregistrement de votre sauvegarde local (position joueur, direction, infos véhicules, etc etc) !
Correction : De textes sur la tablette à l'accueil !
Correction : De couleur sur la tablette à l'accueil !
Correction : Du script de toilette (inversé) !
Correction : Du script de toilette (ce lancer quand même si script désactivé) !
Correction : Du menu gendarmes dédoublé au QG (garde à vue) - Attention concerne le fichier mission.sqm !
Correction : Script des stations services pour remettre du carburant !
Suppression : Dépendance du CBA sur le fichier mission.sqm !


Version 2002 :
Ajout/Création : D'un nouveau HUD !
Ajout/Création : D'une mini carte au HUD avec zoom automatique suivant votre vitesse !
Ajout/Création : D'un nouveau paramètre à la configuration du serveur pour autoriser ou non l'affichage des noms des joueurs dans les véhicules !
Correction : D'un bug de son lors de votre connection !
Correction : Transparence de la tablette !
Correction : Des messages du montant misé à l'euromillion ainsi que celui du loto !
Correction : Du message d'interdiction de sauvegarder certains items dans les véhicules (message non visable à cause de la tablette) !
Correction : Lorsqu'il vous restait plus qu'un seul véhicule, vous n'etez plus crédité d'un véhicule toutes les X secondes !
Correction : Lorsque vous avez fait echap dans le menu loie martiale, l'ecran resté noir !


Version 2001 :
Modification/optimisation/debug : Complète pour rendu publique !


Version 11352 :
Ajout/Création : La touche Espace ferme automatiquement le menu inventaire lorsque vous sautez !
Augmentation : Lègere de l'argent reçu en bonus donateur !
Augmentation : Lègere des primes des trésors (1500 Euros en +) !
Amélioration : Du script bonus donateur (il se pouvait que vous ne recevez pas votre bonus) !
Amélioration : Du chargement des maisons !
Modification : Les sabots sur les véhicules ne déverrouille plus les véhicules !
Correction : Lors d'un déchargement de la dépanneuse fonctionnelle, les roues du véhicule pouvaient être dans le sol !
Correction : De la couleur changeante des véhicules Jonzie !
Correction : Du script pour prendre les trésors !
Correction : Les zones de réparation des bateaux étaient trop petites pour recevoir le MK10 !


Version 11351 :
Ajout/Création : D'une ancre aux bateaux (UNIQUE !!!) !
Ajout/Création : D'un boutton au téléphone de la tablette pour changer votre numéro !
Ajout/Création : Lors d'une fin de service, de nouveau habits sont appliqués !
Ajout/Création : D'une prime aux pompiers lors qu'ils arrivent à maitriser un incendie !
Augmentation : Des bonus donateurs lors d'un don (voir forum) !
Amélioration : Des points de dépannages de la DIR lorsqu'un joueur fait la demande de réparation !
Amélioration : De la distance de detection des coffres forts !
Modification : Menu choix téléphone !
Modification : Lors d'un changement de numéro, votre répertoire n'est plus effacé !
Correction : Whitelist SOB !
Correction : Il n'est plus possible de désassembler les armes du territoire gang !
Correction : Nom du véhicule Ferrari agera en koenigsegg !
Correction : Nom du véhicule Jonzie Cadillac Escalade ESV en Jonzie Gallant !
Correction : Des véhicules jonzie qui changent de couleur après une sauvegarde !
Correction : Baisse du prix des reventes des maisons !
Correction : De la descente en rappel !
Correction : Des freins de la Maserati Quattroporte !
Correction : La nouvelle dépanneuse de la DIR est maintenant fonctionnel script (gyrophare, attacher derrière, argent, etc) !
Correction : Lors d'un saut en parachute avec notre script, le chargement des items de votre sacs etait trop long !
Correction : Couleur du texte de la tablette sur le menu preter clés véhicules !
Correction : D'un bug sur le répertoire téléphonique pour les nouveaux joueurs (le numéro s'affiché comme [0606060606,mon nom]) !
Correction : Lors d'une fin de service à la DIR, les menus d'actions étaient toujours affichés !


Version 11350 :
Correction : Véhicule Jonzie !
Correction : Arme lors d'une descente en rappel (...) !


Version 11349 :
Ajout/Création : D'un filtre pour marker sur la carte ! (UNIQUE) !
Ajout/Création : D'un nouveau menu Y (tablette) (UNIQUE) !
Ajout/Création : D'une nouvelle dépanneuse à la DIR !
Ajout/Création : Vous pouvez maintenant vous retirez de votre service directement sur la tablette !
Ajout/Création : Les gendarmes peuvent maintenant ouvrir les coffres des maisons !
Ajout : D'achat d'avion à Lifou !
Ajout : D'un bateau pour charger les véhicules dessus !
Ajout : D'une Jonzie Ford Falcon XB !
Ajout : D'une Jonzie Dodge Viper !
Ajout : D'une Jonzie Ford Transit !
Ajout : D'une Jonzie Dépanneur modélisé (plateau) !
Ajout : D'une Jonzie Mack Superliner 273 !
Ajout : D'une Jonzie Subaru WRX STI !
Ajout : D'une Jonzie Ford F150 Raptor !
Ajout : D'une Jonzie Maserati Quattroporte !
Ajout : D'une Jonzie Mini Cooper !
Ajout : D'une Jonzie Holden Commodore Gendarmerie !
Ajout : D'une Jonzie Mitsubishi Galant !
Ajout : D'une Jonzie Cadillac Escalade ESV !
Ajout : D'une Jonzie Datsun Fairlady Z432 !
Ajout : D'une Jonzie Datsun Bluebird !
Ajout : D'une Jonzie Toyota Sprinter !
Ajout : D'une Jonzie Kia cee'd !
Ajout : D'une Jonzie 30CSL !
Ajout : D'une montgolfière (boutique avions) !
Ajout : D'un paramoteur (boutique avions) !
Ajout : D'un OverBoard (boutique véhicules) !
Ajout : Des ascenseurs sur certains immeubles !
Ajout : De la corde pour descendre en rappel a la quincaillerie !
Ajout : D'un petit barrage sur le pont pour rejoindre l'ile principale !
Ajout : Du menu carrossier aux aéroport !
Ajout : Du menu tuning aux aéroport !
Amélioration : La position des terroristes est maintenant mise à jour toutes les 20 minutes !
Amélioration : Ajout d'un descriptif à la quincaillerie sur chaques items !
Amélioration : Suppression du brouillard !
Amélioration : Detection des plantes illégales !
Amélioration : Le HUD sur la droite ne s'affiche plus quand la carte est ouverte !
Amélioration : CPU lègère sur la charge de deux addactions !
Amélioration : Le menu carshop n'est plus accessible aux non salariés de l'entreprise !
Modification : De la zone de détection des missions bots taxi !
Modification : Les missions de la DIR ce déclenchent maintenant a partir d'un seul dépanneur !
Modification : Il est maintenant plus facile de jeter des cocktails molotov droit !
Modification : La nuit est maintenant plus rapide !
Correction : A la quincaillerie, certains affichages d'argent étaient mal affichés !
Correction : Vous pouvez maintenant poser les lampadaires à partir de 18h30 !
Correction : Prix de revente des maisons !
Correction : Si une plante n'avait pas de fertilisant, lors de la récolte vous n'en récupérer qu'une seule !
Suppression : De la Aston Martin !
Suppression : Du trigger de la DIR pour les gendarmes !
Suppression : Les gendarmes voient de nouveaux les points illégaux !
Suppression : De l'effet de zoom des icones sur la carte !


Version 11348 :
Ajout : De deux phares à GeorgeTown !
Modification : Lors d'un braquage de station service, la gendarmerie sera automatiquement avertit !
Modification : L'action pour pousser un bateau est maintenant moins forte !
Modification : Déplacement du spawn hélicoptères sur la plage à la licence gang !
Déplacement : Des travailleurs au noir !
Correction : De l'impossibilité aux nouveaux joueurs de se connecter longtemps à cause d'objects inexsistant (tarti et averell) !
Correction : Prix de l'or !
Correction : Temps du revive (sur dernière mini maj) !


Version 11347 :
Ajouter/Création : De la famille SOB !
Augmentation : Du prix que rapporte une prise de garde gendarme !
Augmentation : Lègere de l'argent aléatoire en donateur !
Amélioration : Nouveau script de la valise pour le rendre comme les véhicules !
Amélioration : Réecriture du script des gyrophares !
Modification : Baisse du temps avant de pouvoir revive gratuitement !
Modification : Les travailleurs au noir peuvent monter dans tout véhicules non vérrouillés !
Modification : Général des scripts pour farmer (temps, nombre recolté etc etc etc) !
Modification : Nouveau prix du farming !
Modification : Nouveau réglage de la bourse !
Correction : Prix armes gendarmes !
Correction : Prix hélicoptères territoire gang !
Correction : Prix armes territoire gang !
Correction : Du montant affiché lors d'un revive !
Correction : D'une faute de frappe sur l'ele au lieu de l'ile !
Correction : Il pouvait arriver que les véhicules explosent lorsqu'un dépanneur le décharger !
Correction : De la formation secouriste (temps et fin d'action) !
Correction : Du prix du HMETT !
Correction : Prix des bateaux gendarmes !
Suppression : Des actions pour ouvrir les barrières des douanes (petit gain de charge) !
Suppression : De la famille Sons Of Anarchy !


Version 11346 :
Ajout/Création : Re fonte du script de spawn du point de collecte chalutier !
Ajout/Création : Re fonte du script de spawn du trésor !
Ajout/Création : Nouveau script prise de douane gendarmes !
Ajout : Nouveau QG de la DIR !
Ajout : D'un inventaire virtuel à la JEEP du DLC !
Ajout : La Tahoe pompier à maintenant les gyrophares activables par K !
Mise A Jour : De la tenue Pompier !
Amélioration : Du script du ferry pour éviter les explosions !
Modification : Baisse du prix du ferry !
Modification : Script donateur (argent en jeu, armes, etc etc) !
Modification : Les nouveaux joueurs débarquent plus proche de GeorgeTown !
Modification : Baisse du prix du trésor !
Modification : Baisse du prix d'achat des maisons !
Modification : Baisse du prix d'achat des travailleurs au noir !
Modification : Baisse du prix que vous ramène les travailleurs au noir !
Modification : Des prises véhicules au territoire gang !
Correction : Du message : Attente 1 !
Correction : Certains véhicules n'était pas au prix affiché !
Correction : La jeep du DLC ne pouvait être remorqué par la dir !
Correction : Des prix missions DIR fuite d'eau !
Correction : Des prix missions DIR fuite produits inconnus !
Correction : Des prix missions DIR fuite produits inconnus !
Correction : Des prix missions DIR objects sur la route !
Correction : Des prix missions DIR routes fissurées !
Correction : Du temps long pour passer épreuves de secouriste !
Correction : Le menu m'équiper en gang pour les Daltons est maintenant payant !
Correction : Le menu m'équiper en gang pour les Sons Of Anarchy est maintenant payant !
Correction : Position de la mission eboueur !
Correction : Des prix des véhicules gangs !
Correction : Vous ne payez plus si vous attendez la fin du respawn ou si pas de pompier de connectés !
Correction : De la mission tondre la pelouse !
Correction : Pour poser une plante illégale !
Correction : Pour poser une tente !
Correction : Fuite produits toxiques (lancement mission) !
Correction : Spawn vendeur de voiture en position 112097 !
Correction : Lumière des gyrophares la nuit !


Version 11345 :
Amélioration : De spawn des points de collecte dans l'eau !
Amélioration : D'une prime minimum de 300 euros au CarShop lors d'une vente d'un véhicule !
Modification : Baisse du prix des véhicules Sons Of Anarchy !
Modification : Baisse du prix de l'offroad dalton !
Modification : Baisse du bonus argent donateur in game !
Correction : Lors d'un retrait de point sur votre permis, si vous etiez arrivé à 0 points le permis ne s'annulait pas !
Correction : Des prix au territoire gang !
Correction : Certains spawn étaient hors carte !
Correction : Mission poser lampadaire !
Correction : L'offroad dalton n'avait pas d'inventaire virtuel !
Correction : Lorsque vous repartez sur une nouvelle vie mais qu'il n'y à pas de pompiers de connecté, vous payez quand meme !
Correction : La mutelle etait gratuite pour tout le monde !
Correction : Le menu pousser bateau n'etait pas sur les nouveaux bateaux !


Version 11344 :
Ajout : De la jeep gendarmerie !
Modification : Baisse du prix des missions de patrouilles gendarmes !
Modification : Baisse du prix des livraisons de colis (-50%) !
Modification : Baisse du prix des médicaments !
Modification : Le carshop gagne 5 % du prix neuf d'un véhicule lorsqu'il est revendu par eux !
Modification : Les pompiers ne paient plus de mutuelle (prise en charge par le SDIS) !
Modification : Baisse du revenu des trésors !
Modification : Baisse du salaire des donateurs !
Modification : Baisse du prix d'achat des maisons !
Modification : Baisse du prix du permis leger !
Modification : Baisse du prix du permis poids lourds !
Modification : Baisse du prix des récompenses accident de la route des gendarmes !
Correction : Incendie des maisons !
Correction : Des missions de patrouillent en gendarme !
Correction : Vous pouvez maintenant acheter des maisons !


Version 11343 :
Amélioration : Du script ferry !
Modification : Salaire donateur nouveau joueur pendant 40 minutes (passe de 8100 à 120 euros) !
Modification : Baisse du prix du ferry !
Modification : Baisse du prix des médicaments !
Modification : Baisse du prix des livraisons marchandises !
Modification : Message d'intro au joueur sans notre mod !
Mise A Jour : QG DIR !
Mise A Jour : QG Auto Ecole !
Refonte : De l'economie de la bourse !
Correction : Des nombreux script/detection des stations services !
Correction : De nombreux scripts qui ne ce lancait plus suite passage Altis (Dir, Pompiers, etc) !
Correction : Tarif gendarme boutique vestes !
Correction : Lorsque vous cliquez sur un menu pour collecter du farming, en cas d'interdiction le menu n'apparaissait plus !
Correction : Montant des cotisations de votre mutelle !
Correction : Du spawn des véhicules de livraison de gasoil !
Correction : Du spawn des trésors !
Correction : De certains ATM pas droit !
Correction : La licence fusil n'etait plus achetable !
Correction : De l'affichage du prix dans les menus acheter une redbull !
Correction : De l'affichage du prix dans les menus acheter une barre de céréale !
Correction : De l'affichage du prix dans les menus acheter une bouteille d'eau !


Version 11342 :
Correction : Ajout d'une protection à l'achat des hélicoptères pour éviter qu'ils explosent si un autre est déja sur place !


Version 11341 :
Modification economie de l'ile (en cours) : Terminé pour les gain des braquages de station service !
Modification economie de l'ile (en cours) : Terminé pour les gain des gofast !
Modification economie de l'ile (en cours) : Terminé pour les gain des braquage de banque !
Modification economie de l'ile (en cours) : Terminé pour les temps de braquage de banque !
Modification economie de l'ile (en cours) : Terminé pour les habits civils !
Modification economie de l'ile (en cours) : Terminé pour les habits gendarmes !
Modification economie de l'ile (en cours) : Terminé pour les habits gang !
Modification economie de l'ile (en cours) : Terminé pour les amendes des radars automatique !
Modification economie de l'ile (en cours) : Terminé pour les tarifs du menu tuning véhicule !
Modification economie de l'ile (en cours) : Terminé pour les tarifs du ferry !
Modification economie de l'ile (en cours) : Terminé pour les tarifs du menu hack informatique !
Modification economie de l'ile (en cours) : Terminé pour les tarifs des poubelleurs !
Modification economie de l'ile (en cours) : Terminé pour les tarifs du farming !
Modification economie de l'ile (en cours) : Terminé pour les tarifs des transformation de matières !
Modification economie de l'ile (en cours) : Terminé pour les tarifs SFP Telecom !
Modification economie de l'ile (en cours) : Terminé pour les tarifs du taskforce !
Modification economie de l'ile (en cours) : Terminé pour les tarifs boutique plongée !
Modification economie de l'ile (en cours) : Terminé pour les tarifs des antibiotiques !
Modification economie de l'ile (en cours) : Terminé pour les tarifs de la mutuelle !
Modification economie de l'ile (en cours) : Terminé pour les tarifs de la pépinière !
Déplacement : Licence gang !


Version 11340 :
Ajout/Création : Nouveau QG DIR !
Ajout/Création : Nouveau QG carshop et suppression du batiment moddé !
Modification economie de l'ile (en cours) : Terminé pour la boutique divers !
Modification economie de l'ile (en cours) : Terminé pour la quincaillerie !
Modification economie de l'ile (en cours) : Terminé pour le tarif de réarmement des véhicules !
Modification economie de l'ile (en cours) : Terminé pour les licences de transformation cocaine !
Modification economie de l'ile (en cours) : Terminé pour les licences de transformation de drogue !
Modification economie de l'ile (en cours) : Terminé pour les licences illégales !
Modification economie de l'ile (en cours) : Terminé pour les licences légales !
Modification economie de l'ile (en cours) : Terminé pour les prix des diplomes ecole !
Modification economie de l'ile (en cours) : Terminé pour les gains max des terroristes !
Modification economie de l'ile (en cours) : Terminé pour les gains max du trésor !
Modification economie de l'ile (en cours) : Terminé pour les gains max de la statue !
Modification economie de l'ile (en cours) : Terminé pour les gains max au calcul mathématique !
Modification economie de l'ile (en cours) : Terminé pour les gains max au fond marin !
Modification economie de l'ile (en cours) : Terminé pour les gains max au livraison de marchandise !
Modification economie de l'ile (en cours) : Terminé pour les gains max au livraison de gasoil !
Modification economie de l'ile (en cours) : Terminé pour les gains max au livreur de journaux !
Modification economie de l'ile (en cours) : Terminé pour les gains max à la francaise des jeux !
Modification economie de l'ile (en cours) : Terminé pour les gains max à l'ANPE !
Modification economie de l'ile (en cours) : Terminé pour l'argent en banque des nouveaux arrivant !
Modification economie de l'ile (en cours) : Terminé pour l'argent en poche des nouveaux arrivant !
Modification economie de l'ile (en cours) : Terminé pour les prix des casques pompiers !
Modification economie de l'ile (en cours) : Terminé pour les prix des voitures territoire pol ;  gang !
Modification economie de l'ile (en cours) : Terminé pour les prix des voitures gang !
Modification economie de l'ile (en cours) : Terminé pour les prix des voitures Carshop !
Modification economie de l'ile (en cours) : Terminé pour les prix des voitures Auto Ecole !
Modification economie de l'ile (en cours) : Terminé pour les prix des voitures DIR !
Modification economie de l'ile (en cours) : Terminé pour les prix des objects DIR !
Modification economie de l'ile (en cours) : Terminé pour les prix des voitures pompiers !
Modification economie de l'ile (en cours) : Terminé pour les prix des hélicos Auto Ecole !
Modification economie de l'ile (en cours) : Terminé pour les prix des hélicos pompiers !
Modification economie de l'ile (en cours) : Terminé pour les prix des voitures civil !
Modification economie de l'ile (en cours) : Terminé pour les prix des voitures gendarme !
Modification economie de l'ile (en cours) : Terminé pour les prix des hélicos civil !
Modification economie de l'ile (en cours) : Terminé pour les prix des hélicos gendarmes !
Modification economie de l'ile (en cours) : Terminé pour les accessoires armes des gang !
Modification economie de l'ile (en cours) : Terminé pour les accessoires armes des civils illégaux !
Modification economie de l'ile (en cours) : Terminé pour les accessoires armes des civils légaux !
Modification economie de l'ile (en cours) : Terminé pour les accessoires armes des gendarmes !
Modification economie de l'ile (en cours) : Terminé pour les accessoires armes du GIGN !
Modification economie de l'ile (en cours) : Terminé pour les fusils de gang !
Modification economie de l'ile (en cours) : Terminé pour les fusils illégaux civils !
Modification economie de l'ile (en cours) : Terminé pour les fusils légaux civils !
Modification economie de l'ile (en cours) : Terminé pour les pistolets illégaux civils !
Modification economie de l'ile (en cours) : Terminé pour les pistolets légaux civils !
Modification economie de l'ile (en cours) : Terminé pour les pistolets gendarmes !
Modification economie de l'ile (en cours) : Terminé du salaire des gendarmes !
Modification economie de l'ile (en cours) : Terminé du salaire des pompiers !
Modification economie de l'ile (en cours) : Terminé du salaire de la DIR !
Modification economie de l'ile (en cours) : Terminé du salaire de l'auto école !
Modification economie de l'ile (en cours) : Terminé du salaire du CarShop !
Modification economie de l'ile (en cours) : Terminé sacoche gang !
Modification economie de l'ile (en cours) : Terminé ceinture c4 gang !
Déplacement : Du vendeur de véhicules au Carshop !
Correction : Les civils peuvent désormais rentrer dans le bureau de la SARL AUTO ECOLE !
Correction : Les civils ne peuvent plus acheter d'hélicoptères à la gendarmerie !
Correction : Les civils n'ont plus accès aux caméras de la ville au QG gendarme !
Correction : Du spawn des hélicos au territoire gang !


Version 11339 :
Ajout/Création : Lors d'un braquage de banque l'ATM de la banque centrale est desactivé !
Mise A Jour : Du QG Dalton !
Mise A Jour : De la brigade de gendarmerie !
Mise A Jour : Du QG Auto Ecole !
Mise A Jour : Du QG Pompier !
Mise A Jour : Du batiment SARL AVOCAT !
Mise A Jour : De la prison !
Mise A Jour : Divers script !
Correction suite passage tanoa : De l'affichage sur la carte des ATM !
Suppression : Du QG GIGN (suite avis Tartiflette) !


Version 11338 :
Correction suite passage tanoa : Du Brouillard (refonte du script) !


Version 11337 :
Ajout/Création suite passage tanoa : D'un ferry !
Correction suite passage tanoa : Du Brouillard donc refonte du script météo !
Correction suite passage tanoa : Les travailleurs au noir pouvait travailler près de la cabane !

		
Version 11336 :
Correction suite passage tanoa : Du spawn des avions (mauvaise direction) !
Correction suite passage tanoa : Du spawn des véhicules du Carshop !
Correction suite passage tanoa : Des prévisualisations des véhicules !
Correction suite passage tanoa : Le QG SonsOfAnarchy était deux fois !
Correction suite passage tanoa : Point du spawn des véhicules gang !
Correction suite passage tanoa : Diverses choses voir forum !

		
Version 11335 :
Création : Passage sur Altis !
Amélioration suite passage tanoa : De la patrouille de France !
Amélioration suite passage tanoa : Des caméras de surveillances (ajouts supplémentaires) !
Amélioration suite passage tanoa : Des caméras de surveillances (suppression animation lors de la casse) !
Amélioration suite passage tanoa : Des radars (création automatique) !
Amélioration suite passage tanoa : Désactivation du script de destruction des maisons et grue car les maisons sur Altis ne ce détruisent pas !
Amélioration suite passage tanoa : Refonte des etoiles filantes qui ne fonctionnait plus sur Altis (meilleur rendu maintenant) !
Amélioration suite passage tanoa : Refonte des feux d'artifices qui ne fonctionnait plus sur Altis !
Amélioration suite passage tanoa : Refonte des météorites qui ne fonctionnait plus sur Altis !
Amélioration suite passage tanoa : La zone du marché noir ne fonctionnait plus !
Amélioration suite passage tanoa : Les antennes télécoms ne fonctionnait plus !
Amélioration suite passage tanoa : Refonte des spawn Kébabs qui ne fonctionnait plus !
Amélioration suite passage tanoa : Refonte des spawn médecins qui ne fonctionnait plus !
Amélioration suite passage tanoa : Refonte des spawn de zone de farming qui ne fonctionnait plus !
Amélioration suite passage tanoa : Refonte des spawn de zone de transformations qui ne fonctionnait plus !
Amélioration suite passage tanoa : Augmentation de la zone de coffres des armes !
Modification suite passage tanoa : Très grosse modification de scripts pour rendre compatible Altis !

		
Version 11334 :
Ajout : Des nouveaux modérateurs à la mission !
Ajout : Arme Rebelle : Ak - 12 !
Ajout : Arme Rebelle : AKM !
Ajout : Arme Rebelle : AKS-74u !
Ajout : Arme Rebelle : CAR-95 !
Ajout : Arme Rebelle : CMR-76 !
Ajout : Arme Rebelle : LIM-85 !
Ajout : Arme Rebelle : Mk-1 EMR Boisé !
Ajout : Arme Rebelle : Mk-1 EMR Camo  !
Ajout : Arme Rebelle : Mk-1 EMR Khaki  !
Ajout : Arme Rebelle : Mk-1 EMR Sable  !
Ajout : Arme Rebelle : Mk14 Camo !
Ajout : Arme Rebelle : SPAR-16 Sable !
Ajout : Arme Rebelle : SPAR-17 Sable !
Ajout : Arme Rebelle : Type 115 !
Ajout : Arme Rebelle : RPG-7 !
Ajout : Accessoire Arme Rebelle : AMS Khaki !
Ajout : Accessoire Arme Rebelle : AMS Noir !
Ajout : Accessoire Arme Rebelle : AMS Sable !
Ajout : Accessoire Arme Rebelle : ARCO Hex Verte !
Ajout : Accessoire Arme Rebelle : DMS Hex Verte !
Ajout : Accessoire Arme Rebelle : DMS  !
Ajout : Accessoire Arme Rebelle : ERCO Khaki !
Ajout : Accessoire Arme Rebelle : ERCO  !
Ajout : Accessoire Arme Rebelle : ERCO Sable !
Ajout : Accessoire Arme Rebelle : Holosight Kaki !
Ajout : Accessoire Arme Rebelle : Holosight Noire !
Ajout : Accessoire Arme Rebelle : Khalia ( OLD )  !
Ajout : Accessoire Arme Rebelle : LRPS  !
Ajout : Accessoire Arme Rebelle : LRPS Hex Verte !
Ajout : Accessoire Arme Rebelle : LRPS Tropic !
Ajout : Accessoire Arme Rebelle : Silencieux 7.62 Khaki !
Ajout : Accessoire Arme Rebelle : Silencieux 7.62 Sable !
Ajout : Accessoire Arme Rebelle : Silencieux 5.8 mm Hex verte !
Ajout : Accessoire Arme Rebelle : Silencieux 6.5 mm Khaki !
Ajout : Accessoire Arme Rebelle : Silencieux 6.5 mm Sable !
Ajout : Accessoire Arme Rebelle : Silencieux 5.56 mm Khaki !
Ajout : Accessoire Arme Rebelle : Silencieux 5.56 mm Sable !
Ajout : Accessoire Arme Rebelle : Silencieux Type 115 Hex verte !
Ajout : Arme Gendarmerie : CAR-95 !
Ajout : Arme Gendarmerie : Mp5k  !
Ajout : Arme Gendarmerie : SPAR-16 !
Ajout : Arme Gendarmerie : Type 115 !
Ajout : Arme GIGN : CMR-76 !
Ajout : Arme GIGN : LIM-85 !
Ajout : Arme GIGN : Mk-1 EMR !
Ajout : Arme GIGN : Mk14  !
Ajout : Arme GIGN : SPAR-17 !
Ajout : Accessoire Arme Gendarme : AMS Noir !
Ajout : Accessoire Arme Gendarme : ARCO Noire !
Ajout : Accessoire Arme Gendarme : ERCO Noire !
Ajout : Accessoire Arme Gendarme : DMS  !
Ajout : Accessoire Arme Gendarme : Holosight Noire !
Ajout : Accessoire Arme Gendarme : Khalia Noire !
Ajout : Accessoire Arme Gendarme : LRPS  !
Ajout : Accessoire Arme Gendarme : Silencieux Type 115 !
Ajout : Accessoire Arme Gendarme : Silencieux 5.8 mm noir !
Ajout : Arme Civil : Mp5k  !
Ajout : Arme Civil : PM Makarov !
Ajout : Véhicule Rebelle : Qilin ( Désarmé ) !
Ajout : Véhicule Rebelle : Qilin ( Armé ) !
Ajout : Véhicule Rebelle : Jeep  !
Ajout : Véhicule gendarme : Prowler ( désarmé )   !
Ajout : Véhicule gendarme : Prowler ( Armé ) Noir !
Ajout : Véhicule gendarme : RHIB ( Bateau ) Noir !
Ajout : Véhicule gendarme : Pick up Gendarmerie !
Ajout : Véhicule Civil : Jeep  !
Ajout : Véhicule Civil : RHIB  !
Ajout : Véhicule Civil : JetSki  !
Ajout : Véhicule Civil : Caesar BTT ( Avion ) !
Ajout : Vetement Civil : 14 nouveaux vétements !
Ajout : Vetement Rebelles  : 5 nouveaux vétements !
Ajout : Vehicule Altis && Furious  : 4 nouveaux véhicules !
Correction : Le script donateur était resté en debug, spam des bonus !
Correction : Des plaques à la fourrière de la DIR !
Correction : Glitch des coffres forts ... !!!!!!
Suppression : Des addons CL3 du pack DEBUG : Carrera GT !
Suppression : Des addons CL3 du pack DEBUG : Mercedes E63 AMG SFP !
Suppression : Des addons CL3 du pack DEBUG : Honda Civic MK2 SFP !
Suppression : Des addons CL3 du pack DEBUG : Ford Taurus SFP !
Suppression : Des addons CL3 du pack DEBUG : Ferrari 458 SFP !
Suppression : Des addons CL3 du pack DEBUG : Dodge Charger Stock SFP !
Suppression : Des addons CL3 du pack DEBUG : Bugatti Veyron SFP !
Suppression : Des addons CL3 du pack DEBUG : BMW Z4 SFP !
Suppression : Des addons CL3 du pack DEBUG : Audi Q7 SFP !
Suppression : Des addons CL3 du pack DEBUG : Range Rover SFP !
Suppression : Des addons CL3 du pack DEBUG : Polo GTI SFP !
Suppression : Des addons CL3 du pack DEBUG : Golf MK2 SFP !
Suppression : Des addons CL3 du pack DEBUG : Insignia Vauxhall SFP !


Version 11333 :
Ajout/Création : La pharmacie est fermé de 20 heures à 8 heures IN GAME (pas IRL) !
Ajout/Création : L'antibiotique s'achète maintenant en pharmacie !
Ajout : D'une pharmacie aux pompiers !
Modification : Augmentation du temps de formation secouriste à partir du niveau 3 !
Augmentation : Du prix des ressources légales !
Correction : Du revive pour stabiliser un blessé !
Correction : Du remboursement de la mutuelle des kits de soins !
Correction : Lorsque votre sauvegarde véhicule est pleine, le message "désolé une opération est déja en cours" apparaissait !


Version 11332 :
Modification : De l'affichage du texte du revive !
Correction : Revive nombre de pompiers connectés !
Correction : Prix non ponctionné à la pharmacie !
Correction : Diverses revives !


Version 11331 :
Ajout/Création : Lorsque vous soignez un joueur, vous pouvez passer toutes les étapes de soins directement à l’hôpital à condition qu'il soit transportable pour l'emmener jusqu’à la ;) (UNIQUE !) !
Ajout/Création : Le joueur peut être maintenant soigné par plusieurs personnes mais pas au même endroit en même temps (UNIQUE !) !
Ajout/Création : Nouveau script des caisses d'armes (100 % de compatibilités des items dedans) (UNIQUE !) !
Ajout/Création : Nouveau script des bonus donateurs (100 % de compatibilités des items dedans) (UNIQUE !) !
Ajout/Création : Nouveau script d'information kill des joueurs (plus précis et rapide) (UNIQUE !) !
Ajout/Création : Nouveau revive complet refonte graphique et script (UNIQUE !) !
Ajout/Création : D'une pharmacie formation secouriste ainsi que divers items du revive qui seront ajoutés par la suite (UNIQUE !) !
Ajout/Création : Lors d'un revive, suivant les dégâts du joueur et votre niveau de secouriste, une hémorragie peut se déclencher ! (UNIQUE !) !
Ajout/Création : Lors d'un revive non critique, celui ci peut le devenir vous obligeant à stabiliser le blessé (UNIQUE !) !
Ajout/Création : Il faut maintenant stabiliser le blessé avant de pouvoir le soigner si soins critiques !
Ajout/Création : Les kits de soins s’achètent maintenant en pharmacie !
Amélioration : De l'anti CarKill a partir des tirs d'hélicoptères !
Amélioration : Script pour treuiller un véhicule (+ d'attente pour la synchronisation de bohémia) !
Amélioration : Refonte du script dépanneur pour charger un véhicule sur le offroad (dépose derrière) !
Amélioration : De la rapidité de sauvegarde du revive lors d'une mort pour éviter les glitchs !
Amélioration : De la stabilisation (arrêt lorsque le joueur s'éloigne,  meurt, etc) !
Modification : Lorsqu'une tentative de soigner un joueur vous est refusé, le kit de soin ne sera pas supprimé !
Modification : Vous n'êtes plus obligé d'aller à hôpital pour avoir le menu soigner le joueur (cependant suivant l’état il peut être obligatoire d'y aller ou d'appeler les pompiers) !
Modification : Du prix lorsque vous faite un revive !
Modification : Du revive par si et par la ^^ A vous de découvrir :p !
Modification : Une fois les secours contacté, le délai de pouvoir de nouveau respawn ou les appeler passe de 3 minutes à 15 minutes (trop d'abus) !
Modification : Le statut donateur offert au nouveau joueur est maintenant activé à partir de 10 minutes de jeu et jusqu'à 60 minutes de jeu (et plus toute la journée) !
Suppression : Du random pour passer à travers la protection du revive lors d'un soins !
Suppression : Du menu banque (atm) à la zone gang !
Correction : Lorsque vous récolter une plante sans fertilisant celle ci n’était pas obtenue !
Correction : Glitch sauvegarde des véhicules lors d'un alt + f4 !
Correction : Des menus kérosènes, réparation, etc en hélicoptères qui disparaissaient !
Correction : Synchronisation temps loi martiale !
Correction : Pistolet Lacrymogène gendarmerie !


Version 11330 :
Ajout/Création : Nouveau QG néomédia !
Ajout/Création : Néomédia peut autoriser des personnes à rentrer dans leur QG pour les interviews !
Ajout : Du pack son JSRS3 (https://forums.bistudio.com/topic/187343-jsrs3-dragonfyre-eden-14/) !
Optimisation : Des scripts de détection des incendies !
Modification : Script charge client attente de redémarrage du serveur !
Correction : Spawn des hélicos à l'airfield (il pouvait spawn ailleur) !
Correction : Son départ des pompiers !


Version 11329 :
Ajout/Création : D'un log staff sur les transactions d'argents (virements, poches, etc etc) !
Ajout/Création : D'un log staff sur ceux que les civils farment !
Ajout : D'une configuration d'habit PSIG au menu Y !
Modification : Diminution du montant max des emprunts des crédits sfp !
Modification : Assouplissement des remboursements des crédits sfp !
Modification : Du code revive pour eviter de perdre les armes lors de votre mort !
Modification : Du code revive pour eviter de perdre les items des habits lors de votre mort !
Modification : De la loie martiale pour ne pas avoir le son en double (synchro headless et serveur) !
Modification : Du script du cambriolage pour eviter de spam le boutton (en test suivant headless) !
Modification : Du script des gofasts pour eviter de spam le boutton (en test suivant headless) !
Modification : Assouplissement du besoin en eau des plantes (moins besoin de les arroser) !
Correction : Skins des pickup !
Correction : De la luminosité des gyrophares !
Mise A Jour : Du pack Identity (http://www.armaholic.com/page.php?id=26169) !



Version 11328 :
Ajout : Ajout d'une tenue de PSIG !
Modification : Re fonte du multiplicateur de farming (voir forum : http://www.sfpteam.fr/forum/index.php?threads/prochaine-maj-multiplicateur-farming.17284/) !
Modification : Les prix du farming ne varient plus toutes les 2 heures !
Correction : De la veste gendarmerie au menu stagiaires gendarmes !
Suppression : Du sac GIGN lorsque vous vous habillez en GIGN !



Version 11327 :
Ajout/Création : Si votre véhicule explose lors du chargement de votre sauvegarde, celui ci ni sera pas supprimé (UNIQUE !) !
Ajout/Création : Les gendarmes peuvent maintenant retirer la licence fusil et/ou port d'armes !
Ajout : Du message "dépanneurs connectés" à coté du prix du toolkit lorsqu'ils sont connectés !
Amélioration : Du code pour utiliser ou jeter un farming lorsque rien n'est selectionné (évite erreur) !
Amélioration : Du code de l'inventaire personnel pour pouvoir utiliser le traceur etc !
Amélioration : Charge client pour les gendarme du menu déroulant sur un civil !
Modification : La position des go fasts passe de 1-10 secondes à 10-20 secondes !
Modification : Les gendarmes peuvent maintenant également utilisé l'inventaire personnel sur les véhicules (dépose, prendre, etc) !
Modification : Diverses du comportement du traceur des véhicules !
Modification : Recompilation du menu déroulant gendarme lorsqu'un civil est arreté à proximité de lui !
Modification : Du code gendarme pour supprimer les inventaires des véhicules !
Correction : Skin HMETT SARL DIR !


Version 11326 :
Ajout/Création : Multiplicateur du prix des ressources illégales quand 6 gendarmes connectés (attente de 10 minutes lorsqu'ils se connectent pour les changements de prix) !
Amélioration : Nouvelle version de la loi martiale (son supplémentaire, affichage temps restant, etc) !
Modification : Les gendarmes ne voient plus les markers : Baleine, Heroine, Requin, Cannabis, Medicaments, Organes Animaux, Cocaine, Transf Serpent, Transf Cannabis, Pepiniere, Transf Heroine, Amphetamines, Hack Informatique, Formation Laboratoire !
Modification : Le marché noir est visible aux gendarmes (suite multiplicateurs de prix ainsi que la non visibilité de la ligne au dessus) !
Modification : Baisse du prix de l'illégal si pas de gendarmes connectés !
Re-Fonte : Des SUV !
Re-Fonte : Des HatchBack !
Re-Fonte : Des Offroad !
Correction : Des freins du Q7 !
Correction : Des freins de la BMW M1 !
Correction : Des freins de la BMW M6 !
Correction : Des freins de la Range Rover !


Version 11325 :
Correction : Dupplication menu gendarme loi martiale !
Correction : Activation de la loi martiale !
Correction : De la distance du menu "Donner Un Coup De Poignard" !
Correction : Du taser qui tuer !


Version 11324 :
Ajout/Création : De la loi Martiale (avertit tous le peuple avec sirène et message vocaux pendant l'alerte (gradé seulement à la brigade)) (UNIQUE !) !
Ajout/Création : Nouvelle configuration du fichier addons du taser !
Mise A Jour : Du QG des pompiers !
Correction : Certains guichets d'ATM ne s'affichaient pas !
Suppression : Vieille class du taser !
Suppression : Depuis la dernière maj de bohémia, des objets de base arma (hélipad) ont étés placés en DLC bohémia donc plus compatible !


Version 11323 :
Amélioration : FPS divers sur la charge des menus addactions !
Correction : La gendarmerie de Néo ne peut plus être détruite par le script de grue !


Version 11322 :
Ajout/Création : Nouveau menu des effets de drogue (par dialogue et plus par la souris) (UNIQUE !) !
Modification : Du code du chargement des coffres-forts !
Modification : Du code des habits pour eviter leurs pertes lors d'une reco !
Modification : Du flash ball pour eviter les crashs !
Optimisation : Diverses de codes compilés après mort !
Optimisation : Grosse optimisation de charge CPU client pour vérifier les ATM, une seule requete CPU au lieu d'une 40 ene !
Optimisation : Passage de 8 à 1 requête par seconde de charge CPU client pour vérifier les chiens attaques !
Optimisation : Passage de 6 à 1 requête par seconde de charge CPU client pour vérifier le revive !
Optimisation : Passage de 6 à 1 requête par seconde de charge CPU client pour vérifier les sacoches de c4 !


Version 11.3201 :
Ajout/Création : Vous recevez un popup lorsqu'une personne dépose quelque chose dans votre inventaire (UNIQUE !) !
Correction : Des affichages popup en haut de l'écran (réécriture du code) !
Suppression : De la voix d'interdiction de tir en ville !


Version 11.32001 :
Amélioration : De divers véhicules !
Amélioration : Des Van !
Amélioration : Des X6 !
Amélioration : Des Offroads !
Amélioration : Des Quads !
Amélioration : Des HatchBack !
Amélioration : Des KA-60 !
Amélioration : Des littlebirds !
Amélioration : Général des bateaux civils !
Amélioration : Général du hemtt !
Amélioration : Diverses des blindages et capacité des sacs à dos entreprises, gendarmerie, etc !
Correction : Soucis véhicules, sacs et hélicoptères qui ne spawn pas !

Version 11.32 :
Ajout/Création : Place de néochori mise en place !
Ajout : Bipied HK 416/417 en gendarmerie !
Ajout : HK 417 S en gendarmerie !
Ajout : HK 417 M en gendarmerie !
Amélioration et correction : De nombreux véhicules !
Modification : Vous pouvez maintenant cacher votre visage lors d'un braquage avec 84 cagoules etc (liste donné par Jona) !
Modification : Detection du menu charger un bléssé !
Modification : Les plantes illégales demandent maintenant moins d'eau !
Correction : Gilet par balles gendarmerie !
Correction : Menu charger un bléssé !
Correction : Script des coffres-forts et des maisons suite maj de bohémia (ne charger plus) !
Correction : De nombreux erreurs de véhicules suite à la maj de bohémia !

Version 11.3102 :
Modification : Bandwitch du serveur !
Correction : Activation des puces moteurs des véhicules !
Correction : Le menu charger un bléssé dans un véhicule pouvait se duppliquer !
Correction : Des radars fixes !
Correction : Menu réparer véhicules !
Correction : Lock/unlock des véhicules de l'intérieur !
Correction : Gyrophares des véhicules la journée !
Correction : Diverses de script plus compatible avec la dernière maj de bohémia !

Version 11.3101 :
Correction : Des soucis depuis maj bohémia (déverrouiller véhicule etc) !


Version 11.31 :
Ajout/Création : Du système des SIV des véhicules à la brigade de néochori pour les gendarmes !
Ajout : De l'option pousser avion sur le DR400 et Sab Faallegro !
Ajout : D'une antenne télécom près du QG Néomédia lorsqu'il se connecte !
Ajout : Du raccourci touche K pour activer les gyrophares aux pompiers !
Ajout : Du raccourci touche K pour activer les gyrophares aux gendarmes !
Ajout : Du raccourci touche K pour activer les gyrophares à la DIR !
Modification : Suppression du script qui vous supprime votre inventaire en garde a vue (aux gendarmes de le faire manuellement) !
Modification : Du prix du littlebird Néomédia (60000) !
Modification : Du prix de l'addac Néomédia (110000) !
Amélioration : Du revive pour éviter que le menu charger dans un véhicule reste apparent !
Amélioration : Du revive pour éviter un hack tp lors d'une mauvaise manipulation !
Optimisation : Performance detection des antennes relais !
Correction : Ban et Kick pannel admin SFP !
Correction : L'argent de poche des coffres forts est maintenant sauvegardable !
Correction : Erreur affichage dialogue punto lors de la connexion au serveur !
Correction : Les joueurs sans launcher ne pouvaient pas se connecter (re bug bohémia !) !
Correction : Ajout du point Navette Hélico à Chalkeia !
Suppression : De la zone Safe à Néochori !


Version 11.3 :
Ajout/Création : D'un script pour réarmer vos véhicules (50 000 € par recharge) !
Ajout/Création : Vous pouvez maintenant fouiller un joueur si il met les mains sur la tête !
Ajout/Création : D'un nouveau choix pour les nouveaux joueurs lors de leurs arrivées sur l'ile (bateau ou parachute) !
Ajout/Création : Vous pouvez maintenant supprimer votre puce au carrossier !
Ajout/Création : Vous pouvez maintenant supprimer votre néon au carrossier !
Ajout/Création : Vous pouvez maintenant supprimer votre detecteur de radar au carrossier !
Ajout/Création : Vous pouvez maintenant supprimer votre detecteur de recul au carrossier !
Ajout/Création : Vous pouvez maintenant supprimer votre klaxon personnalisé au carrossier !
Ajout : Du nombre de journaliste connecté (Néomédia) en haut ç gauche sur le HUD !
Ajout : Du Robin DR-400 à la boutique avion !
Ajout : Du Sab Faallegro à la boutique avion !
Ajout : Néomédia peut maintenant acheter son ADDAC au QG !
Ajout : Néomédia peut maintenant acheter son LittleBird au QG !
Ajout : Néomédia peut maintenant manger, boire et dormir à leur QG !
Ajout : Du vetement habit gendarme grand froid à la boutique habit !
Ajout : Du vetement habit gendarme polaire à la boutique habit !
Ajout : Du vetement habit gendarme à la boutique habit !
Ajout : Du vetement GIGN à la boutique habit !
Ajout : Logo HQ panneau Néomédia !
Ajout : Logo HQ panneau Dalton !
Ajout : MX Noir Gendarme !
Ajout : MX SW Noir Gendarme !
Ajout : MXC Noir Gendarme !
Ajout : MXM Noir Gendarme !
Ajout : P07 9mm Gendarme !
Ajout : Rook 9 MM Gendarme !
Ajout : Silencieux HK 416 Camo licence gang !
Ajout : Silencieux HK 417 Camo licence gang !
Ajout : Lampe Camo licence gang !
Ajout : Lunette Aimpoint Camo licence gang !
Ajout : Bipied 416/417 Camo licence gang !
Ajout : Lunette Zeiss Camo licence gang !
Ajout : Silencieux FRF2 Camo licence gang !
Ajout : Lunette J4 Camo licence gang !
Ajout : Lunette J8 Mildot Camo licence gang !
Ajout : HK 416 territoire gang !
Ajout : MX Noir territoire gang !
Ajout : MX SW Noir territoire gang !
Ajout : MXC Noir territoire gang !
Ajout : MXM Noir territoire gang !
Augmentation : Refonte du script de cambriolage, gendarmerie pas avertit automatiquement, si inverse, position de la maison plus précise !
Augmentation : Point de marqueur amélioré pour éviter qu'il reste affiché si le joueur se déconnecte et n'est plus affiché au civil !
Augmentation : De la récompense des gendarmes lorsqu'il trouve un travailleur au noir !
Amélioration : Débug automatique si votre espace total de votre inventaire est buggué !
Amélioration : Les travailleurs au noir sont parfois repéré par la gendarmerie !
Amélioration : Charge headless sur les braquages de stations services !
Amélioration : Charge headless sur les cambriolages de maisons !
Amélioration : Spawn des véhicules de l'auto sav lorsque le serveur crash !
Amélioration : Général des menus addactions !
Modification : Néomédia peut charger jusqu'a 7 vehicules sur la carte pour les preter aux stagiaires !
Modification : Script visuel des marqueurs sur la carte !
Modification : Lorsqu'un gendarme acheté une arme, il pouvait avoir le message lui disant qu'un véhicule était déja sur place !
Optimisation : De la synchronisation des habits sur l'ile !
Optimisation : Script sang joueur !
Optimisation : Compléte des objets spawné par script !
Correction : Hack TP lors d'un choix du respawn !
Correction : Viande de lapins dans la valise de farming !
Correction : La gendarmerie n'etait plus prévenu lors d'un braquage d'une station service !
Correction : Distance d'affichage à pied indiqué dans le menu Y !
Correction : Point/Distance avec shift clique suite dernière maj de bohémia !
Correction : Durée des feux d'artifices !
Correction : Les travailleurs au noir pouvaient travailler dans Néochori !
Correction : Lorsqu'un joueur trouvé un véhicule offert, any était marqué au lieu d'un joueur !
Correction : La réparation des avions à l'aéroport peut maintenant réparer le T6 Texan !
Correction : Lors d'un crash serveur, les véhicules repopé avec des puces etc !
Correction : Boutique habits brigade de Néochori !
Correction : Lorsque vous jouez à la francaise des jeux, l'argent n'était pas retiré de votre poche !
Correction : Pistolet Lacrymogène à la boutique stagiaires gendarmerie !
Correction : Délais d'envoi des messages anonymes des antennes piratées !
Correction : Menu de réparation des hélicoptères à l'aéroport !
Suppression : Du Silencieux HK 417 gang !
Suppression : Du Silencieux FRF2 gang !
Suppression : Lunette J8 gang !
Suppression : Lunette J4 gang !
Suppression : Des titans ac !
Suppression : Arme MXC  territoire gang therisa !
Suppression : Arme MXM territoire gang therisa !
Suppression : Arme MX gendarme !
Suppression : Arme MXC gendarme !
Suppression : De la fiat Punto (impossibilité de monter dedans) !


Version 11.20 :
Ajout/Création/Modification : Des taches de sang aux joueurs (UNIQUE !) !
Ajout/Création : D'un temps pour jeter le farming illégal au sol (indiqué lorsque vous laisser votre souris sur le farming de l'inventaire) !
Ajout/Création : Vous pouvez maintenant choisir votre position de respawn (entreprise, rebelle, et gendarme) lors d'une mort !
Ajout/Création : Nouvelle prévisualisation des véhicules légaux !
Ajout/Création : D'une boutique habits rebelles à la licence gang !
Ajout/Création : Nouvelle boutique habits, sacs à dos etc !
Ajout/Création : Nouvelle wanted liste !
Ajout/Création : D'un son de tir lorsqu'un joueur fait respawn !
Ajout : De nouveau habit à la boutique rebelle (47 disponibles) !
Ajout : De nouveau casques à la boutique rebelle (78 disponibles) !
Ajout : De nouvelles lunettes à la boutique rebelle (50 disponibles) !
Ajout : De nouvelles vestes à la boutique rebelle (17 disponibles) !
Ajout : De nouvelles sacs à dos à la boutique rebelle (29 disponibles) !
Ajout : De nouveau habit à la boutique civil (95 disponibles) !
Ajout : De nouvelles lunettes à la boutique civil (138 disponibles) !
Ajout : De nouveau casques à la boutique civil (108 disponibles) !
Ajout : De nouvelles vestes à la boutique civil (32 disponibles) !
Ajout : De nouvelles sacs à dos à la boutique civil (66 disponibles) !
Ajout : De nouveau habit à la boutique gendarmes (95 disponibles) !
Ajout : De nouvelles lunettes à la boutique gendarmes (69 disponibles) !
Ajout : De nouveau casques à la boutique gendarmes (95 disponibles) !
Ajout : De nouvelles vestes à la boutique gendarmes (39 disponibles) !
Ajout : De nouvelles sacs à dos à la boutique gendarmes (31 disponibles) !
Ajout : Nouvelle brigade gendarmerie à Néochori !
Ajout : Du bouclier GIGN à la boutique arme (pour les gendarmes) !
Ajout : Vous pouvez maintenant acheter de l'eau en station service !
Ajout : Vous pouvez maintenant acheter des barres de céréales en station service !
Ajout : Vous pouvez maintenant acheter des redbull en station service !
Ajout : Vous pouvez maintenant acheter de l'eau en station service !
Ajout : Vous pouvez maintenant acheter des barres de céréales au Kébab !
Ajout : Vous pouvez maintenant acheter des redbull au Kébab !
Ajout : Vous pouvez maintenant acheter de l'eau au Kébab !
Amélioration : Réécriture complete du script de choix d'habit automatique lors d'un respawn !
Amélioration : Système de sauvegarde des plantes illégales !
Amélioration : Du menu quitter arma !
Modification : Du menu Y !
Modification : Le poignard s'achete maintenant en arme légal !
Modification : Du supermarché en quincaillerie !
Modification : Du script pour treuiller un véhicule !
Modification : Il faut maintenant être à l'arret pour poser un lampadaire !
Modification : Augmentation paye du g7 !
Modification : Les modérateurs n'ont plus la sécurité du menu quitter arma !
Mise A Jour : Reset de la licence gant !
Correction : Son verrouillage véhicules !
Correction : SMS Néomédia !
Correction : Inventaire des poissons panés !
Correction : Mission livraison marchandises (rapporté par Vincent Liberati) !
Correction : Message vocal et sécurité reboot à 2H (rapporté par Vincent Liberati) !
Correction : Message vocal et sécurité reboot à 7H (rapporté par Vincent Liberati) !
Correction : Centre de sport force (rapporté par Ragnar) !
Suppression : Du message qui était indiqué sur une antenne pirate (rapporté par Yodoo) !
Suppression : Du menu respawn dans vos maisons (menu Y) !
Suppression : De l'achat de sacs à dos aléatoire !



Version 11.10 :
Ajout/Création : Modification de l'anti hack DIVERS ! gain de 100% en performance headless (modification non expliqué) (UNIQUE !)
Ajout/Création : Vous pouvez maintenant envoyer un message à tout votre répertoire ! (UNIQUE !)
Ajout/Création : Vous pouvez maintenant pirater les antennes relais pour envoyer des messages anonymes à toute l'ile ! (UNIQUE !)
Ajout/Création : Nouveau script gendarmes pour réinitialiser l'inventaire d'un véhicule !
Ajout : Des visages féminins au serveur (a modifier dans votre profil arma/visages) !
Ajout : Les sacs à dos sont maintenant sauvegardé dans les coffres forts !
Ajout : Les pompiers peuvent maintenant poser les barrières oranges !
Ajout : De la R6 bleu en gendarmerie !
Ajout : Nouveau HQ Néomédia !
Ajout : Vous pouvez maintenant envoyer un message à Néomédia !
Ajout : Du skin hélicoptères à néomédia !
Ajout : De l'EC635 à la gendarmerie !
Ajout : D'une caméra à Néomédia !
Ajout : D'un micro à Néomédia !
Amélioration : Spawn mission livraison gasoil Néochori !
Amélioration : De la précision de spawn des véhicules sauvegardés !
Modification et correction : De la distance du camion plateau de la DIR lorsqu'il décharge un véhicule !
Modification et correction : Du treuil des véhicules de la DIR !
Modification : La caisse d'armes sera plus fréquente (légèrement) !
Modification : Le kébab ce paye maintenant par carte bancaire !
Modification : Des travailleurs au noir qui ne spawnait parfois pas (groupe serveur saturé) !
Modification : Déplacement du menu relever la moto en bas de liste !
Modification : Du pistolet radar de la gendarmerie !
Modification : De la distance des sons de verrouillage/deverrouillage !
Mise A Jour : Anti Hack SFP !
Correction Et Amélioration : Des herses (rapporté par Aymeric Mcfly) !
Correction : Script sauvegarde des véhicules si le serveur plante (etait resté en debug) !
Correction : D'un bug sur la sauvegarde auto des gendarmes suite ajout serpent (valeur non connu) !
Correction : Le menu supprimer un véhicule de la fourriere pour la DIR est maintenant constant !
Correction : De la collecte de cuivre (rapporté par Elkyrox) !
Correction : Des menus du carshop (rapporté par Chris20215) !
Correction : Des inventaires des véhicules, pas de vérrouillage possible (rapporté par Milout34) !
Correction : Les bateaux ne pouvait pas spawn à Kavala (rapporté par Milout34) !
Correction : De type d'écriture (font) qui n'existait plus depuis la dernière maj d'arma !
Correction : Des plantes illégales (aucun re-scan dessus ne fonctionnait) !
Correction : Du centre de sport concernant la force (rapporté par Ragnar) !
Correction : Du centre de sport concernant la vitesse, la zone etait mal placée !
Correction : Des menus pour interagir avec les objets posés au sol (modification code bohémia) !
Correction : Du message aux gendarmes lorsqu'un citoyen détruit un radar (rapporté par John Carreen) !
Correction : D'un glitch sur les reventes de véhicules volés (rapporté par John Carreen) !
Correction : De la zone d'antikill à Néochori (rapporté par John Carreen) !
Correction : Protection TP karting (rapporté par Sarah Sams) !
Correction : Menu inventaire farming du chalutier !
Correction : Glitch poissons illimités dans le chalutier lors d'une récolte !
Correction : Spawn mission livraison gasoil Kavala !
Correction : Menu réparer les radars pour la DIR !
Suppression : De la possibilité ou non de braquer une station service (seul le nombre minimum de gendarme est obligatoire) !


Version 11.03
Ajout/création : Le point Amphétamines est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Le point Pépinière est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Le point Formation Laboratoire est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Le point Hack Informatique est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Le point Transformation Or est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Le point Transformation Cuivre est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Le point Transformation Cannabis est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Le point Transformation Serpent est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Le point Transformation Héroine est maintenant dynamique sur la carte à chaque restart !
Ajout/création : Du farming légal des serpents !
Ajout/création : Du farming illégal des serpents (venin transformé) !
Ajout : Vous pouvez maintenant jeter vos valises de farming ou les déposers dans un véhicule !
Ajout : Les donateurs recoivent une précision de visée supplémentaire (voir forum) !
Ajout : Les donateurs recoivent une course à pied plus rapide (voir forum) !
Ajout : D'un supermarché à Athira !
Ajout : D'un carshop à Kavala !
Ajout : D'un Addac noir à l'entreprise néomédia (blanc par la suite attente skin) !
Ajout : Du fertilisant rouge à votre inventaire personnel pour le transferer ou jeter !
Amélioration : De l'affichage des plaques d'immatriculation des véhicules !
Amélioration : Des prix du farming sur le forum (affichage des prix, temps, et place) !
Modification : Il faut maintenant 4 gendarmes de connectés pour braquer la banque !
Modification : Il faut maintenant 4 gendarmes de connectés pour braquer une station service !
Modification : Des prix de tous les farming !
Modification : Réduction de la zone pour le menu quitter près d'un joueur de 20 mètres à 15 mètres !
Modification : Il faut maintenant être plus près des terroristes pour être détecter (de 3000 mètres à 500 mètres) !
Correction : Glitch des armes des holsters !
Correction : Position de la fourrière !
Correction : Script attacher véhicule sur le véhicule dépanneur plateau (resté en débug) !
Correction : Endroit du spawn des hélicos à la DIR !
Correction : Endroit du spawn des voitures et camions à la DIR !
Correction : Zone clients de la DIR !
Correction : Du menu quitter groupe !
Correction : De l'espace utilisé virtuel des gendarmes lorsqu'il meurt !
Correction : D'une erreur dans l'historique des messages (rpt de SteeSeven) !
Correction : D'une erreur sur les feux de déchets (rpt de SteeSeven) !
Correction : Pour la dir de treuiller un véhicule !



			
Version 11.02
Ajout/Création : D'un script qui surveille tout ce qu'il ce lance coté serveur pour en améliorer les performances ! (UNIQUE !)
Ajout/Création : Nouveau QG de la DIR !
Amélioration : Du spawn des véhicules en ville !
Amélioration : Du script pour remorquer un véhicule au plateau de la DIR pour rendre 98 % des véhicules compatibles !
Modification : La gendarmerie et les entreprises peuvent envoyer des messages à tous les civils !
Modification : Agrandissement du dialogue de chat pour le rendre compatible avec les petites résolutions !
Modification : Si un joueur non DIR rentre avec son véhicule dans la fourrière il sera maintenant TP avec son véhicule !
Modification : Déplacement du PNJ véhicule au carshop pour éviter les soucis de manque de place et des employés !
Mise A Jour : Pack R3F !
Correction : Chateau d'eau des pompiers !
Correction : Des whitelists entreprises (plusieurs patrons) !
Correction : Chargement sauvegarde des objets de décorations !
Correction : Chargement sauvegarde des voitures si le serveur plante !
Correction : Chargement sauvegarde des voitures en fourriere !
Correction : De la non prise en charge du è de fourrière !
Correction : De nombreux script coté serveur qui n'était plus compatible avec la nouvelle sauvegarde !
Correction : De l'espace utilisé des coffres forts !
Correction : Achat des véhicules de locations a Chalkeia !
Correction : Spawn véhicules sans permis à néochori !
Correction : Lorsque vous braquez une station service la gendarmerie n'était pas avertit si vous n'avez rien sur la tête !
Désactivation : Du script créé concernant la correction des triggers que bohémia avait planté, ils l'ont normalement corrigé !



			
Version 11.01
Modification : Du temps des bannières de Néomédia !
Modification : Baisse de la durée du feu d'artifice !
Correction : Spawn du chalutier à Néochori !
Correction : Valeur TRUE et FALSE des sauvegardes (licences etc) !
Correction : Mission livreur de gasoil (camion n'apparaissait pas) !
Correction : Menu ramasser les lapins !



			
Version 11.00
Ajout/Création : Nouveau script de nettoyage serveur (objet, etc HS) ! (UNIQUE !)
Ajout/Création : Des feux d'artifice (lancement entre minuit et 2 heures du matin certains jours) ! (UNIQUE !)
Ajout/Création : Réecriture complete du script de sauvegarde serveur (80 % plus leger en cpu et bandepassante ! + beaucoup plus stable) ! (UNIQUE !)
Ajout/Création : Le staff peut maintenant vous kicker ou bannir directement en jeu ! (UNIQUE !)
Ajout/Création : D'une corde lorsqu'un véhicule est treuiller ! (UNIQUE !)
Ajout/Création : D'un repertoire téléphonique (vous devez possédez les numéros des joueurs) !
Ajout/Création : D'un headless client (2 serveur en 1) pour amélioré charge serveur && fps client !
Ajout/Création : Si le headless client crash il se relancera seul en initialisation sans lancer les scripts !
Ajout : Nouveau script de temps (plus de saccade + meilleur charge serveur) !
Ajout : D'un timeout serveur de 90 secondes (en cas de chaine rouge vous ne serez pas kické pendant 90s) !
Ajout : De JonaOmega en modérateur !
Amélioration : Des freins de la taurus !
Amélioration : Général Ford Interceptor !
Amélioration : Sauvegarde du client plus rapide de 50 % (différente execution des variables) !
Amélioration : Des FPS !
Amélioration : De divers script pour soulager le CPU !
Amélioration : Charge de détection pour le revive (client) !
Amélioration : Refonte dialogue chat SMS !
Modification : Changement de la couleur des nouveaux joueurs dans le chat SMS !
Modification : Désactivation de la fonction à tous les civils sur le chat SMS !
Modification : Réglage du ping a 250 !
Modification : Déplacement du PNJ voiture a coté du CarShop !
Modification : Augmentation de la capacité du coffre fort à 300 !
Modification : Les gendarmes ont maintenant le menu plus poussé !
Modification : Du fichier mission sur certaines classes incompatible MP (suspision dédoublement objets à chaque connexion) !
Modification : Des prix de revente des maisons !
Modification : Du script de TP dans vos maisons, pour choisir votre maison, il suffit d'aller dedans et de faire Y activer respawn maison !
Réduction : De la vitesse de course a pied !
Correction : Vente de pétrole !
Correction : Bohémia ont décidés de supprimer les accents en jeu, de ce fait énormement de chose/affichage ne fonctionnait plus !
Correction : Les véhicules de la fourrière se duppliqué si le serveur crashé !
Correction : Mur de la douane GANG (soucis nouveau editeur) !
Correction : Des tirs interdit dans Néochori !
Correction : Ordinateur Auto Ecole !
Correction : PNJ de la prison !
Suppression : De diago du staff (plus présent) !
Suppression : Du script de protection des propriétaires, il n'y a donc plus de TP il faudra donc fermer à clefs les maisons !
Mise A Jour : Addon CBA Arma 3 !
Mise A Jour : Anti Hack SFP !


Version 10.01
Fix : Bug des triggers causé par l'editeur d'arma 3 !!!

Version 10.00
Ajout/Création : Des niveaux de forces différents au centre sportif ! (UNIQUE !)
Ajout/Création : D'un script qui sauvegarde toutes les 60 secondes les véhicules pour les remettres lors d'un crash ! (UNIQUE !)
Ajout/Création : Nouveau système de transfert de farming sur les véhicules ! (UNIQUE !)
Ajout/Création : Nouveau système de transfert de farming des coffres forts ! (UNIQUE !)
Ajout/Création : Nouveau système de transfert de matos entre joueurs ! (UNIQUE !)
Ajout/Création : Nouveau inventaire simple ou poussé (pour jeter objet) ! (UNIQUE !)
Ajout/Création : Nouveau menu de vente au marché noir ! (UNIQUE !)
Ajout/Création : Nouveau menu de vente au marché légal ! (UNIQUE !)
Ajout : D'un hopital à Paros !
Amélioration : Vitesse du personnage avec les différents niveau de sport ! (UNIQUE !)
Amélioration : Vous pouvez maintenant pousser les petits bateaux !
Amélioration : Du redbull ! (UNIQUE !)
Amélioration : Petit gain de FPS !
Amélioration : De divers scripts !
Amélioration : Performance sauvegarde du personnage !
Amélioration : Système de selection endurance au centre sportif !
Modification : Du bar (l'alcool agit sur votre fatigue et l'effet dure moins longtemps) !
Modification : La chemlight s'achete maintenant au supermarché !
Modification : L'argent gagné lors d'un gofast est maintenant en poche !
Modification : L'argent récupéré dans les caisses d'armes est maintenant en poche !
Modification : De nombreux trigger pour améliorer les FPS !
Re Fonte : Complète du système de spawn du farming chez le client (charge cpu de gagné) !
Re Fonte : Complète du système de spawn du farming chez le serveur (charge cpu + bandwitch de gagné) !
Correction : Glitch, les joueurs se mettaient dans des véhicules pour faire l'épreuve sportif !
Epuration : De plus de 500 000 lignes de codes (ancien système de farming, coffre fort et matos joueurs) !
Epuration : De plus de 200 fichiers (ancien système de farming véhicule, coffre fort et matos joueurs) !
Suppression : Du canal véhicule !
Suppression : Du canal groupe !
Suppression : Du sac a dos + de farming !
Suppression : Du marché nautique puisque les poissons peuvent être transportable !
Suppression : De la zone de chasse des lapins etant donné qu'ils peuvent etre chassé sur toute la carte !




Version 9.301
Modification : Remise en place de shounka pour test !
Modification : De l'ORCA !
Modification : Du littlebird !
Correction : Du bug texture des hélicoptères !
Correction : Glitch poissons du chalutier !
Correction : De l'argent sauvegardable des coffres-forts !
Correction : Du prix de la licence gang !
Correction : De la place disponible pour l'achat de la radio véhicule !
Correction : Il pouvait arriver que vous mourrez en boucle lors d'un revive !




Version 9.3
Ajout/Création : Les gendarmes ont la possibilités de déposer une amende sur les véhicules (UNIQUE !!!) !
Ajout/Création : Nouveau script des sacoches de C4 avec cables, vitesse, etc (UNIQUE !!!) !
Ajout/Création : D'un brouilleur pour eviter les explosions des valises c4 (UNIQUE !!!) !
Ajout/Création : Vous pouvez maintenant mettre de l'argent dans vos coffres forts (UNIQUE !!!) !
Ajout/Création : De la boutique pour les stagiaires de gendarmerie avec whitelist !
Ajout/Création : Vous pouvez maintenant remettre votre tenue entreprise avec la touche Y !
Ajout/Création : D'un nouveau menu a la DIR !
Ajout : D'une option repair kit a la DIR !
Ajout : D'une tenue de protection a la DIR !
Ajout : De la boutique divers a la SARL POMPIER !
Ajout : D'une vest aux Sons Of Anarchy !
Modification : Nouveau skin du gilet gendarme !
Modification : Nouveau skin de la DIR !
Modification : Le montant max des crédit passe de 5 000 000 a 2 000 000 !
Modification : Les joueurs avec moins de 5 heures de jeu ne peuvent plus faire de crédit !
Correction : Du revive !




Version 9.2
Ajout/Création : D'un nouveau script de braquage de banque (UNIQUE !!!) !
Ajout/Création : D'un script qui permet aux dépanneurs de remorquer des chalutiers (UNIQUE !!!) !
Ajout/Création : D'un script pour améliorer la solidité des véhicules (UNIQUE !!!) !
Ajout/Création : Lorsque vous mourrez le son de la caméra sera réduit !
Ajout/Création : L'hélico taxi va maintenant jusqu'a Chalkeia (droite de la carte) !
Amélioration : Des FPS clients (minime) !
Modification : Agrandissement de la zone du Carshop !
Modification : D'hélico est maintenant gratuit !
Modification : Du trigger de zone prison !
Correction : HQ des pompiers !
Correction : Barrière des daltons !
Correction : Script anti explosition qui ne s'activait plus une fois activé !




Version 9.11
Correction : Du c4 de la porte de prison !
Correction : De la veste c4 !
Correction : Du flash des radars !
Correction : Du marker lors d'un braquage de station service !
Correction : Du menu revive qui ne disparaissait parfois pas !
Correction : De l'achat de P07 qui ne spawn pas !




Version 9.1
Optimisation : De la mémoire d'arma (600 Mo de gagner coté serveur) !




Version 9.02
Ajout/Création : Vous pouvez supprimer les marker sur l'environnement 3D en désactivant les astuces ecrans (menu Y) !
Amélioration : Vous ne pouvez plus poser d'objets sous les véhicules (troll) !
Amélioration : Des actions de souris des gendarmes !
Amélioration : Meilleure explication de l'erreur 1 in game !
Amélioration : Système pour cacher votre visage lors d'un braquage de station service !
Augmentation : De l'argent recu lors d'un braquage de station service ! 
Modification : Vous pouvez maintenant braquer les stations services avec une arme de poing ! 
Correction : Double flash des radars !
Correction : Des tests d'alcoolémie pour les gendarmes !
Correction : Diverses scripts !
Correction : Dédoublement menu auto école !
Correction : Garde a vue de néochori !
Correction : HQ des daltons tp !
Correction : Menu revive des hopitaux !
Correction : Affichage des plaques des véhicules !




Version 9.01
Ajout/Création : Nouveau script de detection des menus gendarmes pour les rendres compatibles dans les batiments !
Ajout/Création : Nouveau script pour ramasser les lapins (meilleur détection, etc) !
Modification : Agrandissement de la zone d'ouverture des barrières automatique !
Modification : Config P3D du tribunal !
Correction : Les menus du marché étaient affichés sur les menus du saut en parachute !
Correction : Les menus vendre ma voiture etaient accessibles sur les menus acheter un véhicule !
Correction : Menu hopital (soigner maladie contagieuse) !
Correction : Spawn des bateaux à Néochori !
Correction : Script amphétamine !
Correction : Inventaire des véhicules !
Suppression : De la lykan (crash serveur) !
Suppression : De nombreux chapeaux (crash serveur ou client (a3l)) !
Suppression : De nombreux habits (crash serveur ou client (a3l)) !
Suppression : Golf 3 (crash serveur ou client (a3l)) !

Version 9.00
Ajout/Création : Nouveau script de la prise d'amphétamine (UNIQUE !!!) !
Ajout/Création : Nouveau script des inventaires des véhiules qui permet de mettre n'importe qu'elle espace à n'importe quelle véhicule (UNIQUE !!!) !
Ajout/Création : Nouveau script pour la redbull (effet sur la vitesse, stabilité de l'arme, essoufflement, etc) (UNIQUE !!!) !
Ajout/Création : Des noms des marqueurs directement sur l'environnement 3D (UNIQUE !!!) !
Ajout/Création : Les agents de la DIR en service voient maintenant les dégats des véhicules à coté des plaques ! (UNIQUE !!!)
Ajout/Création : Nouveau script pour l'ouverture des barrières automatique (prise en compte de toutes les barrières) (UNIQUE !!!) !
Ajout/Création : Nouvelle prison !
Ajout/Création : Nouveau carshop avec clef pour fermer le batiment (porte) !
Amélioration : Optimisation bandwitch du serveur sur les diffusions de chaine !
Amélioration : Optimisation bandwitch des synchronisations des addactions créés par le serveur pour les medecins !
Amélioration : De la charge du cpu en jeu (optimisation de certains triggers qui ont étés recodés en script) = 1 requete par seconde au lieu de 60 (UNIQUE !!!) !
Amélioration : De l'allocateur mémoire d'arma 3 !
Amélioration : Script dépanneur léger véhicule !
Amélioration : Script dépanneur lourd véhicule !
Amélioration : Script dépanneur treuiller un véhicule !
Modification : Lorsque vous êtes en revive sous l'eau, vous ne mourrez plus par manque d'oxygene !
Optimisation : FPS serveur et client (cache) !
Optimisation : De la variable antibiotique !
Optimisation : Script explosion des véhicules de refuel et marchandise !
Optimisation : De variables publiques lorsque vous parlez !
Correction : D'addons divers depuis maj bohémia (environ 60 000 lignes de code corrigé et/ou supprimé) !
Correction : Addon Shounka depuis maj de bohémia !
Correction : D'un bug sur un script de la prison !
Suppression : Des addons d'Orel qui causent plus de soucis qu'il n'en apporte !
Suppression : Du pack de son !
Suppression : Du hummer qui pourrait provoquer des crashs !
Suppression : Du ford transit qui pourrait provoquer des crashs !


Version 8.202
Ajout/création : D'un message au joueur possédant taskforce sans le plugin de TS activé !
Ajout : D'un pack de son pour arma !
Ajout : Gilet par-balles PSIG à la boutique habbit !
Ajout : Du Orca Dalton à la boutique gang !
Ajout : D'une tenue de plongée aux pompiers !
Modification : Suppression de la sauvegarde du farming illégal des véhicules !
Modification : Vous pouvez maintenant acheter des bouteilles d'eau en illimité !
Modification : Vous pouvez maintenant acheter des barres de céréales en illimité !


Version 8.201
Ajout/Création : D'une barre en haut à gauche indiquant les personnes connectées !
Amélioration : Système de vente des véhicules volés, si le montant est de 0 Euros le vendeur ne vous achetera plus votre véhicule !
Amélioration : Il pouvait arriver parfois que le chargement de votre inventaire ne se faisait car bloqué par l'anti hack !
Amélioration : Des fuites de produits toxiques de la DIR !
Modification : Ajout d'un paramètre supplémentaire a la mission bot taxi pour éviter que le PNJ sort du véhicule (gérer par arma) !
Modification : Le taxi G7 à le droit maintenant à plus de mouvement de sauvegarde de véhicules !
Modification : Du prix du Mercedes Sprinter !
Correction : Lampadaire HQ des daltons !
Correction : QG des daltons !
Correction : D'un nom d'historique d'anti hack pour le staff !




Version 8.2
Ajout/Création : D'un nouveau script de performance client (UNIQUE !!!), attention en test !
Ajout/Création : D'un historique staff pour calculer toutes les heures le nombre de personnes connectées (entreprises + familles) !
Ajout/Création : De la famille Dalton (véhicule, hq, etc) !
Amélioration : Du FTP des pompiers !
Amélioration : Du spam en bande passante des sauts en restant appuyé sur ESPACE !
Amélioration : Du script de saut (impossibilité de sauter dans/près de la prison) !
Modification : Réduction de la zone de protection des propriétaires pour eviter d'etre TP inutilement !
Correction : Kick lors de l'achat d'un chien en gendarmerie !
Correction : l'ajout de la radio aéroportée était impossible car trop grosse !




Version 8.1
Ajout/Création : De l'option achevé un bléssé au revive (UNIQUE !!!) !
Ajout/Création : D'un pistolet lacrymogène aux gendarmes (UNIQUE !!!) !
Ajout/Création : Lors de l'achat ou chargement d'un véhicule, sa plaque sera indiquée dans votre inventaire personnel (UNIQUE !!!) !
Ajout/Création : Gagner 500 000 € à chaque reboot en trouvant la statut sur Altis (UNIQUE !!!) !
Ajout/Création : Parfois le revive ne fonctionnera pas lors de votre mort, attention donc à vos vies (UNIQUE !!!) !
Ajout/Création : De la fertilisation rouge aux plantes illégales (50% de chance de récolter deux plantes) (UNIQUE !!!) !
Ajout/Création : Nouvelle sauvegarde des plantes illégales !
Ajout/Création : Du bouton précédent à la boutique habits !
Ajout/Création : Du menu relever les motos !
Ajout/Création : Des historiques staff des remboursements et demandes de crédit !
Ajout/Création : D'un script pour contrer les glitch de véhicule (inventaire resté ouvert) !
Ajout/Création : Les agents de la DIR peuvent rentrer dans le HQ des pompiers pour réparer des véhicules !
Ajout/Création : Nouveau script pour les gyrophares !
Ajout/Création : De la licence fusils illégaux (1000000 €) !
Ajout/Création : D'un nouveau système de saut et escalade des murs (avec echap) !
Ajout : D'une night vision au menu équiper SARL DIR !
Ajout : D'un toolkit supplémentaire au menu équiper SARL DIR !
Ajout : De message lorsque vous supprimer un objet posé qui indiquera le nombre maintenant restant !
Ajout : De la Yamaha au HQ Sons Of Anarchy !
Ajout : Des barrières orange à la SARL DIR !
Ajout : D'un message du montant de l'argent récupéré sur un bléssé !
Amélioration : Détection des véhicules pour faire les devis de la DIR !
Amélioration : Pret de clefs de véhicule !
Amélioration : Script dépannage camion plateau DIR !
Amélioration : Mercedes Pompier !
Amélioration : Du framerate de certaines addactions !
Amélioration : De la mémoire serveur et client pour en améliorer la stabilité (crash client) !
Amélioration : De la sécurité des addons (recompilation et réecriture entière) !
Amélioration : Du pistolet radar des gendarmes !
Amélioration : Des menus vendre un véhicule volé !
Amélioration : Lors de l'achat d'une radio, si vous n'avez pas de place sur vous l'argent vous ne sera pas retiré !
Amélioration : Rapidité des devis de la sarl DIR !
Amélioration : Des retours d'affichages des montants des maisons (achat et vente) !
Amélioration : Du sang à l'écran lorsque vous prenez des dégats !
Amélioration : De l'effet du sang qui jaillit lorsque vous êtes touché !
Optimisation : De la sauvegarde des items, armes, etc (gains de plus de 80 % en bande passante !!!) !
Optimisation : De la relecture de vos sauvegardes !
Modification : L'achat des licences autres que le permis n'est plus bloquées si l'auto ecole est connectée !
Modification : Les travailleurs au noir sont maintenant payant (2 000 € par civil) !
Modification : L'argent remporté par les travailleurs aux noirs à été augmenté de 100 % !
Modification : Du menu boutique habit à la gendarmerie !
Modification : Du prix de la licence port d'arme !
Modification : Du prix de la licence gang !
Modification : Déplacement de la zone de réparation des avions !
Modification : Des prix des véhicules !
Modification : Remise du vehicule transit (en test suivant crash serveur) !
Modification : Remise du vehicule bowler (en test suivant crash serveur) !
Modification : Augmentation du prix de la plante illégale !
Modification : Baisse du temps d'enlèvement pour la DIR des objets tombés des camions !
Modification : Du logo SFP du HUD (erreur couleur arma) !
Modification : Ajout d'un message lors d'une estimation d'une vente de maison, celui indiquera qu'au prochain reboot le prix peut changer !
Modification : Baisse du prix de la radio courte portée à 7 900 Euros !
Modification : Les items de la boutique habits ce selectionne maintenant en double cliquant !
Modification : Le dialogue de la boutique habits est maintenant plus grand !
Modification : Le HUD sera masqué dans la boutique habits !
Modification : La sauvegarde du verrouillage de votre groupe passe du serveur à votre client (économie bande passante serveur) !
Modification : La sauvegarde de votre carte d'identité passe du serveur à votre client (économie bande passante serveur et attaché à votre profil) !
Modification : La sauvegarde de votre antibiotique passe du serveur à votre client (économie bande passante serveur et attaché à votre profil) !
Modification : La graine des plantes illégales passe de 17 500 à 25 000 Euros à l'achat (rapporte plus à la vente) !
Modification : Augmentation de la zone d'achat aux plantes illégales !
Modification : Vous ne pouvez plus afficher votre carte d'identité si vous courrez ou si le joueur court !
Correction : Des crashs clients (mémoire d'arma 3) !
Correction : Diffusion des variables des coffres forts lorsque vous déposer votre farming !
Correction : Lors de l'utilisation de taskforce, le HUD ne revenait parfois plus (BUG addon taskforce variables) !
Correction : Lors d'une récupération de clefs de véhicule, vous pouviez vous enlever vos propres clefs !
Correction : Affichage script staff nom du joueur s'etant fait voler de l'argent !
Correction : Nombres de cones pour suppression !
Suppression : Des ronds oranges sur votre corp lorsque vous êtes touché !
Suppression : De la variable de déclaration en mairie pour la recompiler dans la carte d'identité (gain bande passante) !
Suppression : Des medikits qui ne servent plus à rien !
Suppression : Des nanos drone des sacs à dos aléatoires !
Suppression : D'un message lors de l'utilisation d'une animation !
Suppression : Du MV 22 au territoire gang !




Version 8.02
Ajout/Création : Des PNJ de rachat des véhicules volés (UNIQUE !!!) !
Ajout/Création : D'un script pour placer les véhicules sur la dépanneuse (attention peut beugger en hauteur suivant les véhicules des addons !) !
Ajout/Création : Vous pouvez mettre un véhicule sur le plateau de la dépanneuse et aussi une autre derrière !
Amélioration : Synchronisation du taser !
Amélioration : Synchronisation du flashball !
Correction : D'addons qui causent des crashs chez certains clients !
Correction : Lancement des scripts de la DIR !
Correction : De l'ordinateur de la SARL DIR !
Suppression : Du message quand quelqu'un ce fait taser !
Suppression : Du message quand quelqu'un ce prend une balle de flashball !




Version 8.01
Ajout/Création : Nouveau script pour supprimer les véhicules de livraison, gasoil, etc lorsque le proprio ce déco ! (Plus aucune synchro !)
Ajout : Le Mercedes des pompiers peut maintenant contenir de l'eau !
Amélioration : Performance serveur (maj de 17 heures coté serveur) !
Amélioration : Vitesse Mercedes Pompier !
Amélioration : Vitesse Depanneur DIR !
Correction : Hack Argent lorsque vous récupérez la caisse d'arme !
Correction : Point de spawn du carshop pour les camions !
Correction : Menu eteindre gyrophare pour la DIR !




Version 8.00
Ajout/Création : De spawn de caisses d'armes, vétements, etc aléatoire sur la carte à partir de 25 joueurs (UNIQUE !!!) !
Ajout/Création : D'une mission aléatoire de routes fissurées (joueurs, ne roulez pas vite dessus ...) pour la DIR (UNIQUE !!!!)!
Ajout/Création : D'une mission aléatoire de la DIR (objets tombés de camion) (UNIQUE !!!!) !
Ajout/Création : Lorsque vous utiliserez le taskforce, le HUD disparaitra (UNIQUE !!!!) !
Ajout/Création : D'une annonce vocal lorsque le serveur va redémarrer (UNIQUE !!!!) !
Ajout/Création : Lorsque vous appuyer sur echap, un BACKUP COMPLET de votre profil sera lancé (UNIQUE !!!!) !
Ajout/Création : Les noms des joueurs dans les véhicules sont maintenant cachés pour les personnes hors staff !
Ajout : D'une option extincteur + gps chez les pompiers !
Ajout : D'une 207 RC !
Ajout : D'une 308 RCZ !
Ajout : D'une 308 Gendarmerie !
Ajout : D'une Dodge Charger 2015 !
Ajout : D'une Citroen DS 3 !
Ajout : D'une Nissan GTR !
Ajout : D'une Mégane RS Gendarmerie !
Ajout : D'une Smart !
Ajout : D'une Agera !
Ajout : D'une Agera Gendarmerie !
Ajout : D'une Alfa Roméo !
Ajout : D'une BMW M1 !
Ajout : D'une BMW M1 Gendarmerie !
Ajout : D'une BMW M6 !
Ajout : D'une Bowler !
Ajout : D'une C4 Citroen !
Ajout : D'une Mercedes C63 !
Ajout : D'une Porsche Cayenne !
Ajout : D'une Cherokee !
Ajout : D'un Corbillard !
Ajout : D'une Moto Ducati !
Ajout : D'une Golf 6 !
Ajout : D'un hummer !
Ajout : D'une Lincoln !
Ajout : D'une Lykan !
Ajout : D'une Mégane RS 2015 !
Ajout : D'une Mustang !
Ajout : D'une Renault 5 !
Ajout : D'une Audi RS 4 !
Ajout : D'une Twingo 2015 !
Ajout : D'une Vandura !
Ajout : D'une Veneno !
Ajout : D'un Volkswagen Touareg !
Ajout : D'une Yamaha R6 !
Ajout : D'un MAN TGX !
Ajout : D'une Audi R8 + !
Ajout : D'une Limousine Audi !
Ajout : D'une Audi R5 !
Ajout : D'une Clio 3 !
Ajout : D'une DAFXF Euros 6 !
Ajout : D'une Citroen DS 4 !
Ajout : D'une Huracan !
Ajout : D'une Peugeot 508 !
Ajout : D'une Porsche 911 92 !
Ajout : D'un Renault Magnum !
Ajout : D'un Mercedes Sprinter !
Ajout : D'un Mercedes Sprinter Pompier !
Ajout : D'un MAN TGR Dépanneur !
Ajout : D'une 308 Gendarmerie !
Ajout : D'une 508 Gendarmerie !
Ajout : D'un Mercedes Sprinter Gendarmerie !
Ajout : D'une Mégane RS Gendarmerie !
Ajout : D'une Agéra Gendarmerie !
Ajout : D'une BMW Gendarmerie !
Ajout : D'une RS Gendarmerie !
Ajout : D'une RS 4 Gendarmerie !
Ajout : D'une Jeep Blindé (licence gang) !
Ajout : D'une Suburban Gendarmerie (véhicule GIGN) !
Amélioration : Performance serveur !
Amélioration : Performance client !
Amélioration : Spam bandwitch serveur taskforce (LOOKS LIKE TASK FORCE RADIO ADDON NOT ENABLED) !
Amélioration : Spam serveur temps fixe taskforce de moins 50 % !
Amélioration : Bandwitch synchronisation serveur + client de la rechercehe au trésor !
Amélioration : Système de selection des missions de la DIR !
Amélioration : Armure casquette gendarmerie !
Amélioration : Armure casque GIGN !
Amélioration : Gillet par-balles gendarmerie !
Amélioration : Gillet par-balles GIGN !
Amélioration : Nouveau sac pompier (plus léger et plus grand) !
Amélioration : Nouveau sac DIR (plus léger et plus grand) !
Amélioration : Performance script recherche du trésor !
Amélioration : Sauvegarde du personnage (evite perte d'armes etc) !
Modification : Agrandissement des points sur la carte des gofast !
Modification : Agrandissement des points sur la carte des feux de voitures des joueurs !
Modification : Du taskforce pour ajouter les radios à tous les véhicules !
Modification : Vous pouvez maintenant courrir plus longtemps !
Modification : Vent sur le serveur un peu moins présent !
Modification : Du temps avant de faire les annonces vocales du serveur (chewing gum etc) !
Modification : De la touche P des bouchons d'oreilles pas la touche $ (dollar) !
Modification : Lors d'une prévisualisation de véhicule, l'affichage se fait maintenant instantanément !
Modification : Les noms des joueurs au dessus de leur tête n'est maintenant plus affichés !
Modification : Les noms des joueurs seront affichés pendant 20 secondes lorsqu'ils auront tués quelqu'un !
Correction : Historique STAFF (Beug Initialisation Argent) !
Correction : D'erreur de config d'addons ... !
Suppression : De la Dodge Charge en double !
Suppression : De la speedzone à Néochori !
Suppression : De la Lada !
Suppression : De la Golf 4 !
Suppression : De la Volha !




Version 7.5031
Suppression : Synchronisation refuel des véhicules !




Version 7.503
Ajout/Création : Nouveau script d'affichage des véhicules pour les pompiers !
Ajout/Création : Nouveau script d'affichage des véhicules pour la DIR !
Ajout : NSVT-M HMG 12,7 mm à la SARL Altis Et Furious !
Ajout : M2A1 Slammer à la SARL Altis Et Furious !
Amélioration : De la consommation des véhicules !
Amélioration : De la bande passante des consommations de véhicule (passage d'environ 200 requetes secondes à 1 requete seconde) !
Correction : Emplacement discotheque !
Correction : Des habits des gendarmes et des entreprises lors d'un revive !
Correction : Des sacs lors d'un revive !
Suppression : Du GNT C185 qui faisait ramer le serveur (perte de performance de 50 %) !
Suppression : Lamborghini Aventador qui créé des crashs du client !




Version 7.502
Ajout : Seul les pompiers voient les morts sur la carte !
Ajout : D'une lumière à la salle de jugement !
Ajout : D'un nouveau son nature !
Ajout : Lorsqu'un joueur est tazé il ne peut plus bouger !
Ajout : Des trackers de véhicules à la DIR !
Amélioration : Incendie feu de camps !
Amélioration : Incendie feux des voitures de joueur !
Amélioration : Incendie feux de poubelles !
Amélioration : Menu detection devis SARL DIR !
Correction : Tenue feu des pompiers !
Correction : Position salle de jugement !
Correction : Des menus recruter (boulet modération) !
Suppression : ATM territoire gang !




Version 7.501
Ajout/Création : Vous ne pouvez plus acheter ou charger de véhicules si vous avez plus de 4 véhicules sur la carte (évite desync etc), entreprise non concerné !
Ajout : Du farming très lourd au Tempest Material !
Ajout : D'une synchro MP sur le gasoil lors d'un chargement de véhicule (USEBUG) !
Amélioration : Menu réparer votre véhicule !
Modification : Consommation des véhicules !
Modification : Du point de spawn du Carshop !
Correction : Menu licence de Néochori !




Version 7.5
Ajout/Création : D'un script de refuel de tous les véhicules (avec prise en charge vitesse, poids, etc) (UNIQUE) !
Ajout/Création : Lorsque vous faite un revive avec de l'argent en poche, celui ci sera mit au sol pendant 5 minutes (UNIQUE) !
Ajout/Création : D'ASSUR'SFP (assurance véhicule personnalisable) (UNIQUE) !
Ajout/Création : Les gendarmes ont maintenant un compte gendarmerie pour payer les rancons via l'argent des amendes (UNIQUE) !
Ajout/Création : D'un système pour contacter la DIR directement quand votre véhicule est en panne (UNIQUE) !
Ajout/Création : Nouveau QG gendarmes !
Ajout/Création : D'un point rouge lorsque vous utilisez le pistolet radar (gendarmerie) !
Ajout/Création : Du prix d'achat de vos véhicules neufs pour le staff et le nouveau système d'assurance !
Ajout/Création : Le CarShop paye 55 % moins cher leur véhicule au CarShop !
Ajout : De la boutique vetements gendarmes à la gendarmerie !
Ajout : Du TaskForce !!!!
Ajout : Du titan AA à la prise de camp !
Ajout : Du titan AC à la prise de camp !
Ajout : De la Rahim à la prise de camp !
Ajout : De la MXC à la prise de camp !
Ajout : De l'EBR à la prise de camp !
Ajout : Du Benneli (fusil à pompe) à la prise de camp !
Ajout : Du CH-49 à la prise de camp !
Ajout : Du MV22 à la prise de camp !
Ajout : De l'ADDAC (EC 635) à la prise de camp !
Ajout : D'un tempest matériel à la prise de gang !
Ajout : D'un Ford Transit !
Ajout : D'une Fiat Punto !
Amélioration : Reconfig de l'audi R8 !
Amélioration : Reconfig de la lamborghini !
Amélioration : Reconfig de la P1 !
Amélioration : Reconfig de la Aston Martin !
Amélioration : Reconfig de la Bugatti Veyron !
Amélioration : Général des retours d'affichage en euros lors des messages d'informations !
Amélioration : Dans l'historique staff des véhicules des joueurs, l'immatriculation est maintenant disponible !
Amélioration : Synchronisation verrouillage/dévérrouillage des véhicules !
Amélioration : Anti Hack !
Augmentation : Du son de la sirène des pompiers !
Modification : Les gendarmes peuvent maintenant acheter tous les habits PSIG !
Modification : Déplacement de la banque !
Modification : Les menus de la banque n'apparaissaient seulement qu'à l'étage !
Modification : Des messages que vous recevez lorsque qu'un pompier vous confirme son arrivée !
Modification : Vous ne pouvez plus sauvegarder vos véhicules à moins de 40 mètres du carshop !
Modification : Le pistolet radar de la gendarmerie est maintenant 10 fois plus rapide sur l'affichage des informations !
Modification : Le pistolet radar de la gendarmerie affiche maintenant pendant 3 secondes les informations des véhicules !
Modification : Script admin pour supprimer des véhicules à distances !
Modification : Les gendarmes peuvent maintenant acheter les armes du GIGN !
Modification : Lorsque vous donnez de l'argent à un joueur, son nom sera affiché seulement si il est dans votre groupe !
Modification : Lorsque vous fouillez un véhicule, le nom du propriétaire ne sera affiché seulement si il est dans votre groupe !
Modification : Baisse du poid des casques pompiers !
Correction : Explosion des véhicules lors de spawn !
Correction : Prévisualisation des hélicoptères civil (décallage) !
Correction : Diverses d'affichages de prix !
Correction : Pour contrer l'addon de l'impala qui la color n'importe comment !
Correction : Nombre de gendarmes connectés lors d'une amende !
Correction : Lorsqu'un véhicule possède un sabot, le véhicule ne peut plus être vérouillé/déverrouille !
Correction : Nombre maximum de cone à poser (10) !
Correction : Affichage du nombre max de véhicules autorisés dans vos sauvegardes !
Correction : Menu allumer un gyrophare etc lors d'un revive !
Suppression : De l'ADDAC aux civils !
Suppression : Des skateboards (pleins de joueurs en font n'importe quoi !) !




Version 7.42
Ajout/Création : Ré-ecriture d'un script de performance serveur sur les véhicules (UNIQUE) !!!!
Ajout/Création : Le staff peut maintenant supprimer des véhicules à distance (MENU ADMIN) (UNIQUE) !
Ajout/Création : D'une sécurité lors d'un chargement d'un véhicule sur une grue ou d'une maison, le script recherchera une nouvelle position à proximité !
Ajout/Création : D'un nouveau menu pour les pompiers !
Ajout : De nouveaux casques aux pompiers !
Ajout : D'un message d'information avant l'ouverture du menu crédit !
Ajout : D'un son lors d'un menottage !
Ajout : D'un ordinateur à la SARL CAR SHOP pour faire vos virement aux salariés !
Ajout : D'un ordinateur à la SARL CAR SHOP pour l'achat de véhicules !
Ajout : Vous ne pouvez plus sauvegarder vos véhicules dans le CarShop !
Ajout : D'une barrière automatique au carshop seulement pour les employés (ouverture automatique) !
Ajout : Du BEEPER aux pompiers à toutes leurs interventions !
Ajout : D'une sirène au QG pompiers lors d'une intervention !
Amélioration : Petite amélioration sur divers objets in game pour vos FPS !
Amélioration : Lors d'une mort, si un véhicule en feu est pret de vous, il sera automatiquement supprimé !
Amélioration : Menu Admin déban des joueurs !
Amélioration : Code marqueur du revive !
Amélioration : Du mouvement de véhicule offert toutes les 60 minutes lors du reboot serveur !
Modification : Du Car Shop (chaise, étagères, table, etc) !
Modification : Passage de 15 véhicules max autorisé dans vos sauvegardes à 20 !
Modification : Réduction arrière du CarShop !
Modification : Le PNJ licence de Néochori n'est plus disponible si des employés de l'auto-école sont connectés !
Déplacement : Tribunal !
Correction : Correction de 6 lignes de tableaux différents (erreur missing) !
Correction : Prévisualisation des ferrari 458 et 380 !
Correction : De la balise /br dans l'information des prêts bancaires !
Correction : Affichage sous forme numérique de la valeur max des prets bancaires !




Version 7.41
Ajout : De deux antennes fixes SFP TELECOM (Airfield && Néochori) !
Ajout : Les entreprises bénéficient maintenant d'office d'un forfait de 200 textos à chaque retour de caserne !
Modification : Hauteur de la salle de jugement !
Modification : La DIR peut maintenant consulter les informations sur les véhicules (bateaux, véhicules, et hélicoptères) !
Optimisation : FPS/SYNC Météorites !
Optimisation : FPS/SYNC Etoiles Filantes !
Optimisation : FPS/SYNC Gyrophares gendarmes et métiers !
Optimisation : FPS/SYNC boite de nuit !
Optimisation : FPS/SYNC neon des véhicules !
Optimisation : FPS/SYNC divers scripts MP !
Optimisation : FPS/SYNC sauvegarde des véhicules fourrières !
Optimisation : FPS/SYNC sauvegarde des plantes illégales !
Correction : Montant du gain de l'euromillion !
Correction : Flash des radars avec les hélicoptères !




Version 7.402
Amélioration : Du systeme de protection des inventaires !
Modification : Du terme mort par blesse lors d'un revive !
Modification : La position des véhicules offerts est maintenant approximatif dans un rayon de 300 mètres !
Modification : Le nom des véhicules offerts est maintenant inconnu dans vos pop-up !
Modification : Script glitch armes lors d'une déco !
Modification : Glitch holster pistolet (duplication civil) !
Modification : Glitch holster fusil (duplication gendarme) !
Modification : Glitch duplication d'armes lors d'un revive !
Modification : Glitch inventaire terroristes, mort, etc !




Version 7.401
Ajout/Création : De l'arme du holster attaché à votre pantalon (UNIQUE) !
Ajout/Création : D'un historique staff sur l'argent voler sur les joueurs !
Ajout/Création : Vous pouvez maintenant verrouiller votre propre groupe même quand vous êtes seul !
Ajout : Des panneaux de danger à la SARL POMPIER !
Ajout : D'historique des scripts serveur pour en améliorer la fluidité !
Amélioration : Holster !
Amélioration : AntiHack argent !
Amélioration : Script remplir eau hélicoptère pompier !
Modification : Chaque joueur doit verrouiller son groupe pour que personne ne puisse le rejoindre !
Modification : Argent du gofast de 150000 à 450000 Euros !
Modification : Reorganisation STAFF Listes des bans trois (Historique) !
Modification : Les noms des joueurs au dessus de la tete ne s'affiche plus que si vous y pointer votre souris sur les joueurs (STAFF NON CONCERNE) !
Correction : Boutton arreter l'animation !
Correction : Glitch Holster !
Correction : Whitelist Sons Of Anarchy !
Correction : Hack argent lorsque quelqu'un vous prenez votre argent !
Suppression : Animation exercice des genoux 1 et 2 (plus compatible) !
Suppression : Animation Faire des pompes (plus compatible) !
Suppression : Grand écart (plus compatible) !
Suppression : S'allonger sur un transat (plus compatible) !




Version 7.4
Ajout/Création : De la boutique Hack Informatique (UNIQUE) !
Ajout/Création : Du modification du nombre de permis (à la boutique Hack Informatique) (UNIQUE) !
Ajout/Création : Du blackout réseau (à la boutique Hack Informatique) (UNIQUE) !
Ajout/Création : Vous pouvez maintenant casser un radar avec un marteau (UNIQUE) !
Ajout/Création : La DIR peut maintenant réparer les radars cassés (fumant) (UNIQUE) !
Ajout/Création : Vous pouvez maintenant prendre l'argent des joueurs en leur faisant mettre les mains sur la tete et en le frappant !
Ajout/Création : Les véhicules sans plaques d'immatriculation ne sont plus flashés !
Ajout : La capture de gang est maintenant accessible aux joueurs possédant la licence gang !
Ajout : D'un carré bleu en zone safe à néochori !
Ajout : Du marteau à la boutique supermarché !
Ajout : Nouveaux véhicules à la SARL ALTIS && FURIOUS !
Ajout : De Chris et Tartiflette à la modération de la mission !
Ajout : Nouvelle animation pour le taser et le flashball !
Augmentation : De la zone des récompenses des terroristes !
Amélioration : Performance serveur !
Amélioration : Achat véhicules SARL ALTIS && FURIOUS !
Amélioration : Script accidents gendarmes !
Amélioration : Du MRAP !
Amélioration : Du Offroad sur les terrains !
Modification : Du temps des prélèvements des crédits qui passent de 10 à 30 minutes !
Modification : D'un radar à Néochori !
Modification : Du poids des véhicules suivant le nombre de personne dedans !
Modification : Script remettre en prison si triche !
Modification : Du prix de la licence cannabis de 5 000 à 50 000 € !
Modification : Du prix de la licence heroine de 5 000 à 50 000 € !
Modification : Le menu des missions du taxi g7 sont maintenant accessible sur toute la carte dans leur véhicule !
Correction : Prise de gang !
Correction : Nombre de véhicules autorisés aux donateurs !
Correction : Erreur dialogue depuis la maj de bohémia !
Correction : Menu Y consulter mon crédit !
Correction : Farming du chalutier !
Suppression : Des licences pilotes et permis obligatoire à la licence gang !
Suppression : Des Bloods !




Version 7.3
Ajout/Création : Des prets bancaires directement à la banque (UNIQUE) !
Ajout/Création : Suppression de tous les tirs dans Néo sauf taser, flashball, rook et P07 !
Ajout/Création : D'une commande de debug pour essayer d'eviter les explosions du à l'addon CBA quand vous montez dans un véhicule !
Ajout/Création : D'un nouveau script de synchronisation des véhicules !
Ajout/Création : Vous gagnez maintenant 500 € quand vous appelez les pompiers lors d'un revive !
Ajout/Création : Vous perdez 500 euros lorsque vous repartez sur une nouvelle vie si les pompiers sont connectés !
Ajout/Création : D'un son pour le beeper des pompiers lors d'une demande d'intervention médicale d'un joueur !
Ajout : Du EC635 pompiers à leurs marqueurs des véhicules sur la carte !
Amélioration : Du flashball (plus rapide + marge d'erreur augmenté) !
Amélioration : Couleur des véhicules (bug textures sur certains véhicules) !
Amélioration : Variables publiques !
Modification : Prix des farming !
Modification : Pour poser une valise de c4, il faut être à l'arret pour éviter de mourrir !
Modification : Script marqueur véhicules pompiers !
Modification : Du véhicule des missions de bus !
Modification : Script spawn hélico (essayer d'eviter les soucis des addons) !
Reactivation : Des JVN sur le drone !
Correction : Les valises de farming étaient reconnues comme des valises de C4 !
Correction : D'une perte de stuff lors d'un revive !
Correction : Nombre de mouvement dans la sauvegarde véhicules des donateurs !
Correction : Erreur addon sqf jonzie random !
Suppression : De la lynx à la prise de gang !
Suppression : Des anciennes chemlights rouge de l'ancienne banque !




Version 7.21
Ajout/Création : Vous pouvez poser du C4 est le faire peter à distance (compatible : Donner, déplacer, supprimer, reprendre, déco reco, sauvegardé, etc) (UNIQUE) !
Ajout/Création : Toutes les deux heures, les prix du marché sont complètement recalculé (UNIQUE) !
Ajout/Création : D'un système de bourse suivant la vente des produits sur l'ile (UNIQUE) !
Ajout/Création : Vous pouvez maintenant désactiver l'intro du serveur avec la touche Y (UNIQUE) !
Ajout/Création : D'une tenue de feu aux pompiers !
Ajout/Création : Les gendarmes voient maintenant si vous avez un holster dans votre inventaire !
Ajout : D'une ambulance aux pompiers (skin SFP en création par la suite) !
Ajout : Prix du farming maintenant consultable directement dans le menu Y !
Ajout : Les pompiers peuvent maintenant rentrer dans les hq et entreprises des joueurs pour les soigner !
Ajout : D'une nouvelle classe de maison achetable !
Ajout : D'un nouveau hélicoptère civil !
Ajout : D'un nouveau hélicoptère pompier !
Réactivation : De la capture de la zone de gang (action action !!!!) !
Amélioration : Hint avertissement prix du farming (refonte graphique) !
Amélioration : Hint avertissement prix du farming (plus automatique) !
Amélioration : Temps de fatigue (course à pied, marche, etc) !
Modification : Les règles du serveur ne s'affiche plus à la connection du serveur (consultable sur le forum) !
Modification : Mitsubishi gendarmerie !
Modification : La licence gang est maintenant de nouveau accessible à tout le monde !!!!!!!
Modification : Les braquages de banque se font maintenant a partir de 2 gendarmes connectés !
Modification : Les braquages des stations services se font maintenant a partir de 1 gendarmes connectés !
Augmentation : De la récompense lors d'un braquage de station (entre 14000  et 120000) !
Correction : Farming des véhicules pour déposer de l'héroine !
Correction : Farming des véhicules pour déposer de la cocaine !
Correction : Farming des véhicules pour déposer du cannabis !




Version 7.2
Ajout/Création : Lors d'une connexion au serveur, si vous n'avez plus d'autorisation de mouvement de sauvegarde, une supplémentaire vous sera donné si la dernière date de moins de 60 minutes (UNIQUE) !
Ajout/Création : Les pompiers peuvent maintenant re-remplir leur camion d'eau près des chateaux d'eau style aéroport (UNIQUE) !
Ajout/Création : Du nombre de véhicules actuellement dans votre sauvegarde accessible par le staff (UNIQUE) !
Ajout/Création : HQ des pompiers !
Ajout/Création : Délais de 10 minutes entre deux go fast !
Ajout/Création : Les dépanneurs répare maintenant 4 fois plus vite les véhicules par rapport aux civils !
Ajout/Création : Nouvelle frontière cubaine !
Ajout/Création : D'une Mitsubishi gendarmerie !
Ajout/Création : Activation ou désactivation sauvegardée par le menu Y du centrage de la carte !
Ajout : Vous ne pouvez plus sauvegarder plus de 15 véhicules dans vos sauvegardes (voir forum pour la raison) !
Ajout : D'un message d'initialisation du serveur (début et fin) !
Optimisation : Script réparation des véhicules !
Amélioration : Herse gendarmerie !
Amélioration : Nouveau script des radars, lors d'une plaque arrachée sur un véhicule, celui ci ne vous flashera pas !
Amélioration : Nouveau script des radars (nombres de points suivant la vitesse, au dessus d'un exces de 190 ou 100, votre permis sautera !) !
Amélioration : Nouvelle version des radars, ils flashent désormais les grands excès de vitesse !
Amélioration : Variables chargement des véhicules pour eviter un brick de votre sauvegarde !
Amélioration : Variables du chat/sms !
Amélioration : Distance livraison du gofast !
Amélioration : Sauvegarde des véhicules !
Amélioration : Script faire dodo !
Amélioration : Valeur des informations du tableau de sauvegarde et chargement des véhicules !
Amélioration : Script bouchon oreille (touche P) !
Modification : Les gofast ne se déclenche plus si moins de 3 gendarmes !
Modification : Les joueurs avec un véhicule de plus de 50 % de dégat ne peuvent plus le réparer eux même (avant 28 %) !
Modification : Baisse du prix du toolkit si pas de DIR connecté !
Modification : Le message donateur à la connection ne s'affichera plus tous le temps à chaque connection !
Modification : Vous devez maintenant acheter la licence port d'arme avant la licence fusil !
Modification : Le marché noir n'est plus visible par les gendarmes !
Modification : De terme SARL DDE en SARL DIR !
Modification : Tarif Range rover !
Modification : Tarif Audi RS4 !
Modification : Tarif Opel Insignia !
Modification : Tarif Mercedes E63 AMG !
Modification : Tarif Dodge Charger SRT8 !
Modification : Tarif Ferrari F380 !
Modification : Tarif Chevrolet Cobalt !
Modification : Tarif Dodge Viper SRT10 !
Modification : Tarif Volkswagen Polo GTI !
Modification : Tarif Lamborghini !
Modification : Tarif Mitsubishi Evolution X !
Modification : Tarif BMW Z4 !
Modification : La famille Sons Of Anarchy possède maintenant un menu pour s'équiper !
Correction : Les dépanneurs peuvent maintenant attacher les offroad camo !
Correction : Valeur Auto FPS au chargement (suivant rapidité d'ouverture) !
Correction : Valeur d'une variable du go fast (suivant rapidité d'execution) !
Correction : Valeur de la couleur du braquage dans votre inventaire !
Correction : Incendie des déchets (valeurs inconnues suivant le nombre de déchets) !
Correction : De la vente de bois au marché !
Correction : De la vente de bois à un joueur !
Correction : De la dépose de bois dans un coffre fort !
Correction : Lorsque vous dormez, certains menus de la souris ne ce supprimer pas !
Correction : Valeur du tableau de sauvegarde des véhicules (espace total) !
Correction : Couleur offroad Sons Of Anarchy !
Correction : Couleur Ifrit licence gang !
Correction : Sauvegarde des coffres forts lors d'un rescann !
Correction : Couleur des hélicoptères gang !
Mise A Jour : Addon CBA !
Mise A Jour : Nouveau skin gendarmerie Ford Interceptor (Merci Chris) !
Mise A Jour : Nouveau skin gendarmerie Taurus (Merci Chris) !
Mise A Jour : Nouveau skin veste (Merci Chris) !




Version 7.1
Ajout/Création : Subventation pour l'ile : Suppression de batiments dynamiques pour re-création ou non avec grue (UNIQUE) !
Ajout/Création : Vous pouvez maintenant arracher et remettre vos plaques d'immatriculation (UNIQUE) !
Ajout/Création : Les pompiers voient maintenant leurs véhicules sur la carte !
Ajout/Création : De sons ambiants (Oiseaux, animaux, construction, scooter, etc etc) (UNIQUE) !
Ajout/Création : Script auto fps (UNIQUE) !
Ajout/Création : Nouveau script toilette (UNIQUE) !
Ajout/Création : Les nouveaux joueurs ont pendant 60 minutes le statut donateur (UNIQUE) !
Ajout/Création : Vous pouvez maintenant braquer les stations services !
Ajout/Création : De nouveaux filtres anti hack battleye !
Ajout/Création : D'un marché nautique pour le poisson chalutier SEULEMENT en dessous de la licence gang !
Ajout/Création : Les pompiers voient maintenant dans leur inventaire personnel si il possède un extincteur !
Ajout/Création : D'un bip de recul pour les véhicules pompiers activé automatiquement pour les pompiers, attention que en local pour éviter des desync !
Ajout : A l'inventaire, l'indication de braquage !
Ajout : Les maisons du HQ Bloods et Sons Of Anarchy sont maintenant achetables !
Ajout : De nouvelles classes de maisons achetables !
Ajout : De deux drapeaux francais au HQ pompier !
Ajout : D'un message aux boutiques voitures, helicoptères et bateau lorsque vous achetez un véhicule pour vous signaler si des employés du CarShop sont connectés !
Amélioration : Les joueurs sans les addons des radars ne sont plus flashés !
Amélioration : Variables locales publiques !
Amélioration : Message statut donateur !
Amélioration : Script billets de banque !
Amélioration : Spawn des véhicules sauvegardés !
Amélioration : Refonte du HQ Sons Of Anarchy !
Amélioration : Script échange d'argent (le joueur recevant l'argent fait le calcul et plus l'inverse) !
Amélioration : Script revive un bléssé !
Amélioration : Script stabiliser un bléssé !
Amélioration : Script contacter les secours !
Amélioration : Des TP, chargements, etc en général !
Amélioration : Du menu lorsque qu'un gendarme fouille un civil !
Modification : Revive obligatoire par les pompiers à partir de 3 pompiers connectés !
Modification : Baisse du son de 50 % des annonces sfp team en jeu !
Modification : Les pompiers peuvent maintenant recharger leur extincteur avait tout moment !
Modification : Les nouveaux joueurs possèdent maintenant un téléphone portable !
Modification : Les hélicoptères ne sont plus soumis au script de désincarcération !
Modification : Le SUV pompier ne peut plus prendre feu avec le script incendie joueur !
Modification : Le camion pompier ne peut plus prendre feu avec le script incendie joueur !
Modification : Le offroad pompier ne peut plus prendre feu avec le script incendie joueur !
Modification : La TAHOE pompier ne peut plus prendre feu avec le script incendie joueur !
Modification : Le VAN pompier ne peut plus prendre feu avec le script incendie joueur !
Modification : Modification salaire du taxi G7 de 2410 à 3000 Euros !
Modification : Déplacement de la prison !
Modification : Déplacement de la banque !
Modification : Les nouveaux joueurs commencent maintenant avec 60 000 Euros en banque !
Modification : Augmentation salaire gendarmere !
Modification : Vous pouvez maintenant faire pipi contre des maisons (toilettes plus obligatoire) !
Mise A Jour : Augmentation salaire gendarmere !
Correction : Quand vous êtes en revive, en contactant les secours, celui ci pouvait vous indiquer à chaque fois que leur service était débordé !
Correction : Des habits à la boutique qui étaient mal diffusés au près des autres joueurs !
Correction : Spawn véhicules fourriere !
Correction : De certains radars qui n'étaient plus présents !
Correction : Re activation de nombreux lampadaires !
Correction : Historique staff bug soucis sauvegarde argent nouveau joueur !
Correction : Kick filtre battleye !
Correction : Sauvegarde Klaxon perso !
Correction : Sauvegarde Puce !
Correction : Sauvegarde Neon !
Correction : Sauvegarde Radar de recul !
Correction : Sauvegarde detecteur de radar !
Correction : Sauvegarde poids perso des véhicules !
Correction : Sauvegarde reservoir eau pompier !
Suppression : Achat licence marché noir (suppression complète du script !) !
Suppression : D'une variable publique !




Version 7.0424
Amélioration : Le menu poser objets s'ouvre maintenant plus rapidement la première fois !
Correction : Recharge hélicoptère pompier en eau !
Correction : Herse !



			
Version 7.0424
Ajout/Création : Les pompiers peuvent maintenant eteindre les feux de camps !
Amélioration : De la hatchback !
Amélioration : Un message vous avertira en cas de risque de brulure lors de l'approche d'un feu de camp !
Amélioration : Spawn du poissons chalutier (plus près de Néo) !
Amélioration : Spawn du poissons (plus près de Néo) !
Amélioration : Spawn du requin (plus près de Néo) !
Amélioration : Spawn des coffres forts (étages, etc) !
Amélioration : Spawn des plantes illégales (étages, etc) !
Amélioration : Spawn des objets décorateurs (étages, etc) !
Amélioration : Spawn des objets missions aléatoires (étages, etc) !
Amélioration : Spawn chargement des véhicules (cotes, etc) !
Amélioration : Spawn divers scripts (étages, etc) + de 2100 valeurs !
Amélioration : Commande admin TP sur un joueur !
Amélioration : Historique staff sauvegarde des coffres forts !
Amélioration : Sauvegarde des coffres forts !
Modification : Augmentation du nombres d'antennes !
Correction : Explosion répété lors de la transformation de cocaine !
Correction : Skin pompier hatchback pompier !
Correction : Sauvegarde des coffres forts !
Correction : Lors de la connection au serveur pour la gendarme, le terminal drone était remplacé par le gps !
Correction : Il pouvait arriver parfois que la liste des bléssés pompier ce n'effacé pas !
Correction : Freeze du serveur dédié pendant 4-5 secondes lors du backup automatique !
Correction : Demultiplication de vos positions de maison dans vos sauvegardes, correction automatique quand vous rentrerez dans vos maisons !
Correction : Lors d'un respawn, les addactions du menu déroulant n'apparaissaient plus dans vos maisons !
Correction : Lors d'un respawn, les addactions du travail au noir n'apparaissaient plus !
Correction : Lors d'un respawn, les addactions du sabotage des caméras de surveillances n'apparaissaient plus !
Correction : Lors d'un respawn, les addactions pour s'assoir n'apparaissaient plus !
Correction : Lors d'un respawn, les addactions du supermarché n'apparaissaient plus !
Correction : Lors d'un respawn, les addactions des effets de drogues n'apparaissaient plus !
Correction : Lors d'un respawn, les addactions du cambriolage n'apparaissaient plus !
Correction : Lors d'un respawn, les addactions du trésor n'apparaissaient plus !
Correction : Lors d'un respawn, diverses addactions n'apparaissaient plus !




			
Version 7.0423
Correction : Tous les joueurs sans launcher ne pouvaient plus se connecter au serveur (merci la maj bohémia ...!) !




			
Version 7.0422
Amélioration : Revive detection !
Amélioration : Portée réseaux des téléphones !
Modification : Le serveur redémarre maintenant a 20 heures au lieu de 21 heures !
Modification : Passage de 6 cônes à 20 cônes pour la DIR !
Modification : Augmentation du prix des maisons !
Modification : 1 chance sur 7 d'aller en prison lors d'un braquage de banque !
Modification : Augmentation des gains lors d'un braquage de banque !
Suppression : Multiplicateur prix du farming si 4 gendarmes !
Suppression : De la limite des comptes banquaires !!! Servait vous maintenant de votre argent !
Correction : Mission Taxi G7 !




			
Version 7.0421
Ajout : LE MJ à maintenant une limite de 100 chargements et sauvegardes de véhicules !
Ajout : LE CarShop à maintenant une limite de 100 chargements et sauvegardes de véhicules !
Amélioration : Synchronisation des ouvertures/fermetures des véhicules !
Modification : Desactivation temporaire de la capture de gang le temps de regler les armes etc !
Modification : Un nouveau chargement ou sauvegarde de votre véhicule passe de 10 minutes à 7 minutes !
Correction : Prix deduction achat de bus !
Correction : Prix deduction achat de dépanneuse legere !
Correction : Prix deduction achat de dépanneuse lourde !
Correction : Prix deduction achat d'un camion de poubelle !
Correction : Hack hélicoptère pompier lorsque vous montez dedans !
Correction : Dépose des coffres forts illimités !
Correction : Chat sms detection pompiers !
Correction : Lors de l'envoi d'un sms, les sms n'étaient pas déduit !
Correction : Lorsque vous répondez directement à un joueur, le téléphone n'était pas prit en compte !
Correction : Un moniteur pouvait vous enlevez des points !
Correction : GodMod lors d'un revive !
Mise A Jour : Anti Hack !




			
Version 7.042
Ajout/Création : Nouvelle sauvegarde des coffres forts !
Ajout/Création : Script mission taxi g7 !
Ajout/Création : Historique staff des coffres forts !
Ajout/Création : Historique staff dernière maj des maisons !
Amélioration : Variable publique propriétaire des véhicules !
Correction : Poser coffre fort !




			
Version 7.041
Ajout/Création : Script mission taxi g7 !
Amélioration : Météo SFP !
Amélioration : Script extinction feux pompiers !
Amélioration : Detection des addactions des joueurs !
Correction : Script activation prise de gang !
Correction : Script tarifs licence gang !
Correction : Couleur des véhicules lors d'une sortie d'un véhicule sauvegardé !
Correction : Couleur des véhicules pour les autres joueurs lors de l'achat d'un véhicule !
Suppression : Famille Velentzas !




Version 7.04
Ajout/Création : Capture de zone de gang (UNIQUE !!!) !
Ajout/Création : Nouvelle effet d'eau pour l'extincteur pompier (UNIQUE) !
Ajout/Création : Nouvelle effet d'eau pour l'helicoptère pompier (UNIQUE) !
Ajout/Création : Vous pouvez maintenant consulter votre propre wanted liste avec le menu Y (UNIQUE) !
Ajout/Création : Lorsque vous ouvrez votre inventaire, votre charge sera affiché en haut en kgs (UNIQUE) !
Ajout/Création : Si vous n'avez pas de place dans votre inventaire à la boutique divers, votre achat sera refusé (UNIQUE) !
Ajout/Création : Lors de l'achat d'un véhicule, si celui ci est compatible au carrossier, une texture sera automatiquement appliqué dessus (UNIQUE) !
Ajout : D'un son lors d'un mouvement d'argent (UNIQUE) !
Ajout : D'un son lorsque vous recevez un sms (UNIQUE) !
Ajout : De la sirène sur le raccourci H des véhicules pompiers : VSAV et PICKUP !
Ajout : Lors qu'un gendarme met une amende, à la fin de l'action le menu WANTED LISTE s'ouvrira automatiquement pour inscrire la raison !
Ajout : HatchBack Hello Kitty au carrossier !
Ajout : Offroad Noir Bande Blanche au carrossier !
Ajout : Offroad Cyan au carrossier !
Ajout : Offroad Manga au carrossier !
Ajout : Offroad Tribal au carrossier !
Ajout : SUV RS Bleu au carrossier !
Ajout : SUV Camo Noir au carrossier !
Ajout : SUV Camo Marron au carrossier !
Ajout : SUV SUV Orange Déco Sport au carrossier !
Ajout : SUV Violet Bandes Blanches au carrossier !
Ajout : SUV Fast && Furious au carrossier !
Ajout : SUV Hello Kitty au carrossier !
Re-ecriture : Du script de wanted liste !
Amélioration : De votre sauvegarde lors d'un changement de pseudo (relecture automatique) !
Amélioration : Sauvegarde des coffres forts !
Amélioration : Météo SFP !
Amélioration : Script publique diffusion autonomie extincteur !
Amélioration : Banniere spot message staff !
Amélioration : Script naufragé !
Correction : Tenue gendarme et GIGN lors de votre reconnexion !
Correction : Sortir bléssé d'un véhicule !
Correction : Les gangs officiel ne pouvaient pas acheter d'hélicoptères et de véhicules !




Version 7.03
Ajout/Création : D'une météo avec neige, pluie, vent, rafale de vent, mer qui bouge, etc etc (UNIQUE) !
Ajout/Création : Lorsque vous ouvrez votre map, elle sera automatiquement pointé sur votre position (UNIQUE) !
Ajout : De 12 véhicules à SARL ALTIS && FURIOUS !
Correction : Des crash du serveur cela va donc améliorer (les remboursements, incendies, sauvegarde, etc soit 99 % du serveur !) !




Version 7.021
Amélioration : Les gendarmes recoivent leurs nouveaux téléphones portables (portée X2) !
Amélioration : Anti Hack !
Amélioration : Spawn des antennes plus droite sur le sol !
Amélioration : Vitesse et temps max de spawn des antennes !
Amélioration : Script incendie véhicules joueurs !
Amélioration : Diverses !
Mise a jour : CBA (erreur variables) !
Correction : Habit Gendarme !
Correction : Boire un café !




Version 7.02
Ajout : Sirène pompier sur le Offroad Pompier !
Ajout : Sirène pompier sur le VSAV Pompier !
Ajout : Lors de l'achat d'une licence drogue (cannabis ou heroine) si votre argent est inférieur à celui d'achat vous en serez avertit !
Augmentation : Des antennes relais SFP TELECOM !
Augmentation : La distance de detection des incendies des pompiers passe de 6 mètres à 11 mètres pour pouvoir déployer l'extincteur !
Amélioration : Sauvegarde véhicules (le temps entre chaque autorisation passe de 13 minutes à 10 minutes) !
Amélioration : Sauvegarde véhicules illimitée lorsque le serveur va redemarrer !
Amélioration : Incendie véhicule joueur (temps avant choix d'un vehicule) !
Amélioration : Les feux de camps ne peuvent plus être posé prêt des véhicules !
Correction : L'hélico taxi ne peut plus prendre feu !
Correction : Historique des messages recus hors ligne !
Correction : Licence port d'arme !
Correction : Licence fusil !
Correction : Incendie véhicule joueur (explosion) !
Correction : Sortir les bléssés des véhicules !
Correction : Pas d'incendie sur l'ile si pas de pompiers !
Correction : Farming poisson du chalutier !
Correction : Sauvegarde gps !




Version 7.01
Correction : Reinitialisation sauvegarde des véhicules !





Version 7.00
Ajout/Création : De SFP TELECOM (création d'antenne télécom, forfait téléphonique, extinction du téléphone, destruction des antennes relais, etc etc) (UNIQUE !!!!) !
Ajout/Création : De la modification du poids du chassis à la boutique TUNING (UNIQUE) !
Ajout/Création : Vous ne pouvez plus sauvegarder ni charger vos véhicules en illimités (1 véhicule par 1/4 d'heure) (pour eviter de spam le serveur et jouer non RP) (UNIQUE) !
Ajout/Création : Lors de l'achat d'un véhicule, si celui si explose, vous n'aurez rien à payer (UNIQUE) !
Ajout/Création : Lorsque vous aurez un antibiotique, le texte de la statutbar sera affiché en vert (UNIQUE) !
Ajout/Création : Lorsque vous êtes en zone critique, le texte de la statutbar sera affiché en rouge (UNIQUE) !
Ajout/Création : D'effet de sang quand vous tirez sur quelqu'un (UNIQUE) !
Ajout/Création : Les gendarmes peuvent maintenant vous retirer votre licence de pilote (UNIQUE) !
Ajout/Création : Des feux de camp au supermarché (UNIQUE) !
Ajout/Création : La licence du marché noir n'est maintenant accessible qu'après 12 minutes des reboots serveurs (UNIQUE) !
Ajout/Création : Lorsque vous vous prenez une amende, chaque gendarme touche un pourcentage (UNIQUE) !
Ajout/Création : Nouveau skin offroad carshop !
Ajout/Création : Skin employé carshop !
Ajout/Création : 1 Skin offroad vert (CHRIS) !
Ajout/Création : 1 Skin offroad marron (CHRIS) !
Ajout/Création : 1 Skin offroad blanc (CHRIS) !
Ajout/Création : 1 Skin offroad camo V1 (CHRIS) !
Ajout/Création : 1 Skin offroad camo V2 (CHRIS) !
Ajout/Création : 1 Skin SUV Monster (CHRIS) !
Ajout/Création : 1 tenue gendarme polaire (CHRIS) !
Ajout/Création : 1 tenue gendarme grand froid (CHRIS) !
Ajout/Création : Nouveau skin camion pompier (CHRIS) !
Ajout/Création : Offroad Pompier !
Ajout/Création : Offroad Velentzas !
Ajout/Création : VSAV Pompier !
Ajout/Création : Casquette de gendarmerie !
Ajout : Du carrossier au carshop !
Ajout : D'animations quand vous changez d'accessoires d'armes !
Ajout : D'une tenue chat !
Ajout : D'une tenue loup !
Ajout : D'une tenue main !
Ajout : D'une tenue nuage !
Ajout : D'une tenue ourse !
Ajout : D'une tenue pikachu !
Ajout : D'une tenue tigre !
Ajout : De 4 skins au littlebird au carrossier !
Ajout : Des cones aux pompiers !
Ajout : D'une petite animation lorsque vous donner des objets !
Ajout : D'une sécurité supplémentaire lorsque vous échangez de l'argent avec un joueur !
Ajout : Nouveaux accessoires d'armes pour le GIGN !
Ajout : Nouveaux accessoires d'armes illégales !
Ré-ecriture : Script pompier incendie déchets !
Ré-ecriture : Script pompier incendie feu de champs !
Ré-ecriture : Script pompier incendie feu de maisons !
Ré-ecriture : Script pompier incendie feu de poubelle !
Ré-ecriture : Script pompier incendie feu de véhicules non joueur !
Ré-ecriture : Script pompier incendie feu de véhicules joueurs !
Amélioration : Suppression, attache herse !
Amélioration : Offroad Gendarme !
Amélioration : Sur certains scripts, la barre de progression pouvait être affichée plusieurs fois !
Amélioration : La sensibilité des curseurs du menu tuning peinture à été améliorée !
Amélioration : Taser !
Amélioration : Spawn des véhicules pour eviter le ban !
Amélioration : De la sauvegarde joueur !
Amélioration : Perf serveur/client (recodage variable publique revive) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique detection revive) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique revive stabiliser) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique rechercher) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique cambriolage) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique rechercher armes illégales) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique rechercher braquage de banque) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique conduite sans permis) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique joueur arreter) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique collecte) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique malade a la sauvegarde) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique antibiotique) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique joueur menotte) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique sac sur la tete) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique bombe porte prison) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique licence pilote) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique licence bateau) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique licence petrole) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique licence heroine) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique licence cannabis) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique permis de chasse) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique permis port darmes) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique licence fusils) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique alcool) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique sarl car shop) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique sarl depannage) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique sarl pompier) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique sarl avocat) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique sarl taxi) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique sarl neomedia) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique sarl auto ecole) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique velentzas) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique Sons Of Anarchy) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique Bloods) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique soif) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique prisons) (UNIQUE) !
Amélioration : Perf serveur/client (recodage variable publique diverses en locales) (UNIQUE) !
Amélioration : Distance livraison du gofast !
Modification : Chargement des véhicules moins rapide (pour eviter de spam le serveur) !
Modification : Sauvegarde des véhicules moins rapide (pour eviter de spam le serveur) !
Refonte : Des armes (merci Shawn !) !
Correction : Spawn voiture à Perpignan !
Correction : Bonus whitelist donateur !
Correction : Le véhicule de livraison avait un skin camo !
Correction : La Dodge Charger Stock ne pouvait pas être repeinte !
Correction : Espace utilisé du farming petrole !
Correction : Paiement d'une entreprise par CB !
Correction : Vous pouvez maintenant verrouiller/déverrouiller les skateboards !
Correction : Lors d'une action à la carrosserie, l'argent n'etait pas déduit de votre compte bancaire !
Correction : Lors d'une action de peinture au carrossier, l'argent n'etait pas déduit de votre compte bancaire !
Correction : Lorsque des employés du carshop sont connectés, les clients étaient expulsés en dehors des locaux !
Correction : Parfois lors de votre connection, la carte et/ou la montre et/ou le gps disparaissaient !
Correction : Du prix de la Ford Taurus !
Correction : Les skateboards ne peuvent plus prendre feu !
Correction : Location des véhicules !
Suppression : Perf serveur/client (variable publique pour savoir si vous possédez des licences) !
Desactivation : Script d'optimisation serveur du aux explosions des véhicules (erreur commande bohémia) !





Version 6.004
Ajout/Création : Nouveau système de sauvegarde (passage de 2 500 000 sauvegarde à environ 100 000 en 22 heures !!!!!) (UNIQUE) !
Ajout/Création : Script DEV système de personnalisation des véhicules lors d'achat automatique (UNIQUE) !
Ajout/Création : Vous voyez maintenant le prix du permis et plus VARIE dans le dialogue licence !
Re Ajout : Du tribunal !
Re Ajout : De la discothèque !
Amélioration : Si un joueur de la SARL TAXI G7 ne prend pas son service, il ne sera pas affiché dans le chat SMS !
Amélioration : Si un joueur de la SARL NEOMEDIA ne prend pas son service, il ne sera pas affiché dans le chat SMS !
Amélioration : Si un joueur de la SARL AVOCAT ne prend pas son service, il ne sera pas affiché dans le chat SMS !
Amélioration : Si un joueur de la SARL AUTOECOLE ne prend pas son service, il ne sera pas affiché dans le chat SMS !
Amélioration : Si un joueur de la SARL DEPANNAGE ne prend pas son service, il ne sera pas affiché dans le chat SMS !
Amélioration : Si un joueur de la SARL POMPIER ne prend pas son service, il ne sera pas affiché dans le chat SMS !
Amélioration : Script perf voiture !
Amélioration : Script revive pompiers !
Amélioration : Diverses !
Modification : Baisse du prix de l'achat des plantes illégales !
Modification : Augmentation du prix de revente des plantes illégales !
Modification : Du prix de la licence de pilote qui passe à 400 000 € !
Modification : Du prix du permis poid lourd qui passe à 100 000 € !
Modification : Du prix du port d'arme qui passe à 500 000 € !
Correction : Script soin pompier (voir bug tracker !!!) !
Correction : OffRoad Gang !
Suppression : Script paintball !
Suppression : Script paintball !





Version 6.003
Suppression : Centre de tir !
Suppression : Paintball !





Version 6.002
Amélioration : Perf serveur !
Amélioration : Anti Hack distant !
Correction : Console Admin !





Version 6.001
Amélioration : Gyrophares des véhicules !
Amélioration : Anti hack véhicules !
Modification : Le zoom et dezoom de votre position sur votre carte n'est plus effectif sur les joueurs de plus d'une heure de jeu !
Activation : Fin du calibrage de l'anti hack argent !
Correction : Des bans sur les missions de livraison de gasoil !
Correction : Des bans sur les missions de livraison de marchandises !
Correction : Des couleurs bizarres (offroad) sur les véhicules des addons (addons mal fait !) !
Correction : Les detecteurs de radar détectés les gendarmes ???!! !
Correction : Valeur après sauvegardes des neons voitures !
Correction : Valeur après sauvegardes des radar de recul voitures !
Correction : Valeur après sauvegardes des klaxons voitures !
Correction : Valeur après sauvegardes des puces voitures !
Correction : Valeur après sauvegardes des detecteur de radar voitures !
Correction : Lors d'une fin de livraison de gasoil ou de marchandise vous vous retrouver en prison (maxou arrete la fumette ^^) !
Correction : Ban pour les pompiers lors de l'achat d'une hatchback !
Correction : Ban pour les pompiers lors de l'achat d'une TAHOE !
Correction : Sauvegarde items nouveaux joueurs !
Correction : Sauvegarde véhicules et joueurs !
Correction : Diverses !
Suppression : Anti Hack joueur ne bouge pas !





Version 6.0
Ajout/Création : Nouveau Algorythme de sauvegarde intelligent (gain d'environ 70 % en bande passante !!!!!!!) (UNIQUE) !
Ajout/Création : D'une carrosserie (UNIQUE) !
Ajout/Création : Une fois votre carte ouverte, un marqueur de-zoomera et zoomera sur votre position pour mieux vous reperer (UNIQUE) !
Ajout/Création : Vous pouvez maintenant repeindre proprement vos véhicules au carrossier (UNIQUE) !
Ajout/Création : Vous pouvez réparer (seulement carrosserie) au carrossier (UNIQUE) !
Ajout/Création : Des detecteurs de radar à la boutique tuning (UNIQUE) !
Ajout/Création : Les whitelists des patrons et chef de famille se font maintenant sans faire de maj de la mission (UNIQUE) !
Ajout/Création : De bonus en jeu pour les donateurs niveau 5 (UNIQUE) !
Ajout/Création : De l'heure du prochain reboot dans la barre de FPS (UNIQUE) !
Ajout/Création : De votre position sous forme 114521 dans la barre de FPS (UNIQUE) !
Ajout/Création : De votre temps de jeu depuis votre connection dans la barre de FPS (UNIQUE) !
Ajout/Création : Les gendarmes peuvent maintenant savoir si vous avez une puce sur votre véhicule (UNIQUE) !
Ajout/Création : Les gendarmes peuvent maintenant savoir si vous avez un detecteur de radar sur votre véhicule (UNIQUE) !
Ajout/Création : Les gendarmes peuvent maintenant supprimer également vos puces ou detecteur de radar (UNIQUE) !
Ajout/Création : Sécurité argent de la sauvegarde lorsqu'un bug se produit j'en serais avertit (UNIQUE) !
Ajout/Création : Lorsque vous parler en jeu, PARLE sera affiché à coté de votre pseudo in game !
Ajout/Création : Du KA 60 Gendarme !
Ajout/Création : Les prix sont maintenant indiqués correctement au lieu d'un calcul de puissance !
Ajout/Création : Du farming Petrole brut dans les véhicules !
Ajout/Création : Du farming Petrole traité dans les véhicules !
Ajout/Création : Nouveau script et nouveau radar Mobile !
Ajout/Création : Veste BLOODS !
Ajout, Amélioration Et Correction : D'une veste de C4 !
Ajout, Amélioration Et Correction : D'une Audi R8 !
Ajout, Amélioration Et Correction : D'une Mitsubishi Evolution !
Ajout, Amélioration Et Correction : D'une Bugatti Veyron !
Ajout, Amélioration Et Correction : D'une Ferrari 458 !
Ajout, Amélioration Et Correction : D'une BMW M3 !
Ajout, Amélioration Et Correction : D'une Lamborghini Aventador !
Ajout, Amélioration Et Correction : D'une McLaren P1 !
Ajout, Amélioration Et Correction : D'une Aston Martin !
Ajout, Amélioration Et Correction : D'une Chevrolet Cobalt !
Ajout, Amélioration Et Correction : D'une Dodge Charger Stock !
Ajout, Amélioration Et Correction : D'une Porche GT 3 !
Ajout, Amélioration Et Correction : D'une Polo GTI !
Ajout, Amélioration Et Correction : D'une Golf 2 !
Ajout, Amélioration Et Correction : D'une Opel Insignia !
Ajout, Amélioration Et Correction : D'une BMW Z4 !
Ajout, Amélioration Et Correction : D'une Range Rover !
Ajout, Amélioration Et Correction : D'une Mercedes E63 AMG !
Ajout, Amélioration Et Correction : D'une Honda Civic VTI !
Ajout, Amélioration Et Correction : D'une Ford Taurus !
Ajout, Amélioration Et Correction : D'une Audi Q7 !
Ajout : D'une tenue femme bikini !
Ajout : D'une tenue zombie !
Ajout : D'une tenue momie !
Ajout : D'une tenue de travailleur !
Ajout : D'une tenue de prisonnier !
Ajout : D'une tenue de montagnard !
Ajout : D'une tenue de jeune !
Ajout : D'une salle de jugement à Neochori (village des SFP) !
Ajout : D'une nouvelle discothèque (village des SFP) !
Ajout : D'un Sambrero !
Ajout : D'un chapeau type coybow !
Ajout : D'un courrone (chapeau) !
Ajout : D'une perruque blonde (chapeau) !
Ajout : D'une perruque brune (chapeau) !
Ajout : D'une perruque rousse (chapeau) !
Ajout : D'un chapeau mexicain !
Ajout : D'un ATM à la frontière Cubaine !
Ajout : Manger, boire en frontière cubaine !
Ajout : D'un nano drone !
Amélioration : Vous pouvez maintenant farmer des lapins sur toute l'ile !
Amélioration : L'ID des véhicules de votre sauvegarde est maintenant remplacée par votre plaque d'immatriculation !
Amélioration : Des messages hint (noir) !
Amélioration : Ré-ecriture du script pour fouiller les véhicules !
Amélioration : Ré-ecriture du script pour installer le farming dans les véhicules !
Amélioration : Une fois un message d'aide affiché au bas de votre écran, celui ci ne s'affichera plus !
Amélioration : Script detection véhicule tuné !
Amélioration : Sauvegarde couleur des véhicules (arma renvoyé parfois une valeur NULL suivant les véhicules moddés !) !
Amélioration : Variables globales publiques sur le chargement des véhicules !
Amélioration : Scripts mission serveur pompier !
Amélioration : Scripts accident gendarmes !
Amélioration : Variables publiques prison !
Amélioration : Variables publiques garde à vue !
Amélioration : Variables publiques banque !
Amélioration : Variables publiques farming des véhicules !
Amélioration : Variables publiques menu farming des véhicules !
Amélioration : Diverses !
Amélioration : FPS client !
Amélioration : Nouveau script de discothèque !
Amélioration : Nouveau script de veste bombe c4 !
Amélioration : Auto correction de la sauvegarde des coffres forts lors qu'une classe etait mal renvoyée !
Amélioration : Sauvegarde joueur !
Amélioration : Il arrivait parfois qu'a votre reconnection le script vous indiquer que vous etiez mort !
Amélioration : Retour de sauvegarde en variables publiques !
Amélioration : Ré-ecriture du script d'achat de drone !
Optimisation : Script achat de véhicule !
Optimisation : Variables publiques lors d'achat de véhicules !
Optimisation : Variables publiques SARL ALTIS ET FURIOUS !
Optimisation : Variables publiques SARL AUTO ECOLE !
Optimisation : Variables publiques SARL AVOCAT !
Optimisation : Variables publiques SARL CARSHOP !
Optimisation : Variables publiques SARL DEPANNAGE !
Optimisation : Variables publiques SARL NEOMEDIA !
Optimisation : Variables publiques SARL POMPIERS !
Optimisation : Variables publiques SARL G7 !
Modification : Du salaire des pompiers !
Modification : Baisse du niveau sonore de la musique d'intro !
Modification : Deplacement de la SARL AVOCAT !
Modification : Baisse du prix des livraisons de marchandises !
Modification : Baisse du prix des livraisons de journaux !
Correction : Farming lapin des véhicules !
Correction : Chargement sauvegarde propriétaire véhicule !
Correction : Chargement sauvegarde de votre direction !
Correction : Glitch armes !
Correction : Abus véhicules mission livraison gasoil !
Correction : Abus véhicules mission livraison marchandise !
Correction : Menu depose et remettre du farming pour le bois !
Correction : Sauvegarde eau des camions pompiers !
Correction : Lors d'une peinture véhicule à la boutique tuning, vous payez deux fois le montant indiqué !
Correction : Boutique équipements armes !
Correction : Configuration de nombreux addons (cfgpatch) !
Correction : Addon SuperFlash (Erreur variable ...) !
Correction : Des quelques erreurs serveur et client affichées à l'initialisation du serveur !
Correction : Des images dans les dialogues du à la MAJ d'arma !
Correction : Des Go-Fast !
Suppression : De la McLaren F1 (buggé signature addon) !





Version 5.123
Ajout/Création : Spawn parfois d'hélicos sur l'ile de passage pour donner de la vie  !
Ajout/Création : Nouveau système de sauvegarde du personnage !
Amélioration : Diverses !
Modification : Diverses !
Correction : Des toilettes !
Suppression : De la taxe d'habitation !
Mise A Jour : Anti Hack !
Desactivation : Script performance pour test coté serveur !





Version 5.12211
Ajout/Création : Nouveau script nettoyage du serveur !
Ajout/Création : Nouveau script performance (3 ième essai serveur) !
Ajout/Création : Nouveau script de petit saut !
Amélioration : Gain en fluidité !
Modification : Du message lorsque le serveur va redémarrer !
Modification : Diverses !
Epuration : Diverses !





Version 5.1221
Correction : Test correction freeze !





Version 5.122
Amélioration : Global du serveur !
Amélioration : Système de poid des véhicules !





Version 5.1211
Ajout/Création : Création d'un script pour simuler le poid des véhicules suivant le nombre de personne dedans (puissance + enfoncement du véhicule) (UNIQUE) !
Ajout/Création : Anti Connection pour les non Francais (UNIQUE) !
Ajout : Impossibilité de faire les animations en véhicule !
Amélioration : Script performance client que coté client maintenant !
Modification : La demande policière est maintenant visible que par les gendarmes !
Modification : Les ATM sont maintenant fixe (seul Paris, airfield et Village Des Sfp sont indiqués) !
Correction : Script remettre du gasoil !
Correction : Incendie non detecté par les pompiers (pas d'incendie detecté en hélico) !
Correction : Skin SUV Pompier !
Correction : Skin SUV Gendarmerie !
Correction : Menu trainer du revive !






Version 5.121
Ajout/Création : Nouveau script de livraison des colis (UNIQUE) (PNJ vivant, sur toute la carte, etc) !
Ajout/Création : Nouveau script de performance client et serveur (UNIQUE) (Marge max de fps pendant le script = 3; detection des objets mort, proximité, etc etc etc) !
Ajout/Création : Des ATM sur la carte de facon aléatoire à chaque redémarrage !
Ajout/Création : Nouveau HUD sur la droite de votre ecran (UNIQUE) !
Ajout : De 6 nouvelles animations !
Ajout : Nouveau flashball (Compatible Lampe et ACO) !
Ajout : Nouveau Taser (Compatible Lampe) !
Ajout : Suppression automatique de votre Khieffe en prison ou garde à vue (Remise auto à la sortie) !
Modification : Timming Anti Hack Paye !
Modification : Nouvelle icone sur la carte avec prise en compte de votre direction !
Modification : Météo !
Modification : Des vagues en mer !
Suppression : Munitons explosifs R3F PGM !
Correction : Suppression de la MC Laren F1 en véhicule offert !






Version 5.12
Ajout/Création : Nouveau script d'achats d'armes, accessoires, prix et armement à la tete du client etc (UNIQUE) !
Ajout/Création : Prise en compte de l'espace restant de votre inventaire avant l'achat d'une armes et munitions (UNIQUE) !
Ajout/Création : Le menu accessoires d'armes vous indique maintenant les compatibilités (UNIQUE) !
Ajout/Création : Nouveau script bombe c4 GANG (UNIQUE) !
Ajout/Création : Kick du groupe une fois menotté ou Sac sur la tête (UNIQUE) !
Ajout/Création : Suppression de votre carte et gps lorsque vous avez un sac sur la tête (UNIQUE) (Remise automatique une fois plus de sac) !
Ajout/Création : D'un traceur de véhicule au supermarché (UNIQUE) !
Ajout/Création : D'une gendarmerie à Paris !
Ajout : L'eau du camion de pompier et hélicoptère est maintenant sauvegardée !
Ajout : Pack armes R3F !
Ajout : Nouvelles armes aux gangs !
Ajout : Nouvelles armes aux gendarmes !
Ajout : Nouvelles armes aux civils (légale et illégales) !
Ajout : Vous pouvez maintenant tirer depuis les offroads !
Ajout : Anti Hack communautaire (racordé à 292 serveurs avec une liste actuelle de 7000 bannis !) !
Ajout : D'une sécurité pour eviter les explosions lors d'achat d'un véhicule !
Ajout : Lors de votre garde à vue, les armes de votre holster seront supprimées !
Ajout : Lors de votre visite en prison, les armes de votre holster seront supprimées !
Ajout : Desactivation des messages des maisons disponibles avec le menu desactiver les astuces !
Ajout : Desactivation des messages du prix du marché avec le menu desactiver les astuces !
Ajout : Medecin fixe au sud de l'ile !
Ajout : Toilette au sud de l'ile !
Ajout : La keffieh des bloods n'affiche plus le pseudo au dessus de la tete !
Augmentation : Du prix de la cocaine !
Amélioration : Perf serveur !
Amélioration : Refonte des actions Attacher le prisonnier, etc (désormais compatible MP) !
Amélioration : OffRoad !
Amélioration : Hunter !
Amélioration : Script des animations !
Amélioration : Anti hack plus rapide pour les hacks de contournement des displays !
Amélioration : Script de la garde à vue !
Amélioration : Performance client (finalisation) !
Amélioration : De nombreux dialogues de missions !
Amélioration : Taxe habitation !
Amélioration : Script déployer extincteur !
Amélioration : Diverses !
Modification : Du OffRoad gang !
Modification : L'hélicoptère des pompiers peut maintenant balancer de l'eau même sans incendie en dessous de lui !
Modification : Les menus attacher, détacher et treuiller son maintenant en fin de liste de la DIR !
Modification : Reactivation des signatures des addons !
Modification : Diverses cartes + scripts !
Modification : Les menus : Menu groupe, Jouer Animations, Poser Objets, Izik et Chat / Sms passe maintenant par le menu Y !
Modification : Le menu acheter un chien à la gendarmerie est maintenant en bas de la liste du menu déroulant !
Modification : La zone du menu vendre sa voiture au CarShop est maintenant plus grande !
Modification : HQ Bloods !
Correction : Argent nouveaux joueurs !
Correction : Sauvegarde véhicule nouveau joueur !
Correction : Diverses cartes + scripts !
Correction : Des portes de la garde à vue (Disparu ??) !
Correction : Script laboratoire illégale !
Correction : Script de la garde à vue !
Correction : Menu treuiller à la Sarl DIR !
Correction : Certains menus n'apparaissaient plus !
Suppression : Les véhicules McLaren, Scania, HEMTT, Dodge Viper, Ferrari F308, Charger SRT8 et la M3 sont supprimés des véhicules offerts gratuitement !
Suppression : Diverses de vieux scripts !
Suppression : Du montant maximum des amendes que peut vous donner les gendarmes !
Mise A Jour : Du CBA !






Version 5.1101
Ajout/Création : D'un nouveau script de performance serveur (UNIQUE) !
Ajout/Création : D'un nouveau script de performance client (UNIQUE) !
Ajout/Création : D'un script pour voir votre position sur la carte !
Modification : L'anti hack est maintenant paufiné, il est désormais actif sur le serveur ! !
Modification : Baisse du prix du camion poubelle !
Modification : Script dodo, vous allez maintenant vous reveiller à 1 mètre du sol (bug des maisons) !
Modification : La suppression des cones, barrières and co laissé seul, seront maintenant supprimés si aucuns joueurs ou véhicules n'est proche à moins de 30 mètres !
Modification : Couleur du chat + fond noir !
Modification : Déplacement du paintball !
Amélioration : Réecriture du script de la francaise des jeux (temps + argent + message) !
Amélioration : Réecriture du script du camion poubelle !
Amélioration : Système anti hack paye (Kick si vous bougez pas) !
Amélioration : Réecriture d'une partie du script d'achat des maisons !
Amélioration : Script revive !
Amélioration : Script divers !
Amélioration : Variables diverses !
Correction : Diverses sur la carte !
Correction : Couleur SARL DIR sur la carte !
Suppression : Du Smur !!!!! !
Suppression : Zone de Baignade au village des SFP !





Version 5.11
Ajout : Poste De Garde QG Sons Of Anarchy !
Ajout : Toilette QG Sons Of Anarchy !
Ajout : Barrieres DIR !
Correction : Barrieres QG gendarmerie !
Desactivation : Du montant de la taxe d'habitation le temps de régler le soucis d'argent !





Version 5.11
Ajout/Création : D'un anti abus sur les payes (Kick si joueur ne bouge pas) !
Ajout/Création : D'un script de performance client (UNIQUE !!!) !
Ajout/Création : Nouveau système de vérrouillage des inventaires (UNIQUE) !
Ajout/Création : De la taxe d'habitation - 5 000 € par maisons (UNIQUE) !
Ajout/Création : Sauvegarde des paramètres de distance avec la touche Y !
Ajout/Création : Sauvegarde des paramètres ombrage avec la touche Y !
Ajout/Création : Sauvegarde des paramètres des graphiques des herbes !
Ajout/Création : Nouvelle Anti Hack Sur Les Displays !
Ajout/Création : Nouvelle Anti Hack Sur Les Valeurs Des Tableaux De Dialogues !
Ajout/Création : Anti Hack Argent !
Ajout/Création : Un temps d'attente est maintenant de 30 secondes avant de pouvoir ou enlever un sabot sur un véhicule !
Ajout/Création : Prise en compte des couleurs des véhicules dans les sauvegardes !
Ajout/Création : La gendarmerie, DIR, POMPIERS et SMURS ont reçu leur nouveau gyroled (gyrophares) (meilleur fonctionnement in game > latence, visible de jour, etc) !
Ajout/Création : D'un historique des textos envoyés sur le serveur !
Ajout/Création : Vérification de tous les cones sur la map toutes les 5 minutes pour suppression si besoin !
Ajout/Création : Vérification de tous les barrières DIR et Gendarmes sur la map toutes les 5 minutes pour suppression si besoin !
Ajout : HQ Des Sons Of Anarchy !
Ajout : Divers Radars 50 Et 110 km Dans Zones A Risques !
Ajout : L'anti hack TP ban automatiquement le joueur !
Ajout : Finalisation Anti Hack Display !
Ajout : Des personnages 3D de filles (option profil et sélectionné votre perso féminin) !
Amélioration : Script dépannage SARL DIR (attacher, détacher, hélitreuiller) !
Amélioration : Variables publiques non globales !
Amélioration : Des sirènes des véhicules qui devrait être beaucoup plus stable et beaucoup moins gourmandes en bande passante !
Amélioration : Bandwitch serveur !
Amélioration : Charge serveur !
Amélioration : Sauvegarde !
Amélioration : Script TP après le dodo !
Amélioration : Codage Script dormir !
Amélioration : Anti Hack Variables !
Amélioration : Avions !
Amélioration : HMETT !
Amélioration : MRAP !
Amélioration : HatchBack !
Amélioration : OffRoad !
Amélioration : Quad Civil !
Amélioration : Camion Iveco !
Amélioration : Suv !
Amélioration : Scripts divers !
Modification : L'argent de boire une boisson est maintenant retiré du compte bancaire !
Modification : L'argent de boire un café est maintenant retiré du compte bancaire !
Modification : HQ Bloods !
Modification : Du message d'intro pour les nouveaux joueurs !
Modification : QG Velentzas Agrandissement Zone Manger Boire Dormir + Suppressions D'Objets !
Modification : Emplacement licence drogue poste de douane deux !
Modification : Emplacement licence marché noir douane deux !
Mise A Jour : Des dernières variables de Hack !
Mise A Jour : Anti Hack Distant !
Suppression : Famille Bratva !
Suppression : Ancien HQ Sons Of Anarchy !
Suppression : D'objets à la DIR !
Correction : Menu charger dans un véhicule pour les gendarmes !
Correction : Sécurité envoi SMS dans le chat !
Correction : Argent de poche des nouveaux joueurs !
Correction : Sauvegardes véhicules des nouveaux joueurs (multicompte) !
Correction : Diverses !




Version 5.1036
Ajout/Création : Création d'un anti hack sur les valeurs diffusées distantes (UNIQUE) !
Modification : Réorganisation fichier mission !







Version 5.1035
Ajout : D'un avion amphibi !
Ajout : D'un avion NON amphibi !






Version 5.1034
Ajout : Barriere automatique à la fourriere !
Ajout : Mirador, bunker au QG Bloods oublié lors de l'ajout QG !
Modification : Marqueur DDE en DIR !
Modification : Barriere de la DIR en automatique !
Modification : Réalignement Mur QG bloods !
Modification : Appellation  Gendarmerie Check point en Poste de Douane !
Modification : QG Velentzas allegé ! 
Correction : ChangeLog en jeu !
Correction : des 2 GoFast au SUD de l'ile !
Suppression : PNJ radar Rodopolis en plein milieu de la route !
Suppression : Feu de piste QG Bloods !
Suppression : PNJ inutile QG Bloods!






Version 5.1034
Correction : De la sauvegarde !
Correction : ChangeLog en jeu !
Correction : Whitelist donateur !
Modification : L'argent de la boutique divers est maintenant en banque !
Modification : L'argent de la boutique licence est maintenant en banque !



					
					
		
		
Version 5.1031
Amélioration : Performance du serveur 3/3 !
Amélioration : Performance du serveur 2/3 !
Correction : Du spawn des terroristes !
Correction : De l'historique de revente des véhicules au car shop !
Correction : Historique Hack Vehicules !
Correction : Historique Hack TP !
Correction : Valeur de re-lecture sauvegarde !



					
					
		
Version 5.103
Ajout/Création : D'un anti explosion de véhicule lors d'un accident, si le reservoir risque d'exploser, l'explosion s'annulera (UNIQUE) !
Ajout/Création : La licence du marché noir est valide jusqu'au prochain reboot !
Modification : Passage des inventaires très lourd de 220 places à 500 !
Modification : Vous n'êtes plus obligé d'acheter la licence du marché noir pour vendre au marché noir !
Modification : Vous pouvez maintenant déverrouiller vos véhicules à une distance maxi de 10 mètres à la place de 6 !
Modification : Vous pouvez maintenant réparer le chalutier au village des SFP !



					
		
Version 5.102
Ajout/Création : QG Famille Bloods !
Ajout/Création : De la licence du marché noir pour voir sa position (50 000 Euros) !
Ajout : Offroad bloods !
Ajout : LittleBird bloods !
Ajout : Uniforme Bloods !
Ajout : Kieffe Bloods !
Ajout : Les pompiers sont maintenant affichés dans le chat !
Ajout : De l'option POUSSER AVION sur l'avion de ligne pour pouvoir le démarrer quand vous êtes à l'arret !
Modification : La position du go fast s'actualise entre 1 à 13 secondes suivant la qualité GPS (RP) !
Modification : Si la DIR est connecté, le toolkit passe de 15 000 Euros à 30 000 Euros !
Modification : L'icone du marché noir est maintenant un peu plus grande !
Mise à jour : Des patrons de la DIR !
Correction : Des bombes C4 à la licence gang !
Correction : Du sac sur la tête lorsque vous êtes menotté !
Correction : Menu trainé du revive !
Correction : D'icones sur la carte !
Correction : Divers !



					
		
Version 5.10111
Correction : Menu inventaire farming des véhicules !
Amélioration : Modification sauvegarde joueur staff !
Amélioration : Chargement joueur !
Amélioration : Sauvegarde joueur !



	
		
Version 5.1011
Amélioration : De la sauvegarde !
Correction : Erreur de sauvegarde !
Correction : Du niveau eau lors d'un respawn !
Correction : Affichage de votre photo d'identité chez les autres joueurs !
Correction : Affichage nom des joueurs au dessus de la tete pour le staff !
Correction : Des remboursements !
Correction : Des amendes !
Correction : Diverses !



		
Version 5.101
Correction : Erreur de sauvegarde !




Version 5.1
Ajout : D'éclairage à l'aéroport !
Optimisation : Plus de 400 variables publiques (Amélioration desync) !
Optimisation : Desync (Partie chargement) !
Optimisation : Desync (Partie sauvegarde automatique) !
Optimisation : Générale 1/3 !
Modification : Suppression de la sécurité pour réparer vos véhicules si pas de dégat était renvoyé (bug d'un véhicule provenant d'un addon mal fait !) !
Modification : Augmentation de l'argent lors d'un casse de banque (jusqu'a 50000 Euros par tas d'argent !) !
Modification : Récompense du gofast de 20 000 environ à (100 000 - 400 000 Euros) !
Modification : Desactivation de l'icone mort in game lors de votre mort (reste sur la carte) !
Modification : Script TP gendarmerie !
Modification : Des PNJ à l'aéroport !
Modification : Les météorites ne spawn plus au début de mission !
Modification : Vous pouvez maintenant cambrioler les maisons achetées !
Modification : Le chalutier ne peut spawn qu'à Neochori !
Modification : Passage de 6 cones à 10 cones !
Amélioration : Variables publiques du revive !
Amélioration : Anti Hack !
Amélioration : Anti Hack TP + Historique TP !
Amélioration : Anti Hack Display !
Modification : La patrouille de france ne sera plus present automatiquement à chaque restart mais de temps en temps !
Modification : Reinitialisation de votre liste de véhicule lors d'un reset !
Finalisation : Anti Hack !
Ré-ecriture : Du script d'alcool !
Suppression : Du dernier achat véhicule dans votre inventaire !




Version 5.0996
Ajout/Création : D'un Paint Ball à Néo (UNIQUE) !!!!
Ajout/Création : Du chalutier pour pêcher en mer (UNIQUE) !
Ajout/Création : Des éclairs lors d'orages (UNIQUE) avec effet de couleur, de bruit, d'intensité, etc. AUCUNE PERTE DE FPS OU DESYNC CAR NON MP (synchronisé) !
Ajout/Création : Vous devez maintenant posséder/créér une carte d'identité sur l'ile à la mairie (UNIQUE) !
Ajout/Création : Vous pouvez maintenant envoyer des messages anonymes payant via le téléphone !
Ajout/Création : Lorsque vous tuer quelqu'un votre nom RP sera remplacé par votre nom de profil pendant 20 secondes !
Optimisation : Des variables publiques diffusées sur le serveur !
Augmentation : Du prix de l'héroine !
Augmentation : Du prix de la cocaïne !
Augmentation : Des salaires des donateurs !
Augmentation : De l'argent en banque pour les nouveaux joueurs !
Amélioration : Des paramètres bannière STAFF (plus besoin de mettre d'espace au début des phrases) !
Amélioration : Des paramètres bannière NEOMEDIA (plus besoin de mettre d'espace au début des phrases) !
Amélioration : Des paramètres de bandwitch du serveur !
Amélioration : Chargement des maisons !
Amélioration : Du script de nettoyage serveur !
Amélioration : Desync !
Amélioration : Sauvegarde du personnage !
Amélioration : Chargement des coffres-forts !
Modification : Baisse du prix du trésor (mini 10 000 maxi 75 000) !
Modification : Du temps de spawn des voitures offertes (trop rapide) !
Modification : Le menu se déclarer à la mairie est maintenant en tête de liste !
Modification : Du menu réparer dans le menu déroulant qui n'apparaissait pas suivant ce que renvoyé arma !
Modification : Nouveau son d'ouverture et de fermeture des véhicules !
Mise A Jour : Prise en compte des derniers hacks pour l'anti hack SFP !
Mise A Jour : Skins divers !
Mise A Jour : Du CBA !
Correction : Du chargement des objets dans la maison qui étaient mit sous terre !
Correction : Correction du temps avant de retaper un joueur !
Correction : La vision nocture lors d'achat d'habits s'activé de nuit !
Correction : Les clients ne pouvaient pas payer par CB à la SARL AUTOECOLE !
Correction : Vous pouvez maintenant refaire des cambriolages !
Correction : Lors d'envoi d'un message avec le tchat, la position n'était pas indiquée aux joueurs recevant le texto !
Correction : Les voitures offertes n'avaient pas d'inventaire de farming !
Correction : Erreur d'une ligne dans le code du carkill !
Correction : Certaines icones de la carte étaient de travers !
Correction : Votre pseudo apparaissait dans la liste du chat sms !
Correction : Couleur chat sms lors de la première initialisation !
Correction : Certaines maisons n'étaient pas prises en compte dans la sauvegarde (position par rapport au niveau de la mer) !




Version 5.0995
Ajout/Création : Vous pouvez maintenant indiquer votre position automatiquement dans le chat SMS !
Ajout/Création : La sarl pompier, DDE et les gendarmes peuvent maintenant poser des petits projecteurs sur pied lors de nuit !
Ajout : Vous ne pouvez plus poser d'objets quand vous courrez (evite de mourir bêtement) !
Ajout : De lumière sur toute la carte dans les grosses tentes comme à l'aéroport (petit effet d'intensité) !
Ajout : De lumière à la sarl TAXI G7 !
Ajout : De lumière à la sarl POMPIER !
Ajout : De lumière à la sarl SMUR !




Version 5.0994
Ajout/Création : D'une camera nocture lors de la nuit pour les caméras de surveillances !
Ajout/Création : D'une camera nocture lors de la nuit pour les effets de balles !
Ajout/Création : D'une camera nocturne lors de la nuit pour les revives !
Ajout/Création : D'une camera nocture lors de la nuit pour l'intro de connection !
Ajout/Création : D'une lumière la nuit lors d'achat habits !
Ajout/Création : Vous pouvez maintenant choisir de faire tourner ou non la caméra à la boutique habit !
Ajout : D'une station service pour les avions à l'aéroport !
Ajout : McLaren F1 à la SARL ALTIS ET FURIOUS !
Ajout : VIPER à la SARL ALTIS ET FURIOUS !
Ajout : DODGE CHARGER à la SARL ALTIS && FURIOUS !
Amélioration : Du script de refuel !
Correction : Vous pouvez glitcher avec remettre du fuel !




Version 5.0993
Ajout/Création : D'un spawn automatique aléatoire gratuit de véhicules sur la carte (UNIQUE) !
Modification : Position vendeur d'armes illégales !
Modification : Du temps d'affichage des messages d'astuces en bas de l'écran !
Amélioration : Boucle script diverse !
Augmentation : Prime revente du carshop !
Réactivation : De la patrouille de France !
Réactivation : Du message STAFF dans le chat !
Correction : Lors d'une phase RP (nouveau joueur) vous étiez recherché pour conduite sans permis !
Correction : D'icônes sur la carte de travers !
Suppression : Menu remettre véhicules sur roues à la DIR !
Suppression : De vieux script divers !




Version 5.0992
Modification : Reactivation des etoiles filantes 
Modification : Reactivation des météorites 
Correction : Du script de réparation des véhicules 
Correction : Au chargement des maisons, la sauvegarde des portes n'etaient pas enregistrées 
Correction : Votre position sur la carte devrait être reactivée 




Version 5.0991
Modification : PNJ Achats Véhicule Néo replacé 
Modification : Wc Néo replacé
Modification : Logo SFP Chargement mission
Modification : QG Velentzas (pour mon plaisir vu que je joue presque plus :P)
Modification : QG Bratva Wc et respawn
Modification : La Navette Hélicoptère (Taxi Hélico) s’arrête à l’aéroport 
Modification : Zone d'information de l'arrivée de la Navette Hélicoptère
Modification : Agrandissement des zones de patrouilles gendarme à Néo et Aéroport
Modification : Suppression du tag STAFF dans le chat SMS in game
Modification : Du règlement de début de jeu pour les moins de 50 heures
Ajout/Création : Marqueur PNJ achat Véhicules Néo
Ajout/Création : Barrières manuelles bâtiment de l'aéroport 
Ajout/Création : Barrière manuelle à l'arrières des pistes
Ajout/Création : Barrière automatique pour l' Accès aéroport par Taxi G7/Pompier et Smur
Ajout/Création : Toilette zone transformation produit (ex zone pvp)
Ajout/Création : Radar Néo supplémentaire
Ajout/Création : Radars supplémentaire sur l'autoroute
Ajout/Création : Co-gérant Pompier et Smur
Ajout/Création : Message d'information Prénom Nom de famille OBLIGATOIRE
Ajout/Création : De Yodoo Tigger à la liste de connexion des modérateurs sur le serveur 
Suppression : Parcours test auto école
Suppression : Terrain de cross
Suppression : Carcasse hélicoptère de l'aérport



Version 5.098
Modification :  emplacement vendeur et location véhicules AÉROPORT
Modification :  emplacement Boutique divers Kavala 
Modification :  emplacement Amphétamines de Kavala
Modification :  boutique plongé Kavala
Modification :  plein essence 
Modification : Déplacement des transformations illegales
Modification : Déplacement licence drogue
Modification : Déplacement Formation laboratoire
Modification : Déplacement Vendeur d'armes illégales
Modification : Déplacement transformation heroine
Modification : Déplacement transformation cuivre
Modification : Taxi Helico
Modification : Mise à jour des patrons d'entreprises
Suppression : Banque Kavala
Suppression : Banque Nantes
Suppression : menu banque du pnj saut en parachute
Suppression : PNJ banque Gravia
Suppression : PNJ Banque Kavala
Suppression : Zone PVP
Ajout/Création : 30 DAB sur les distributeur de l'ile (environ) 
Ajout/Création : 3 boutiques Divers dans des stations services
Ajout/Création : A la mission du modérateur Yodoo
Ajout/Création : 2 Go-Fast en zone illégale
Ajout/Création : D'un script automatique contre les carkills avec systeme de ban auto etc (UNIQUE) !
Ajout/Création : D'un nouveau script pour les stations services qui desactive egalement le refuel automatique (UNIQUE) !
Ajout/Création : D'une zone de peche avec un chalutier (UNIQUE) !
Ajout/Création : D'une commande dans le menu Y pour regler la distance des ombres 
Amélioration : Anti Hack !
Amélioration : Script terroristes !
Amélioration : Script étoiles filantes !
Amélioration : Script surveillance des véhicules !
Amélioration : Script trésor !
Modification : De la famille FSB en Bratva !
Modification : De la detection d'ouverture des barrières automatiques !
Correction : Verrouillage automatique des véhicules lors d'un verrouillage ou deverrouillage !
Correction : Script farming !
Correction : Position farming poisson !
Correction : Script divers !
Suppression : Invincibilité à la license gang !




/*
Version 5.0971
Ajout/Création : D'un script automatique contre les carkills avec systeme de ban auto etc (UNIQUE) !
Ajout/Création : D'un nouveau script pour les stations services qui desactive egalement le refuel automatique (UNIQUE) !
Ajout/Création : D'une zone de peche avec un chalutier (UNIQUE) !
Ajout/Création : D'une commande dans le menu Y pour regler la distance des ombres etc (attention pas encore activé sur la version de bohémia ! Elle le sera sur la prochaine MAJ de bohémia) !
Ajout/Création : La zone de spawn des véhicules à l'aéroport recoit désormais un mur de protection !
Amélioration : Anti Hack !
Amélioration : Script terroristes !
Amélioration : Script étoiles filantes !
Amélioration : Script surveillance des véhicules !
Amélioration : Script trésor !
Modification : De la famille FSB en Bratva !
Modification : De la detection d'ouverture des barrières automatiques !
Correction : Verrouillage automatique des véhicules lors d'un verrouillage ou deverrouillage !
Correction : Script farming !
Correction : Position farming poisson !
Correction : Script divers !
Suppression : Invincibilité à la license gang !





Version 5.097
Ajout/Création : Les gendarmes peuvent maintenant mettre un sabot sur les roues de votre véhicule !
Ajout/Création : Vous pouvez maintenant stabiliser un patient !
Ajout : La golf 3 est maintenant compatible avec le farming !
Ajout : De nouvelles lunettes à la boutique habits !
Ajout : De nouveaux habits à la boutique habits !
Ajout : De nouveaux chapeaux à la boutique habits !
Amélioration : De la sauvegarde des véhicules (parfois lors d'une desync, les valeurs n'étaient pas envoyées au serveur et de ce fait vous vous retrouvez avec une sauvegarde réinitialisée !) !
Amélioration : De la commande d'ajout d'uniforme !
Amélioration : Sauvegarde des coffres forts !
Amélioration : De la taille des inventaires en cas de bug !
Modification : La patrouille de France restera plus longtemps sur l'ile !
Modification : De la couleur d'espace utilisé sur les véhicules !
Correction : Skin taxi G7 !
Correction : De l'argent l'achat du coffre fort qui passe de en poche à en banque !
Suppression : Du littlebird armé !
Suppression : Du MRAP armé !
Suppression : Du VBL armé !
Suppression : Du blindé GIGN armé !





Version 5.096
Ajout/Création : De la personnalisation de vos klaxons de véhicules partie tuning (UNIQUE) !
Ajout/Création : Les gendarmes peuvent maintenant supprimer l'inventaire de vos véhicules !
Amélioration : Refonte complète de la gcam modérateur !
Amélioration : Historiques sauvegarde joueur staff !
Amélioration : Historique fichier des kills !
Amélioration : Menu déroulant gendarmerie (plus compacte) !
Amélioration : Sauvegarde des véhicules joueurs !
Amélioration : Menu remplir camion-citerne pompier en eau !
Modification : Vous pouvez maintenant sauvegarder vos véhicules même en ayant fait les terroristes !
Correction : Ancien radar fixe à Kavala (Paris) !
Correction : Du texte d'affichage du montant de donation !
Correction : De l'action pour attacher les véhicules à la DIR !
Correction : Inventaire farming du SCANIA !
Correction : Inventaire farming de la Ferrari 308 !
Correction : Du farming des truffes !
Correction : Du farming du sel !
Suppression : Des bots dans la zone PVP !






Version 5.095
Ajout/Création : D'un script de ban automatique en cas de hack ou autres diverses raisons (UNIQUE) !
Ajout/Création : Nouveau menu pour preter vos clefs de véhicules !
Ajout : Vous pouvez maintenant acheter un sac GIGN à la boutique divers !
Ajout : D'un nouveau modèle de taser !
Ajout : D'un véhicule blindé GIGN !
Ajout : D'un véhicule Lada !
Ajout : D'un véhicule MC Laren F1 !
Ajout : D'un véhicule Pontiac Firebird !
Ajout : D'un véhicule Viper!
Ajout : D'un véhicule Golf 4 !
Ajout : D'un véhicule Vieux Bus !
Ajout : D'un véhicule Dodge Charger !
Ajout : D'un véhicule Camion Scania !
Ajout : D'un véhicule Golf 3 !
Amélioration : Anti hack coté display !
Modification : Baisse du prix du toolkit !
Modification : Les JVN gendarmes ont changé de couleur !
Modification : Les gendarmes peuvent maintenant acheter des grenades flash en illimité !
Modification : Amélioration du flashball en vitesse !
Modification : Amélioration du flashball, il contient maintenant 2 balles !
Modification : Amélioration du taser, il contient maintenant 2 balles !
Modification : Les étoiles filantes seront maintenant plus nombreuses !
Modification : Les météorites seront maintenant plus nombreuses !
Correction : Scripts mineurs !
Correction : Lors d'achat d'une tenue du GIGN, votre casque n'était pas ajouté !
Suppression : De la limitation de munitions pour le taser et le flashball !





Version 5.094
Ajout/Création : Vous pouvez maintenant monter dans les véhicules dans la zone PVP !
Correction : Prix du farming !
Correction : De la limitation d'envoi d'argent en banque !
Correction : L'achat de pistolet gendarme est maintenant retiré sur le compte bancaire !
Correction : L'achat du RPG GIGN est maintenant retiré sur le compte bancaire !
Correction : L'achat de fusil GIGN est maintenant retiré sur le compte bancaire !
Correction : D'ancien termine policier remplacé en gendarme !





Version 5.093
Ajout/Création : Refonte des prix de farming suivant les gendarmes connectés !
Ajout/Création : Nouveau système de whitelist, vous pouvez maintenant etre whitelisté en temps réel !
Ajout/Création : Desactiver les messages d'astuces en jeu avec la touche Y (trésor, astuces, etc) !
Amélioration : Performance desync !
Amélioration : Sauvegarde des maisons !
Modification : Prime carshop !
Modification : Les maisons vendues sont maintenant débarrassées des objets à l'intérieur !
Modification : La barre de FPS ne s'affiche plus en véhicule !
Modification : Le bateau des nouveaux joueurs (phase RP) se supprimera automatiquement à la fin !
Correction : Du freeze de l'hélico taxi !
Correction : Il pouvait avoir des erreurs sur l'enregistrement de votre sauvegarde (donateur) !
Correction : Divers mineurs !





Version 5.092
Ajout : Nouveau patron des pompiers (julien) !
Ajout : Le serveur démarre maintenant à une heure aléatoire !
Amélioration : Sauvegarde du joueur (armes, uniforme, etc) !
Amélioration : Du revive pour eviter le message fatidique Lors de votre déconnection vous etiez mort ... !
Correction : Historique destruction sauvegarde véhicules des joueurs STAFF !
Correction : Historique sauvegarde véhicules des joueurs STAFF !
Correction : Transformation cocaïne !
Correction : Menu repeindre véhicule au carshop !





Version 5.091
Ajout : Nouveau véhicule de gendarmerie !
Correction : Points bleus des gendarmes sur la carte !
Correction : Sauvegarde du joueur (armes, etc) !
Correction : Sauvegarde des véhicules !
Correction : Achat habit gendarme au GIGN !
Correction : Certains toilettes n'avaient pas d'interaction !





Version 5.09
Ajout/Création : D'un nouveau panel admin au staff (UNIQUE) !
Ajout/Création : Refonte de la prison avec possibilité d'exploser la porte d'entrée (UNIQUE) !
Ajout/Création : Refonte de la prison pour les gendarmes avec animation de la porte d'entrée (UNIQUE) !
Ajout/Création : Vous pouvez maintenant décorer vos maisons (UNIQUE) !
Ajout/Création : Des étoiles filantes (UNIQUE) !
Ajout/Création : De la patrouille de France (UNIQUE) !
Ajout/Création : Des caméras de recul sur les véhicules (UNIQUE) !
Ajout/Création : Vous pouvez allumer une GoPro sur une personne de votre groupe (UNIQUE) !
Ajout/Création : D'une phase RP pour les nouveaux habitants (débarquation de la mer en bateau) (UNIQUE) !
Ajout/Création : Des météorites (UNIQUE) !
Ajout/Création : Des missions de recherche en fond marin (UNIQUE) !
Ajout/Création : Vous pouvez maintenant savoir ou se trouvent vos maisons (UNIQUE) !
Ajout/Création : Vous pouvez maintenant mettre des néons sous vos voitures (UNIQUE) !
Ajout/Création : Vous pouvez maintenant mettre des puces (puissance) à votre moteur (avec effets) (UNIQUE) !
Ajout/Création : D'un historique staff pour tous les kills de l'ile (UNIQUE) !
Ajout/Création : D'une trousse type médicale au pied du soigneur lors d'un revive !
Ajout/Création : D'un antibiotique au pied du soigneur lors d'un revive !
Ajout/Création : D'un pseudo holster pour fusil (shift + barre d'espace) pour les gendarmes !
Ajout/Création : Vous pouvez maintenant prêter vos clefs de maisons !
Ajout/Création : D'un menu achat de véhicule spécial donateur !
Ajout/Création : De bots (terroristes divers) dans la zone PVP (environ 30 - 100) !
Ajout/Création : Les grenades fumigènes provoquent maintenant un gène de vision lorsque vous les approchez !
Ajout/Création : D'un nouveau tableau pour repeindre vos véhicules !
Ajout/Création : Vous pouvez maintenant charger des joueurs avec un sac sur la tête dans vos véhicules (avec effets) !
Ajout/Création : Les joueurs avec un sac sur la tête ne peuvent plus ouvrir leur carte !
Ajout/Création : Les gendarmes avec un sac sur la tête ne sont plus affichés sur la carte !
Ajout/Création : Les gendarmes avec un sac sur la tête ne peuvent plus utiliser la fonction panique (appel d'urgence) !
Ajout/Création : D'un nouvel éclairage de nuit à Néochori (village des SFP) !
Ajout/Création : D'une barre de vos FPS ainsi que votre temps de jeu par connections en haut à gauche de votre écran !
Ajout : Vous pouvez maintenant décharger un joueur d'une voiture avec un sac sur la tête !
Ajout : Nouveau HQ auto-école !
Ajout : Vous pouvez maintenant revendre vos véhicules directement dans le carshop !
Ajout : Trigger famille FSB !
Ajout : Des grenades fumigènes à la boutique diverse !
Ajout : De l'heure sur l'historique d'achat de vos maisons (STAFF) !
Ajout : De l'historique staff SERVEUR sur la confirmation d'achat/Revente/Rescan de vos maisons !
Ajout : De l'historique staff sur les hacks bombe à Néochori !
Ajout : Les gendarmes peuvent maintenant acheter un chien à la gendarmerie !
Ajout : Du silencieux 7.5 mm !
Amélioration : Anti hack exécution script distante !
Amélioration : Système retrait de point !
Amélioration : Refonte de l'inventaire virtuel civil !
Amélioration : Refonte de l'inventaire virtuel gendarme !
Amélioration : Refonte de l'inventaire virtuel lors d'une fouille !
Modification : Nouveau dialogue pour le menu supermarché !
Modification : De la musique d'intro !
Modification : De l'introduction au serveur (moins longue, pour les anciens joueurs les règles ne sont plus affichées d'office tout le temps) !
Modification : Le menu repeindre vos véhicules est maintenant disponible dans les emplacements TUNING !
Modification : Des salaires donateurs !
Modification : L'antibiotique fait maintenant effet jusqu'à votre mort !
Modification : La zone du cambriolage est maintenant indiquée dans un rayon max de 200 mètres autour du point initial !
Modification : Du temps de loot des terroristes !
Modification : Le cocktail molotov part moins en sucette lorsqu'il est jeté !
Modification : De la touche appel d'urgence pour les gendarmes (ALT GR + CTRL DROIT) !
Modification : Du prix pour soudoyer le garde !
Modification : L'argent des fusils et accessoires légaux passe maintenant par le compte en banque !
Modification : Le PSIG ou autres peuvent maintenant acheter des habits de gendarmes !
Modification : De la portée du taser et du flashball !
Optimisation : Script réseaux !
Optimisation : Script local !
Optimisation : Synchronisation réseaux editeur (plus de 800 objets) !
Correction : Du message d'argent lors d'achat d'un coffre fort !
Correction : Erreur sur le retrait ou l'ajout de point sur le permis de conduire (gendarme et auto ecole) !
Correction : Glitch holster !
Correction : Affichage du nombre total de maisons disponibles !
Correction : Debug historique argent nouveau joueur !
Correction : Bug argent drone de surveillance !
Correction : Achat orca hélicoptère licence gang pour les personnes sans gang officiel !
Correction : Lorsque vous étiez évadé de prison, la tenue d'évasion n'était pas appliquée desuite !
Correction : Glitch caméra de vidéo surveillance !
Correction : Décallage dans la liste des prévisualisations !
Suppression : Zone limitée véhicules devant le respawn civil !
Suppression : De la sécurité banque sur les gros mouvements d'argent (protection hack) !
Suppression : Du message lorsqu'un joueur explose à la cocaïne !
Suppression : Du message lorsque vous êtes tazé aux civils !
Mise A Jour : De l'anti hack suite au hack du 16/09/2014 !




Version 5.081
Correction : Il se pouvait que votre véhicule soit détecté par l'anti hack lors d'achat de véhicule !





Version 5.08
Ajout : L'antibiotique est maintenant sauvegardé est fonctonne maintenant avec un tempo !
Ajout : De la BMW M3 (remodifié par mes soins vitesse-acceleration-frein etc) !
Ajout : Des plaques d'immatriculation sur les véhicules de marchandises (missions) !
Ajout : Des plaques d'immatriculation sur les véhicules de fuel (missions) !
Ajout : Nouveau QG Sons Of Anarchy !
Ajout : D'un OffRoad Sons Of Anarchy !
Ajout : D'un Orca Sons Of Anarchy !
Amélioration : Du spawn medecin à Néochori !
Modification : Réactivation des voitures des addons !
Modification : De la distance d'affichage des noms au dessus de la tete !





Version 5.071
Ajout : De nouvelles banques !
Amélioration : Spawn obligatoire d'un medecin à Néochori !
Amélioration : Plus de faillite pour les médecins à Néochori !
Amélioration : Du menu premier soin dans les hopitaux !
Modification : L'audi à été desactivé à l'achat (addon de merde que les joueurs ne comprenne pas !) !
Correction : Il se pouvait quand le trésor était spawn, il vous suffisait de pointer votre souris sur une poubelle pour gagner l'argent !
Correction : Boutique accessoires armes pour les civils !






Version 5.07
Ajout/Création : D'une nouvelle sauvegarde des véhicules !
Ajout/Création : D'un menu compilation pour la boutique du GIGN !
Ajout/Création : D'un menu compilation pour la boutique des gendarmes !
Ajout/Création : D'un nouveau tableau pour la liste des accessoires d'armes !
Ajout/Création : D'un nouveau tableau pour la liste du drone !
Ajout/Création : Nouvelle sauvegarde des maisons plus performante !
Ajout/Création : D'un script pour désactiver les voix de votre radio !
Ajout/Création : D'un nouveau HQ au carshop !
Ajout/Création : D'un système d'ouverture des barrières automatique !
Ajout/Création : Les pompiers ne sont plus flashés aux radars !
Ajout/Création : Les gendarmes peuvent maintenant vous retirer des points sur votre permis de conduire !
Ajout/Création : L'auto-école peut maintenant vous remettre des points sur votre permis !
Ajout/Création : Les radars sont maintenant activés sur TOUS les véhicules sans sirène activée !
Ajout : Vous pouvez maintenant mettre les deux farming héroïne dans vos véhicules !
Ajout : Vous pouvez maintenant régler le carshop par CB !
Ajout : Le carshop peut maintenant repeindre des véhicules à leur HQ !
Amélioration : Des FPS généraux du serveur !
Amélioration : Du script pour tondre la pelouse !
Amélioration : De la recherche au trésor !
Amélioration : De l'anti hack TP !
Amélioration : De l'anti hack voiture !
Amélioration : Du script de statut donateur !
Modification : Modification de la couleur des joueurs morts sur la carte !
Modification : Vous pouvez maintenant acheter une chemlight et la déposer au sol !
Modification : La nuit sera maintenant aussi rapide que le jour !
Modification : Le temps in game avance maintenant moins rapidement !
Modification : Beaucoup de PNJ ont été supprimés pour réduire la charge du client, les menus seront donc dans votre menu déroulant !
Correction : Distance de l'entrepôt de la mission de marchandise !
Correction : Du menu karting !
Correction : Argent système ANPE !
Correction : De l'hélitreuillage du GIGN !
Correction : Glitch Française des jeux !
Correction : Glitch achat à la licence gang !
Correction : Glitch marché noir !
Optimisation : Des scripts de carte (éditeur) !
Suppression : D'objets dans l'éditeur pour alléger la charge mission !





Version 5.06
Ajout/Création : D'un nouveau revive !
Ajout/Création : D'un nouveau script de nettoyage du serveur (faite vos retour) !
Amélioration : De la sauvegarde des véhicules (duplication + mise à jour en temps réel) !
Modification : Baisse du prix du HMETT !
Modification : Temps de l'envie du pipi !
Modification : Temps de l'envie de la soif !
Modification : Temps de l'envie de la faim !
Modification : Temps de l'envie du dodo !
Correction : L'inventaire d'organes animaux n'était pas affiché dans les inventaires farming des véhicules !
Correction : Des inventaires des véhicules illégaux lorsque vous souhaitez retirer de la marchandise !
Correction : Des soucis de groupes gendarmes et civils !
Suppression : Divers sur l'éditeur (parking etc) !





Version 5.05
Ajout/Création : Des nouveaux dialogues pour le farming des véhicules !
Ajout/Création : D'un historique de hack sur les véhicules non achetés !
Ajout/Création : Vous pouvez maintenant mettre du farming illégal dans certains véhicules (BUG A PREVOIR !!! Remontés les !) !
Ajout : Du HMETT !
Amélioration : De la sauvegarde des véhicules (Débug propriétaire + débug plaque immatriculation) !
Amélioration : De la détection de PNJ lors d'achat de maison !
Amélioration : Réécriture complète du script des noms des joueurs au-dessus de leur tête (plus de petits lag) !
Amélioration : Réécriture complète du script d'affichage des plaques d'immatriculation (plus de petits lag) !
Amélioration : De fin de détection des incendies !
Amélioration : Du spawn du marché noir (ajout d'une deuxième sécurité) !
Modification : La limitation des comptes passe maintenant de 2 000 000 à 6 000 000 !
Modification : Les civils ne peuvent plus rejoindre les groupes gendarmes et vive verca !
Correction : Le staff peut maintenant vous rembourser de grosses sommes d'argent !
Correction : Du freeze de la sauvegarde lorsqu'un véhicule n'avait pas de plaque !
Correction : Shawn ou moi même (Maxou) pouvont de nouveau vous restaurer vos véhicules (contre correction duplication de véhicules !!!) !
Suppression : De l'affichage des plaques d'immatriculation sur les véhicules illégaux !
Suppression : Des sacs à dos aléatoires sans contenance (merci Chris) !
Desactivation : Du revive, le temps d'en créer un (trop de soucis avec celui utilisé actuellement) !





Version 5.00
Ajout/Création : D'un nouveau système de group player avec groupement automatiquement des habitués (UNIQUE)
Ajout/Création : Des caméras de vidéos surveillances (UNIQUE)
Ajout/Création : Des plaques d'immatriculation sur les véhicules (UNIQUE)
Ajout/Création : Refonte complète du système d'historique de chat/texto avec prise en charge en sauvegarde (UNIQUE)
Ajout/Création : D'un raccourci pour afficher le dernier texto reçu (shift gauche + capslock) (UNIQUE)
Ajout/Création : Refonte complète du système visuel d'achats de voitures (UNIQUE)
Ajout/Création : Refonte complète visuelle de beaucoup de tableaux (UNIQUE)
Ajout/Création : Vous pouvez recevoir des spots d'annonce de la sarl NeoMedia (UNIQUE)
Ajout/Création : Vous pouvez recevoir des spots d'annonce du STAFF (UNIQUE)
Ajout/Création : Vous pouvez maintenant être verbalisé en étant hors ligne ! (UNIQUE)
Ajout/Création : D'un script qui vous kick du jeu si vous explosez une maison avec le véhicule de citerne ou de livraison ! (UNIQUE)
Ajout/Création : D'un script qui vous indique par un point rouge ou vous avez pris un dégât sur votre corps (tir, etc) ! (UNIQUE)
Ajout/Création : Vous ne pourrez plus utiliser le revive si vous êtes mort d'une balle dans la tête ! (UNIQUE)
Ajout/Création : D'un nouveau effet visuel lorsque vous perdez de la vie ! (UNIQUE)
Ajout/Création : Des tremblements de terre (UNIQUE)
Ajout/Création : D'un effet de vent (poussière) au spawn de Neochori ! (UNIQUE)
Ajout/Création : D'un effet de vent (poussière) au spawn des gendarmes ! (UNIQUE)
Ajout/Création : D'un effet de vent (poussière) au spawn de Aeroport ! (UNIQUE)
Ajout/Création : D'un système pour vous rembourser directement hors ligne ou en ligne avec un message personnalisé ! (UNIQUE)
Ajout/Création : Des fuites toxiques pour la DIR ! (UNIQUE)
Ajout/Création : D'une barre de progression pour afficher divers temps en jeu !
Ajout/Création : D'un holster en raccourci shift gauche + ctrl gauche (avec prise en chargeur des chargeurs et nombre de munitions !)
Ajout/Création : D'un nouveau script d'affichage des messages en bas de l'écran !
Ajout/Création : D'un affichage d'intro lors du chargement de votre sauvegarde !
Ajout/Création : D'un script d'achat de sac à dos aléatoire (toute la liste arma) !
Ajout/Création : Vous pouvez maintenant cacher votre nom au-dessus de la tête avec divers casques/foulards !
Ajout/Création : Du sac à dos de la DIR !
Ajout/Création : D'une vrai tenue de prisonnier !
Ajout/Création : D'un littlebird Velentzas !
Ajout/Création : D'un littlebird NeoMedia !
Ajout/Création : D'une veste légère au velentzas !
Ajout/Création : D'une veste lourde au velentzas !
Ajout/Création : D'effet de lumière à Néochori !
Ajout/Création : De la tenue du GIGN !
Ajout/Création : D'un sac à dos pour le GIGN !
Ajout/Création : D'un gilet par balles pour le GIGN !
Ajout/Création : D'un casque pour le GIGN !
Ajout/Création : D'une camionnette pour le GIGN !
Ajout : Des toilettes chez les pompiers !
Ajout : Les gendarmes ne peuvent plus vous mettre en prison quand le serveur va redémarrer !
Ajout : Du saut en parachute à Kavala !
Ajout : Du LittleBird à la SARL Auto Ecole !
Amélioration : Des sauvegardes automatiques pour ne plus perdre vos maisons, coffres, etc lors d'un redémarrage sauvegarde (mauvais choix missions par exemple) !
Amélioration : Refonte du script de braquage de banque !
Amélioration : Du script de livraison de marchandises !
Amélioration : Du script de livraison de gasoil !
Amélioration : Du système de chat !
Amélioration : Complète du script pour gagner de l'argent chez la SARL Depannage en voiture !
Amélioration : Des détections des gains d'argent quand vous rentrez dans un véhicule (certains n'étaient pas détectés) !
Amélioration : Réécriture du script du marché noir (erreur position arma / Spawn dans l'eau) !
Amélioration : Considèrable du script de gestions des sauvegardes (réécriture complète !!) !
Amélioration : Historique STAFF des sauvegardes des véhicules !
Amélioration : Du spawn des médecins pour un meilleur équilibre sur la carte !
Amélioration : Du temps de livraison de marchandises !
Amélioration : Du temps de livraison de gasoil !
Amélioration : Du spawn des lapins !
Amélioration : Des détections des feux pour les eteindres avec les extincteurs !
Modification : Sur la chance d'arriver à faire un cambriolage !
Modification : La pêche en mer se fait maintenant a partir du bateau !
Modification : De l'heure du serveur, avance de 1 minute tout les 5 secondes !
Modification : Les médecins ne spawn plus dans les maisons achetées !
Modification : Les pnj vous détectent maintenant avec la visée et la proximité !
Modification : Le serveur lance une sav générale avant les 20 minutes du restart pour éviter qu'elle n'est pas le temps de se terminer !
Modification : Les missions de DIR sont maintenant activable avec seulement 2 dir connectés !
Modification : Des distances des missions de la DIR (2 Kms autour des villes Alikampos,Neochori,Poliako,Panochori,Lakka,Stavros) !
Modification : Vous pouvez maintenant acheter des maisons sur toute l'ile !
Modification : D'activation de la tenu velentzas par menu déroulant !
Modification : Remplacement du COS par le GIGN (encore ^^) !
Modification : Vous pouvez maintenant ouvrir le sac des terroristes !
Correction : D'un bug sur les temps de farming (Etait divisé par deux !)
Correction : Plus aucune erreur de scripts répertoriée dans le débug serveur !! (clients en cours déjà débugé sous 4.9 et antérieur) !
Correction : Des sacs à dos dans les inventaires des véhicules (sauvegarde trop rapide) !
Correction : Des items dans les inventaires des véhicules (sauvegarde trop rapide) !
Correction : Emplacement trigger collecte de lapins !
Correction : Le menu ramasser lapins apparaissait deux fois !
Correction : L'hélico taxi était rempli de stuff !
Correction : D'une erreur de script sur la couleur des flammes d'incendies (de nuit) (non-critique) !
Correction : D'une erreur de script sur la protection de synchronisation des prêts de clefs (non-critique) !
Correction : D'une erreur de script sur l'affichage de votre livret A (non-critique) !
Correction : D'une erreur de script sur l'affichage du verrouillage et déverrouillage (non-critique) !
Correction : D'une erreur de script sur l'affichage lors d'un essai de cambriolage (non-critique) !
Correction : Divers action editeur (non-critique) !
Correction : De l'historique staff des soucis d'informations des véhicules pour éviter qu'il soit spammé si ce n'est pas un véhicule en face !
Correction : Du PNJ de licence drogue (disparu) !
Correction : Du souci de sauvegarde cote gendarme et civil !!! (soucis encore du revive !!)
Correction : De la revente des véhicules !
Correction : Les gendarmes touchent maintenant la prime lors d'une trouvaille des travailleurs au noir !
Correction : Il se pouvait que les nouveaux joueurs apparaisser avec 0 euro en argent en banque !
Correction : Il pouvait survenir des soucis de sauvegarde qui se mélanger entre civil et gendarme (à cause du revive, mort a la reconnections) !
Correction : Depuis la rectification des comptes des nouveaux joueurs à 10 000 Euros, il se pouvait que vous vous retrouvez dans la protection anti hack des trop grosses sommes d'argent !
Epuration : Des anciens dialogues dans la base hpp !
Supression : Des Los Zetas !
Analyse : Après divers essai, la perte de FPS vient tout simplement du nombre d'objets sur la carte :/ !





Version 4.9
Ajout/Création : D'un système UNIQUE de spawn des nourritures, boisson etc sur l'ile !
Ajout/Création : D'un système UNIQUE de spawn des points de collectes aléatoirement !
Ajout/Création : D'un système UNIQUE de spawn des médecins !
Ajout/Création : D'un système UNIQUE d'autodimensionnement d'icônes sur la carte, avec une option rapide d'affichage !
Ajout/Création : La SARL Dépannage peut maintenant vous montrer leur devis réalisé sur vos véhicules (UNIQUE) !
Ajout/Création : Lorsque votre véhicule est mis en fourrière, vous en serez avertit !
Ajout/Création : De sécurité sur le menu respawn et quitter !
Ajout/Création : Nouvelle protection contre le hack !
Ajout/Création : D'un nouveau script pour les inventaires des véhicules (n'oubliez pas de faire vos retours !!!) !
Ajout/Création : D'une sécurité pour ne plus perdre la position ou le type de véhicule dans vos sauvegardes !
Ajout/Création : D'un système complexe de protection divers avant le redémarrage !
Ajout/Création : De la sauvegarde, juste avant le reboot des véhicules en fourrières !
Ajout/Création : Les maisons totales achetables sont maintenant affichées dans le check des propriétaires !
Ajout/Création : Vous ne pourrez plus charger vos véhicules juste avant le reboot du serveur !
Amélioration : Recréation complète du script du taser (date de plus d'un an et demi ^^) !
Amélioration : Considérable de la sauvegarde des maisons, coffres, etc !
Amélioration : D'un débug pour éviter d'avoir indéfiniment le message < initialisation, patientez ... > !
Amélioration : Du verrouillage des coffres forts !
Amélioration : De l'endurance !
Amélioration : Des performances des échanges de variables entres joueurs (plus de 400 valeurs optimisées) !
Amélioration : Des performances du serveur !
Amélioration : Du système de verrouillage car il se pouvait qu'un message de type < Function does not exist > s'affichait !
Amélioration : De l'anti hack pour le passer coté serveur (variables inconnues) !
Amélioration : Complète du système de devis à la SARL Depannage !
Amélioration : Des messages de END (fin de mission) !
Amélioration : Du flashball, il passe d'une détection de 1 mètre autour du joueur à 1.3 mètre !
Modification : Remplacement du terme McDonald par Kebab !
Modification : Du texte pour poser un objet qui passe de < acheter objet > à < poser objet > !
Modification : Baisse du prix lors de la trouvaille de travailleurs au noir !
Modification : La zone au sud de la carte passe maintenant en PVP !
Modification : La fumée des incendies scriptés sont maintenant activé d'office !
Modification : La portée du taser passe de 0 à 20 mètres et le flashball à partir de 20 mètres  !
Correction : Le menu des extincteurs pouvait apparaitre deux fois (bohémia ?) !
Correction : De l'historique STAFF d'achat des maisons !
Correction : De l'historique STAFF de bug ouverture des véhicules !
Correction : De l'historique STAFF de revente des véhicules !
Correction : Il arrivait parfois que votre inventaire affiché 0/0, il sera maintenant corrigé automatiquement !
Correction : D'erreur de script du revive (initialisation merdique) !
Correction : Le temps restant de location ne décomptait plus !
Correction : Il pouvait arriver que parfois vous spawnez avec la faim ou autre à -1 !
Correction : Erreur d'affichage dans le check des inventaires (erreur non critique) !
Correction : Lorsqu'un gendarme fouiller un civil, any pouvait apparaitre (erreur truffes) !
Suppression : D'une partie du message d'intro !
Suppression : Des bots terroristes à la license gang !




Version 4.8
Ajout/Création : Vous pouvez maintenant sauvegarder et charger vos véhicules avec un nom différent !
Ajout/Création : D'un historique STAFF lorsque vous chargez ou sauvegardez vos véhicules !
Ajout/Création : Des explosions de canalisations pour la DIR !
Ajout/Création : D'un script pour les terroristes supprimant leurs armes une fois mort après un temps aléatoire !
Ajout/Création : D'un système de devis a la SARL DDE pour avoir les dégâts précis des véhicules !
Ajout/Création : D'une prime pour le CarShop lors d'une revente d'un véhicule !
Ajout/Création : D'un script pour le nettoyage des bots terroristes !
Ajout : De la désactivation de la touche ² pour les personnes hors staff !
Ajout : D'un casque de karting !
Ajout : D'un bonnet noir !
Ajout : D'un bonnet vert !
Ajout : D'un foulard d'aviateur !
Ajout : D'un uniforme de treillis !
Ajout : D'une tenue de Karting !
Ajout : De nouvelle tenue aléatoire hors d'achat !
Amélioration : Le chargement de la sauvegarde est maintenant un peu plus rapide !
Amélioration : Sécurité des inventaires !
Amélioration : Complète du code de verrouillage des inventaires (usebugger, etc) !
Amélioration : De la sauvegarde des inventaires des véhicules !
Amélioration : Du système de sauvegarde !
Amélioration : Du tag des joueurs au-dessus de la tête (affichage continu pour le staff) et une fois toutes les 60 secondes pour les autres !
Modification : Du prix pour repeindre les véhicules !
Mise A Jour : Des whitelists !
Suppression : D'une tenue non compatible MP qui vous affichez en caleçon !
Correction : Lorsque vous étiez mort, si vous vous déconnectez et reconnecter, vous mourrez deux fois !
Correction : Script coup d'oeil inventaire du coffre fort (any) !
Correction : Script coffre-fort lors de chargement d'objet d'inventaire fictif ou non (any) !
Correction : Historique staff d'erreur de véhicules !
Correction : Historique staff d'erreur d'achat de maisons !
Correction : Lors d'un lift sur un véhicule verrouillé, celui-ci était automatiquement déverrouillé !
Correction : De traduction du lift !
Correction : Divers de script !




Version 4.73
Ajout/Création : De la possibilité de mettre sous sac des joueurs !
Ajout/Création : Des historiques staff lorsque vous avez le message AUCUNE INFORMATION SUR CE VEHICULE !
Ajout/Création : Des historiques staff lorsqu'une maison achetée ne vous appartient plus !
Ajout/Création : Des filtres hack de battleye !
Ajout : D'une tenue à la SARL G7 !
Ajout : D'un casque pilote à la DIR !
Ajout : D'un casque pilote à la gendarmerie !
Ajout : De la possibilité d'aller aux toilettes en prison !
Ajout : De la nourriture et la boisson en prison (sur le gardien) !
Amélioration : De la sauvegarde des véhicules (Pour éviter les pertes) !
Mise A Jour : De l'anti Hack !
Correction : Des noms au dessus de la tête juste pour les modérateurs !
Correction : Le COS ne pouvait plus acheter certaines choses !
Correction : Des whitelists !
Correction : De la nourriture, soif, etc apparaissaient à zéro lors de leur premier chargement !
Correction : Du centre sportif !
Correction : De l'argent des nouveaux joueurs qui étaient de 0 Euros !




Version 4.72
Optimisation : Du serveur/mod pour une meilleure charge serveur !
Amélioration : Complète du système de detection d'hack !
Amélioration : Du système de whitelist !
Modification : Remplacement de l'arme Sting par la PWD 2000 !
Modification : Les pseudos au dessus de la tete ne sont maintenant disponible que pour le staff !
Mise à jour : Du CBA !
Mise à jour : Du compilateur de sauvegarde !
Correction : De l'inventaire des véhicules !
Correction : D'erreurs de scripts divers !





Version 4.71
Ajout/Création : D'un fichier automatique réunissant tous vos pseudo utiliser avec votre UID (remboursements, etc) !
Ajout/Création : D'un anti hack !
Amélioration : De l'anti hack tp !
Amélioration : De l'anti hack bombe !
Amélioration : De l'anti hack véhicule !
Amélioration : Du système de verrouillage des sacs à dos, véhicules, etc !
Amélioration : De la wanted list !
Amélioration : De l'inventaire des véhicules pour eviter des erreurs !
Correction : Des radars fixes !





Version 4.7
Ajout/Création : D'un effet de tremblement lors d'un tir (vu 1 ère-personne) !
Ajout/Création : Du respawn dans vos maisons !
Ajout/Création : Du raccourci < pour déverrouiller vos véhicules de l'intérieur !
Ajout/Création : Les pompiers peuvent recharger lors extincteurs dans leur camion !
Ajout/Création : De la SARL NEOMEDIA !
Ajout/Création : Du raccourci sirène pour le Ford torrus avec les touches F1 F2 et F3 !
Ajout/Création : Du raccourci sirène pour l'interceptor avec les touches F1 F2 et F3 !
Ajout/Création : Du raccourci sirène pour le véhicule de pompier avec les touches F1 F2 et F3 !
Ajout/Création : Du canal chat des pompiers !
Ajout/Création : Du nouveau système de prisonnier (voir forum post Ricks) !
Ajout : D'un nouveau serveur bien plus puissant !
Ajout : Les gendarmes peuvent maintenant poser des coffres !
Ajout : Les gendarmes peuvent maintenant acheter des maisons !
Ajout : Les travailleurs ne peuvent plus travailler dans le village des SFP !
Ajout : De 10 sécurités lors d'un transfert de poche à poche pour éviter les erreurs de type SCALAR !
Ajout : Du SDAR au COS !
Ajout : Du Lynx au COS !
Ajout : De la Dodge aux gendarmes !
Ajout : De la Jonzie aux gendarmes !
Amélioration : De script pour eviter les pertes de farming des véhicules !
Amélioration : De script pour eviter les pertes d'informations des véhicules !
Amélioration : Du système de sauvegarde de la prison pour lancer une sauvegarde automatique des votre sortie !
Amélioration : De la sauvegarde des maisons (plus rapide) !
Amélioration : De plus de 90 % de la bande passante des fichiers de sauvegardes joueurs !
Amélioration : Du menu rapprocher le travailleur !
Amélioration : Du message lorsque vous recevez de l'argent de poche à poche !
Amélioration : Du moteur du BUS !
Amélioration : Du comportement du BUS !
Amélioration : De L'Anti Hack TP !
Amélioration : Diverses !
Modification : Désactivation des sirènes sur les hélicoptères !
Modification : Du message lors d'un saut en parachute !
Modification : De la mission de gasoil, les joueurs pouvaient livrer avec n'importe quels véhicules !
Modification : De la mission de marchandises, les joueurs pouvaient livrer avec n'importe quels véhicules !
Correction : Pour les personnes donatrices, leurs salaires étaient remplacés par celle des entreprises !
Correction : Vous ne pouvez pas acheter plusieurs cocktail molotov !
Correction : Du script de revive lorsque des pompiers ou smurs sont connectés !
Correction : D'un glitch sur la vente de matos avec valise !
Correction : Du temps des plantes (erreur non reel) !
Correction : Les Favelas n'étaient pas flashés aux radars !
Correction : D'un glitch sur le revive lors d'une mort !
Correction : Le drone du surveillance se supprimé (script cheat) !
Correction : Des inventaires des véhicules qui affichent parfois 0/X (bohémia) !
Correction : De l'alerte de conduite sans permis pour les véhicules sans permis !
Correction : La hache n'était pas sauvegardée !
Correction : Du spawn du camion de pompier !
Correction : Du spawn de l'hélicoptère de la DIR !
Correction : Diverses !





Version 4.61
Ajout/Création : Vous ne pouvez plus vous revive si des smurs ou des pompiers sont plus de 4 connectés !
Ajout/Création : De la sauvegarde des SACS A DOS VIDE dans les voitures !
Ajout : D'une sécurité sur les travailleurs aux noirs pour ne pas monter dans les véhicules vérrouillés !
Ajout : Les dépanneurs et le COS peuvent maintenant hélitreuiller des véhicules !
Ajout : De la descente en rappel sur le Gosht Hawk !
Ajout : Des gyrophares au renault Master !
Ajout : Vous pouvez directement payer un smur en pointant votre souris sur eux !
Amélioration : Du système inventaire des véhicules (places, débug, etc) !
Amélioration : Du menu réparer les hélicoptères (difficile à l'afficher) !
Amélioration : Du script du revive !
Modification : Agrandissement du HQ de la DIR !
Correction : De la liste des habits des gendarmes !





Version 4.6
Ajout/Création : De nouveau GROS incendie de champs !
Ajout/Création : Des Cocktails Molotov (avec possibilité de les éteindre) !
Ajout/Création : De nouveaux objets lors d'un cambriolage !
Ajout ET Amélioration : D'un Bus !
Ajout ET Amélioration : D'une Ferrari !
Ajout ET Amélioration : D'un Renault Master DIR !
Ajout ET Amélioration : De barrières de travaux pour la DDE !
Ajout ET Amélioration : Des panneaux de danger à la DDE !
Ajout : D'un masque d'anonymous !
Ajout : D'un Képi Noir !
Ajout : D'une cagoule de tete de mort !
Ajout : D'un casque ONU !
Ajout : D'un casque de BaseBall !
Ajout : D'un casque de chantier Rouge !
Ajout : D'un casque de cross Rouge !
Ajout : D'un casque de cross Jaune !
Ajout : De deux casques de pompiers !
Ajout : D'une tenue de Dalton !
Ajout : Des bouteilles d'oxygène aux pompiers !
Amélioration : De l'heure du serveur !
Amélioration : De l'anti hack TP !
Amélioration : Vous pouvez maintenant désactiver et réactiver à tout moment la fumée sur les incendies des champs !
Amélioration : Du système de détection des cones !
Amélioration : Les karting ne peuvent plus être sauvegardés !
Amélioration : De La Sauvegarde !
Amélioration : De la hatchback !
Modification : De la sécurité pour envoyer un SMS au SMUR !
Modification : La fumée des incendies SCRIPTE est automatiquement désactivé sur la prochaine MAJ, pensez à l'activer si besoin !
Modification : Baisse du prix des journaux !
Modification : Kavala n'est plus disponible au cambriolage pour le moment !
Correction : Les véhicules chargés avec une sauvegarde pouvaient avoir des armes dedans (hors objets sauvegardés) !
Correction : Du script pour retaper les numéros de série !
Correction : Les kartings arrivés à sortir de la piste de kart malgré le script !
Correction : Le COS ne pouvait plus acheter de véhicules !
Correction : Glitch sur les missions de journaux !






Version 4.5
Ajout/Création : Du canal chat des Taxi G7 !
Ajout/Création : D'un nouveau message dans les annonces du serveur !
Ajout/Création : Des effets de drogue (cocaïne sur le temps de farming) !
Ajout/Création : Des effets de drogue (héroïne sur la faim et la soif) !
Ajout/Création : Des effets de drogue (cannabis sur le sommeil) !
Ajout/Création : Des effets de drogue (médicaments sur le niveau minimum de régénération de la vie) !
Ajout/Création : Les gendarmes peuvent savoir si vous êtes sous l'emprise de produit illicite !
Ajout/Création : Des désincarcération lors d'un accident avec un dégât sur le véhicule à plus de 75 pour cent !
Ajout : Des kartings et de leurs accessoires !
Modification : De la zone à 200 mètres autour de Neochori concernant la suppression des objets mit au sol (Check toutes les 100 secondes) !
Modification : Les joueurs seront avertis avant d'être TP si ils rentrent dans les HQ des gendarmes !
Amélioration : De script pour éviter que les véhicules depop !
Amélioration : De script pour éviter les erreurs de reconnaissance des noms des propriétaire de véhicules !
Correction : Erreur changement nom du script RANDOM.sqf au chargement du jeu (BOHEMIA) !
Correction : De l'inventaire du sac des pompiers !
Correction : Du checkpoint 2 concernant l'argent lors d'une prise de garde !





Version 4.4
Ajout/Création : D'un farming de plantations illégales (UNIQUE) !
Ajout/Création : D'un flash ball maison (UNIQUE) !
Ajout/Création : Des missions de livraison de marchandises (UNIQUE) !
Ajout/Création : Des missions de livraison de gasoil (UNIQUE) !
Ajout/Création : Des missions de Go Fast (UNIQUE) !
Ajout/Création : De l'hélicoptère des pompiers avec largage d'eau (UNIQUE) !
Ajout/Création : D'une nouvelle wanted liste (UNIQUE) !
Ajout/Création : Des historiques de chat sms (UNIQUE) !
Ajout/Création : De la possibilité d'embaucher des PNJ au noir (UNIQUE) !
Ajout/Création : De la possibilité de jeter les objets du supermarché de l'inventaire !
Ajout/Création : Des maitres chiens gendarmerie (UNIQUE) !
Ajout/Création : Vous pouvez maintenant revendre vos maisons (UNIQUE) !
Ajout/Création : D'un effet de balle lors d'un tir, configurable (UNIQUE) !
Ajout/Création : De calcul mathématique (UNIQUE) !
Ajout/Création : D'un système unique de vérification des informations des véhicules des joueurs (administration) !
Ajout : Du skin de l'hélicoptère des pompiers !
Ajout : De skins à la SARL Dépannage !
Ajout : D'une sécurité au SMS lorsque un texto est envoyé à une entreprise non connectée !
Ajout : Vous pouvez maintenant dormir chez vous !
Ajout : Vous pouvez maintenant manger chez vous !
Ajout : Vous pouvez maintenant boire de l'eau chez vous !
Ajout : Vous pouvez maintenant boire un demi chez vous !
Ajout : Vous pouvez maintenant prendre un café chez vous !
Ajout : D'un nouveau avion non amphibi !
Ajout : D'un message lors d'un tir au taser si la personne en face est trop loin !
Ajout : Les SMS sont bloqués aux entreprises qui ne sont pas connectés !
Ajout : De la MX noire !
Amélioration : De la sauvegarde du personnage !
Amélioration : Du script de déverrouillage des véhicules hors location !
Amélioration : Du système de sauvegarde des véhicules !
Amélioration : Du système détaché des cones, herses et barrières !
Amélioration : Des performances du serveur (bandwitch, senderror, etc) !
Amélioration : Du script des cambriolages !
Amélioration : Diverses !
Modification : Du script de protection des dépanneurs quand ils sont connectés pour empecher les réparations etc !
Modification : Du spawn du véhicule du carshop !
Modification : Du temps avant de tomber malade !
Modification : Les Cartels deviennent les Sons Of Anarchy !
Modification : Vous pouvez maintenant farmer avec une valise !
Correction : D'un USEBUG sur les valises lors d'une collecte !
Correction : Du PNJ mission de livraison à PARIS !
Correction : Lors du chargement d'un véhicule, il se pouvait que la classe du véhicule apparaissait mal sur le marker !
Correction : De script de déverrouillage pour les véhicules de locations !
Correction : De l'Anti Hack TP !
Correction : Du bar !
Correction : L'équipement du COS se supprimer après une déco reco !
Correction : D'un bug sur la valise, les truffes n'étaient pas ajoutées dedans !
Correction : Diverses !






Version 4.3
Ajout/Création : D'un système permettant de prêter vos clefs de véhicules à un autre joueur !
Ajout/Création : Le PIPI est maintenant sauvegardé !
Ajout/Création : D'un Anti hack contre les téléportations !
Ajout/Création : De 13 skins au littlebird !
Ajout/Création : De 4 skins à l'ORCA Civil !
Ajout/Création : D'un nouveau skin au littlebird gendarme !
Ajout : D'un message chat lorsqu'un joueur rate son braquage de banque !
Ajout : D'une sécurité empêchant de sauvegarder les véhicules attachés à une dépanneuse !
Ajout : D'une prime à la SARL DDE lors d'une mise en fourrière !
Ajout : Du skin Zetas au ORCA !
Ajout : Du skin Velentzas au ORCA !
Ajout : Du skin francais à la voiture de pompier !
Ajout : Du skin francais à la voiture des gendarmes !
Ajout : D'une nouvelle tenue au Velentzas !
Amélioration : Les entreprises avec skins sont maintenant automatiquement appliquées lors d'un respawn !
Amélioration : De la sauvegarde des véhicules !
Amélioration : Du système de vente au marché noir !
Amélioration : Du script des radars !
Amélioration : Du menu Y !
Amélioration : Du menu verrouillé/déverrouillé !
Amélioration : Diverses !
Modification : Des PNJ restaurants !
Modification : Tous les gendarmes peuvent maintenant poser des barrières !
Modification : Tous les gendarmes peuvent maintenant poser des cones !
Modification : Tous les gendarmes peuvent maintenant poser des herses !
Modification : Du prix des livraisons de journaux !
Modification : Du prix des grenades flash !
Modification : Du timing pour braquer la banque !
Modification : L'ifrit non armé est passé du coté gang !
Modification : Augmentation de l'espace du gilet du COS et de la gendarmerie !
Modification : Du patron de la SARL CarShop !
Modification : Des patrons du gang Los Zetas !
Modification : Des prix des hélicoptères gendarmerie !
Modification : Du script de regénération de la vie !
Correction : Des habits du cos lors d'un revive ou respawn !
Correction : De l'affichage du prix d'un bateau des gendarmes !
Correction : De la boutique armes des gendarmes !
Correction : Du verrouillage des sacs à dos !
Correction : De la sirène du SUV Pompier !
Correction : Du message lors de l'achat d'habit du COS !
Correction : Du message de fin de transaction lors d'achat d'habit du COS !
Correction : D'un PNJ au COS !
Correction : Diverses !




Version 4.21
Ajout/Création : De la société Altis ET Furious !
Correction : Du temps de vente au marché noir !
Correction : Du script anti hack maison contre les parachutes !
Correction : D'un glitch sur la vente au marché noir !
Correction : D'une whitelist !




Version 4.2
Ajout/Création : D'un terrain de cross !
Ajout/Création : D'un nouveau système de sélection d'habits !
Ajout/Création : Du farming de cocaïne !
Ajout/Création : D'un nouveau système de transformation de drogue (cocaïne) !
Ajout/Création : D'un script qui régénère votre vie si votre santé est supérieure à 75 pourcent !
Ajout/Création : D'un marqueur avec le type de véhicule lors de son chargement !
Ajout/Création : D'un anti hack fait maison sur les véhicules de hackeur !
Ajout/Création : D'un anti hack fait maison sur les bombardements de Néo !
Ajout/Création : D'une prévisualisation lors de l'achat d'une voiture !
Ajout/Création : D'une prévisualisation lors de l'achat d'un hélico !
Ajout/Création : D'une prévisualisation lors de l'achat d'un bateau !
Ajout/Création : D'une prévisualisation lors de l'achat d'une arme !
Ajout/Création : Du OffRoad Smur !
Ajout/Création : Du Gilet du COS !
Ajout/Création : Du Gilet de la Gendarmerie !
Ajout/Création : D'un Mercedes à la SARL DDE !
Ajout/Création : De trois nouveaux habits !
Ajout : D'un dos d'ane à la SARL DDE !
Ajout : De l'option de paiement par virement sur les employés du taxi G7 !
Ajout : D'un ORCA chez la SARL DDE !
Ajout : D'une sécurité pour empêcher les joueurs de braquer la banque 30 minutes avant le redémarrage !
Ajout : D'une sécurité pour empêcher les joueurs de farmer en véhicule !
Ajout : D'un nouveau véhicule de pompier !
Ajout : D'un nouveau véhicule de civil (dodge) !
Ajout : D'un nouveau véhicule de civil (Chevrolet Tahoe) !
Ajout : D'un nouveau véhicule de civil (Chevrolet Jonzie) !
Ajout : D'un nouveau véhicule de civil (Audi A4) !
Ajout : D'un nouveau véhicule de gendarmerie + modif (Ford Interceptor) !
Ajout : D'un nouveau véhicule de gendarmerie + modif (Taurus Police) !
Ajout : D'une sécurité pour les personnes sans launcher concernant la location des véhicules !
Ajout : Des gyrophares à la dépanneuse !
Ajout : D'un hôpital à néochori !
Ajout : De décor près de l'hôpital de néochori !
Ajout : De 5 nouveaux terroristes !
Ajout : De 2 nouveaux patrons au smur !
Ajout : De lumières à la fourrière !
Ajout : De lumières à la SARL DDE !
Amélioration : Du système de donateur !
Amélioration : Du système de réparation des véhicules lors que la DDE est la ou pas !
Amélioration : Du système de protection d'inventaire !
Amélioration : Du système de chargement des maisons !
Amélioration : De la distance d'accès au menu du marché noir !
Amélioration : De la vente au marché noir !
Amélioration : Du script des pompiers !
Amélioration : Du script de détection de la conduite sans permis !
Amélioration : Les incendies sont désactivés quand la DDE n'est pas connecté !
Amélioration : Des incendies des hélicoptères/avions, vous avez désormais plus de temps pour vous poser !
Amélioration : Complète du système de sauvegarde des véhicules !
Amélioration : Spawn marché noir !
Amélioration : Divers de scripts !
Modification : Modification de certaines villes d'Altis !
Modification : De la clarté de la nuit !
Modification : Déplacement de l'hôpital de Kavala !
Modification : Du script de la mairie pour une meilleure détection !
Modification : Du salaire de la SARL DDE !
Mise A Jour : Du skin du Littlebird Gendarmerie !
Mise A Jour : Du skin du SUV Taxi G7 !
Correction : D'un bug sur la sauvegarde des véhicules lorsque véhicule à déjà prit feu !
Correction : De l'impossibilité de se connecter au PSIG !
Correction : Diverses de script !
Correction : Lors d'une déconnexion vos véhicules ne vous appartenez plus !
Correction : Divers de scripts !
Suppression : Du canal COMMAND et SIDE !





Version 4.11
Ajout/Création : D'un script qui supprime vos armes lors d'une déconnexion !
Ajout/Création : D'un script qui supprime vos armes lors de votre mort !
Ajout/Création : D'une synchronisation de verrouillage et déverrouillage des véhicules !
Modification : Remise des anciennes barrières gendarme !
Modification : Du système de sauvegarde des véhicules !
Amélioration : Du système de sauvegarde des véhicules pour le multi profile !
Amélioration : Vous ne perdez plus un chargeur lors de votre déco reco !
Amélioration : Du système de paiement par carte bancaire pour la SARL DDE !
Correction : Du message des smurs et pompier lors de l'action de la sirène par la touche H !
Correction : Du gyrophare des pompiers !
Correction : De l'affichage du prix des hélicoptères gang !
Correction : De l'affichage des pseudo en couleur !
Correction : De l'affichage de l'inventaire !
Correction : Des habits du COS !
Correction : Gilet du COS qui DEPOP lorsqu'un autre COS ce connecte !
Correction : Whitelist !
Correction : Diverses !




Version 4.1
Ajout/Création : D'un Izik (IPOD) !
Ajout/Création : Du système de numéro de série à la SARL CarShop pour les retaper !
Ajout/Création : De la sauvegarde de votre inventaire, sac, etc. lors du saut en parachute !
Ajout/Création : Du café avec effet sur le sommeil !
Ajout/Création : Des Amphétamines qui agit sur la durée de la course !
Ajout/Création : D'une sécurité concernant l'achat des véhicules pour les personnes sans launcher !
Ajout/Création : D'une salle à peinture pour les véhicules avec prise en charge dans la sauvegarde !
Ajout/Création : Du livreur de journaux !
Ajout/Création : D'icônes dans les listes d'achats de véhicules !
Ajout/Création : De l'hélicoptère TAXI G7 !
Ajout/Création : D'une caméra de bienvenue !
Ajout : D'un nouveau véhicule civil !
Ajout : De deux nouveaux habits hors Arma !
Ajout : Du PNJ plongé au COS !
Ajout : D'un silencieux pour 6.5 mm !
Ajout : La SARL Auto Ecole peut maintenant délivrer les licences pilotes !
Ajout : D'une sécurité du spawn d'achat d'avion !
Amélioration : Performance serveur/script !
Amélioration : Les nouveaux joueurs auront leur nom en vert au-dessus de la tête !
Amélioration : Les véhicules en fourrière ne sont plus sauvegardés !
Amélioration : Du taux du système de donation !
Amélioration : Du spawn du marché noir (l'eau était considérée comme de l'herbe à certains endroits ...) !
Modification : Rapide du prix des médicaments ainsi que du prix de l'héroïne !
Modification : Du message du taser qui sera affiché maintenant en bas à gauche !
Modification : Offre ANPE mit à jour !
Modification : De tous les PNJ pour avoir accès au menu déroulant sans l'ouvrir !
Modification : Du système de chargement de véhicule !
Modification : Vous êtes maintenant projeté plus haut lors d'un saut en parachute !
Modification : Du rapprochement de la caméra du revive !
Modification : Du radar fixe du CarShop (passage de 130 à 50) !
Modification : De l'effet des radars fixes !
Modification : Du gilet du COS !
Modification : De l'heure de la discothèque !
Modification : De l'effet du message de donation !
Modification : De l'image du système D'ANPE !
Modification : Du temps entre chaque virement !
Modification : Du HQ des Los Zetas !
Modification : Du prix des grenades fumigènes !
Modification : Du prix des bâtons lumineux !
Correction : De la sauvegarde des maisons !
Correction : De la place tireur sur les Offroad !
Correction : De la place tireur sur le Hunter !
Correction : D'un bug sur l'inventaire pour les nouveaux joueurs !
Correction : D'un débug sur la sauvegarde des véhicules (écrasement) !
Correction : De divers bug !




Version 4.02
Ajout/Création : D'un nouveau système de donation pour ne plus attendre une fois le don fait et validé !
Ajout/Création : D'un message quand vous recevez de l'argent de poche entre joueurs !
Ajout/Création : D'une sécurité à la sauvegarde des véhicules quand vous venez de faire les terroristes !
Modification : Des bâtons lumineux réservés aux gangs !
Modification : Des messages de payes etc pour ne plus être spammé à la connexion !
Modification : Modification du nom du PNJ de drogue !
Correction : D'un bug sur le revive lors de votre reconnexion !
Correction : Du glitch sur la maladie dangereuse lors d'une déco reco !
Correction : De la discothèque !
Correction : D'un bug sur les valises !
Correction : De l'affichage de l'hélico gang !
Correction : Du petit saut qui ne pouvait parfois pas s'initialiser !





Version 4.01
Ajout/Création : D'une protection de sauvegarde qui oblige le véhicule d'être à l'arrêt !
Ajout/Création : D'une protection de sauvegarde contre les véhicules en feu !
Ajout/Création : D'un OffRoad SARL CAR SHOP !
Ajout/Création : D'une sécurité de spawn des véhicules au SARL !
Ajout : De véhicules compatibles à la SARL DDE pour le remorquage léger !
Amélioration : Du script pour donner de l'argent !
Amélioration : Du script des pompiers concernant les points restant sur la carte !
Modification : Des sauvegardes sur les véhicules HS !
Modification : Des sauvegardes des maisons qui fera des savs plus souvent !
Correction : Du nombre de places des hélicoptères de type LittleBird !
Correction : Du menu policier qui n'apparaissaient seulement quand deux civils étaient proche de votre position !
Correction : D'application des dommages lors du chargement d'un véhicule !
Correction : Du prix du littlebird armé !
Correction : Du prix du KA Gang !
Correction : D'un spawn voiture qui n'était pas à la bonne place !
Correction : D'un ancien radar fixe !




Version 4.00
Ajout/Création : Des chemlights aux GANG !
Ajout/Création : D'une nouvelle sauvegarde complètement recodée !
Ajout/Création : D'une sécurité à l'achat des maisons !
Ajout/Création : Les joueurs peuvent maintenant revive un blessé directement à l'un des deux hôpitaux (kit de soin obligatoire) !
Ajout/Création : Vous pouvez maintenant acheter un poignard !
Ajout/Création : Du système d'amende même hors ligne, concernant les véhicules abandonnés ou autres !
Ajout/Création : Des grenades fumigènes aux GANG !
Ajout/Création : D'un raccourci avec la touche P pour abaisser et augmenter le son in game !
Ajout/Création : D'un nouveau spawn de bateaux à Pyrgos !
Ajout/Création : D'un skin au littlebird pour le cartel !
Ajout/Création : D'un skin à l'orca pour le cartel !
Ajout/Création : D'un message plus (+) visible 10 minutes avant le redémarrage serveur !
Ajout : De véhicules compatibles avec le farming !
Ajout : De véhicules compatibles avec l'attache de la sarl DDE !
Ajout : De nouveaux modèles aux radars fixes !
Ajout : Du nouveau HQ du taxi G7 !
Ajout : Du nouveau HQ du gang Los Zetas !
Ajout : Du nouveau HQ du Car Shop !
Ajout : Du nouveau HQ du COS (avec TP automatique lors d'un décès) !
Amélioration : Diverses du Taser !
Amélioration : Du système déverrouiller des voitures de location !
Amélioration : Du système de spawn d'accidents !
Amélioration : Complète du système de skin des véhicules !
Amélioration : Du script des terroristes !
Amélioration : Du script pour donner de l'argent !
Amélioration : Diverses de véhicules !
Amélioration : Du spawn du marché noir !
Amélioration : Du script du centre d'entrainement pour éviter de perdre la fonction saut etc !
Amélioration : Du revive (rapidité, debug, etc) !
Amélioration : Diverses !
Amélioration (annulé): Amélioration du chargement des véhicules sauvegardés pour le rendre plus rapide mais un peu plus gourmand AU DEMARRAGE DE MISSION !
Modification : Modification du menu policier civil pour le rendre persistant proche de civil !
Modification : Pour éviter les bugs d'ouverture du sac à dos malgré qu'il n'y à pas de PNJ !
Modification : Grosse augmentation de la prime lors d'intervention sur un accident de la route !
Modification : Les gendarmes ne peuvent plus rentrer dans la fourrière !
Modification : La licence gang n'est plus accessible à tout le monde !
Modification : Du taxi hélico !
Modification : Diverses de la map !
Modification : De la paye des gendarmes !
Modification : De la paye donateur !
Modification : Des habits du psig qui n'étaient plus les même lors d'une déco reco !
Modification : L'effet du coup de poing dure moins longtemps !
Modification : Le serveur redémarre maintenant toutes les 5 heures !
Modification (annulé): Du CarShop !
Modification (annulé): Les véhicules avec les deux roues de devant HS ne sont plus sauvegardés !
Modification (annulé): Les véhicules qui ont le moteur HS ne sont plus sauvegardés !
Modification : De la portée du Taser de 11 à 20 mètres !
Correction : Du menu propriétaire qui ne s'affichait plus après un respawn !
Correction : Du prix des maisons qui pouvait vous indiquez ANY !
Correction : De la UAZ MG qui contenait 8 places !
Correction : Du script de remettre du fuel !
Correction : Du menu d'accessoires Gendarmes !
Correction : Du menu d'accessoires GANG !
Correction : Du silencieux 5.56 mm !
Correction : Lors d'un revive d'un gendarme celui mettait plus de temps avant de réapparaitre !
Correction : De la fourrière, les dépanneurs ne pouvaient pas rentrer dedans !
Correction : Des caisses de plongées qui contenaient des armes !
Correction : D'un glitch sur la réparation des véhicules !
Correction : Du PNJ du cimetière qui ne restait pas à sa place !
Correction : De l'opérateur drone qui n'était pas reconnu par le COS !
Correction : De l'hélicoptère taxi !
Correction : Du deverrouiller du véhicule de location !
Correction : Vous ne pouvez pas mettre de farming dans les véhicules de location !
Correction : De l'affichage du prix dans l'inventaire du véhicule de location !
Corrections : Diverses !
Optimisation : Diverses du mod !
Augmentation : Légère des prix du marché le temps du remaniement des prix !
Nettoyage : D'anciens scripts qui ne servaient plus (debug) !
Suppression : De la limitation munitions du littlebird armé gang !
Suppression : Divers objets de la map !





Version 3.9
Correction : Du système de sauvegarde pour éviter de perte des données !
Correction : De la sauvegarde des maisons !
Augmentation : Du temps de check des propriétaires !
Modification : De l'heure de la discothèque !
Suppression : De l'armement au HQ gendarme des box !
Suppression : De l'armement du hunter au HQ des gendarmes !
Ajout : La sarl dépannage peut maintenant savoir à qui appartient un véhicule !
Modification : Les joueurs non dépanneurs ne peuvent plus rentrer dans la fourrière !
Correction : Des skins qui pouvait disparaitre !
Correction : De PNJ qui partaient en courant lors de tirs !
Ajout : Nouveau HQ des Velentzas !
Correction : Du SOS chez le COS !
Suppression : Du fusil à pompe !
Ajout : D'un nouveau véhicule au gang !
Ajout : D'un nouveau véhicule au civil !
Modification : Des scripts du nettoyage serveur pour améliorer légèrement la charge du serveur !
Modification : Les véhicules avec plus de 40 pour cent de dégât ne sont plus sauvegardés !
Mise à jour : Des adons des avions !
Ajout : D'un menu au PNJ du marche pour connaitre les prix !
Ajout : Du sifflet chez les gendarmes (touche H à pied) !
Amélioration : Du SUV !
Création : D'un SUV Sport !
Modification : De la trajectoire du taxi hélico !
Modification : De l'emplacement du taxi hélico !
Modification : Du prix du permis de conduire pour les nouveaux joueurs !
Ajout : Nouveau système du permis de conduire ! (Plus vous l'achetez, plus vous le payerez cher !) !
Corrections et améliorations : Diverses !





Version 3.84
Correction : De nombreuses corrections ont étées appliquées (glitch, bug, etc) !
Amélioration : Revue entière du système de jerrican !
Ajout : De la fourrière à la SARL DDE !
Modification : Du plafond d'argent à 2 000 000 !




Version 3.83
Modification : Du système de sauvegarde des véhicules !




Version 3.82
Ajout : De la société Car Shop !
Amélioration : De la sauvegarde !




Version 3.81
Correction : De nombreux bugs !





Version 3.8
Création : Des sauvegardes automatiques des véhicules avec prise en charge de toutes les fonctions !
Modification : Du menu d'animation quand vous êtes menottez !
Amélioration : Des sauvegardes du joueur !
Amélioration : Les sauvegardes civils et flics sont maintenant différentes sauf pour l'argent qui reste commum !
Ajout : De l'achat de maisons !
Ajout : De l'achat de coffre fort !
Mise à jour : De certaines armes ! !
Modification : Des prix du farming !
Modification : Desactivation des sauvegardes de véhicules manuels !
Modification : Diminution du temps d'attente des interventions des pompiers !
Correction : Du bug au chargement lorsque vous possédez le sac farming votre inventaire n'était pas de 70 !
Ajout : Vous ne pouvez plus louer de voitures quand les taxis sont connectés !
Modification : Diverses de Neochori !
Corrections et améliorations : Diverses !
Ajout : Nouveau son du jeu !
Ajout : De toilettes et restaurant dans certaines stations services !
Ajout : De la liste des infractions !
Amélioration : Du temps de fatigue niveau 5 !
Ajout : De la valise de farming pour vous débarrasser en un clique de tout votre farming !





Version 3.7
Correction : Des menus invicible lors d'un revive par le smur !
Ajout : Vous ne pouvez plus taper un joueur lorsque vous etes menottez !
Correction : Correction de la tenu gendarme qui ne s'affichait pas !
Modification : Nouveau patron à la SARL AUTO ECOLE !
Ajout : De nouveaux fusils !
Amélioration totale : Du système de sauvegarde !
Correction : Lors d'une sav d'un avion, celui etait considéré comme un hélico !
Correction : Du bug de prison !
Correction : Du bug du menu policier !
Correction : De bug divers !
Modification : Vous ne perdez plus votre argent de poche en prison !
Ajout : Vous pouvez maintenant vous échapper de prison !
Modification : Le serveur redemarre maintenant toutes les 6 heures !
Ajout : Des cones à la SARL DDE !
Modification : Du prix des captures de CP !
Correction : Les véhicules en sauvegarde n'enregistré pas les dommages ainsi que le niveau de fuel !
Ajout : Vous pouvez maintenant acheter un bidon d'essence au super marché !
Ajout : Les dépanneurs peuvent maintenant remorquer les vélos !
Ajout : Vous pouvez maintenant mettre du farming dans la chevrolet !
Création : De l'entreprise TAXIS G7 !
Correction : De BUG divers !





Version 3.6 : Ajout de l'AK 47 au gang en plusieurs versions !
Modification : L'avion de ligne ne balance plus de son quand il se pose !
Correction : Beaucoup de joueurs n'arrivaient pas à nous rejoindre sur le serveur !
Amélioration : De la consommation de la chevrolet !
Amélioration : De la conduite de la chevrolet !
Amélioration : Du menu policier !
Amélioration : Augmentation de la distance d'affichage du bléssé une fois mort !
Amélioration : Du script pour menotter un joueur !
Ajout : Un message vous avertira en bas à gauche si vous possédiez ou non le launcher !
Modification : Du script de prison !
Correction : Les vélos n'apparaissaient pas en jeu !
Traduction : Du menu du Boeing !
Amélioration : Du SUV !
Amélioration : Du camion des dépanneurs !






Version 3.5 : Les nouveaux joueurs débute maintenant avec 10000 Euros !
Ajout : Du launcher !
Ajout : Modification de la plupart sons du jeu !
Ajout : D'un vélo avec prise en charge de la sauvegarde !
Ajout : De deux avions avec prise en charge de la sauvegarde !
Ajout : Des grenades flash !
Ajout : De l'arc !
Amélioration : Des véhicules d'arma !
Ajout : D'une herse aux gendarmes !
Ajout : De plus jolies barrières !
Ajout : De nouveaux véhicules !
Correction : Bug d'interprétation du script de l'or lors d'un chargement d'un véhicule sauvegardé !
Création : D'une arme taser fait maison !
Modification : Du prix de l'or !
Ajout : Nouvelle intro aux joueurs de moins de 10 minutes de jeu pour leur expliquer brièvement le fonctionnement de notre serveur !
Ajout : De vrai véhicules de location avec un moteur de 50 cc !
Ajout : Les addons sont sécurisés par clé cryptée !





Version 3.4 : Corrections lorsqu'un joueur était tasé, il pouvait se détaser avec le menu des animations !
Correction : Lors d'un revive, vous pouvez vous réanimez avec le menu des animations !
Modification : Du script de prison pour le rendre le moins buggué possible !
Amélioration : De quelques scripts des pompiers pour le rendre le moins buggué possible !
Ajout : Vous pouvez vous s'assoir sur divers objets (chaises, etc) !
Correction : Lors d'un chargement d'une sauvegarde d'un véhicule d'un dépanneur, il y avait un bug sur l'option attacher le véhicule !
Amélioration : Pour éviter la perte d'un véhicule lors d'une déco/reco !
Amélioration : Du script de mise en fourrière !
Modification : Du prix de la mise en fourrière !
Correction : Du menu faire pipi qui pouvait disparaitre !
Amélioration : Du script de skin de la sarl dépannage pour eviter que le skin ne s'applique pas !
Ajout : D'un lampadaire au HQ des velentzas !
Suppression : Des icones toilettes au SARL et FAMILLE !
Ajout : Les gendarmes ne peuvent plus sortir les joueurs si le véhicule est verrouillé !
Modification : De la console admin !
Modification : Du script du marché noir pour le rendre moins buggé !
Ajout : Du Farming D'or !






Version 3.3 : Corrections BUG divers !
Modification : Reactivation et amélioration du script des terroristes !
Modification : Nettoyage des scripts des addactions !
Ajout : Les pompiers peuvent maintenant vous réanimer !
Ajout : Vos véhicules ne prendront plus feu si il n y à pas de joueur de connecté !
Ajout : Les dépanneurs peuvent maintenant remorquer leur véhicule lourd entre eux !
Amélioration : Des menus attacher détacher de la SARL DEPANNAGE !
Ajout : La SARL DEPANNAGE peut maintenant treuiller des véhicules !
Ajout : Vous pouvez maintenant jouer des animations !
Ajout : Si un véhicule explose à la sauvegarde de l'airfield, vous ne prendrez plus de dégât !
Ajout : Les véhicules moteurs éteints ne pourront plus prendre feu !
Ajout : Des hatchbacks non sport à la gendarmerie !
Amélioration : Du script des pompiers pour éviter les flammes invisibles !
Modification : Les PNJ des pompiers ne sont plus qu'accessible qu'à eux seuls !
Amélioration : Du taser pour éviter que la victime meurt si plusieurs décharges envoyés !
Correction : Du script de la banque !
Ajout : Au bout de 3 amendes refusées, vous devez la payer obligatoirement !
Correction : La mutuelle ne remboursait pas l'argent de vos frais médicaux !
Correction : D'une faille d'argent sur la consultation du médecin !
Amélioration : Des performances du serveur !
Modification : La SARL DEPANNAGE s'appelle maintenant SARL DDE !





Version 3.21 : Correction BUG divers !
Annulation : Désactivation pour le moment du script des bots !





Version 3.2 : Correction du little bird armé des gangs !
Modification : La SARL DEPANNAGE à un nouveau HQ !
Correction : Lors d'un revive, en faisant soigné le patient le joueur était réanimé !
Correction : Lors d'un feu d'un véhicule d'un joueur, si celui explosé, les flammes n'étaient pas éteintes !
Correction et amélioration : Des scripts des pompiers !
Amélioration : LA SARL DEPANNAGE peut maintenant prendre des véhicules plus lourd sur leur Offroad !
Amélioration : Du script chargé et déchargé de la SARL DEPANNAGE !
Correction : Du menu attacher un véhicule de la SARL DEPANNAGE lors du chargement d'une sauvegarde d'un Offroad !
Création : De la chasse aux terroristes, toutes les armes peuvent être utilisées !
Correction : Le menu premier soin du revive pouvait être affiché pour tout le monde !
Amélioration : Vous ne prendrez plus de dommage à la banque une fois celle-ci explosée !
Modification : Vous pouvez maintenant être mis en prison pour 30 minutes !
Correction : D'une faille pour dépasser la limite de farming !
Correction : Le prix du cannabis et des pommes de terre n'étaient pas affichés dans le prix du marché !
Modification : Les prix des truffes, du lapin et du bois ont étés augmentés !
Correction : D'un bug sur la prison lors d'une déco reco !
Modification : Déplacement du farming pomme dans la foret !
Correction : D'un PNJ à GRAVIA qui était sur la route !





Version 3.1 : Correction de la disparition de la carte, boussole, etc au respawn !
Ajout : Des salaires aux nouveaux modérateurs !
Amélioration : Du script de feu d'incendie !
Correction : Les véhicules en pannes et en feu ne seront plus supprimés automatiquement !
Modification : Suppression et re codage des scripts de tirer, soigné etc du revive !
Correction : Des positions une fois mort pour les sarl et gang !
Amélioration et modification : Des radars fixes (vitesse, prix, etc etc) !
Modification : Les radars fixes passe de 90 à 130 Kms heures !
Modification : Des prix de la mutuelle !
Modification : Du prix de l'antibiotique !
Correction : D'une faille quand vous étiez en revive dans un véhicule !
Création : D'un nouveau système d'amende !
Ajout : Vous pouvez maintenant frapper des joueurs !
Modification : Le smur ne peut plus donner d'antibiotique au PNJ !
Correction de script divers !





Version 3.02 : Correction du freeze des incendies (du au script de revive ...) !





Version 3.01 : Correction de plusieurs bugs !





Version 3.0 : Modification de la couleur des incendies de la SARL POMPIER !
Ajout: Création des incendies des véhicules de joueurs !
Correction: Les skins des SUV et Offroad police ne ce charger plus !
Création: du COS en script !
Ajout: de véhicules au COS !
Correction: Lors d'un chargement d'un hunter HMG celui-ci n'était pas limité en munition !
Correction: Lors d'un chargement d'un vehicule pompier le skin était mal appliqué !
Correction: Lors d'un chargement d'un hélico de flic le skin était mal appliqué !
Modification: Certains menu avaient des listes trop courtes !
Correction: Du menu d'accessoires d'armes (décallage) !
Correction: D'exploit d'argent sur la nourriture, alcool et boire !
Correction: Les PNJ supérieur à DP3 n'avait pas l'option de finir une course !
Correction: Des donateurs qui avait un salaire fixé à 600 Euros en bluefor !
Modification: Des scripts de chargement et déchargement de la SARL DEPANNAGE !
Modification: Du script de remettre sur roue de la SARL DEPANNAGE !
Ajout: Si des dépanneurs sont connectés sur le serveur, les gendarmes ne pourront plus mettre en fourrière des véhicules !
Suppression: Le métier de dépanneur indépendant n'existe plus pour ne pas pénaliser la SARL DEPANNAGE !
Amélioration: Des sauvegardes et chargement des véhicules !
Ajout: Vous pouvez maintenant sauvegarder jusqu'à 4 véhicules (voitures) !
Ajout: Lors d'un cambriolage, votre indice de recherche sera réinitialisé automatiquement après un certain temps !
Ajout: Lors d'achat d'armes illégales, votre indice de recherche sera réinitialisé automatiquement après un certain temps !
Ajout: Lors d'un braquage de banque, votre indice de recherche sera réinitialisé automatiquement après un certain temps !
Ajout: De protection contre les tirs de RPG en ville !
Modification: De la distance d'affichage des pseudo au-dessus de la tête !
Création: En script du HQ des Chicos !
Création: En script du HQ des Cartel !
Amélioration: Pour les gangs, une fois respawn, ils seront automatiquement TP à leur HQ !
Amélioration: Lors d'un décès en entreprise, une fois respawn vous serez automatiquement TP à votre HQ !
Ajout: Le smur peut maintenant vendre des antibiotiques !
Modification: Déplacement du Petrole et augmentation de son prix !
Ajout: Renforcement des scripts du serveur pour éviter les vols !
Ajout: Lors d'un chargement d'un véhicule, si celui-ci explose, il sera automatiquement supprimé et remit en sauvegarde !
Ajout: D'un système de revive !!! (Merci à celui qui à eu l'idée !! ;))
Correction: Du menu groupe qui bugger !
Correction: Un bug disait que vous étiez trop loin de votre véhicule et vous ne pouvez plus réparer !
Ajout: Du canal chat Sarl Depannage !
Modification: Meilleur ajustement du menu chat !
Modification: Des prix des hélicoptères pour favoriser le terrestre !
Amélioration et correction: De scripts divers !





Version 2.9 : Correction du prix de la tenue de plongée civil !
Correction: les flics ne pouvaient pas supprimer les cones routiers !
Correction: les véhicules de locations n'étaient pas déclarés au SIV !
Correction: après avoir rendu un véhicule de location, le décompte était toujours affiché !
Correction: les véhicules de locations peuvent maintenant recevoir du farming par tout le monde !
Modification: augmentation de la distance pour éteindre un feu !
Ajout: Tu peux maintenant acheter une tente au supermarché pour dormir !
Ajout: D'un lampadaire à la SARL POMPIER !
Correction: Des joueurs exploités encore une faille d'argent !
Correction: Lors d'un chargement d'une sauvegarde de véhicule, un bug vous passer à travers !
Ajout: Création d'un pannel admin pour nos membres du staff !
Ajout: Création de la sarl Avocat !
Amélioration: Des menus de recrutement des SARL !
Amélioration: Du menu de la SARL Dépannage !
Ajout: Les dépanneurs peuvent maintenant remettre du gasoil dans vos véhicules !
Ajout: Des menus boire, manger, etc à la SARL Dépannage !
Ajout: Les skins des véhicules sont maintenant sauvegardés (voir forum) !
Ajout: Ajout d'un skin au OffRoad police !
Modification: Réduction du nombre de gendarmes obligatoire pour un cambriolage !
Modification: La sarl Dépannage peut maintenant retourné les véhicules avec 30 pour cent de dommage au lieu de 50 !
Amélioration: Lors d'un chargement d'un véhicule de sauvegarde, celui-ci pouvait ce décaler un petit peu, une modification à été faite pour éviter ce souci !
Modification: Le salaire de la SARL AUTO ECOLE à été augmenté !
Ajout: Création en script du gang Velentzas !
Ajout: Les donateurs possèdent d'office un salaire de 600 Euros !
Ajout: Le smur est immunisé d'office contre les vagues de microbes !
Modification: Du script de déploiement d'eau de la SARL POMPIER !
Correction: Des joueurs exploités une faille au chrysanthème !
Ajout: de nouveaux skins de véhicules !
Amélioration: Amélioration du temps de prison qui est maintenant affecté qu'au joueur et plus à tout les joueurs !
Amélioration: Les gendarmes peuvent maintenant poser 8 barrières !






Version 2.8 : Modification pour éviter que le SMUR meurt à leur HQ lors de l'explosion d'un bâtiment (bug texture bohémia) !
Ajout d'une zone safe à la banque pour éviter les soucis de kill sans raison (bug texture bohémia) !
Correction du cambriolage qui était toujours en débug !
Création complète du système des pompiers !
Ajout d'une sécurité aux sirènes des véhicules !
Correction lors d'un chargement d'un véhicule, celui-ci ne vous appartenez pas !
Modification du script de trésor !
Amélioration du script de braquage de banque !
Un minimum de gendarme est obligatoire pour faire une tentative de cambriolage !
Correction d'un bug sur l'horaire de la discothèque !
Création d'un script d'électricité sur Néochori !
Pour pouvoir réparer un véhicule, il vous faut maintenant un BEP mécanique auto !
Correction d'un bug lors d'un virement bancaire, certains joueurs ont exploité une faille !
Ajout de deux protections pour essayer d'éviter les explosions de véhicules aux chargements lors de bug de \sfp_divers\textures !
Augmentation des munitions de l'hélicoptère armé des gendarmes !
Correction sur la liste d'achat divers, argent était affiché deux fois !
Amélioration de la liste d'achats divers, elle est maintenant plus grande !
La gendarmerie peut maintenant choisir la couleur des grenades fumigènes !
Modification de la Sarl Depannage pour éviter que les attachent lors d'un remorquage ne ce suppriment plus !
En faisant partie de la Sarl Depannage, vous pouvez maintenant attacher plus de véhicules !
Amélioration de la Sarl Depannage, lors qu'un véhicule est attaché à la dépanneuse, il sera attaché un peu plus haut pour éviter d'avoir les roues dans le sol !
Ajout d'une météo local !
Vous pouvez désactiver la fumée des incendies grâce à la touche Y !
Augmentation du prix du toolkit pour favoriser la Sarl Dépannage !
Ajout de la date de naissance à l'inventaire !
Améliorations de tous les scripts de banque (suppression des gros virements, etc etc etc) !
Amélioration du spawn du marché noir !
Suppression du marché noir fixe !
Correction du radar Onze à Dorida !
Passage du radar à 50 devant la Sarl Depannage !
Ajout du pied de biche !
Vous devez maintenant avoir un pied de biche pour cambrioler les maisons !
Correction pour nos nouveaux gendarmes, ils pouvaient avoir le message qu'ils n'avaient pas de licence alors qu'ils en avaient !
Augmentation du prix du poisson jusqu'à fois 3 !
Correction de bug divers !
Corrections et améliorations de divers scripts !
Ajouts de nouveaux skins !






Version 2.7 : Le dommage minimum pour la détection du menu réparer un véhicule a été réduit !
La SARL dépannage peut maintenant réparer tous les véhicules !
La SARL dépannage peut maintenant réparer les véhicules avec plus de 65 pour cent de dégâts !
La SARL dépannage peut maintenant retourner les véhicules accidentés !
Les véhicules de location peuvent maintenant recevoir du farming !
Modification pour que le véhicule ne recoit plus de dégat lors d'un achat !
Correction, après une déco reco les véhicules ne vous appartenez plus !
Lors d'un cambriolage l'argent ne vous était pas ajouté si vous en avez trouvé !
Les couleurs n'étaient pas toutes les mêmes dans l'inventaire du véhicule !
Le farming des véhicules est maintenant sauvegardé !
Vous pouvez maintenant déposer des lingots de cuivre dans vos véhicules !
Vous pouvez maintenant déposer du cuivre non transformé dans vos véhicules !
Augmentation du prix des pommes pour les favoriser !
La prime des flics pour les accidents de voiture passe de 1000 à 2500 Euros !
Lors de la consultation d'un véhicule au SIV, si celui ci est inconnu il sera maintenant supprimé automatiquement !
Les cambriolages ne peuvent plus que se faire toutes les 20 minutes !
Vous pouvez savoir quand un joueur à cambriolé une maison dans son inventaire !
Le ifrit non armé passe de 50 000 à 130 000 euros puisque trop abusé !
Optimisation de script serveur !
Ajout de bande d'annonce in game !
Le timer de la banque passe de 600 secondes à 300 secondes !
Modification du script anti hack lors de gros virement !
Ajout d'hôtel et nourriture dans la SARL SMUR !
Si vous rencontré un souci avec votre inventaire qui affiche moins quelques choses, celui ci sera automatiquement réinitialisé !
Le smur possède maintenant une zone de sauvegarde d'hélico !
Le smur possède maintenant un nouveau véhicule !
Les gendarmes peuvent maintenant descendre en rappel avec le KA 60 !
Correction depuis la maj 1.10 de bohémia des erreurs apparaissaient à l'ouverture d'un menu !
Modification graphique, les menus de selection apparaissaient maintenant en rouge pour plus de visibilité !
Modification graphique, ajout de son dans les menus d'achats !
Lors de l'ouverture d'un menu, certain signe d'euro n'était pas affiché !
Ajout de Angel'ste Avocats à l'ANPE !
Liste des donateurs activé !
Ajout d'une sav bateau à Pyrgos !
Modification de la tenu de plongée des civils !
Modification de l'endroit du spawn de Aktinarki !
Augmentation du prix du Petrole !
Augmentation des ressources de l'ile au demarrage du serveur !
Correction de l'erreur de position de sortie de la prison quand vous braquez la banque !
Ajouts de nouveaux skins aux véhicules !
Modification des camions de la SARL DEPANNAGE !





Version 2.6 : Modification d'un script qui pouvait entrainer un écran noir à votre chargement !
Corrections des erreurs d'inventaires de véhicule lors d'un chargement d'une sauvegarde !
Modification lors d'un spawn d'un véhicule, celui ci pouvait avoir des dégâts !
Modification du script des Salvetta concernant l'ajout automatique d'habit !
Vous pouvez maintenant vendre vos véhicules !
Ajout d'un marché à Kavala !
Ajout d'un Hopital à Kavala !
Baisse du toolkit !
Ajout des jumelles chez les civils et les gangs !
Modification du nom de camion bâché à camion boxer !
Modification du prix du pickup armé !
Ajout du Ifrit non armé !
Ajout de la chasse au trésor !
Les nouveaux joueurs débute maintenant avec 3500 Euros !
Ajout d'une fonction panique pour les gendarmes avec la touche pagedown !
Création des cambriolages !
Remplacement du raccourci pour menotter !
Synchronisation de l'animation du taser !
Remplacement de l'arme du taser par le rook !
Synchronisation de l'animation du pipi !
Suppression du métier de médecin !
Ajout du canal SMUR au chat sms !
Mise en place du système de donateur sur le serveur !
Augmentation du prix des hélicos !
Création du marché noir aléatoire sur la carte !
Les gendarmes peuvent maintenant donner de l'argent !
Suppression de la banque à côté du marché noir !
Augmentation du prix du checkpoint 1 lors d'une prise de garde !
Les gendarmes peuvent maintenant choisir le temps de prison !
Correction lors de la sortie de prison vous ne pouvez plus appuyer sur la touche V !
Vous pouvez maintenant mettre les mains sur la tête avec la touche SUPPR !
Correction du bug de remise à zéro de l'inventaire quand vous possédez un sac à dos de plus gros farming !
Correction du bug de freeze des médecins depuis la dernière maj de bohémia !
Correction du bug de freeze lors d'un farming depuis la dernière maj de bohémia !
Vous pouvez maintenant sauter avec le niveau 5 du centre sportif !
Correction lors d'une fouille policière, il pouvait y avoir un souci lors de l'affichage du nom de la personne fouillé !
Lors d'une fouille policière, si vous avez plus de 200000 en banque, le policier ne le voit plus !
Correction du message d'hélico taxi qui s'affichait pour tous les joueurs !
Pour obtenir des aides publiques, vous devez maintenant vous déclarer en mairie !
Ajout d'un camion de transport de personne !
Amélioration du chargement de la mission de plus de 70 pour cent !
Les radars fixes flashent maintenant à partir de 55 et 95 Kms heure !
Ajout du menu pour régler la qualité graphique avec la touche Y !
Correction de la duplication des armes !
Correction de la duplication des lunettes !
Ajout de gilet par balles au flics et civils !
Corrections diverses !





Version 2.5 : Correction d'un bug qui vous essoufflez quand vous étiez dans un véhicule !
Vous pouvez maintenant savoir quelle mission vous à proposez l'ANPE !
Création en script de la société SARL AUTOECOLE !
Le permis de conduire léger est maintenant plus cher sans passer le permis chez SARL AUTOECOLE !
Vous pouvez savoir maintenant pour qui vous travaillez dans votre inventaire !
Les flics peuvent savoir pour qui vous travaillez !
Vous ne pouvez maintenant plus travailler pour plusieurs entreprises SARL !
Modification du décor de la SARL SMUR !
Correction du script pour courir, une variable était cassée seulement pour les modérateurs !
Correction du script pour courir, les joueurs ne pouvaient pas monter en aptitude !
Correction du PNJ banque à l'aéroport qui affichait le menu 3 fois !
TOUS les véhicules spawn maintenant à 1 mètre du sol pour essayer d'éviter les bugs de texture !
Correction du freeze lors du chargement d'un véhicule concernant votre sauvegardé !
Les menus de tous les joueurs travaillant dans une entreprise ont étés allégés !
Modification du type d'hélico au décor de l'aéroport !
Création d'un script pour éviter le vol dans les sacs des joueurs !
Création d'un script pour éviter le vol dans les véhicules avec option bloquée débloqué !
Création en script du gang des Salvetas !
Correction du QG des flics lorsque un civil le survoler il était TP !
Création de la CAF (Caisse d'allocation familiale) !
Modification des scripts de banque, paye et RSA !
Nouveau logo d'accueil, merci à toto !
Ajouts de nouveaux points de sauvegarde !
Ajout du ranger master à l'achat !
Modification des équipements de base des policiers simples !
Création de la mutuelle Altis, qui vous remboursera vos frais de santés !
Augmentation du délai de détection des bateaux pour la sauvegarde !
Ajout de la nourriture, faim, hotel au HQ police !
Corrections des menus de sauvegarde qui n'apparaissaient plus après votre mort !
Baisse du prix du toolkit !
Correction du message de réparation des bateaux qui indiquait 90 000 Euros au lieu de 50 000 Euros !
Création d'un script de réparation des véhicules avec pas mal de fonctionnalités !
Amélioration de l'intro pour qu'elle soit plus lisible !
Ajout d'un spawn d'achat de véhicule à Kavala !
Ajout du raccourci pour menotter un civil !
Ajout de nouvelle protection anti copie !
Correction du menu banque au DP7 !
Modification des messages lors d'une action de menottage !
Ajout de nouveaux points de véhicule de location !
Ajout d'un skin aux hélicoptères civils !
Ajout de skin policier au quad des flics !
Les gangs ont maintenant un habit différent !
Modification du spawn des hélicos au QG flic !
Le menu reparer dans une zone de réparation n'apparait maintenant qu'en tant que conducteur !
Modification des skins des ambulances !
Les policiers peuvent maintenant intervenir sur un joueur déjà menotté !
Vous ne pouvez plus controler l'hélico taxi !
Modification de l'heure in game pour les cycles jour/nuit !






Version 2.4 : Modification réseaux pour une meilleure optimisation de bande passante !
Optimisation de code pour une moins grande perte de FPS PHASE 1 !
Correction du spawn d'arme dans les véhicules accidentés lors de mission de gendarmerie !
Ajout d'une protection contre le vol dans les sacs à dos lors d'une nuit à l'hotel !
Création en script de la société SARL DEPANNAGE !
Création en script de la société SARL SMUR !
Agrandissement de la fenêtre du chat !
Correction de l'erreur d'endroit quand vous souhaitez rendre un véhicule de location !
Pour les medecins, obligation d'avoir un kit de premier soin sur vous pour soigner des joueurs !
Correction d'un radar fixe qui flashait à 50 au lieu de 90 Km/heure !
Correction des couleurs de fond des logos alcool et dormir qui étaient plus clair que les autres !
Ajout d'un nouveau logo pour connaitre votre fatigue !
Le serveur redémarre maintenant tout les 6 heures !
Création d'un système d'endurance complet pour plus de RP pour nos policiers !
Ajout d'une whitelist pour eviter au civil de se connecter sur les slots flics civils !
Correction d'un bug quand vous donniez un objet du supermarché à un joueur !
Ajout de redbull au super marché pour lutter contre la fatigue !
Ajout de bruit quand vous mangez une barre de céréale, buvez une bouteille d'eau et redbull !
Modifications diverses du script pour boire et manger !
Modifications du message d'accueil !
Correction des medecins qui pouvaient reparer les véhicules !
Le SMUR n'est pas flashé aux radars Fixes !





Version 2.3 : Ajout de l'achat d'une hache !
Vous devez possédez une hache pour couper du bois !
Création d'une animation dynamique suivant l'endroit de la récolte !
Ajout de l'achat d'une canne a peche !
Vous devez possédez une canne a peche pour pecher !
Ajout de la vente de sac à dos dans les supermarchés !
Ajout de l'achat du harpon !
Vous devez possédez un harpon pour pecher la baleine et le requin !
Ajout de l'achat de gant !
Vous devez possédez une paire de gants pour prendre du Petrole !
Création complète d'un système dynamique de marché pour l'emploi avec école etc !
Ajout d'école sur la carte !
Ajout d'agence ANPE sur la carte !
Correction d'une faille qui permettais d'avoir la faim et la soif à plus de 100 !
Correction de la prison !
Augmentation du prix pour soudoyer le garde de prison !
Augmentation du temps avant de tomber malade !
Quand vous envoyez en prison un civil, si celui ci est attaché à vous il sera automatiquement détaché !
Correction lors d'une réparation de véhicule, deux toolkits étaient supprimés au lieu d'un seul !
Correction lors de l'annulation d'un saut en parachute celui ci remboursé deux fois !
Ajout du métier salarié d'EDF !
Ajout du métier salarié tondre le gazon !
Modification de plusieurs noms de PNJ affichés sur la carte !
Modification du message d'intro !
Modification d'un paramètre du système de marché !
Modification du sac à dos de la banque par une valise !
Augmentation du délais de la maladie, soif, nourriture, pipi et dodo !
Ajout d'une protection contre les décos volontaires quand vous êtes menotté !
Correction du spawn de l'achat des bateaux en ville !
Suppression de l'affichage des civils sur la carte !
Modification du prix de l'héroine !
Ajout de la MX !
Baisse du prix du taser !
Ajout du 4 Five !
Augmentation du plafond d'amende !
Optimisation du serveur pour un lancement beaucoup plus rapide de la carte !
Optimisation du serveur pour eviter les deconnections instantanné des joueurs !






Version 2.21 : Correction du script pour dormir !
Correction d'un bug d'argent !
Correction des erreurs de numeros de checkpoints lors d'une prise de gang !






Version 2.2 : Correction du menu mettre en banque qui n'apparaissait pas !
Remplacement des termes Stratis par Altis !
Sauvegarde de la maladie pour eviter les USEBUGS !
Correction de la téléportation quand un civil rentrer dans le QG des flics !
Correction du PNJ de banque qui partait !
Augmentation de la chance pour pouvoir braquer la banque !
Création de missions d'accidents aléatoires sur l'ile pour nos gendarmes !
Ajout de 14 nouveaux points de livraison !
Le montant maximum du livret A est de maintenant 30 000 Euros mais rapporte moins en interet !
Modification du système de virement bancaire, vous avez maintenant des frais sur vos virements !
La faim, la santé, la soif et la nourriture sont maintenant sauvegardées !
Vous pouvez maintenant acheter des barres de céréales et en donner !
Vous pouvez maintenant acheter des bouteilles d'eau et en donner !
Ajout du supermarché dans les grandes villes !
Ajout de nouvelle zone de réparation !
Ajout d'une animation quand vous farmez !
Le changelog est maintenant directement accessible en haut à gauche sur la carte !






Version 2.1 : Ajout du farming de médicaments !
Ajout du farming de traffic d'organes animaux !
Corrections des PNJ du transfo cuivre et camp d'entrainement qu'ils partaient en courant !
Création d'un script pour éviter les erreurs de compte bancaire à 1500 Euros !
Modification du menu pour vendre son matos !
Création du livret A bancaire !
Vous pouvez maintenant donner de l'argent de poche directement à un joueur face à vous !
Vous pouvez maintenant être immunisé contre la vague de microbe en achetant un antibiotique chez le medecin !






Version 2.01 : Correction du message que vous roulez sans permis lors d'une location de voiture !
Réorganisation des index d'icones !
L'hopital est maintenant au rez de chaussée !
Correction des radars à 90 Km/Hs !
Augmentation des ressources de la ville !
Augmentation du délais du pipi, nourriture, dormir etc !
Correction du menu de transformation du Petrole !
Correction de tous les erreurs des hotels !
Faire pipi et maintenant plus rapide !
Formation Héroine Réparer !
Certains farming sont maintenant plus proche !
Ajouts de nouvelles boutiques de véhicules !
Ajouts de nouveaux médecins sur la carte !
Ajouts de nouvelles zones de réparation !
Ajouts de nouveaux PNJ de nourriture !
Correction du menu de transformation d'héroine !
Ajout du farming de cannabis !






Version 2.00 : Passage sur Altis !
Les flics peuvent maintenant créer des barrages de police avec des objets !
Refonte entière du système de marché !
Vous ne pourrez plus manger et boire quand les ressources de l'île seront épuisées !
Ajout du farming de sel !
Ajout du stockage de sel au joueur !
Ajout du stockage de sel aux véhicules !
Le message de l'hélico taxi est affiché maintenant que pour les joueurs en ville !
Modification de l'hélicoptère taxi !
Ajout du farming de pomme de terre !
Ajout du stockage de pomme de terre au joueur !
Ajout du stockage de pomme de terre aux véhicules !
Corrections de script divers !
Modification de la musique de la discothèque !
Les civils voient désormais la position de tout les civils !
Le serveur redémarre maintenant tout les 15 heures !
Ajout d'une hatchback sport de police !
Ajout d'un SUV de police !
Agrandissement du menu d'achat de véhicule !
Ajout d'un SUV Ambulance pour les médecins !





Version 1.51 : Ajout d'une intro !
Modification script anti hack !
Correction menu faire pipi disparaissait après un respawn !
Amélioration de l'action pour faire pipi !
Correction du bug pour pouvoir farmer en illimité !





Version 1.5 : Modification du menu des flics !
Quand vous démenottez un civil, celui ci est automatiquement détaché de vous !
Modification de la touche de raccourci du radar mobile !
Ajouts de slots PSIG !
Vous pouvez maintenant vendre du matos entres joueurs !
Le menu inventaire et vendre matos restent désormais toujours en top liste !
Habbit différent après chaque mort pour les civils !
Ajout d'un gyrophare à la dépanneuse !
Ajout d'une nouvelle tenue !
Ajout du Zubr 45 pour les gangs !
Modification des tenues du SPIG et des flics simples !
Correction des habbits qui ne se changeait pas quand vous faisez flic/civil !
Augmentation du prix de la récolte de l'héroine !
Vous savez desormais de qui provient l'argent des virements !
Création du système de SMS !
Modification du message de mission terminée concernant les whitelists !
Correction bug du message d'inventaire farming : Je bug, signaler le à l'admin !
Agrandissement du menu habbit !
Correction du bug pour deverrouiller les helicos !
Amélioration du script de banque + mise en place d'un timer !
La personne est automatiquement déttaché de vous lors de la mise en garde à vue !
La personne est automatiquement déttaché de vous lors du démenottage !
Modification et amélioration de script divers !
Modification des noms du requin et baleine !
Amélioration de l'animation du menottage !
Amélioration du script de menottage !
Réorganisation du menu déroulant !
Amélioration du script quand vous mettez un joueur menotté dans un véhicule !
Amélioration du script du tazer !
Déplacement du PNJ de location de véhicule !
Ajout d'une dépanneuse légère !
Ajout de nouveaux skins aux véhicules flics et dépanneuse !
Les indépendants ne peuvent plus rentrer dans le QG flic !





Version 1.42 : Améliorations diverses de scripts !
Modification erreur d'argent hack !





Version 1.40 et 1.41 : Correction PBO Serveur !
Modification raccourci CAPSLOCK par la touche Inférieur/Supérieur pour deverrouiller vos véhicules ! !
Vous pouvez de nouveau locker votre voiture de l'intérieur !
Les skins ne s'appliquent maintenant que sur certains véhicules policier !
Corrections diverses !
Modification du temps de la maladie !
Grosse modification du système de sauvegarde des véhicules !
Votre inventaire de farming est maintenant sauvegardé !
Modification complète du système de verrouillage de vos véhicules !
Ajout d'alarme sur les véhicules !
Correction des erreurs de respawn civil !
Ajout de protection contre le vol du mod !
Ajout d'un nouveau sac à dos qui augmente votre espace de farming !
Amélioration du script pour faire pipi !
Correction d'erreur RPT !
Correction du bug d'argent qui vous faisiez revenir à 1500 Euros !
Correction/modification/amélioration du script de réparation de véhicules !
Correction du menu réparation qui n'apparaissait pas sur les véhicules d'un chargement d'une sauvegarde !
Ajout de skins aux véhicules de police !
Vous ne pouvez maintenant que reparer les éléments jaune de votre véhicule avec le toolkit !
Ajout du raccourci CAPSLOCK pour deverrouiller vos véhicules !
Les véhicules ne se déverrouille plus automatiquement quand vous y en sortez !
Correction de divers boggues !
Ajout de lumière à l'hopital !
Augmentation du salaire des flics !
Ajout d'un fast food au centre de Stratis !





Version 1.37 : Modification des messages qui s'affichaient au milieu de l'écran !
Ajout d'un système de location de véhicule !
Vous pouvez maintenant sauvegarder un bateau, un hélico et une voiture !
Modification des couleurs de certains nouveaux logos !
Ajouts de 11 maladies possibles !
Ajout de l'affichage des noms des joueurs !
Correction BUG affichage du menu policier !
Ajouts de couleurs aux quads !
Ajouts de panneaux publicitaires !






Version 1.36 : Les radars ne flashent désormais plus que le conducteur !
Ajout d'un hélico taxi automatique !
Création de script anti hack propre au serveur pour empecher les hacks d'argents !
Nouveaux logos des indications en jeu !
Vous pouvez êtes maintenant recherché pour conduite sans permis !
Correction d'un bug d'affichage du menu d'indication lors de chiffre supérieur à 6 !
Le menu du farming des véhicules est maintenant accessible qu'au civil !
Ajout du menu CONTENU FARMING VEHICULE pour les policiers !
Correction de la whitelist !




Version 1.35 : Vérification du sac à dos quand vous achetez une tenue de plongée !
Modification total du script de réparation de véhicule !
Réactivation de la sauvegarde des uniformes !
Suppression automatique de votre tenue de plongée (si vous la possédez) à votre respawn !
Correction d'affichage de liste du civil 57 !
Suppression de la météo !
Correction prix du permis de conduire !
Correction de la réinitialisation des stats nourriture etc lors du respawn flic !
Augmentation de la distance du taser !
Modification de l'arme du taser !
Ajout d'un toilette publique au ckeck 1 !
Les radars fixes flashent desormais à partir de 53 Km H !
Modification du prix des radars fixes !
Correction des toilettes qui disparaissaient !
Amélioration du script pour dormir !
Amélioration du système de SIV !
Nouvelle animation quand un medecin soigne un joueur !
Ajouts de lampadaires au checkpoint 1 !





Version 1.34 : Desactivation du channel global pour nos petites oreilles !
Ajout d'un camp d'entrainement !
La license du permis de conduire leger coute maintenant 7500 Euros !
Ajout du métier de médecin !
Correction des messages sur fond noir qui étaient affichés sur d'autres messages !
Ajout d'un slot whitelist pour les flics en civil !
Amélioration du script des toilettes !
Vous pouvez maintenant réinitialiser votre inventaire de farming au marché !
MAJ Whitelist !
Correction de l'heure du redémarrage automatique du serveur  !




Version 1.331 : Correction erreur PBO Serveur (Merci à DJO45 !) !




Version 1.33 : Ajout du systeme de toilettes !
Ajout de toilettes publiques !
Modification des scripts de nourriture, eau et alcool !




Version 1.32 : Correction de divers boggues !
Retour des SFP après divers petit et gros soucis !
Modification de la météo toutes les 10 minutes !
Renforcement de scripts et base de données pour éviter les vols du mod !
La whitelist ce fait maintenant en temps réel !
Correction du message concernant l'inventaire : Vous n'avez aucune license ...
Ajout du permis à points !
Correction du radar fixe en ville !
Amélioration des radars fixes !
Correction de l'affichage du nom des joueurs dans les véhicules !





Version 1.31 : Passage des barrières de l'aéroport en manuel !
Correction du bug multi concernant le keypressed !
Les avis de recherches sont supprimés quand vous vous prenez une amende !
Les véhicules de police sont maintenant bleu !





Version 1.3 : Ajout du métier d'éboueur !
Les véhicules se verrouillent automatiquement quand vous y en sorter !
Vous pouvez maintenant mettre le farming dans certains véhicules (pour le moment) !
Ajouts de nouvelles couleurs pour les quads !
Déplacement de la boutique armes à l'aéroport !
Déplacement des armes illégales !
Ajout du parachute !
Ajout du pickup armé pour les gangs !
Ajout des raccourcis clavier !
Ajout du saut en parachute !
Ajout de la météo !
Modification des triggers portails de l'aéroport !
Ajout d'une mitraillette chez les flics !






Version 1.21 : Correction de votre remise en garde à vue après votre sortie !
Corrections des habits du SPIG !
Correction du menu mettre en garde à vue qui ne se supprimer pas !
Corrections diverses !
La licence des gangs re fonctionne !
Vous ne pouvez plus sauvegarder vos véhicules au spawn civil !
Possiblité de mettre une amende à un joueur ne portant pas de casque en quad !





Version 1.2 : Modification de la paye !
Ajout de la garde à vue !
Améliorations/Corrections diverses !
Création de la BAC (Brigade Anti Criminalité) !
Correction le menu attacher/detacher n'apparaissait pas lors d'une restauration de sauvegarde concernant la dépanneuse !
Modification de la soif/faim/sommeil !
Modification de la sauvegarde !
Ajout du farm de cuivre !
Ajout du farm requin !
Ajout du farm pommes !
Modification des prix du farm !
Modification des prix des armes illégales !
Modification de la license des gangs !





Version 1.1 : Amélioration du script de sauvegarde des véhicules !
Vous pouvez maintenant soudoyer le garde de prison pour 50 000 euros !
Correction message des amendes !
Correction test alcoolémie !
Ajouts de nouveaux habits !
Les casques, casquettes, etc sont maintenant sauvegardés !
Les flics peuvent maintenant savoir à qui appartient les véhicules !
Modification : Une fois menotté, vous pourrez bouger et parler à nouveau dans 20 secondes !
Vous devez maintenant aller jusqu'en prison pour y mettre un prisonnier !
La fatigue descend moins rapidement !
Amélioration du menu Attacher/Detacher !
Amélioration du menu gyrophare !
Ajout lampadaire à l'auto école !
Modification de la sirène de police !
Correction du bug de la sirène qui restait allumée si vous ne l'éteignez pas quand vous rentrez de nouveau dans un véhicule !
Correction des comptoirs qui étés supprimés automatiquement lors du nettoyage du serveur !
Création de la française des jeux !
Modification des couleurs de l'inventaire civil !
Modification disposition de l'inventaire flic !
Lors d'une arrestation, vous pouvez mettre le prisonnier dans un véhicule !
Correction : Les missions de patrouillent flics n'étaient pas affichées dans l'inventaire si la mission était supérieur à 4 !
Correction : A la sortie de prison, l'espace utilisé ne se remettait pas à zéro !
Les flics qui ont fait une demande de whitelist ne peuvent plus joindre les civils sauf sur les slots 58 59 et 60 !
Création d'un métier de dépannage. Vous pouvez aller chercher les véhicules en pannes pour les réparer !







Version 1.00 : Modification du prix du LRR !
Vous pouvez chasser le lapin sans license (illégal) !
Modification du prix des matières !
L'inspecteur du permis de conduire peut désormais supprimer le véhicule endommagé !
Le hunter armé des flics est maintenant deux fois plus cher avec un peu plus de munitions !
Ajouts des nouveaux véhicules de la version 1.00 !
Ajouts des nouveaux bateaux de la version 1.00 !
Modifications diverses !
La rampe du véhicule de police est maintenant activé et toujours actif !
La baleine rapporte moins puisque vous avez maintenant des bateaux rapides !
Modification de l'arme du taser !
Une fois menotté, vous ne pouvez plus bouger !
Mise en place du système des amendes !
Une fois taser, vous ne pouvez plus bouger pendant quelques secondes !
Suppression de la musique du bar ! C'est elle qui faisait lagguée le serveur après quelques minutes !
Ajout du sous marin chez les flics !
La license du permis de conduire passe à 60 000 Euros !
Correction, vous etez toujours recherché à la sortie de prison !
Correction, vos items étaient toujours sauvegardés en prison !
Les tenues de plongées sont maintenant sauvegardées ! Attention plus d'abus avec les habits ou ce sera de nouveau supprimé !
Ajout du permis poids lourds !
Modification des prix des licenses !
Le temps pour le braquage de banque à été réduit de moitié !
Le script pour remettre de l'essence à été amélioré !
Vous ne pouvez plus remettre de l'essence à la station service avec votre hélicoptère !
Les salaires ont étés augmentés !






Version 0.921 : Hotfix correction BUG alcool !








Version 0.92 : Ajouts de groupes chef par default pour les flics et GIGN !
Ajout d'hotel pour dormir,manger et boire un peu partout !
Correction du prix du LRR chez le GIGN !
Correction du bug de bannissement lors de votre retour de prison !
Correction BUG banque, les braqueurs pouvaient se cacher dans les bacs de sables sous l'échelle !
Vous savez maintenant pourquoi vous êtes recherché !
Ajouts des ouvertures de barrières séparées aux checkpoints !
Il n'y à désormais plus de slots publics car beaucoup trop d'abus !!!
Revue du prix de la ceinture de c4 pour les gangs !
Mise en place des checkpoints pour les gangs !
Revue des prix des checkpoints !
Le DJ de la boite danse maintenant également !
Vous pouvez maintenant proceder à des controles d'alcoolémie !
Vous pouvez maintenant boire de l'alcool au bar ! Attention aux effets !!!
Correction du bug de l'héroine lors de la vente, votre inventaire était mal vidé !
Ajout d'un centre de formation pour le permis de conduire !
Augmentation du prix de la baleine !
Vous devez maintenant posséder une license de chasse pour chasser le lapin !
Le choix du braquage de banque est maintenant aléatoire !
Ajout du métier de maire !
Ajout du métier d'examineur du permis de conduire !
Ajout des modérateurs sur le serveur !
Le serveur redémarre automatiquement tous les jours à 6 heures du matin !
Les joueurs en attente dans le hall, seront kické après 10 minutes d'inactivité !
Ajout d'un RCON serveur, j'ai maintenant l'oeil sur le serveur !
Correction du spawn hélico à l'aéroport !
Correction du spawn véhicule à air station !
Suppression du spawn hunter à l'aéroport !
Vous ne mourrez plus si un joueur vous tue en dormant !





Version 0.911 : Hotfix amélioration de l'anti AFK !
Modification du script pour dormir et de son prix !
Hotfix Correction du spawn avec un stuff pour le GIGN lors de votre première sauvegarde !
Modification de la réparation des véhicules au garage station service, arma avait encore une fois du mal à interpreter le script !
Amélioration de la config du serveur niveau 2, il devrait mieux tourner !





Version 0.91 : Hotfix correction bug anti campement et bug quand vous êtes envoyé en prison !




Version 0.90 : Essai de correction BUG Katiba !
Correction du bug message de la réparation bateau au port !
Correction du temps de suppression du sac à dos du cimetière quand vous n'êtes plus sur zone !
Suppression de l'objet sous la tour proche de la banque !
Modification de la sirène des flics pour en mettre une francaise !
Synchronisation de l'heure pour tous + journée et nuit plus rapide !
Ajout des jumelles télémétriques chez les flics et gangs !
Modification des scripts de réparation et refuel concernant les problèmes d'apparition des menus actions !
La réparation des hélicos est maintenant moins cher !
Ajout du système des gangs !
Diminution des munitions des véhicules armés !
Modification de divers prix !
Modification du sac à dos !
Modification diverses d'objets !
Ajout d'un hélico armé chez les flics !
Ajout d'une boite de nuit !
Modification du gyrophare pour un meilleur rendu de loin !
Modification du checkpoint 2 !
Correction et modification de la soif et de la faim !
Modification du script de banque, il faut minimum 4 flics pour pouvoir la braquer désormais !
Les véhicules sont maintenant supprimées au bout de 3 heures et plus 2 heures !
Ajout d'un véhicule non banalisé chez les flics !
Modification de l'effet du taser de 7 secondes à 14 secondes + augmentation de la distance d'effet !
Ajouts d'arrets de bus et d'un lampadaire sur l'aéroport !
Correction icone de la vie !
Création et mise en place de la fatigue, il faut maintenant dormir !
Vous pouvez maintenant convertir vos poissons en poissons panés pour gagner plus d'argent ! Attention les prix sont variables et le script est donc sécurisé !
Protection Hack contre les tricheurs et hackeurs !
Protection contre l'AFK ! Sanction sévère si vous ne bougez pas régulièrement !
Passage à 1 slot public flic et 1 slot public GIGN !
Amélioration de la sauvegarde, quand un véhicule est sauvegardé en étant HS, il ne respawnera plus lors de votre reconnexion!
Amélioration de la config du serveur, il devrait mieux tourner !
Amélioration des différences entre GIGN et policier !
Amélioration des différences d'armes chez les civils !
Ajout whitelist GIGN seulement pour les habitués !
Modification script de banque pour supprimer le sac d'argent quand vous mourrez !
Modification des prix des armes et munitions !
Prise en compte désormais des véhicules civils pour téléportation lors de leur entrée dans l'espace des flics !
Nouvelle mission au DP3 !
La discothèque est disponible également sans musique pour que vous puissiez y mettre la votre ;) !








26/08/2013 : Les véhicules inutilisés pendant 2 heures seront automatiquement supprimés !
Nettoyage du script de la sauvegarde des véhicules !
Augmentation du son du taser !
Diminution du son des terroristes lors d'une capture de point !
La banque peut être braqué plus facilement !
Correction lors de votre sortie de prison vous êtiez toujours recherché !
Vous pouvez maintenant former des groupes !





25/08/2013 : Hotfix du beug hack transmis a maxou !
Amélioration du script prison pour les évadés !
Correction du spawn des armes dans les véhicules !
Ajustement des prix des livraisons !
Ajout d'une zone réparation bateau au port !





23/08/2013 : Correction menu divers centre commercial !
Modification du script de banque car trop d'abus !
Sac d'argent desormais supprimé quand vous mourrez lors d'un braquage !
Correction deverouiller du bateau d'assault des flics !
Les missions de patrouillent pour les flics sont maintenant fonctionnelles !
Création du script bus pour gagner de l'argent ! (En beta)
Réajustement du prix des checkpoints !
Mise en place de la fonction RECHERCHE ;) !








22/08/2013 : Modification du script serveur pour eviter le freeze rencontré !
Correction de la sirène et du gyrophare !
Vous payez désormais des impots !
Correction du menu flic qui apparaissait deux fois !
Création d'un script pour la suppression auto des véhicules brulés !
Correction du drapeau du bus qui ne disparaissait pas quand le véhicule était HS !
Modification script réparation par Toolkit !
Ajout d'un message d'accueil pour signaler les modifications à prévoir !
Ajout d'un mur sur le spawn des flics pour eviter les kills ennemis !
Les terroristes peuvent maintenant reparer leur helicoptère sur le spawn d'achat d'hélicos !
Ajout de l'achat de véhicules à Kamino et Air Station !
Ajout des bateaux de combat chez les flics !
Correction du message de l'inventaire, vous n'avez pas de Licences !
Amélioration du script de banque !
Amélioration des scripts des flics !
Ajout d'une zone de réparation à la station service !
Modification du prix du ifrit armé et du KA 60 chez les terros !
Modification des prix de collecte !
Suppression des prix des checkpoints sur la carte !
Revue à la baisse des prix des checkpoints chez terros !
Correction direction lampadaire à la pompe à essence !





19/08/2013 : Sauvegarde désormais les medikits, toolkits, FirstAidKits, etc !
Réduction du nombre de terroristes à 6!
Améliorations de divers scripts !
Ajout de la whitelist !





16/08/2013 : Correction de la somme d'argent lors d'un braquage !
Ouverture des portails directement depuis les miradors !
Ajout de la sauvegarde des véhicules !
Ajout de la sauvegarde des viseurs, silencieux, etc !
Correction message d'erreur lors de la prise de controle du chekpoint 2 !
Correction de la sauvegarde des terroristes !
Ajout d'une formation obligatoire pour transformer l'héroine !
Correction et modification de l'espace utilisé lors de la vente de poissons, heroine, etc !
Correction du script d'impossibilitée d'attacher les terroristes !
Corrections diverses des traductions !
Arme désormais obligatoire pour braquer la banque !




14/08/2013 : Correction du script pour extraire civil d'un véhicule !
Ouverture des portails automatiques à l'approche !
Ajout d'un parking payant pour les hélicos !
Ajouts de mines à la pêche à la baleine !
Gyrophare ajouté aux véhicules de police !
Recodage du script des policiers pour fouiller les personnes !
Vous pouvez maintenant reparer les hélicos à la base des flics !
Correction inventaire terroriste quand vous n'avez pas de license !
Ajout de la sauvegarde de votre équipement, argent, etc !!!
Tu peux attachés des chemlights sur toi pour voir la nuit  !
Ajouts de chemlights la nuit sur certains endroits !
Vous pouvez maintenant deposer de l'engrais au cimetière !!!
Ajout de lampadaires sur toute la carte !
Amélioration script menotte !
Correction spawn helico terroriste !
Correction des scripts d'achats sur Camp Rogain !
Correction du script de réparation hélicoptère !
Amélioration sirène de la police !
Amélioration script escorter les prisonniers !
Ajout des jumelles chez les policiers !
Les flics ne se prennent plus de prune aux radars !
Correction prix des Licences !
Les joueurs dans les spawns ne recoivent plus de dégats !





10/08/2013 : Correction du script pour extraire civil d'un véhicule !
Ajout d'un dialogue expliquant le mode du serveur au setup du player !
Correction boutique vetements !
Correction boutique armes munitions !
Correction message radar fixe !
Modification des scripts menotte et prison !
Vous pouvez maintenant escorter les prisonniers !




05/08/2013 : Correction d'erreur de traduction !
Ajouts de radars fixes ... Attention au porte feuille !
Ajout d'un mode kamikaze chez les terroristes !
Corrections des scripts d'achats des terroristes !
Correction du spawn véhicule des terroristes !
Correction de l'erreur de script quand vous ne selectionner par un véhicule pour la mise en fourrière !
Ajout d'un medecin un petit peu fou en ville !
Ajouts de nouveaux terroristes !
Amélioration du script de banque !
Corrections d'erreurs de scripts (licences, respawn, etc)!
Ajout d'un radar mobile pour les policiers !
Augmentation des salaires !
Ajout d'une zone terroriste au nord de la carte !
La faim est maintenant activé !
Modification des skins des véhicules de police !
Vitesse limitée en véhicule civil dans le village pour éviter les accidents !





31/07/2013 : Tu peux maintenant chasser le lapin !
31/07/2013 : Quand tu es policier, recois de l'argent lors d'une mise en fourrière !
31/07/2013 : Tu recois désormais une paye chaque mois !
31/07/2013 : Quand tu braques la banque, plusieurs choix s'afficheront. A toi de choisir le bon ...!
31/07/2013 : Ajout d'un fast food pour manger et boire.
31/07/2013 : Tu peux soudoyer le garde pour sortir de prison rapidement ... Mais il n'acceptera pas toujours !
31/07/2013 : Un parking à été ajouté pour garer vos véhicules !
31/07/2013 : Correction des icones de soif, nourriture ...
31/07/2013 : Modification totale du script quand vous dérobez la banque.
31/07/2013 : Un drapeau taxi est automatiquement ajouté dessus quand vous achetez un bus.
31/07/2013 : Personnalisation de la voiture de police.
31/07/2013 : Ajout de la sirène au véhicule de police.
31/07/2013 : Ajout d'un véhicule de police.
31/07/2013 : Ajouts de nouveaux points de patrouille.
31/07/2013 : Correction d'enormement d'erreur de scripts.




ANCIENNE MAJ NON AFFICHEES depuis avril 2013 ...
*/

		"
	]
];



player createDiaryRecord 
["Diary", 
	["TS et Serveur", 
		"
		 Adresse de notre TS : ts.sfpteam.fr 
		 Adresse de notre serveur : 62.210.189.101:2302
		 Adresse de notre site : www.sfpteam.fr
		"
	]
];


player createDiaryRecord 
["Diary", 
	["BUGS", 
		"
		 Tu vois des bugs ou des améliorations à faire ? 
		 Contact moi à maxou@sfpteam.fr
		
		"
	]
];



player createDiaryRecord 
["Diary", 
	["Les potes", 
		"
		
		Les membres clés de notre serveur
		
		 [SFP] Maxou
		
		Et vous ??? Rejoignez nous ! ;)
		"
	]
];



player createDiaryRecord 
["Diary", 
	["Nos +++", 
		"
		 - Notre serveur est totalement codé par Maxou !
		 - Ce n'est pas une mission copier/coller de Tonic mais bien de Maxou
		"
	]
];

player createDiaryRecord 
["Diary", 
	["Fonctionnement du mode", 
		"
		Les gendarmes :
		
		- Faire respecter la loi.
		- Effectuer des controles routiers sur différent point de la carte.
		- Controler les personnes suspectes ...
		- Et bien entendu, les arreter ...
		- Mettre des véhicules en fourrière et gagner de l'argent.
		- Tu as un radar mobile pour prendre les véhicules en excès de vitesse.
		- Etc etc etc ...
		
		
		Les civils :
		
		- Gagner de l'argent en travaillant légalement ou non, avec ou sans patron !
		- Acheter des armes légales ou illégales!
		- Braquer la banque !
		- Etc etc etc ...
		
		
		Ce que tu peux faire :
		
		- Acheter des licences de port d'armes, conduite, etc.
		- Acheter des véhicules pour le transport !
		- Acheter des armes légalement ou non !
		- Recolter de la drogue, la transformer et la revendre !
		- Effectuer diverses missions de livraisons !
		- Chauffeur de bus !
		- Etc etc etc ...
		"
	]
];




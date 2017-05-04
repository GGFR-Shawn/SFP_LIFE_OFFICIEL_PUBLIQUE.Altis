// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!
// En cas d'ajout de nouveaux parametres ici, ne pas oublier de modifier le fichier configuration_du_serveur.sqf !!!!!

// =======================================================================================================================================================================================
												// NE PAS TOUCHER CETTE PARTIE CI DESSOUS //
// =======================================================================================================================================================================================
if (isnil "fin_sfp_configuration_du_serveur") then
{
	[] call compile PreprocessFileLineNumbers "config\compilation_listes_des_armes.sqf";
	[] call compile PreprocessFileLineNumbers "config\compilation_listes_des_equipements.sqf";
	[] call compile PreprocessFileLineNumbers "divers\repeindre_voiture\tuning\initialisation_tuning.sqf";

	_lancement_initilisation_inventaire = [] execVM "config\personnalisation_famille.sqf";  
	waitUntil {scriptDone _lancement_initilisation_inventaire;};
	
	fin_sfp_configuration_du_serveur = true;
};
// =======================================================================================================================================================================================
										// JUSQU'A ICI -- JUSQU'A ICI -- JUSQU'A ICI -- JUSQU'A ICI //
// =======================================================================================================================================================================================


// =======================================================================================================================================================================================
										// VOUS POUVEZ MODIFIER LES PARTIES CI DESSOUS //
// =======================================================================================================================================================================================

debug_mission_pour_dev = false; // True si dev en local seulement !!!!!
serveur_id_sauvegarde = "nom_de_votre_life_sfp"; // A modifier obligatoirement pour avoir vos propres sauvegardes, mettez ce que vous voulez !

// =======================================================================================================================================================================================
// ADMINISTRATEUR/MODERATEUR/MJ
// =======================================================================================================================================================================================

sfp_config_liste_admin =  	   
								[
									"76561198087719454", // Maxou
									"la_votre_ici_etc" // Maxou
								];

sfp_config_liste_moderateur = 
								[
									"76561198087719454", // Maxou
									"la_votre_ici_etc" // Maxou
								];
					
sfp_config_liste_des_mj = 		
								[
									"76561198087719454", // Maxou
									"la_votre_ici_etc" // Maxou
								];

// =======================================================================================================================================================================================
// CREDIT SFP ET PROGRAMMATION ARGENT
// =======================================================================================================================================================================================
sfp_config_credit_autorisation_minutes_de_jeu = 300; // Nombres de minutes de jeu minimum pour obtenir autorisation credit

sfp_config_reglage_credit_sfp = 
					[
						1250000, // Montant MAX crédit possible
						round (60 * 10), // Temps attente entre les mensualités
						250 // mensualité maximum = montant du crédit divisé par cette somme
					];

sfp_config_activer_impots = 
					[
						true, // Activer ou desactiver
						10, // Pourcentage du montant de l'impot sur salaire si salaire !
						600 // Prélévement tout les X minutes
					];

sfp_config_montant_de_depart_banque = 320000;
sfp_config_montant_de_depart_poche = 1000;

sfp_config_montant_max_livret_A = 50000;
sfp_config_montant_interet_livret_A = 2.3; // Argent en pourcentage que rapporte le montant sur le livret A

sfp_config_salaire_sarl_auto_ecole = 250;
sfp_config_salaire_sarl_avocat = 3200;
sfp_config_salaire_sarl_car_shop = 1500;
sfp_config_salaire_sarl_depannage = 850;
sfp_config_salaire_sarl_neomedia = 3040;
sfp_config_salaire_sarl_pompier = 1000;
sfp_config_salaire_sarl_taxi_g7 = 850;

sfp_config_pourcentage_amende_coffre_gendarmerie = 60; // Lors d'une amente, ce pourcentage va dans le coffre de la gendarmerie
sfp_config_pourcentage_envoye_aux_gendarmer = 10; // Lors d'une amende, ce pourcentage va a chaque joueur (divisé entre le nombre de gendarme connectés)

sfp_config_montant_recompense_max_loto = 1000; // Francaise des jeux minimum 1 max 100000 !!!
sfp_config_montant_recompense_max_euromillion = 5000; // Francaise des jeux minimum 1 max 100000 !!!
sfp_config_montant_recompense_statut_a_trouver = 35000;

sfp_config_pourcentage_gain_mission_courrier = 0.39; // Distance de mission multiplié par ce pourcentage

sfp_config_tresor_montant_argent_gagne = round (6000 + (random 5000)); // Montant gagné lorsque vous avez trouvé le trésor
sfp_config_tresor_temps = (300 + (random 1200)); // Le temps d'attente entre chaque spawn du trésor
sfp_config_tresor_distance = 100; // La distance MAX ou peut ce trouver le trésor par rapport au marqueur
sfp_config_tresor_type = "Land_GarbageContainer_closed_F"; // Le type de trésor à rechercher

sfp_config_prix_transformation_heroine = 25;
sfp_config_prix_transformation_petrole = 10;
sfp_config_prix_transformation_cannabis = 21;

sfp_config_prix_saut_parachute = 650;

// =======================================================================================================================================================================================
// CONFIGURATION EXTRA VEHICULES
// =======================================================================================================================================================================================
sfp_config_listes_des_vehicules_pompiers = ["DAR_TahoeEMS","C_Hatchback_01_sport_F","C_SUV_01_Pompier_SFP","I_Truck_Pompier_SFP","SFP_Mercedes_Camion_Pompier","SFP_Sprinter_Pompier","C_Van_Pompier_01_box_F","Offroad_01_sarl_pompier_sfp"]; // Pour initialiser les scripts de gyrophares etc
sfp_config_listes_des_vehicules_avec_reserve_eau = ["O_Heli_Light_Pompier_SFP","I_Truck_Pompier_SFP","SFP_Mercedes_Camion_Pompier"]; // Pour initialiser les scripts de gyrophares etc

sfp_config_listes_des_vehicules_interdit_de_plaques = ["O_MRAP_02_F","UAZ_MG","B_G_Offroad_01_armed_F","B_G_Offroad_01_F","I_C_Offroad_02_unarmed_F","O_T_LSV_02_armed_F","O_T_LSV_02_unarmed_F","SFP_jeep_blinde"];
sfp_config_listes_des_plaques_non_flashables = ["??-???-??","Plaque arrachée","Véhicule gang licence_gang_v2","Véhicule gang %1","Véhicule gang %2", sfp_config_famille_une_nom_pour_variable, sfp_config_famille_deux_nom_pour_variable];

sfp_config_nombre_de_vehicule_max_par_joueur_sorties_civil = 4; // Evite abus donc lag
sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_altis_and_furious = 30; // Evite abus donc lag 
sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_carshop = 9; // Evite abus donc lag
sfp_config_nombre_de_vehicule_max_par_joueur_sorties_sarl_neomedia = 7; // Evite abus donc lag

sfp_config_position_des_previsualitions_des_vehicules = [25692,19480.1,0]; // Zone ou sera affiché en prévisualition des véhicules avant achat

sfp_config_pourcentage_remboursement_max_assurance_sfp = 75; // Pourcentage que rembourse l'assurance par rapport aux prix du véhicule
sfp_config_pourcentage_pour_calcul_prix_assurance_sfp = 53; // Pourcentage a payer sur le montant souhaité remboursé

sfp_config_prix_du_ferry = 0.04; // distance joueur a position final multiplié par ce pourcentage
sfp_config_temps_traverse_du_ferry = 180; // distance joueur a position final divisé par ce chiffre
sfp_config_position_du_ferry_sfp = 
						[
							["Ekali",(getmarkerpos "position_ferry_spawn_un"), round ((player distance (getmarkerpos "position_ferry_spawn_un")) * sfp_config_prix_du_ferry), round ((player distance getmarkerpos "position_ferry_spawn_un") / sfp_config_temps_traverse_du_ferry)],
							["Ochrolimni",getmarkerpos "position_ferry_spawn_deux", round ((player distance getmarkerpos "position_ferry_spawn_deux") * sfp_config_prix_du_ferry), round ((player distance getmarkerpos "position_ferry_spawn_deux") / sfp_config_temps_traverse_du_ferry)],
							["Kavala",getmarkerpos "position_ferry_spawn_trois", round ((player distance getmarkerpos "position_ferry_spawn_trois") * sfp_config_prix_du_ferry), round ((player distance getmarkerpos "position_ferry_spawn_trois") / sfp_config_temps_traverse_du_ferry)],
							["Presque ile sud",getmarkerpos "position_ferry_spawn_quatre", round ((player distance getmarkerpos "position_ferry_spawn_quatre") * sfp_config_prix_du_ferry), round ((player distance getmarkerpos "position_ferry_spawn_quatre") / sfp_config_temps_traverse_du_ferry)],
							["Kalithea",getmarkerpos "position_ferry_spawn_cinq", round ((player distance getmarkerpos "position_ferry_spawn_cinq") * sfp_config_prix_du_ferry), round ((player distance getmarkerpos "position_ferry_spawn_cinq") / sfp_config_temps_traverse_du_ferry)]
						];

// =======================================================================================================================================================================================
// CONFIGURATION MAISONS
// =======================================================================================================================================================================================
sfp_config_listes_objects_decorateurs = [
								["Land_Icebox_F","Congèlateur"],
								["Land_Pillow_F","Oreiller"],
								["Land_Sun_chair_F","Chaise"],
								["Land_Sunshade_F","Parasol"],
								["MapBoard_altis_F","Tableau (Carte De Altis)"],
								["Land_LampDecor_F","Lampadaire"],
								["Land_Basket_F","Grand panier (Patate, etc)"],
								["Land_Cages_F","Cages (Fruits,, etc)"],
								["Land_CratesPlastic_F","Cagette"],
								["Land_CratesShabby_F","Caissette en bois"],
								["Land_Portable_generator_F","Groupe Electrogène"],
								["Land_Suitcase_F","Valise"],
								["Land_DrillAku_F","Perceuse"],
								["Land_Hammer_F","Marteau"],
								["Land_BarrelEmpty_F","Bidon plastique"],
								["Land_Bucket_F","Sceau en ferraille"],
								["Land_MetalBarrel_empty_F","Fûts métallique"],
								["Land_GarbageContainer_closed_F","Grosse poubelle"],
								["Land_ShelvesMetal_F","Etagère blanche"],
								["Land_Metal_wooden_rack_F","Etagère rouge"],
								["Land_ShelvesWooden_blue_F","Etagère bleu"],
								["Land_SlideCastle_F","Tobogan"],
								["Land_Bench_01_F","Banc"]
							];

sfp_config_listes_des_maisons_achetable = 
							[
								["Land_House_Big_03_F", 100000], // Classe, prix de la maison
								["Land_Slum_03_F", 100000], // Classe, prix de la maison
								["Land_Addon_04_F", 100000], // Classe, prix de la maison
								["Land_GarageShelter_01_F", 100000], // Classe, prix de la maison
								["Land_House_Small_04_F ", 100000], // Classe, prix de la maison
								["Land_House_Small_03_F", 100000], // Classe, prix de la maison
								["Land_House_Small_04_F", 100000], // Classe, prix de la maison
								["Land_House_Small_05_F", 100000], // Classe, prix de la maison
								["Land_i_House_Small_01_V1_F", 100000] // Classe, prix de la maison
							];
							
sfp_config_listes_des_maisons_cambriolables = 
							[
								"Land_i_Shop_01_V2_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V3_F", 
								"Land_i_House_Small_02_V2_F"
							];
						
							
sfp_config_autoriser_achat_maison = true; // False si pas d'activation d'achat des maisons
sfp_config_autoriser_pose_objets_decoration = true; // False si pas d'autorisation
sfp_config_autoriser_cambriolages_maisons = true; // False si pas d'autorisation

// =======================================================================================================================================================================================
// CONFIGURATION REVIVE
// =======================================================================================================================================================================================
sfp_config_revive_activation = true; // False pour ne pas activer le revive
sfp_config_revive_acheve_joueur = true; // Possibilité d'achever un joueur au sol avec un poignard
sfp_config_revive_trainer_blesse = true; // Possibilité de trainer les blesses
sfp_config_revive_tas_billet = true; // Lors d'une mort jeter argent en poche au sol pour récupération
sfp_config_revive_pas_de_chance = 10; // 1 chance sur ce nombre de ne pas avoir la possibilité de revive (respawn direct)

sfp_config_nombre_de_soins_par_kit_de_soins = 5; // Un kit de soins sert pour soigner ce nombre de fois

revive_temps_respawn_autoriser_apres_contact_urgence = 900; // 10 secondes minimum par tranche de 10 secondes
revive_nombre_max_de_medecin_pour_revive_entre_joueur = 3; // Si en dessous les joueurs peuvent se revive entre eux

revive_temps_minimum_respawn = 7; // Temps mini avant de pouvoir respawn
revive_temps_maximum_respawn = 600; // Temps max d'attente de revive

revive_icone_max_vu_distance = 300; // Mètres // Distance de vue de l'icone revive, de vous au bléssé
revive_icone_taille = 0.8; // Taille icone du revive en jeu
revive_icone_couleur  = [1,0,0,1]; // Couleur de l'icone en jeu

tarif_menu_revive =
					[
						5000, // Argent perdu lorsque l'on repart sur une nouvelle vie
						2500  // Argent gagne lors d'appel des pompiers
					];

// =======================================================================================================================================================================================
// CONFIGURATION DIVERS
// =======================================================================================================================================================================================
sfp_config_language_du_jeu_autorise = ["French"]; // French pour francais, English pour anglais (Autorise les joueurs avec la langue inclus dans ce tableau à ce connecter à votre serveur)
sfp_config_choix_redemarrage = "#Shutdown"; // #Shutdown kill completement le serveur (N'oubliez pas de definir le mot de passe admin correspond au cfg du serveur dans arma3/userconfig/password_serveur/password_commande_sfp.hpp
sfp_config_choix_heure_redemarrage = [02,07,12,17,20]; // Execute la commande au dessus une fois l'heure atteinte ! Attention d'avoir quelques choses qui relance le serveur automatiquement si commande #Shutdown utilisée

sfp_config_activer_regeneration_de_sante = true; // false si non (Remet de la vie doucement lorsqu'elle est à moins de 25 %, lors de petit saut par exemple)
sfp_config_activer_protection_sac_a_dos = true; // false si non (Empecher les autres joueurs d'ouvrir les sacs à dos)
sfp_config_activer_revente_voitures_voles = true; // false si non (Pour que le carshop change le propriétaire du véhicule)
sfp_config_activer_retaper_numero_de_serie = true; // false si non (Pour que le carshop change le propriétaire du véhicule)
sfp_config_activer_travailleur_au_noir = true; // false si non
sfp_config_activer_soif = true; // false si non (pour les besoins de boire)
sfp_config_activer_faim = true; // false si non (pour les besoins de nourriture)
sfp_config_activer_dormir = true; // false si non (pour les besoins de sommeil)
sfp_config_activer_toilette = true; // false si non (pour les envies d'uriner)
sfp_config_activer_optimisation_client = true; // false si non (peut améliorer les performances chez certains et les baisser chez d'autres ... a vous de tester !)
sfp_config_activer_go_fast = true; // false si non
sfp_config_activer_sang_lors_de_tir = true; // false si non
sfp_config_activer_effet_grenade_fumigene = true; // false si non
sfp_config_activer_nom_des_joueurs_en_jeu = true; // false si non (nom des joueurs au dessus de la tete)
sfp_config_afficher_nom_joueurs_dans_vehicules = true; // Affiche le nom des joueurs dans les véhicules quand vous êtes dedans également
sfp_config_activer_achat_coffre_fort = true; // false si non
sfp_config_activer_marqueur_gendarmes = true; // false si non / Affiche la position des gendarmes entres eux sur la carte
sfp_config_activer_son_en_jeu = true; // Activer ou non des bruits ambiants en jeu (bruit d'animaux, de vie, etc)
sfp_config_activer_braquage_station_service = true; // false si non
sfp_config_minutes_de_jeu_pour_taper = 600; // Nombre de minutes minimum pour qu'un joueur puisse en taper un autre
sfp_config_nombre_carkill_autorise = 3; // Nombre de carkill autorisé avant ban automatique

sfp_config_nombre_max_antennes_telecom = round (18 + (random 10)); // Nombre d'antennes télécom sur la map !! Attention MAXI 80 !!!!!!!!
sfp_config_liste_des_forfaits_telecoms = [	// Nom, Tarif, nombres de sms
											["SFP Télécom 4G+ + Galaxy S7",450,15], 
											["SFP Télécom 4G  + Galaxy S7",225,7],
											["SFP Télécom 3G  + Galaxy S7",150,5],
											["SFP Télécom 2G  + Galaxy S7",100,2],
											["SFP Télécom 4G+ + Iphone 7S",400,10],
											["SFP Télécom 4G  + Iphone 7S",250,6],
											["SFP Télécom 3G  + Iphone 7S",120,2],
											["SFP Télécom 2G  + Iphone 7S",75,1]
										  ];


sfp_config_vitesse_du_personnage = 1; // De base sans entrainement sportif (ne pas aller au dessu de 1.50 trop rapide)
sfp_config_vitesse_stabilite_du_viseur = 1; // De base sans entrainement sportif (maxi 1, mini 0.5000, plus petit moins ca bouge)

sfp_config_liste_position_des_atm_affiches = [[14610.1,16819.7,0.1], [12662.9,14265.5,0.1], [3715.01,13030.8,0.1]]; // Affiche ces ATM par marqueurs sur la carte	

sfp_config_choix_niveau_de_force = 
									[
										[40,70], // Niveau force total , temps pour l'obtenir (centre sportif)
										[50,140], // Niveau force total , temps pour l'obtenir (centre sportif)
										[60,310],// Niveau force total , temps pour l'obtenir (centre sportif)
										[70,480], // Niveau force total , temps pour l'obtenir (centre sportif)
										[80,600] // Niveau force total , temps pour l'obtenir (centre sportif)
									];

sfp_config_choix_position_civils =   
									[
										["Neochori", getmarkerpos "respawn_civilian"]
									];									

sfp_config_choix_position_gendarmes =   
									[
										["Neochori", getmarkerpos "respawn_civilian"],
										["Brigade", getmarkerpos "gendarmerie_2"]
									];									

sfp_config_armes_autorisation_effet = 
									[
										"arifle_MX_Black_F","arifle_MX_F","SMG_02_F" // Camera sur la balle lors d'un tir
									];
									
sfp_config_armes_interdiction_effet = 
									[
										"hgun_Rook40_F_Taser_Maxou","F_Flash_Ball_SFP_Maxou" // Camera sur la balle lors d'un tir
									];

sfp_config_liste_des_armes_coffre_d_armes = // Listes des munitions et des armes qui peuvent POP dans les recherches de coffres d'armes
									[
										["R3F_10Rnd_127x99_M107","R3F_M107_DES","R3F_7Rnd_M4S90","R3F_M4S90"],
										["30Rnd_65x39_caseless_green","arifle_Katiba_C_F"],
										["10Rnd_93x64_DMR_05_Mag","srifle_DMR_05_tan_f"],
										["10Rnd_93x64_DMR_05_Mag","srifle_DMR_05_hex_F"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_surb_DES"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_surb_HG_DES"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_surb"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_surb_HG"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_surb_M203"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_surb_M203_DES"],
										["R3F_25Rnd_556x45_FAMAS","R3F_Famas_F1"],
										["R3F_25Rnd_556x45_FAMAS","R3F_Famas_F1_DES"],
										["R3F_25Rnd_556x45_FAMAS","R3F_Famas_F1_HG"],
										["R3F_25Rnd_556x45_FAMAS","R3F_Famas_F1_HG_DES"],
										["R3F_25Rnd_556x45_FAMAS","R3F_Famas_F1_M203"],
										["R3F_25Rnd_556x45_FAMAS","R3F_Famas_F1_M203_DES"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_G2_HG"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_G2_HG_DES"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_G2_M203"],
										["R3F_30Rnd_556x45_FAMAS","R3F_Famas_G2_M203_DES"],
										["R3F_10Rnd_762x51_FRF2","R3F_FRF2"],
										["R3F_10Rnd_762x51_FRF2","R3F_FRF2_DES"],
										["R3F_30Rnd_556x45_HK416","R3F_HK416M"],
										["R3F_30Rnd_556x45_HK416","R3F_HK416M_DES"],
										["R3F_30Rnd_556x45_HK416","R3F_HK416M_HG"],
										["R3F_30Rnd_556x45_HK416","R3F_HK416M_HG_DES"],
										["R3F_30Rnd_556x45_HK416","R3F_HK416M_M203"],
										["R3F_30Rnd_556x45_HK416","R3F_HK416M_M203_DES"],
										["R3F_20Rnd_762x51_HK417","R3F_HK417S_HG"],
										["R3F_20Rnd_762x51_HK417","R3F_HK417S_HG_DES"],
										["R3F_20Rnd_762x51_HK417","R3F_HK417M_HG"],
										["R3F_20Rnd_762x51_HK417","R3F_HK417M_HG_DES"],
										["R3F_20Rnd_762x51_HK417","R3F_HK417L"],
										["R3F_20Rnd_762x51_HK417","R3F_HK417L_DES"],
										["30Rnd_65x39_caseless_green","arifle_Katiba_F"],
										["30Rnd_65x39_caseless_green","arifle_Katiba_GL_F"],
										["10Rnd_338_Mag","srifle_DMR_02_camo_F"],
										["10Rnd_338_Mag","srifle_DMR_02_F"],
										["10Rnd_338_Mag","srifle_DMR_02_sniper_F"],
										["R3F_5Rnd_127x99_TAC50","R3F_TAC50"],
										["R3F_200Rnd_556x45_MINIMI","R3F_Minimi"],
										["R3F_100Rnd_762x51_MINIMI","R3F_Minimi_762"],
										["R3F_100Rnd_762x51_MINIMI","R3F_Minimi_762_HG"],
										["R3F_200Rnd_556x45_MINIMI","R3F_Minimi_HG"],
										["20Rnd_762x51_Mag","srifle_DMR_03_woodland_F"],
										["20Rnd_762x51_Mag","srifle_DMR_03_multicam_F"],
										["20Rnd_762x51_Mag","srifle_DMR_03_khaki_F"],
										["20Rnd_762x51_Mag","srifle_DMR_03_F"],
										["20Rnd_762x51_Mag","srifle_DMR_03_tan_F"],
										["20Rnd_762x51_Mag","srifle_DMR_06_camo_F"],
										["20Rnd_762x51_Mag","srifle_DMR_06_olive_F"],
										["30Rnd_556x45_Stanag","arifle_Mk20_plain_F"],
										["30Rnd_556x45_Stanag","arifle_Mk20_F"],
										["30Rnd_556x45_Stanag","arifle_Mk20_GL_plain_F"],
										["30Rnd_556x45_Stanag","arifle_Mk20_GL_F"],
										["200Rnd_65x39_cased_Box","LMG_Mk200_F"],
										["30Rnd_556x45_Stanag","arifle_Mk20C_plain_F"],
										["30Rnd_556x45_Stanag","arifle_Mk20C_F"],
										["30Rnd_65x39_caseless_mag","arifle_MX_GL_F"],
										["30Rnd_65x39_caseless_mag","arifle_MX_GL_Black_F"],
										["30Rnd_65x39_caseless_mag","arifle_MX_F"],
										["30Rnd_65x39_caseless_mag","arifle_MX_Black_F"],
										["100Rnd_65x39_caseless_mag_Tracer","arifle_MX_SW_F"],
										["100Rnd_65x39_caseless_mag_Tracer","arifle_MX_SW_Black_F"],
										["30Rnd_65x39_caseless_mag","arifle_MXC_F"],
										["30Rnd_65x39_caseless_mag","arifle_MXC_Black_F"],
										["30Rnd_65x39_caseless_mag","arifle_MXM_F"],
										["30Rnd_65x39_caseless_mag","arifle_MXM_Black_F"],
										["150Rnd_93x64_Mag","MMG_01_hex_F"],
										["150Rnd_93x64_Mag","MMG_01_tan_F"],
										["10Rnd_762x54_Mag","srifle_DMR_01_F"],
										["130Rnd_338_Mag","MMG_02_camo_F"],
										["130Rnd_338_Mag","MMG_02_black_F"],
										["130Rnd_338_Mag","MMG_02_sand_F"],
										["30Rnd_556x45_Stanag","arifle_TRG20_F"],
										["30Rnd_556x45_Stanag","arifle_TRG21_F"],
										["30Rnd_556x45_Stanag","arifle_TRG21_GL_F"],
										["30Rnd_45ACP_Mag_SMG_01","SMG_01_F"],
										["150Rnd_762x54_Box","LMG_Zafir_F"],
										["11Rnd_45ACP_Mag","hgun_Pistol_heavy_01_F"],
										["9Rnd_45ACP_Mag","hgun_ACPC2_F"],
										["16Rnd_9x21_Mag","hgun_P07_F"],
										["16Rnd_9x21_Mag","hgun_Rook40_F"],
										["6Rnd_45ACP_Cylinder","hgun_Pistol_heavy_02_F"]
									];

// Le nom de l'animation, la classe de l'animation, (1 = playMoveNow ; 2 = playMove ; 3 = switchmove)
sfp_config_listes_des_animations_sfp =
									[
										["Assis avec les mains derrière le dos.","ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Cooper","3"],
										["Assis avec les mains derrière le dos 2.","ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Ohara","3"],
										["Assis avec les mains derrière le dos 3.","ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Rodriguez","3"],
										["Avancer et se rendre les mains sur la tete.","ctsLopoHover_lopotev","3"],
										["Avoir mal partout.","ActsPercMstpSrasWrflDnon_sceneLopotevBandCaptured_Lopotev","3"],
										["Avoir mal partout 2.","ActsPercMstpSrasWunaDnon_sceneLopotevBandCaptured_Kostey","3"],
										["Discuter.","UnaErcVelitelProslov1","3"],
										["Discuter long speech.","armstrong_c0start","3"],
										["Faire atterir un hélico.","NavigationHeli","3"],
										["S'assoir tete sur les bras.","C5efe_honza","3"],
										["S'appuyer sur une table.","TowingTractorSupport","3"],
										["Se rendre mains en l'air et tomber.","ActsPercMstpSnonWpstDnon_sceneBardak01","3"],
										["Tomber en arrière.","ActsPercMstpSnonWpstDnon_sceneBardak02","3"],
										["Tomber en arrière 2.","AdthPercMstpSlowWrf_beating","3"],
										["Tomber et se relever.","ActsPpneMstpWunaSnonDnon_sceneCrashSite_Cooper","3"],
										["Tomber et se relever 2.","ActsPpneMstpWrflSlowDnon_sceneCrashSite_Ohara","3"],
										["Tomber et se relever 3.","ActsPpneMstpWrflSlowDnon_sceneCrashSite_Sykes","3"],
										["Tomber et se relever 4.","ActsPpneMstpWrflSlowDnon_sceneCrashSite_Rodriguez","3"],
										["Viser et regarder partout.","ActsPercMstpSlowWrflDnon_sceneLopotevBandCaptured_Cooper","3"],
										
										["Ce coucher sur le dos.","AinjPpneMstpSnonWrflDnon_rolltoback","1"],
										["Petit saut.","AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow","3"],
										["Ce mettre à genoux tête baissé.","AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon","2"],
										["Faire semblant de jeter quelque chose.","AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthStart","3"],
										["Faire le mort.","DeadState","1"],
										["Avoir peur.","AmovPercMstpSnonWnonDnon_Scared2","2"],
										["Faire signe de s'arreter.","AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon","3"],
										["Mettre les mains sur les hanches.","InBaseMoves_SittingRifle1","3"],
										["Exercice de karaté !","AmovPercMstpSnonWnonDnon_exerciseKata","2"]
									];

sfp_config_liste_addons_autorise_anti_hack = ["A3_Data_F_Loadorder","A3_Data_F_Curator_Music","A3_Data_F_Curator_Loadorder","A3_Data_F_Kart_Loadorder","A3_Data_F_Bootcamp_Loadorder","A3_Data_F_Heli_Loadorder","A3_Data_F_Mark_Loadorder","A3_Data_F_Exp_A_Loadorder","A3_Data_F_Exp_B_Loadorder","A3_Data_F_Exp_Loadorder","Jonzie_Sounds","Jonzie_Rims","jonzie_sounds","Core","sab_paraglider","sga_hover_board","AUR_AdvancedUrbanRappelling","DES_Elevator","R_HotairBalloon","Jonzie_Code","Burnes_MK10_Patch","Jonzie_Carpack","Jonzie_Ceed","Jonzie_Corolla","Jonzie_Datsun_510","Jonzie_Datsun_Z432","Jonzie_Escalade","Jonzie_Forklift","Jonzie_Galant","Jonzie_Lightbar","Jonzie_Mini_Cooper","Jonzie_Quattroporte","Jonzie_Raptor","Jonzie_STI","Jonzie_Superliner","Jonzie_Trucks","Jonzie_Trailer_Pack","Jonzie_Transit","Jonzie_VE","Jonzie_Western","Jonzie_XB","Jonzie_30CSL","Jonzie_Ambulance","Jonzie_Highway","A3_Static_F_Exp_AA_01","A3_Static_F_Exp_AT_01","A3_Static_F_Exp_GMG_01","A3_Static_F_Exp_HMG_01","A3_Static_F_Exp_Mortar_01","A3_Armor_F_Exp_APC_Tracked_01","A3_Armor_F_Exp_APC_Wheeled_01","A3_Armor_F_Exp_MBT_01","A3_Boat_F_Exp_Boat_Armed_01","A3_Soft_F_Exp_MRAP_01","A3_Soft_F_Exp_Truck_01","cba_settings_helper","cba_modules","cba_settings","cba_statemachine", "A3_Map_Data_Exp","A3_Rocks_F_Exp","A3_Rocks_F_Exp_Cliff","A3_Rocks_F_Exp_LavaStones","A3_Structures_F_Exp","A3_Structures_F_Exp_Civilian","A3_Structures_F_Exp_Civilian_Accessories","A3_Structures_F_Exp_Civilian_Garages","A3_Structures_F_Exp_Civilian_House_Big_01","A3_Structures_F_Exp_Civilian_House_Big_02","A3_Structures_F_Exp_Civilian_House_Big_03","A3_Structures_F_Exp_Civilian_House_Big_04","A3_Structures_F_Exp_Civilian_House_Big_05","A3_Structures_F_Exp_Civilian_House_Native_01","A3_Structures_F_Exp_Civilian_House_Native_02","A3_Structures_F_Exp_Civilian_House_Small_01","A3_Structures_F_Exp_Civilian_House_Small_02","A3_Structures_F_Exp_Civilian_House_Small_03","A3_Structures_F_Exp_Civilian_House_Small_04","A3_Structures_F_Exp_Civilian_House_Small_05","A3_Structures_F_Exp_Civilian_House_Small_06","A3_Structures_F_Exp_Civilian_School_01","A3_Structures_F_Exp_Civilian_Sheds","A3_Structures_F_Exp_Civilian_Slum_01","A3_Structures_F_Exp_Civilian_Slum_02","A3_Structures_F_Exp_Civilian_Slum_03","A3_Structures_F_Exp_Civilian_Slum_04","A3_Structures_F_Exp_Civilian_Slum_05","A3_Structures_F_Exp_Civilian_SportsGrounds","A3_Structures_F_Exp_Commercial","A3_Structures_F_Exp_Commercial_Addons","A3_Structures_F_Exp_Commercial_Advertisements","A3_Structures_F_Exp_Commercial_FuelStation_01","A3_Structures_F_Exp_Commercial_FuelStation_02","A3_Structures_F_Exp_Commercial_Hotel_01","A3_Structures_F_Exp_Commercial_Hotel_02","A3_Structures_F_Exp_Commercial_Market","A3_Structures_F_Exp_Commercial_MultistoryBuilding_01","A3_Structures_F_Exp_Commercial_MultistoryBuilding_03","A3_Structures_F_Exp_Commercial_MultistoryBuilding_04","A3_Structures_F_Exp_Commercial_Shop_City_01","A3_Structures_F_Exp_Commercial_Shop_City_02","A3_Structures_F_Exp_Commercial_Shop_City_03","A3_Structures_F_Exp_Commercial_Shop_City_04","A3_Structures_F_Exp_Commercial_Shop_City_05","A3_Structures_F_Exp_Commercial_Shop_City_06","A3_Structures_F_Exp_Commercial_Shop_City_07","A3_Structures_F_Exp_Commercial_Shop_Town_01","A3_Structures_F_Exp_Commercial_Shop_Town_02","A3_Structures_F_Exp_Commercial_Shop_Town_03","A3_Structures_F_Exp_Commercial_Shop_Town_04","A3_Structures_F_Exp_Commercial_Shop_Town_05","A3_Structures_F_Exp_Commercial_Supermarket_01","A3_Structures_F_Exp_Commercial_Warehouses","A3_Structures_F_Exp_Cultural","A3_Structures_F_Exp_Cultural_AncientRelics","A3_Structures_F_Exp_Cultural_BasaltRuins","A3_Structures_F_Exp_Cultural_Cathedral_01","A3_Structures_F_Exp_Cultural_Cemeteries","A3_Structures_F_Exp_Cultural_Church_01","A3_Structures_F_Exp_Cultural_Church_02","A3_Structures_F_Exp_Cultural_Church_03","A3_Structures_F_Exp_Cultural_Fortress_01","A3_Structures_F_Exp_Cultural_Temple_Native_01","A3_Structures_F_Exp_Cultural_Totems","A3_Structures_F_Exp_Data","A3_Structures_F_Exp_Industrial","A3_Structures_F_Exp_Industrial_DieselPowerPlant_01","A3_Structures_F_Exp_Industrial_Fields","A3_Structures_F_Exp_Industrial_Materials","A3_Structures_F_Exp_Industrial_Port","A3_Structures_F_Exp_Industrial_Stockyard_01","A3_Structures_F_Exp_Industrial_SugarCaneFactory_01","A3_Structures_F_Exp_Industrial_SurfaceMine_01","A3_Structures_F_Exp_Infrastructure","A3_Structures_F_Exp_Infrastructure_Airports","A3_Structures_F_Exp_Infrastructure_Bridges","A3_Structures_F_Exp_Infrastructure_Pavements","A3_Structures_F_Exp_Infrastructure_Powerlines","A3_Structures_F_Exp_Infrastructure_Railways","A3_Structures_F_Exp_Infrastructure_Roads","A3_Structures_F_Exp_Infrastructure_Runways","A3_Structures_F_Exp_Infrastructure_WaterSupply","A3_Structures_F_Exp_Military","A3_Structures_F_Exp_Military_Barracks_01","A3_Structures_F_Exp_Military_Camonets","A3_Structures_F_Exp_Military_ContainerBases","A3_Structures_F_Exp_Military_Emplacements","A3_Structures_F_Exp_Military_Flags","A3_Structures_F_Exp_Military_Fortifications","A3_Structures_F_Exp_Military_Pillboxes","A3_Structures_F_Exp_Military_Trenches","A3_Structures_F_Exp_Naval","A3_Structures_F_Exp_Naval_Canals","A3_Structures_F_Exp_Naval_Piers","A3_Structures_F_Exp_Signs","A3_Structures_F_Exp_Signs_Companies","A3_Structures_F_Exp_Signs_Traffic","A3_Structures_F_Exp_Walls","A3_Structures_F_Exp_Walls_BackAlleys","A3_Structures_F_Exp_Walls_Bamboo","A3_Structures_F_Exp_Walls_Concrete","A3_Structures_F_Exp_Walls_Crashbarriers","A3_Structures_F_Exp_Walls_Hedges","A3_Structures_F_Exp_Walls_Net","A3_Structures_F_Exp_Walls_Pipe","A3_Structures_F_Exp_Walls_Polewalls","A3_Structures_F_Exp_Walls_Railings","A3_Structures_F_Exp_Walls_Slum","A3_Structures_F_Exp_Walls_Stone","A3_Structures_F_Exp_Walls_Tin","A3_Structures_F_Exp_Walls_Wired","A3_Structures_F_Exp_Walls_Wooden","A3_Vegetation_F_Exp","A3_Map_Tanoabuka","A3_Map_Tanoabuka_Data","A3_Map_Tanoabuka_Data_Layers","A3_Map_Tanoa_Scenes_F", "A3_Data_F_Exp","A3_Data_F_Exp_ParticleEffects","A3_Dubbing_F_Exp","A3_Dubbing_Radio_F_EXP","A3_Dubbing_Radio_F_EXP_Data_CHI","A3_Dubbing_Radio_F_EXP_Data_ENGFRE","A3_Dubbing_Radio_F_EXP_Data_FRE","A3_EditorPreviews_F_Exp","A3_Functions_F_Exp","A3_Language_F_Exp","A3_LanguageMissions_F_Exp","A3_Modules_F_Exp","A3_Music_F_Exp","A3_Music_F_Exp_Music","A3_Props_F_Exp","A3_Props_F_Exp_Civilian","A3_Props_F_Exp_Civilian_Garbage","A3_Props_F_Exp_Commercial","A3_Props_F_Exp_Commercial_Market","A3_Props_F_Exp_Industrial","A3_Props_F_Exp_Industrial_HeavyEquipment","A3_Props_F_Exp_Infrastructure","A3_Props_F_Exp_Infrastructure_Railways","A3_Props_F_Exp_Infrastructure_Traffic","A3_Props_F_Exp_Military","A3_Props_F_Exp_Military_Camps","A3_Props_F_Exp_Military_OldPlaneWrecks","A3_Props_F_Exp_Naval","A3_Props_F_Exp_Naval_Boats","A3_Static_F_Exp","A3_Supplies_F_Exp","A3_Supplies_F_Exp_Ammoboxes","A3_Ui_F_Exp","A3_Weapons_F_Exp","A3_Weapons_F_Exp_Launchers_RPG32","A3_Weapons_F_Exp_Launchers_RPG7","A3_Weapons_F_Exp_Launchers_Titan","A3_Weapons_F_Exp_LongRangeRifles_DMR_07","A3_Weapons_F_Exp_Machineguns_LMG_03","A3_Weapons_F_Exp_Pistols_Pistol_01","A3_Weapons_F_Exp_Rifles_AK12","A3_Weapons_F_Exp_Rifles_AKM","A3_Weapons_F_Exp_Rifles_AKS","A3_Weapons_F_Exp_Rifles_ARX","A3_Weapons_F_Exp_Rifles_CTAR","A3_Weapons_F_Exp_Rifles_CTARS","A3_Weapons_F_Exp_Rifles_SPAR_01","A3_Weapons_F_Exp_Rifles_SPAR_02","A3_Weapons_F_Exp_Rifles_SPAR_03","A3_Weapons_F_Exp_SMGs_SMG_05","A3_Air_F_Exp","A3_Air_F_Exp_Heli_Light_01","A3_Air_F_Exp_Heli_Transport_01","A3_Air_F_Exp_Plane_Civil_01","A3_Air_F_Exp_UAV_03","A3_Air_F_Exp_UAV_04","A3_Air_F_Exp_VTOL_01","A3_Air_F_Exp_VTOL_02","A3_Anims_F_Exp","A3_Anims_F_Exp_Revive","A3_Armor_F_Exp","A3_Armor_F_Exp_APC_Tracked_02","A3_Armor_F_Exp_APC_Wheeled_02","A3_Armor_F_Exp_MBT_02","A3_Boat_F_Exp","A3_Boat_F_Exp_Boat_Transport_01","A3_Boat_F_Exp_Boat_Transport_02","A3_Boat_F_Exp_Scooter_Transport_01","A3_Cargoposes_F_Exp","A3_Characters_F_Exp","A3_Characters_F_Exp_Civil","A3_Characters_F_Exp_Headgear","A3_Characters_F_Exp_Vests","A3_Soft_F_Exp","A3_Soft_F_Exp_LSV_01","A3_Soft_F_Exp_LSV_02","A3_Soft_F_Exp_MRAP_02","A3_Soft_F_Exp_Offroad_01","A3_Soft_F_Exp_Offroad_02","A3_Soft_F_Exp_Quadbike_01","A3_Soft_F_Exp_Truck_03","A3_Soft_F_Exp_UGV_01","A3_Soft_F_Exp_Van_01","A3_Sounds_F_Exp","A3_Missions_F_Exp","A3_Missions_F_Exp_Data","A3_Missions_F_Exp_Video", "A3Data","A3_3DEN_Language","A3_Functions_F","A3_Functions_F_EPA","A3_Functions_F_EPC","SFP_SALLE_JUGEMENT","SFP_Vest_Suicide","BaBe_core","BaBe_EM","babe_EM_UI","BaBe_FD","Shemaghs","SFG_Tac_Beard","SFG_Tac_SmallBeard","tut_helo","SFP_sounds","SFP_vehiclefunctions","US_ESS_Glasses_tryk","inidbi2","ivory_yak42d","Kio_Balaclava","A3_Sounds_F_MM_Bank_SFP","PoliceStation","Pub_A","Pub_C","Centrelink","A3_Sounds_F_MM_Buildings_SFP","Land_PostB","HouseDoubleAL","HouseStudsDouble","Mattaust_Objects_MM_SHOPPING_SFP","CAAir2_MV22","SFP_Objects_Panneau_Objets","SFP_VOITURES_Agora","SFP_VOITURES_Master","SFP_VOITURES_Monster","Quiet_voiture_1_config","Quiet_voiture_1_moteur","r3f_armes","config_sfp_niveau_eau","Casque_Perso_Maxou_SFP","Vest_Perso_Maxou_SFP","A3_Bush","A3_Plants","A3_Stones","A3_Trees","listes_klaxon_sfp_maxou","listes_musiques_sfp_maxou","TRYK_Shemaghs","shounka_a3_base","SpeedRadar","TacticalHoods","maa_Uniform","A3_Data_F","A3_Data_F_Hook","A3_Data_F_ParticleEffects","A3_Dubbing_F","A3_Dubbing_F_Beta","A3_Dubbing_F_Gamma","A3_Dubbing_Radio_F","A3_Dubbing_Radio_F_Data_ENG","A3_Dubbing_Radio_F_Data_ENGB","A3_Dubbing_Radio_F_Data_GRE","A3_Dubbing_Radio_F_Data_PER","A3_Dubbing_Radio_F_Data_VR","A3_Editor_F","A3_EditorPreviews_F","A3_Functions_F_Curator","A3_Language_F","A3_Language_F_Beta","A3_Language_F_Gamma","A3_LanguageMissions_F","A3_LanguageMissions_F_Beta","A3_LanguageMissions_F_Gamma","A3_Misc_F","A3_Misc_F_Helpers","A3_Modules_F","A3_Modules_F_Data","A3_Modules_F_DynO","A3_Modules_F_Effects","A3_Modules_F_Events","A3_Modules_F_GroupModifiers","A3_Modules_F_Hc","A3_Modules_F_Intel","A3_Modules_F_LiveFeed","A3_Modules_F_Marta","A3_Modules_F_Misc","A3_Modules_F_Multiplayer","A3_Modules_F_ObjectModifiers","A3_Modules_F_Sites","A3_Modules_F_Skirmish","A3_Modules_F_StrategicMap","A3_Modules_F_Supports","A3_Modules_F_Uav","A3_Modules_F_Beta","A3_Modules_F_Beta_Data","A3_Modules_F_Beta_FiringDrills","A3_Modules_F_EPB","A3_Modules_F_EPB_Misc","A3_Music_F","A3_Music_F_Music","A3_Music_F_EPA","A3_Music_F_EPA_Music","A3_Music_F_EPB","A3_Music_F_EPB_Music","A3_Music_F_EPC","A3_Music_F_EPC_Music","A3_Plants_F","A3_Roads_F","A3_Rocks_F","A3_Rocks_F_Blunt","A3_Rocks_F_Sharp","A3_Rocks_F_Water","A3_Structures_F","A3_Structures_F_Bridges","A3_Structures_F_Civ","A3_Structures_F_Civ_Accessories","A3_Structures_F_Civ_Ancient","A3_Structures_F_Civ_BellTowers","A3_Structures_F_Civ_Calvaries","A3_Structures_F_Civ_Camping","A3_Structures_F_Civ_Chapels","A3_Structures_F_Civ_Constructions","A3_Structures_F_Civ_Dead","A3_Structures_F_Civ_Garbage","A3_Structures_F_Civ_Graffiti","A3_Structures_F_Civ_InfoBoards","A3_Structures_F_Civ_Kiosks","A3_Structures_F_Civ_Lamps","A3_Structures_F_Civ_Market","A3_Structures_F_Civ_Offices","A3_Structures_F_Civ_Pavements","A3_Structures_F_Civ_PlayGround","A3_Structures_F_Civ_SportsGrounds","A3_Structures_F_Civ_Statues","A3_Structures_F_Civ_Tourism","A3_Structures_F_Data","A3_Structures_F_Dominants","A3_Structures_F_Dominants_Amphitheater","A3_Structures_F_Dominants_Castle","A3_Structures_F_Dominants_Church","A3_Structures_F_Dominants_Hospital","A3_Structures_F_Dominants_Lighthouse","A3_Structures_F_Dominants_WIP","A3_Structures_F_Furniture","A3_Structures_F_Households","A3_Structures_F_Households_Addons","A3_Structures_F_Households_House_Big01","A3_Structures_F_Households_House_Big02","A3_Structures_F_Households_House_Shop01","A3_Structures_F_Households_House_Shop02","A3_Structures_F_Households_House_Small01","A3_Structures_F_Households_House_Small02","A3_Structures_F_Households_House_Small03","A3_Structures_F_Households_Slum","A3_Structures_F_Households_Stone_Big","A3_Structures_F_Households_Stone_Shed","A3_Structures_F_Households_Stone_Small","A3_Structures_F_Households_WIP","A3_Structures_F_Ind","A3_Structures_F_Ind_AirPort","A3_Structures_F_Ind_Cargo","A3_Structures_F_Ind_CarService","A3_Structures_F_Ind_ConcreteMixingPlant","A3_Structures_F_Ind_Crane","A3_Structures_F_Ind_DieselPowerPlant","A3_Structures_F_Ind_Factory","A3_Structures_F_Ind_FuelStation","A3_Structures_F_Ind_FuelStation_Small","A3_Structures_F_Ind_Pipes","A3_Structures_F_Ind_PowerLines","A3_Structures_F_Ind_ReservoirTank","A3_Structures_F_Ind_Shed","A3_Structures_F_Ind_SolarPowerPlant","A3_Structures_F_Ind_Tank","A3_Structures_F_Ind_Transmitter_Tower","A3_Structures_F_Ind_WavePowerPlant","A3_Structures_F_Ind_Windmill","A3_Structures_F_Ind_WindPowerPlant","A3_Structures_F_Items","A3_Structures_F_Items_Documents","A3_Structures_F_Items_Electronics","A3_Structures_F_Items_Food","A3_Structures_F_Items_Gadgets","A3_Structures_F_Items_Luggage","A3_Structures_F_Items_Medical","A3_Structures_F_Items_Military","A3_Structures_F_Items_Stationery","A3_Structures_F_Items_Tools","A3_Structures_F_Items_Valuables","A3_Structures_F_Items_Vessels","A3_Structures_F_Mil","A3_Structures_F_Mil_BagBunker","A3_Structures_F_Mil_BagFence","A3_Structures_F_Mil_Barracks","A3_Structures_F_Mil_Bunker","A3_Structures_F_Mil_Cargo","A3_Structures_F_Mil_Flags","A3_Structures_F_Mil_Fortification","A3_Structures_F_Mil_Helipads","A3_Structures_F_Mil_Offices","A3_Structures_F_Mil_Radar","A3_Structures_F_Mil_Shelters","A3_Structures_F_Mil_TentHangar","A3_Structures_F_Naval","A3_Structures_F_Naval_Buoys","A3_Structures_F_Naval_Fishing","A3_Structures_F_Naval_Piers","A3_Structures_F_Naval_RowBoats","A3_Structures_F_Research","A3_Structures_F_System","A3_Structures_F_Training","A3_Structures_F_Training_InvisibleTarget","A3_Structures_F_Walls","A3_Structures_F_EPA","A3_Structures_F_EPA_Civ_Camping","A3_Structures_F_EPA_Civ_Constructions","A3_Structures_F_EPA_Items_Electronics","A3_Structures_F_EPA_Items_Food","A3_Structures_F_EPA_Items_Medical","A3_Structures_F_EPA_Items_Tools","A3_Structures_F_EPA_Items_Vessels","A3_Structures_F_EPA_Walls","A3_Structures_F_EPB","A3_Structures_F_EPB_Civ_Accessories","A3_Structures_F_EPB_Civ_Camping","A3_Structures_F_EPB_Civ_Dead","A3_Structures_F_EPB_Civ_Garbage","A3_Structures_F_EPB_Civ_Graffiti","A3_Structures_F_EPB_Civ_PlayGround","A3_Structures_F_EPB_Furniture","A3_Structures_F_EPB_Items_Documents","A3_Structures_F_EPB_Items_Luggage","A3_Structures_F_EPB_Items_Military","A3_Structures_F_EPB_Items_Vessels","A3_Structures_F_EPB_Naval_Fishing","A3_Structures_F_EPC","A3_Structures_F_EPC_Civ_Accessories","A3_Structures_F_EPC_Civ_Camping","A3_Structures_F_EPC_Civ_Garbage","A3_Structures_F_EPC_Civ_InfoBoards","A3_Structures_F_EPC_Civ_Kiosks","A3_Structures_F_EPC_Civ_Playground","A3_Structures_F_EPC_Civ_Tourism","A3_Structures_F_EPC_Dominants_GhostHotel","A3_Structures_F_EPC_Dominants_Stadium","A3_Structures_F_EPC_Furniture","A3_Structures_F_EPC_Items_Documents","A3_Structures_F_EPC_Items_Electronics","A3_Structures_F_EPC_Walls","A3_UiFonts_F","ColorbondA","SFP_207","Quiet_voiture_1","SFP_MUNITIONS_CONFIG","shounka_a3_audia8_limo","A3_Animals_F","A3_Animals_F_Animconfig","A3_Animals_F_Fishes","A3_Animals_F_Kestrel","A3_Animals_F_Rabbit","A3_Animals_F_Seagull","A3_Animals_F_Snakes","A3_Animals_F_Turtle","A3_Animals_F_Beta","A3_Animals_F_Beta_Chicken","A3_Animals_F_Beta_Dog","A3_Animals_F_Beta_Goat","A3_Animals_F_Beta_Sheep","A3_Anims_F","A3_Anims_F_Config_Sdr","A3_Anims_F_Config_Sdr_WeaponSwitching","A3_Anims_F_Data","A3_Anims_F_EPA","A3_Anims_F_EPC","A3_Dubbing_F_EPA","A3_Dubbing_F_EPB","A3_Dubbing_F_EPC","A3_Language_F_EPA","A3_Language_F_EPB","A3_Language_F_EPC","A3_LanguageMissions_F_EPA","A3_LanguageMissions_F_EPB","A3_LanguageMissions_F_EPC","A3_Map_Data","A3_Map_Stratis","A3_Map_Stratis_Data","A3_Map_Stratis_Data_Layers","A3_Map_Stratis_Scenes_F","A3_Plants_F_Bush","A3_Signs_F","A3_Signs_F_Signs_Ad","A3_Structures_F_Signs_Companies","A3_Ui_F","A3_Ui_F_Data","A3_Ui_F_Curator","A3_Weapons_F","A3_Weapons_F_Ammoboxes","A3_Weapons_F_DummyWeapons","A3_Weapons_F_Explosives","A3_Weapons_F_Items","A3_Weapons_F_Launchers_NLAW","A3_Weapons_F_Launchers_RPG32","A3_Weapons_F_Launchers_Titan","A3_Weapons_F_LongRangeRifles_DMR_01","A3_Weapons_F_LongRangeRifles_EBR","A3_Weapons_F_LongRangeRifles_GM6","A3_Weapons_F_LongRangeRifles_M320","A3_Weapons_F_Machineguns_M200","A3_Weapons_F_Machineguns_Zafir","A3_Weapons_F_Pistols_ACPC2","A3_Weapons_F_Pistols_P07","A3_Weapons_F_Pistols_Pistol_Heavy_01","A3_Weapons_F_Pistols_Pistol_Heavy_02","A3_Weapons_F_Pistols_Rook40","A3_Weapons_F_Rifles_Khaybar","A3_Weapons_F_Rifles_MK20","A3_Weapons_F_Rifles_MX","A3_Weapons_F_Rifles_MX_Black","A3_Weapons_F_Rifles_SDAR","A3_Weapons_F_Rifles_TRG20","A3_Weapons_F_SMGs_Pdw2000","A3_Weapons_F_SMGs_SMG_01","A3_Weapons_F_SMGs_SMG_02","A3_Weapons_F_Beta","A3_Weapons_F_Beta_Ammoboxes","A3_Weapons_F_Beta_LongRangeRifles_EBR","A3_Weapons_F_Beta_LongRangeRifles_GM6","A3_Weapons_F_Beta_LongRangeRifles_M320","A3_Weapons_F_Beta_Rifles_Khaybar","A3_Weapons_F_Beta_Rifles_MX","A3_Weapons_F_Beta_Rifles_TRG20","A3_Weapons_F_Gamma","A3_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_Gamma_LongRangeRifles_EBR","A3_Weapons_F_Gamma_Rifles_MX","Pistolet_Radar_Gendarmerie_SFP","BaBe_EM_Anims","BaBe_fd_anims","IP_A2C","SFP_Objects_Barriere_Chantier","Press_Assets","TPS_Cam","TPS_Mic","SFP_ARMES_CONFIG","SFP_CHIEN_CONFIG","SFP_SAC_CONFIG","TRYK_BackPack","A3_Characters_F","A3_Characters_F_BLUFOR","A3_Characters_F_Civil","A3_Characters_F_Heads","A3_Characters_F_OPFOR","A3_Characters_F_Proxies","A3_Characters_F_Beta","A3_Characters_F_Beta_INDEP","A3_Characters_F_Gamma","A3_Data_F_Curator","A3_Data_F_Curator_Eagle","A3_Data_F_Curator_Intel","A3_Data_F_Curator_Misc","A3_Data_F_Curator_Respawn","A3_Data_F_Kart","A3_Data_F_Kart_ParticleEffects","A3_Language_F_Curator","A3_Language_F_Kart","A3_LanguageMissions_F_Kart","A3_Map_Altis","A3_Map_Altis_Data","A3_Map_Altis_Data_Layers","A3_Map_Altis_Scenes_F","A3_Missions_F","A3_Missions_F_Data","A3_Missions_F_Video","A3_Missions_F_Beta","A3_Missions_F_Beta_Data","A3_Missions_F_Beta_Video","A3_Missions_F_Gamma","A3_Missions_F_Gamma_Data","A3_Missions_F_Gamma_Video","A3_Modules_F_Curator","A3_Modules_F_Curator_Animals","A3_Modules_F_Curator_CAS","A3_Modules_F_Curator_Curator","A3_Modules_F_Curator_Effects","A3_Modules_F_Curator_Environment","A3_Modules_F_Curator_Flares","A3_Modules_F_Curator_Intel","A3_Modules_F_Curator_Lightning","A3_Modules_F_Curator_Mines","A3_Modules_F_Curator_Misc","A3_Modules_F_Curator_Multiplayer","A3_Modules_F_Curator_Objectives","A3_Modules_F_Curator_Ordnance","A3_Modules_F_Curator_Respawn","A3_Modules_F_Curator_SmokeShells","A3_Modules_F_Kart","A3_Modules_F_Kart_Data","A3_Modules_F_Kart_TimeTrials","A3_Sounds_F","A3_Sounds_F_Arsenal","A3_Sounds_F_Characters","A3_Sounds_F_Environment","A3_Sounds_F_Sfx","A3_Sounds_F_Vehicles","A3_Sounds_F_EPB","A3_Sounds_F_EPC","A3_Sounds_F_Kart","A3_Static_F","A3_Static_F_Mortar_01","A3_Static_F_Beta","A3_Static_F_Beta_Mortar_01","A3_Static_F_Gamma","A3_Static_F_Gamma_Mortar_01","A3_Structures_F_Kart","A3_Structures_F_Kart_Civ_SportsGrounds","A3_Structures_F_Kart_Mil_Flags","A3_Structures_F_Kart_Signs_Companies","A3_Ui_F_Kart","A3_Weapons_F_Acc","A3_Weapons_F_Beta_Acc","A3_Weapons_F_EPA","A3_Weapons_F_EPA_Acc","A3_Weapons_F_EPA_Ammoboxes","A3_Weapons_F_EPB","A3_Weapons_F_EPB_Acc","A3_Weapons_F_EPB_Ammoboxes","A3_Weapons_F_EPB_LongRangeRifles_GM6","A3_Weapons_F_EPC","A3_Weapons_F_Gamma_Acc","A3_Weapons_F_Kart","A3_Weapons_F_Kart_Pistols_Pistol_Signal_F","babe_core_UI","babe_EM_gst","Bowman_headsets","DragonFyre_Bullethits","DragonFyre_Environment","DragonFyre_Explosions","DFyre_FrameWork","DragonFyre_GlobalFilters","DragonFyre_Movement","DragonFyre_Sonic_Cracks","DragonFyre_230mm_Titan","DragonFyre_Air_Weapons","DragonFyre_35mm_Autocannon","DragonFyre_120mm_Cannon","DragonFyre_Gatling","DragonFyre_Gatling_30mm_Plane_CAS_01","DragonFyre_Cannon_30mm_Plane_CAS_02","DragonFyre_CTWS_Autocannon","DragonFyre_DAGR","DragonFyre_DAR","DragonFyre_30mm_Cannon","DragonFyre_Gatling_Weapons","DragonFyre_155mm_AMOS","DragonFyre_LMG_Coax","DragonFyre_LMGRCWS","DragonFyre_GMG20","DragonFyre_GMG40","DragonFyre_127","DragonFyre_Skalpel_ATGM","DragonFyre_Skyfire","DragonFyre_Veh_Titan","DragonFyre_4Five45","DragonFyre_ACPC","DragonFyre_ASP1","DFyre_MX","DragonFyre_Cyrus","DragonFyre_M6","DragonFyre_Khaybar","DragonFyre_M320R","DragonFyre_MAR10","DragonFyre_Mk1EMR","DragonFyre_Mk14","DragonFyre_EBR","DragonFyre_FS2000","DragonFyre_M200","DragonFyre_Navid","DragonFyre_P07","DragonFyre_PCML","DragonFyre_PDW","DragonFyre_Rahim","DragonFyre_Rook40","DragonFyre_RPG32","DragonFyre_SPMG","DragonFyre_Scorpian","DragonFyre_Titan","DragonFyre_TRG20","DragonFyre_UGL","DragonFyre_SDAR","DragonFyre_Vector","DragonFyre_Zafir","DragonFyre_Zubr45","FEMAL3_v1","Identizee_CustomModels","More_Heads","r3f_acc","Casque_Pompier_SFP","gign_shield","SUP_flash","Zee_Glasses","A3_Air_F","A3_Air_F_Heli_Light_01","A3_Air_F_Heli_Light_02","A3_Air_F_Beta","A3_Air_F_Beta_Heli_Attack_01","A3_Air_F_Beta_Heli_Attack_02","A3_Air_F_Beta_Heli_Transport_01","A3_Air_F_Beta_Heli_Transport_02","A3_Air_F_Beta_Parachute_01","A3_Air_F_Beta_Parachute_02","A3_Air_F_Gamma","A3_Air_F_Gamma_Plane_Fighter_03","A3_Anims_F_Kart","A3_Armor_F","A3_Armor_F_Beta","A3_Armor_F_Beta_APC_Tracked_01","A3_Armor_F_Beta_APC_Tracked_02","A3_Armor_F_Gamma","A3_Armor_F_Gamma_MBT_01","A3_Armor_F_Gamma_MBT_02","A3_Boat_F","A3_Boat_F_Boat_Armed_01","A3_Boat_F_Boat_Transport_01","A3_Boat_F_Beta","A3_Boat_F_Beta_Boat_Armed_01","A3_Boat_F_Beta_Boat_Transport_01","A3_Boat_F_Beta_SDV_01","A3_Boat_F_Gamma","A3_Boat_F_Gamma_Boat_Civil_01","A3_Boat_F_Gamma_Boat_Civil_04","A3_Boat_F_Gamma_Boat_Transport_01","A3_Characters_F_Common","A3_Characters_F_EPA","A3_Characters_F_EPB","A3_Characters_F_EPB_Heads","A3_Characters_F_EPC","A3_Characters_F_Kart","A3_Data_F_Bootcamp","A3_Data_F_Curator_Characters","A3_Data_F_Curator_Virtual","A3_Data_F_Heli","A3_Data_F_Mark","A3_Dubbing_F_Bootcamp","A3_Dubbing_F_Heli","A3_Dubbing_F_Mark","A3_Dubbing_F_MP_Mark","A3_Functions_F_Bootcamp","A3_Functions_F_Heli","A3_Functions_F_Mark","A3_Functions_F_MP_Mark","A3_Language_F_Bootcamp","A3_Language_F_Heli","A3_Language_F_Mark","A3_Language_F_MP_Mark","A3_LanguageMissions_F_Bootcamp","A3_LanguageMissions_F_Heli","A3_LanguageMissions_F_Mark","A3_LanguageMissions_F_MP_Mark","A3_Map_VR","A3_Map_VR_Scenes_F","A3_Missions_F_EPA","A3_Missions_F_EPA_Data","A3_Missions_F_EPA_Video","A3_Missions_F_EPB","A3_Missions_F_EPC","A3_Modules_F_Bootcamp","A3_Modules_F_Bootcamp_Misc","A3_Modules_F_Curator_Chemlights","A3_Modules_F_Heli","A3_Modules_F_Heli_Misc","A3_Modules_F_Mark","A3_Modules_F_Mark_FiringDrills","A3_Modules_F_MP_Mark","A3_Modules_F_MP_Mark_Objectives","A3_Music_F_Bootcamp","A3_Music_F_Bootcamp_Music","A3_Music_F_Heli","A3_Music_F_Heli_Music","A3_Music_F_Mark","A3_Music_F_Mark_Music","A3_Soft_F","A3_Soft_F_MRAP_01","A3_Soft_F_MRAP_02","A3_Soft_F_Offroad_01","A3_Soft_F_Quadbike_01","A3_Soft_F_Beta","A3_Soft_F_Beta_MRAP_03","A3_Soft_F_Beta_Quadbike_01","A3_Soft_F_Beta_Truck_01","A3_Soft_F_Beta_Truck_02","A3_Soft_F_Gamma","A3_Soft_F_Gamma_Hatchback_01","A3_Soft_F_Gamma_Offroad_01","A3_Soft_F_Gamma_Quadbike_01","A3_Soft_F_Gamma_SUV_01","A3_Soft_F_Gamma_Truck_01","A3_Soft_F_Gamma_Truck_02","A3_Soft_F_Gamma_Van_01","A3_Sounds_F_Bootcamp","A3_Sounds_F_Heli","A3_Sounds_F_Mark","A3_Static_F_AA_01","A3_Static_F_AT_01","A3_Static_F_Mark","A3_Static_F_Mark_Designator_01","A3_Static_F_Mark_Designator_02","A3_Structures_F_Mil_Scrapyard","A3_Structures_F_Wrecks","A3_Structures_F_Bootcamp","A3_Structures_F_Bootcamp_Civ_Camping","A3_Structures_F_Bootcamp_Civ_SportsGrounds","A3_Structures_F_Bootcamp_Ind_Cargo","A3_Structures_F_Bootcamp_Items_Electronics","A3_Structures_F_Bootcamp_Items_Food","A3_Structures_F_Bootcamp_Items_Sport","A3_Structures_F_Bootcamp_System","A3_Structures_F_Bootcamp_Training","A3_Structures_F_Bootcamp_VR_Blocks","A3_Structures_F_Bootcamp_VR_CoverObjects","A3_Structures_F_Bootcamp_VR_Helpers","A3_Structures_F_EPA_Mil_Scrapyard","A3_Structures_F_Heli","A3_Structures_F_Heli_Civ_Accessories","A3_Structures_F_Heli_Civ_Constructions","A3_Structures_F_Heli_Civ_Garbage","A3_Structures_F_Heli_Civ_Market","A3_Structures_F_Heli_Furniture","A3_Structures_F_Heli_Ind_Airport","A3_Structures_F_Heli_Ind_Cargo","A3_Structures_F_Heli_Ind_Machines","A3_Structures_F_Heli_Items_Airport","A3_Structures_F_Heli_Items_Electronics","A3_Structures_F_Heli_Items_Food","A3_Structures_F_Heli_Items_Luggage","A3_Structures_F_Heli_Items_Sport","A3_Structures_F_Heli_Items_Tools","A3_Structures_F_Heli_VR_Helpers","A3_Structures_F_Mark","A3_Structures_F_Mark_Items_Military","A3_Structures_F_Mark_Items_Sport","A3_Structures_F_Mark_Mil_Flags","A3_Structures_F_Mark_Training","A3_Structures_F_Mark_VR_Helpers","A3_Structures_F_Mark_VR_Shapes","A3_Structures_F_Mark_VR_Targets","A3_Supplies_F_Heli","A3_Supplies_F_Heli_Bladders","A3_Supplies_F_Heli_CargoNets","A3_Supplies_F_Heli_Fuel","A3_Supplies_F_Heli_Slingload","A3_Supplies_F_Mark","A3_Ui_F_Bootcamp","A3_Ui_F_Heli","A3_Ui_F_Mark","A3_Ui_F_MP_Mark","A3_Weapons_F_Bootcamp","A3_Weapons_F_Bootcamp_Ammoboxes","A3_Weapons_F_Bootcamp_LongRangeRifles_GM6_Camo","A3_Weapons_F_Bootcamp_LongRangeRifles_M320_Camo","A3_Weapons_F_Mark","A3_Weapons_F_Mark_Acc","A3_Weapons_F_Mark_LongRangeRifles_DMR_01","A3_Weapons_F_Mark_LongRangeRifles_DMR_02","A3_Weapons_F_Mark_LongRangeRifles_DMR_03","A3_Weapons_F_Mark_LongRangeRifles_DMR_04","A3_Weapons_F_Mark_LongRangeRifles_DMR_05","A3_Weapons_F_Mark_LongRangeRifles_DMR_06","A3_Weapons_F_Mark_LongRangeRifles_EBR","A3_Weapons_F_Mark_LongRangeRifles_GM6","A3_Weapons_F_Mark_LongRangeRifles_GM6_Camo","A3_Weapons_F_Mark_LongRangeRifles_M320","A3_Weapons_F_Mark_LongRangeRifles_M320_Camo","A3_Weapons_F_Mark_Machineguns_M200","A3_Weapons_F_Mark_Machineguns_MMG_01","A3_Weapons_F_Mark_Machineguns_MMG_02","A3_Weapons_F_Mark_Machineguns_Zafir","A3_Weapons_F_Mark_Rifles_Khaybar","A3_Weapons_F_Mark_Rifles_MK20","A3_Weapons_F_Mark_Rifles_MX","A3_Weapons_F_Mark_Rifles_SDAR","A3_Weapons_F_Mark_Rifles_TRG20","SFP_BMW_135_Config","SFP_Challenger","SFP_CHARGER_Config","SFP_CVPI_Config","SFP_Mitsubishi_Config","SFP_FERRARI_F350_Config","SFP_FERRARI_458_Config","SFP_GRAND_CARAVAN_Config","SFP_GRAND_CARAVANUC_Config","SFP_Discotheque_Config","SFP_REGAL_Config","SFP_TAHOE_Config","SFP_TAURUS_Config","SFP_Vehicules_Refait","SFP_LAND_ROVER_Config","SFP_DBS_VOLANTE_Config","SFP_AUDI_Q7_Config_Deux","SFP_AUDI_Q7_Config","SFP_AUDI_R8_Config","SFP_E60_M5_Config","SFP_Z4_ADDONS","SFP_VEYRON_Config","SFP_CHARGER_DODGE_Config","SFP_FERRARI_458_Config_Deux","SFP_FORD_GT_Config","SFP_TAURUS_Config_Deux","SFP_CIVIC_VTI_Config","SFP_RANGE_ROVER_Config","SFP_AMG_E63_Config","SFP_CARRERA_GT_Config","SFP_INSIGNA_Config","SFP_GOLF_MK2_Config","SFP_GOLF_LEARNER_Config","SFP_POLO_GTI_Config","SFP_Colbat_Config","DAR_Challenger_F_Deux","DAR_Challenger_F","DAR_Explorer_F","DAR_Tahoe_A","DAR_Tahoe_F_Deux","DAR_Tahoe_F","DAR_Impala_A_Deux","DAR_Taurus_F","DragonFyre_FighterPlane3","DragonFyre_CAS_Plane1","DragonFyre_AH99_Blackfoot","DragonFyre_AH9_Pawnee","DragonFyre_UAV_1","DragonFyre_CH67_Huron","DragonFyre_CH49_Mohawk","DragonFyre_Mi290_Taru","DragonFyre_Mi48_Kajman","DragonFyre_UAV_2","DragonFyre_Po30_Orca","DragonFyre_CAS_Plane2","DragonFyre_UH80_GhostHawk","DragonFyre_WY55_Hellcat","DragonFyre_Armed_Boat","DragonFyre_Rubber_Boat","DragonFyre_Speed_Boat","DragonFyre_2S9_Sorcher","DragonFyre_BTRK_Kamysh","DragonFyre_FV720_Mora","DragonFyre_IFV6a_Cheetah","DragonFyre_IFV6c_Panther","DragonFyre_M2A1_Slammer","DragonFyre_M4_Scorcher","DragonFyre_M5_Sandstorm","DragonFyre_MBT52_Kuma","DragonFyre_T100_Varsuk","DragonFyre_ZSU39_Tigris","DragonFyre_AFV4_Gorgon","DragonFyre_AMV7_Marshal","DragonFyre_Hatchback","DragonFyre_truck1","DragonFyre_Hunter","DragonFyre_Ifrit","DragonFyre_MSE3_Marid","DragonFyre_Offroad","DragonFyre_Quadbike","DragonFyre_Strider","DragonFyre_SUV","DragonFyre_Truck2","DragonFyre_Van","DragonFyre_Truck3","gign","HAFM_UAZ","HAFM_UK_WHEELED","HAFM_EC635_Config","TRYK_HRP","DAR_Impala_A","IVORY_T6A","Jonzie_96_Impala","SFP_Ambulance","Jonzie_A3L_Car_Base","Jonzie_Viper","mm_bank","mm_buildings2","mm_buildings","GatedoorA","Gate_B","Gate_C","Gaol_MapObject","Helipad_MapObject","MainSection","Mattaust_Objects","HouseA","mm_showroom","Config_SFP_308_RCZ","Config_SFP_308_Gendarmerie","Config_SFP_F350","Config_SFP_Citroen_DS3","Config_SFP_Nissan_GTR","Config_SFP_Megane_RS_Gendarmerie","Config_SFP_Smart","Config_SFP_Agera_Sportif","Config_SFP_Agera_Gendarmerie","Config_SFP_Alpha_Romeo","Config_SFP_BMW_Serie_Une","Config_SFP_BMW_Serie_Une_Gendarmerie","Config_SFP_BMW_Serie_Six","Config_SFP_Bowler","Config_SFP_C4_Picasso","Config_SFP_Mercedes_E63_2015","Config_SFP_Porsche_SFP","Config_SFP_Jeep_Cherokee","Config_SFP_Corbillard","Config_SFP_Ducati_Civil","Config_SFP_Golf_Six","Config_SFP_Jeep_Blinde","Config_SFP_Lincoln","Config_SFP_Megane_RS_2015","Config_SFP_Megane_Rs_2015_Gendarmerie","Config_SFP_Renault_R5","Config_SFP_Audi_RS_Quatre_Gendarmerie","Config_SFP_Audi_Rs_Quatre","Config_SFP_Renault_Twingo","Config_SFP_Vandura","Config_SFP_Lamborghini_Veveno","Config_SFP_Volkswagen_Touareg","Config_SFP_Yamaha_Moto","Config_SFP_MAN_THX_POIDS_LOURD","Config_SFP_Atego_FTP_Pompier","Config_SFP_Audi_R8_Plus","RPIMA","SFP_McLarenP1_Config","SFP_Porsche_RS_Config","SFP_Vantage_Voiture_Config","sab_aircraftlib","sab_alphajet","sab_An2","sab_FAAllegro","sab_RobinDR400","SAL_77TRANSAM_A","SAL_Audi_A","SAL_IROC_A","A3_Air_F_Beta_Heli_Transport_01_SFP","SFP_AVIONS_CONFIG_LITTLEBIRD","SFP_AVIONS_CONFIG_O_HELI_LIGHT_02","SFP_VOITURES_CONFIG_D_MAX","A3_Air_F_EPB_Heli_Light_03_SFP","SFP_VOITURES_CONFIG_MRAP","SFP_VOITURES_CONFIG_VAN_BOX","Config_SFP_Audi_R5","Config_SFP_Clio_Trois_RS_Civil","Config_SFP_Dafxf_Euros_Six","Config_SFP_Citroen_DS_Quatre","Config_SFP_Gendarmerie_Sprinter","Config_SFP_Lamborghini_Huracan","Config_SFP_Mantgs_Depanneur","Config_SFP_Peugeot_508","Config_SFP_Peugeot_508_Gendarmerie","Config_SFP_Sprinter_Pompier","Config_SFP_Porsche_911_92","Config_SFP_Renault_Magnum","Config_SFP_SuburBanGIGN","Config_SFP_suburbangign_transport","TRYK_Uniform","cba_jr_prep","cba_xeh","cba_xeh_a3","Extended_EventHandlers","CBA_Extended_EventHandlers","cba_ee","A3_Air_F_EPB","A3_Air_F_EPB_Heli_Light_03","A3_Air_F_EPC","A3_Air_F_EPC_Plane_CAS_01","A3_Air_F_EPC_Plane_CAS_02","A3_Air_F_EPC_Plane_Fighter_03","A3_Air_F_Heli","A3_Air_F_Heli_Heli_Attack_01","A3_Air_F_Heli_Heli_Attack_02","A3_Air_F_Heli_Heli_Light_01","A3_Air_F_Heli_Heli_Light_02","A3_Air_F_Heli_Heli_Light_03","A3_Air_F_Heli_Heli_Transport_01","A3_Air_F_Heli_Heli_Transport_02","A3_Air_F_Heli_Heli_Transport_03","A3_Air_F_Heli_Heli_Transport_04","A3_Anims_F_Bootcamp","A3_Anims_F_Heli","A3_Anims_F_Mark","A3_Anims_F_Mark_Deployment","A3_Armor_F_Beta_APC_Wheeled_01","A3_Armor_F_Beta_APC_Wheeled_02","A3_Armor_F_EPB","A3_Armor_F_EPB_APC_Tracked_03","A3_Armor_F_EPB_MBT_03","A3_Armor_F_EPC","A3_Armor_F_EPC_MBT_01","A3_Armor_F_Gamma_APC_Wheeled_03","A3_Boat_F_EPC","A3_Boat_F_EPC_Submarine_01","A3_Boat_F_Heli","A3_Boat_F_Heli_Boat_Armed_01","A3_Boat_F_Heli_SDV_01","A3_Cargoposes_F","A3_Cargoposes_F_Heli","A3_Characters_F_Bootcamp","A3_Characters_F_Bootcamp_Common","A3_Characters_F_Mark","A3_Data_F_Exp_A","A3_Data_F_Exp_B","A3_Drones_F","A3_Drones_F_Air_F_Gamma_UAV_01","A3_Drones_F_Air_F_Gamma_UAV_02","A3_Drones_F_Characters_F_Gamma","A3_Drones_F_Soft_F_Gamma_UGV_01","A3_Drones_F_Weapons_F_Gamma_Ammoboxes","A3_Drones_F_Weapons_F_Gamma_Items","A3_Functions_F_Exp_A","A3_Language_F_Exp_A","A3_Language_F_Exp_B","A3_LanguageMissions_F_Exp_A","A3_Missions_F_Curator","A3_Missions_F_Kart","A3_Missions_F_Kart_Data","A3_Modules_F_Exp_A","A3_Props_F_Exp_A","A3_Props_F_Exp_A_Military","A3_Props_F_Exp_A_Military_Equipment","A3_Soft_F_EPC","A3_Soft_F_EPC_Truck_03","A3_Soft_F_Kart","A3_Soft_F_Kart_Kart_01","A3_Sounds_F_Exp_A","A3_Structures_F_Exp_A","A3_Structures_F_Exp_A_VR_Blocks","A3_Structures_F_Exp_A_VR_Helpers","A3_Ui_F_Exp_A","TCP_Su22","TCP_Su22_BrakeChute","cba_jr","asdg_jointrails","asdg_jointmuzzles","A3_3DEN","A3_Anims_F_Exp_A","A3_Data_F_Exp_A_Virtual","A3_Missions_F_Bootcamp","A3_Missions_F_Bootcamp_Data","A3_Missions_F_Bootcamp_Video","A3_Missions_F_Heli","A3_Missions_F_Heli_Data","A3_Missions_F_Heli_Video","A3_Missions_F_Mark","A3_Missions_F_Mark_Data","A3_Missions_F_Mark_Video","A3_Missions_F_MP_Mark","A3_Missions_F_MP_Mark_Data","A3_Soft_F_Bootcamp","A3_Soft_F_Bootcamp_Offroad_01","A3_Soft_F_Bootcamp_Quadbike_01","A3_Soft_F_Bootcamp_Van_01","A3_Soft_F_Heli","A3_Soft_F_Heli_Hatchback_01","A3_Soft_F_Heli_MRAP_01","A3_Soft_F_Heli_MRAP_02","A3_Soft_F_Heli_MRAP_03","A3_Soft_F_Heli_Quadbike_01","A3_Soft_F_Heli_SUV_01","A3_Soft_F_Heli_UGV_01","A3_Soft_F_Heli_Van_01","A3_BaseConfig_F","3DEN","A3_Animals_F_Chicken","A3_Animals_F_Dog","A3_Animals_F_Goat","A3_Animals_F_Sheep","A3_Armor_F_Panther","A3_Armor_F_AMV","A3_Armor_F_Marid","A3_Armor_F_APC_Wheeled_03","A3_Armor_F_Slammer","A3_Armor_F_T100K","A3_Boat_F_SDV_01","A3_Boat_F_EPC_Submarine_01_F","A3_Boat_F_Civilian_Boat","A3_Boat_F_Trawler","A3_Characters_F_INDEP","A3_Air_F_Gamma_UAV_01","A3_Air_F_Gamma_UAV_02","A3_UAV_F_Characters_F_Gamma","A3_Soft_F_Crusher_UGV","A3_UAV_F_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_gamma_Items","A3_Map_Altis_Scenes","A3_Map_Stratis_Scenes","Map_VR","A3_Map_VR_Scenes","A3_Modules_F_Heli_SpawnAi","A3_Modules_F_Mark_Objectives","A3_Signs_F_AD","A3_Soft_F_Quadbike","A3_Soft_F_MRAP_03","A3_Soft_F_Beta_Quadbike","A3_Soft_F_HEMTT","A3_Soft_F_TruckHeavy","A3_Soft_F_Bootcamp_Quadbike","A3_Soft_F_Bootcamp_Truck","A3_Soft_F_Car","A3_Soft_F_Gamma_Offroad","A3_Soft_F_Gamma_Quadbike","A3_Soft_F_SUV","A3_Soft_F_Gamma_HEMTT","A3_Soft_F_Gamma_TruckHeavy","A3_Soft_F_Truck","A3_Soft_F_Heli_Car","A3_Soft_F_Heli_Quadbike","A3_Soft_F_Heli_SUV","A3_Soft_F_Heli_Crusher_UGV","A3_Soft_F_Heli_Truck","A3_Static_F_Gamma_AA","A3_Static_F_Gamma_AT","A3_Structures_F_Items_Cans","A3_Weapons_F_NATO","A3_Weapons_F_CSAT","A3_Weapons_F_AAF","A3_weapons_F_FIA","A3_Weapons_F_ItemHolders","A3_Weapons_F_Headgear","A3_Weapons_F_Uniforms","A3_Weapons_F_Vests","A3_Weapons_F_Launchers_LAW","A3_Weapons_F_EPA_LongRangeRifles_DMR_01","A3_Weapons_F_EBR","A3_Weapons_F_EPB_Rifles_MX_Black","A3_Weapons_F_Pistols_PDW2000","A3_Weapons_F_Rifles_Vector","a3_weapons_f_rifles_SMG_02","A3_Weapons_F_beta_EBR","A3_Weapons_F_EPA_LongRangeRifles_GM6","A3_Weapons_F_EPB_LongRangeRifles_M320","A3_Weapons_F_Bootcamp_LongRangeRifles_GM6","A3_Weapons_F_Bootcamp_LongRangeRifles_M320","A3_Weapons_F_EPB_LongRangeRifles_GM3","A3_Weapons_F_EPA_EBR","A3_Weapons_F_EPA_Rifles_MX","A3_Weapons_F_Mark_EBR","CuratorOnly_Air_F_Beta_Heli_Attack_01","CuratorOnly_Air_F_Beta_Heli_Attack_02","CuratorOnly_Air_F_Gamma_UAV_01","CuratorOnly_Armor_F_AMV","CuratorOnly_armor_f_beta_APC_Tracked_02","CuratorOnly_Armor_F_Marid","CuratorOnly_Armor_F_Panther","CuratorOnly_Armor_F_Slammer","CuratorOnly_Armor_F_T100K","CuratorOnly_Boat_F_Boat_Armed_01","CuratorOnly_Characters_F_BLUFOR","CuratorOnly_Characters_F_Common","CuratorOnly_Characters_F_OPFOR","CuratorOnly_Modules_F_Curator_Animals","CuratorOnly_Modules_F_Curator_Chemlights","CuratorOnly_Modules_F_Curator_Effects","CuratorOnly_Modules_F_Curator_Environment","CuratorOnly_Modules_F_Curator_Flares","CuratorOnly_Modules_F_Curator_Lightning","CuratorOnly_Modules_F_Curator_Mines","CuratorOnly_Modules_F_Curator_Objectives","CuratorOnly_Modules_F_Curator_Ordnance","CuratorOnly_Modules_F_Curator_Smokeshells","CuratorOnly_Signs_F","CuratorOnly_Soft_F_Crusher_UGV","CuratorOnly_Soft_F_MRAP_01","CuratorOnly_Soft_F_MRAP_02","CuratorOnly_Soft_F_Quadbike","CuratorOnly_Static_F_Gamma","CuratorOnly_Static_F_Mortar_01","CuratorOnly_Structures_F_Civ_Ancient","CuratorOnly_Structures_F_Civ_Camping","CuratorOnly_Structures_F_Civ_Garbage","CuratorOnly_Structures_F_EPA_Civ_Constructions","CuratorOnly_Structures_F_EPB_Civ_Dead","CuratorOnly_Structures_F_Ind_Cargo","CuratorOnly_Structures_F_Ind_Crane","CuratorOnly_Structures_F_Ind_ReservoirTank","CuratorOnly_Structures_F_Ind_Transmitter_Tower","CuratorOnly_Structures_F_Items_Vessels","CuratorOnly_Structures_F_Mil_BagBunker","CuratorOnly_Structures_F_Mil_BagFence","CuratorOnly_Structures_F_Mil_Cargo","CuratorOnly_Structures_F_Mil_Fortification","CuratorOnly_Structures_F_Mil_Radar","CuratorOnly_Structures_F_Mil_Shelters","CuratorOnly_Structures_F_Research","CuratorOnly_Structures_F_Walls","CuratorOnly_Structures_F_Wrecks","A3_Missions_F_Exp_A","A3_Missions_F_Exp_A_Data","BABE_CORE_FNC","BABE_EM_FNC","BABE_FD_FNC","rds_A2_Civilians","chalutier_SFP","SFP_VOITURES_CONFIG_HMETT","SFP_VOITURES_CONFIG_CIVIC_HONDA","SFP_VOITURES_CONFIG_TXR500","SFP_VOITURES_CONFIG_I_TRUCK","SFP_VOITURES_CONFIG_X6","task_force_radio_items","cba_common","cba_events","cba_hashes","cba_keybinding","cba_linux","cba_network","cba_strings","cba_ui_helper","cba_vectors","cba_ai","cba_arrays","cba_diagnostic","cba_diagnostics_xeh_disabled","cba_help","cba_ui","cba_versioning","cba_main","cba_main_a3","r3f_armes_c","RAV_Lifter_A3","task_force_radio"];

sfp_config_liste_des_plantes_illegale = ["Cane1","Cane2","Oleander_White","Oleander1"];

// =======================================================================================================================================================================================
// CONFIGURATION SCRIPTS SERVEURS
// =======================================================================================================================================================================================
sfp_config_activer_meteorite = true; /* false si non */                                  /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_meteorite";  
sfp_config_activer_patrouille_de_france = true; /* false si non */                       /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_patrouille_de_france";  
sfp_config_activer_tremblement_de_terre = true; /* false si non */                       /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_tremblement_de_terre";  
sfp_config_activer_simulation_grue_maison_construction = true; /* false si non */        /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_simulation_grue_maison_construction";  
sfp_config_activer_objet_recompense = true; /* false si non */                           /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_objet_recompense";  
sfp_config_activer_vehicules_de_vie = true; /* false si non */                           /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_vehicules_de_vie";  
sfp_config_activer_vehicules_offert = true; /* false si non */                           /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_vehicules_offert";  
sfp_config_activer_etoiles_filantes = true; /* false si non */                           /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_etoiles_filantes";  
sfp_config_activer_feux_artifices = true; /* false si non */                             /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_feux_artifices";  
sfp_config_activer_les_tresors = true; /* false si non */                                /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_les_tresors";  
sfp_config_activer_coffre_armes = true; /* false si non */                               /* Ne pas toucher cette partie a droite ! */ publicvariableserver "sfp_config_activer_coffre_armes";  



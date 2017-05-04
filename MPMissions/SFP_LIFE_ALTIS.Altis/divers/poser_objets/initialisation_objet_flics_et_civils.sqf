// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};

if (revive_mon_side == west) then 
{
	// Mat d'éclairage
	jepeuxreprendreunmatdeclairageobject = 0;
	distance_max_de_detection_mat_eclairage_object = 2;
	condition_mat_eclairage_object = {_cond_mat_eclairage_un = false;_cond_mat_eclairage_deux = nearestObjects [player, ["Land_PortableLight_double_F"], distance_max_de_detection_mat_eclairage_object];{_cond_mat_eclairage_un = true; } foreach _cond_mat_eclairage_deux;_cond_mat_eclairage_un};

	actionpourprendreunmatdeclairageobjet = player addAction ["<t color=""#ff0000"">" + "Attacher Mat Eclairage","divers\poser_objets\civil\mat_eclairage\attacher_mat_eclairage.sqf",[],10,true,true,"","[] call condition_mat_eclairage_object && jepeuxreprendreunmatdeclairageobject >= 1"];
	suppressiondumatdeclairageobject = player addAction ["<t color=""#ff0000"">" + "Supprimer Mat Eclairage","divers\poser_objets\civil\mat_eclairage\supprimer_mat_eclairage.sqf",[],10,true,true,"","[] call condition_mat_eclairage_object && jepeuxreprendreunmatdeclairageobject >= 1"];		

	// Barrières
	jepeuxreprendreunebarriere = 0;
	distance_max_de_detection_barriere_gendarmerie = 2;
	condition_barriere_gendarmerie = {_cond_barriere_gendarmerie = false;_cond_barriere_gendarmerie_deux = nearestObjects [player, ["RoadBarrier_F"], distance_max_de_detection_barriere_gendarmerie];{_cond_barriere_gendarmerie = true; } foreach _cond_barriere_gendarmerie_deux;_cond_barriere_gendarmerie};

	actionpourprendrebarriere = player addAction ["<t color=""#ff0000"">" + "Attacher Barrière","divers\poser_objets\flics\barrieres\attacher_barriere.sqf",[],8,true,true,"","[] call condition_barriere_gendarmerie && jepeuxreprendreunebarriere >= 1"];
	suppressiondelabarriere = player addAction ["<t color=""#ff0000"">" + "Supprimer La Barrière","divers\poser_objets\flics\barrieres\supprimer_barriere.sqf",[],5,true,true,"","[] call condition_barriere_gendarmerie && jepeuxreprendreunebarriere >= 1"];

	// Cones
	distance_max_de_detection_des_cones = 1.7;	
	condition_cone ={_cond_cone_un = false;_cond_cone_deux = nearestObjects [player, ["RoadCone_L_F"], distance_max_de_detection_des_cones];{_cond_cone_un = true; } foreach _cond_cone_deux;_cond_cone_un};
	jepeuxreprendreuncone = 0;

	actionpourprendrecone = player addAction ["<t color=""#ff0000"">" + "Attacher Cone","divers\poser_objets\flics\cones\attacher_cone.sqf",[],8,true,true,"","[] call condition_cone && jepeuxreprendreuncone >= 1"];
	suppressionducone = player addAction ["<t color=""#ff0000"">" + "Supprimer Cone","divers\poser_objets\flics\cones\supprimer_cone.sqf",[],5,true,true,"","[] call condition_cone && jepeuxreprendreuncone >= 1"];		
	
	// Herse
	jepeuxreprendreuneherse = 0;
	distance_max_de_detection_des_herses = 2.5;
	condition_herses =
	{
		_cond_herse = false;
		{
			_cond_herse = true; 
		} foreach (nearestObjects [player, ["Pole_F"], distance_max_de_detection_des_herses]);
		_cond_herse
	};

	actionpourprendreherse = player addAction ["<t color=""#ff0000"">" + "Attacher Herse","divers\poser_objets\flics\herse\attacher_herse.sqf",[],8,true,true,"","[] call condition_herses && jepeuxreprendreuneherse >= 1"];
	suppressiondelaherse = player addAction ["<t color=""#ff0000"">" + "Supprimer Herse","divers\poser_objets\flics\herse\supprimer_herse.sqf",[],5,true,true,"","[] call condition_herses && jepeuxreprendreuneherse >= 1"];	

	// Plante Illégale (avec launcher)
	if (isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then
	{
		liste_des_plantes_illegale = ["Cane1","Cane2","Oleander_White","Oleander1"];
		detruire_plante_illegal = {hint format['! PLANTATION ! \n --------------------------------------- \n\n Vous venez de détruire une plante illégale ! \n\n Il restait %1 heures avant la récolte ou %2 minutes ! \n\n Une prime de 16500 Euros vient de vous êtes octroyé ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou',round ((cursortarget getvariable "jour_recolte") / 60),round (cursortarget getvariable "jour_recolte")]; deletevehicle cursortarget; player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + 16500,true]; autorisation_mouvement_argent = true;};
		supprimer_plante_illegale = player addAction ["<t color=""#ff0000"">" + "Détruire La Plante Illégale",detruire_plante_illegal,[],11,true,true,"","typeof cursortarget in liste_des_plantes_illegale && !isnil {cursortarget getvariable 'c_est_une_plante_illegal'}"];
	};

	// Panneau Halte Gendarmerie etc
	distance_max_de_detection_des_panneaux_gendarmerie = 1.7;
	condition_panneau_halte_gendarmerie = {_cond_panneau_halte_gendarmerie_un = false;_cond_panneau_halte_gendarmerie_deux = nearestObjects [player, ["SFP_Panneau_Pied_Rond"], distance_max_de_detection_des_panneaux_gendarmerie];{_cond_panneau_halte_gendarmerie_un = true; } foreach _cond_panneau_halte_gendarmerie_deux;_cond_panneau_halte_gendarmerie_un};
	jepeuxreprendreunpanneauhaltegendarmerie = 0;
	
	actionpourprendrepanneauhaltegendarmerie = player addAction ["<t color=""#ff0000"">" + "Attacher Panneau Halte Gendarmerie","divers\poser_objets\flics\halte_gendarmerie\attacher_halte_gendarmerie.sqf",[],8,true,true,"","[] call condition_panneau_halte_gendarmerie && jepeuxreprendreunpanneauhaltegendarmerie >= 1"];
	suppressiondupanneauhaltegendarmerie = player addAction ["<t color=""#ff0000"">" + "Supprimer Panneau Halte Gendarmerie","divers\poser_objets\flics\halte_gendarmerie\supprimer_halte_gendarmerie.sqf",[],5,true,true,"","[] call condition_panneau_halte_gendarmerie && jepeuxreprendreunpanneauhaltegendarmerie >= 1"];		
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (revive_mon_side == civilian) then 
{
	// Tente
	actionpourprendrelatente = player addAction ["<t color=""#ff0000"">" + "Attacher Tente","divers\poser_objets\civil\tente_de_couchage\attacher_tente.sqf",[],8,true,true,"","cursortarget iskindof 'Land_TentA_F' && cursortarget distance player < 5 && cursortarget getvariable 'cestmatante' == 1"];
	suppressiondelatente = player addAction ["<t color=""#ff0000"">" + "Supprimer La Tente","divers\poser_objets\civil\tente_de_couchage\supprimer_tente.sqf",[],5,true,true,"","cursortarget iskindof 'Land_TentA_F' && cursortarget distance player < 5 && cursortarget getvariable 'cestmatante' == 1"];
	dormirdanslatente = player addAction ["<t color=""#ff0000"">" + "Dormir dans la tente","menu\hotel.sqf",[],5,true,true,"","cursortarget iskindof 'Land_TentA_F' && cursortarget distance player < 4 && cursortarget getvariable 'cestmatante' == 1"];

	// Cones
	distance_max_de_detection_des_cones = 1.7;
	condition_cone ={_cond_cone_un = false;_cond_cone_deux = nearestObjects [player, ["RoadCone_L_F"], distance_max_de_detection_des_cones];{_cond_cone_un = true; } foreach _cond_cone_deux; _cond_cone_un};
	jepeuxreprendreuncone = 0;

	actionpourprendrecone = player addAction ["<t color=""#ff0000"">" + "Attacher Cone","divers\poser_objets\flics\cones\attacher_cone.sqf",[],8,true,true,"","[] call condition_cone && jepeuxreprendreuncone >= 1"];
	suppressionducone = player addAction ["<t color=""#ff0000"">" + "Supprimer Cone","divers\poser_objets\flics\cones\supprimer_cone.sqf",[],5,true,true,"","[] call condition_cone && jepeuxreprendreuncone >= 1"];		
	
	// Barriere Chantier DDE
	distance_max_de_detection_des_barriere_de_chantier_dde = 2.5;
	condition_barriere_de_chantier_dde = {_cond_barriere_travail_dde_un = false;_cond_barriere_travail_dde_deux = nearestObjects [player, ["SFP_Barriere_Chantier"], distance_max_de_detection_des_barriere_de_chantier_dde];{_cond_barriere_travail_dde_un = true; } foreach _cond_barriere_travail_dde_deux;_cond_barriere_travail_dde_un};
	jepeuxreprendreunebarrieredechantier = 0;
	
	actionpourprendreunebarrieredechantier = player addAction ["<t color=""#ff0000"">" + "Prendre Barriere","divers\poser_objets\civil\barriere_chantier_dde\attacher_barriere_chantier.sqf",[],8,true,true,"","[] call condition_barriere_de_chantier_dde && jepeuxreprendreunebarrieredechantier >= 1"];
	suppressiondunebarrieredechantier = player addAction ["<t color=""#ff0000"">" + "Supprimer Barriere","divers\poser_objets\civil\barriere_chantier_dde\supprimer_barriere_chantier.sqf",[],5,true,true,"","[] call condition_barriere_de_chantier_dde && jepeuxreprendreunebarrieredechantier >= 1"];		
	
	// Barriere Chantier ORANGE
	distance_max_de_detection_des_barriere_de_chantier_dde = 2.5;
	condition_barriere_de_chantier_dde_deux = {_cond_barriere_travail_dde_un = false;_cond_barriere_travail_dde_deux = nearestObjects [player, ["PlasticBarrier_03_orange_F"], distance_max_de_detection_des_barriere_de_chantier_dde];{_cond_barriere_travail_dde_un = true; } foreach _cond_barriere_travail_dde_deux;_cond_barriere_travail_dde_un};
	jepeuxreprendreunebarrieredechantier_orange = 0;
	
	actionpourprendreunebarrieredechantier_orange = player addAction ["<t color=""#ff0000"">" + "Prendre Barriere","divers\poser_objets\civil\barriere_chantier_dde_orange\attacher_barriere_chantier.sqf",[],8,true,true,"","[] call condition_barriere_de_chantier_dde_deux && jepeuxreprendreunebarrieredechantier_orange >= 1"];
	suppressiondunebarrieredechantier_orange = player addAction ["<t color=""#ff0000"">" + "Supprimer Barriere","divers\poser_objets\civil\barriere_chantier_dde_orange\supprimer_barriere_chantier.sqf",[],5,true,true,"","[] call condition_barriere_de_chantier_dde_deux && jepeuxreprendreunebarrieredechantier_orange >= 1"];		
	
	// Plante Illégale (avec launcher)
	if (isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then
	{
		liste_des_plantes_illegale = ["Cane1","Cane2","Oleander_White","Oleander1"];
		jarrose_ma_plante = 0;
		deplacer_plante = 0;
		arreter_arrosage = {jarrose_ma_plante = 0;};
		poser_plante = {_surfacedeux = surfaceType getPosATL player;_verificationsurface = ["#GdtGrassShort","#GdtGrassTall","#GdtGrassDry","#GdtGrassGreen","#GdtDirt"];if !(_surfacedeux in _verificationsurface) exitwith {hint "Désolé, tu n'es pas dans l'herbe !";}; deplacer_plante = 0;};
		information_de_la_plante = {if !(typeof cursortarget in liste_des_plantes_illegale) exitwith {hint "Désolé, ce n'est pas une plante !";}; hint format['! ACHAT PLANTATION ! \n --------------------------------------- \n\n Il reste %1 pourcent d''eau dans la plante ! \n\n Il reste %2 heures avant la récoltes ou %3 minutes ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou',round (cursortarget getvariable "niveau_eau"),round ((cursortarget getvariable "jour_recolte") / 60),round (cursortarget getvariable "jour_recolte")];};
		recolter_la_plante = {private "_combien_mettre_de_graine"; _combien_mettre_de_graine = 1; if !(typeof cursortarget in liste_des_plantes_illegale) exitwith {hint "Désolé, ce n'est pas une plante !";}; if (((player getvariable "usedspace") + 25) > (player getvariable "totalspace")) exitwith {hint "Opération impossible ! Tu n'as pas assez de place dans ton inventaire ! \n\n Chaque plante prend 25 de place !";}; if (cursortarget getvariable "item_plante_fertilisant_rouge" > 0) then {_combien_mettre_de_graine = round (1 + (random 1));}else{_combien_mettre_de_graine = 1;};hint format ["! ACHAT PLANTATION ! \n --------------------------------------- \n\n Vous venez de recuperer %1 plante illégale à vendre au marché noir ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", _combien_mettre_de_graine]; player setvariable ["item_plante_illegale_prete_a_vendre_sfp",(player getvariable "item_plante_illegale_prete_a_vendre_sfp") + _combien_mettre_de_graine,true]; player setvariable ["usedspace",(player getvariable "usedspace") + (25 * _combien_mettre_de_graine),true]; deletevehicle cursortarget;};
		
		action_deplacer_plante = player addAction ["<t color=""#ff0000"">" + "Déplacer La plante","divers\systeme_plantation\actions_plantes\attacher__detacher_plante.sqf",[],10,true,true,"","player distance cursortarget < 5.5 && typeof cursortarget in liste_des_plantes_illegale && !isnil {cursortarget getvariable 'c_est_une_plante_illegal'} && deplacer_plante < 1"];
		action_poser_plante = player addAction ["<t color=""#ff0000"">" + "Poser La Plante",poser_plante,[],10,true,true,"","deplacer_plante >= 1"];
		action_arroser_plante = player addAction ["<t color=""#ff0000"">" + "Arroser La Plante","divers\systeme_plantation\actions_plantes\arroser_la_plante.sqf",[],10,true,true,"","player distance cursortarget < 5.5 && jarrose_ma_plante < 1 && typeof cursortarget in liste_des_plantes_illegale && !isnil {cursortarget getvariable 'c_est_une_plante_illegal'}"];
		action_remplir_mon_seau = player addAction ["<t color=""#ff0000"">" + "Remplir Mon Seau D'eau","divers\systeme_plantation\actions_plantes\remplir_seau_d_eau.sqf",[],9,true,true,"","player getvariable 'seau_plante_illegal' >= 1 && isnil 'niveau_de_mon_reservoir_eau_plante_illegales'"];
		action_remplir_mon_seau_deux = player addAction ["<t color=""#ff0000"">" + "Remplir Mon Seau D'eau","divers\systeme_plantation\actions_plantes\remplir_seau_d_eau.sqf",[],9,true,true,"","player getvariable 'seau_plante_illegal' >= 1 && niveau_de_mon_reservoir_eau_plante_illegales < 100"];
		action_arreter_arrosage = player addAction ["<t color=""#ff0000"">" + "Arreter Arrosage",arreter_arrosage,[],11,true,true,"","jarrose_ma_plante >= 1"];
		action_information_de_la_plante = player addAction ["<t color=""#ff0000"">" + "Informations De La Plante",information_de_la_plante,[],9,true,true,"","player distance cursortarget < 5.5 && jarrose_ma_plante < 1 && typeof cursortarget in liste_des_plantes_illegale && !isnil {cursortarget getvariable 'c_est_une_plante_illegal'}"];
		action_recolter_la_plante = player addAction ["<t color=""#ff0000"">" + "Recolter La Plante",recolter_la_plante,[],11,true,true,"","player distance cursortarget < 5.5 && typeof cursortarget in liste_des_plantes_illegale && cursortarget getvariable 'jour_recolte' <= 0"];
		action_fertilisant_rouge_plante = player addAction ["<t color=""#ff0000"">" + "Mettre Le Fertilisant Rouge","divers\systeme_plantation\achat_plantes\fertilisant_rouge\appliquer_fertilisant_rouge.sqf",[],11,true,true,"","player distance cursortarget < 5.5 && typeof cursortarget in liste_des_plantes_illegale && !isnil {cursortarget getvariable 'c_est_une_plante_illegal'}"];
	};

	// Panneau Danger DDE
	distance_max_de_detection_danger_dde = 1.7;
	condition_panneau_danger_dde = {_cond_panneau_danger_dde_un = false;_cond_panneau_danger_dde_deux = nearestObjects [player, ["SFP_Panneau_Pied_Triangle"], distance_max_de_detection_danger_dde];{_cond_panneau_danger_dde_un = true; } foreach _cond_panneau_danger_dde_deux;_cond_panneau_danger_dde_un};
	jepeuxreprendreunpanneaudangerdde = 0;
	
	actionpourprendrepanneaudangerdde = player addAction ["<t color=""#ff0000"">" + "Attacher Panneau Danger","divers\poser_objets\civil\panneau_danger\attacher_panneau_danger.sqf",[],10,true,true,"","[] call condition_panneau_danger_dde && jepeuxreprendreunpanneaudangerdde >= 1"];
	suppressiondupanneaudangerdde = player addAction ["<t color=""#ff0000"">" + "Supprimer Panneau Danger","divers\poser_objets\civil\panneau_danger\supprimer_panneau_danger.sqf",[],10,true,true,"","[] call condition_panneau_danger_dde && jepeuxreprendreunpanneaudangerdde >= 1"];		

	// Mat d'éclairage
	jepeuxreprendreunmatdeclairageobject = 0;
	distance_max_de_detection_mat_eclairage_object = 2;
	condition_mat_eclairage_object ={_cond_mat_eclairage_un = false;_cond_mat_eclairage_deux = nearestObjects [player, ["Land_PortableLight_double_F"], distance_max_de_detection_mat_eclairage_object];{_cond_mat_eclairage_un = true; } foreach _cond_mat_eclairage_deux;_cond_mat_eclairage_un};

	actionpourprendreunmatdeclairageobjet = player addAction ["<t color=""#ff0000"">" + "Attacher Mat Eclairage","divers\poser_objets\civil\mat_eclairage\attacher_mat_eclairage.sqf",[],10,true,true,"","[] call condition_mat_eclairage_object && jepeuxreprendreunmatdeclairageobject >= 1"];
	suppressiondumatdeclairageobject = player addAction ["<t color=""#ff0000"">" + "Supprimer Mat Eclairage","divers\poser_objets\civil\mat_eclairage\supprimer_mat_eclairage.sqf",[],10,true,true,"","[] call condition_mat_eclairage_object && jepeuxreprendreunmatdeclairageobject >= 1"];		
};


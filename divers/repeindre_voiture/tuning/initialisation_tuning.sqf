// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
								  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

previsualiser_son_klaxon_sfp =
{
	klaxon_sfp_selectionne_pour_achat = _this select 0 select 1;
	player say (listes_des_klaxons_SFP_Maxou select (_this select 0 select 1));
};
creation_klaxon_vehicule_by_maxou =
{
	if (isnil "klaxon_sfp_selectionne_pour_achat") exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, vous n'avez pas selectionné/prévisualisé un klaxon. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
	if (player getvariable "mon_argent_banque_by_sfp_maxou" < 260) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, vous n'avez pas assez d'argent. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
	
	le_vehicule_a_tunner_by_maxou = nil;
	
	[] spawn 
	{
		if (isnil "le_vehicule_a_tunner_by_maxou") then
		{
			if (!isnil {cursortarget getvariable "vehicule_info_parvariable"}) then
			{
				le_vehicule_a_tunner_by_maxou = cursortarget;
			};
		};
		
		_le_vehicule_a_tunner_init_by_maxou = le_vehicule_a_tunner_by_maxou;
	
		if (isnil "_le_vehicule_a_tunner_init_by_maxou") exitwith {closedialog 0; hint "Erreur choix sur le véhicule, recommence ...";};
		
		if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_klaxon"}) then 
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_klaxon",[[listes_des_klaxons_SFP_Maxou select klaxon_sfp_selectionne_pour_achat],1],true];
		};
		if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_klaxon") < 1) then 
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_klaxon",[[listes_des_klaxons_SFP_Maxou select klaxon_sfp_selectionne_pour_achat],1],true];
		};

		if (!isnil {listes_des_klaxons_SFP_Maxou select klaxon_sfp_selectionne_pour_achat}) then
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_klaxon",[[listes_des_klaxons_SFP_Maxou select klaxon_sfp_selectionne_pour_achat],1],true];
		};
		
		hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Le %1 à bien été installé sur ton véhicule de type %2 pour 260 Euros. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", listes_des_klaxons_SFP_Maxou select klaxon_sfp_selectionne_pour_achat, getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
		
		player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") - 260,true];
	};
};
activer_son_klaxon_sfp =
{
	if (isnil {(vehicle player) getvariable "voiture_possede_un_klaxon"}) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, vous ce véhicule n'a pas de klaxon. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
	if (count ((vehicle player) getvariable "voiture_possede_un_klaxon") < 1) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, vous ce véhicule n'a pas de klaxon. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
	if (isnil {(vehicle player) getvariable "voiture_possede_un_klaxon" select 0}) exitwith {player globalchat "Erreur sur la recherche du klaxon du véhicule ...";};
	if (driver vehicle player != player) exitwith {player globalchat "Tu n'es pas le conducteur !";};
	
	if (isnil "je_peux_activer_klaxon_sfp") then {je_peux_activer_klaxon_sfp = 0;};
	if (je_peux_activer_klaxon_sfp >= 1) exitwith {player globalchat format ["Temps avant de pouvoir reutiliser le klaxon : %1 Secondes.",temps_pourvoir_reutiliser_le_klaxon_sfp];};
	je_peux_activer_klaxon_sfp = 1; 
	[] spawn 
	{
		temps_pourvoir_reutiliser_le_klaxon_sfp = round (6 + (random 20)); 
		while {temps_pourvoir_reutiliser_le_klaxon_sfp > 0} do
		{
			sleep 1; 
			temps_pourvoir_reutiliser_le_klaxon_sfp = round (temps_pourvoir_reutiliser_le_klaxon_sfp - 1);
		}; 
		je_peux_activer_klaxon_sfp = nil;
	};
	
	_quel_klaxon_jouer = (vehicle player) getvariable "voiture_possede_un_klaxon" select 0 select 0;
	_vehicule_ou_jouer_le_klaxon = (vehicle player);
	
	[[[_quel_klaxon_jouer, _vehicule_ou_jouer_le_klaxon],"divers\repeindre_voiture\tuning\synchronisation_klaxon_MP.sqf"],"BIS_fnc_execVM",true, false] spawn BIS_fnc_MP;
};	
creation_neon_vehicule_by_maxou =
{
	if (player getvariable "mon_argent_banque_by_sfp_maxou" < 500) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, vous n'avez pas assez d'argent. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
	
	le_vehicule_a_tunner_by_maxou = nil;
	
	[] spawn 
	{
		if (isnil "le_vehicule_a_tunner_by_maxou") then
		{
			if (!isnil {cursortarget getvariable "vehicule_info_parvariable"}) then
			{
				le_vehicule_a_tunner_by_maxou = cursortarget;
			};
		};
		
		_le_vehicule_a_tunner_init_by_maxou = le_vehicule_a_tunner_by_maxou;
	
		if (isnil "_le_vehicule_a_tunner_init_by_maxou") exitwith {closedialog 0; hint "Erreur choix sur le véhicule, recommence ...";};
		
		_condition_refuse = false;
		if (!isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_neon"}) then {if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_neon") > 0) then {_condition_refuse = true;};};
		if (_condition_refuse) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule à déja un néon. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

		if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_neon"}) then 
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_neon",[[254,242,1],1],true];
		};
		if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_neon") < 1) then 
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_neon",[[254,242,1],1],true];
		};

		hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Le neon à bien été installé sur ton véhicule de type %1. \n\n Attention, il ne se voit que de nuit ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
		
		[[[_le_vehicule_a_tunner_init_by_maxou],"divers\repeindre_voiture\tuning\creation_neon_MP.sqf"],"BIS_fnc_execVM",true, false] spawn BIS_fnc_MP;
	};
};
activer_desactiver_neon =
{
	if (isnil {(vehicle player) getvariable "voiture_possede_un_neon"}) exitwith {hint "Erreur pas de neon sur ce véhicule, recommence !";};
		
	if (count ((vehicle player) getvariable "voiture_possede_un_neon") > 0) then 
	{
		if ((vehicle player) getvariable "voiture_possede_un_neon" select 1 >= 1) then
		{
			player globalchat "Néon désactivé ...";
			_couleur_actuelle = (vehicle player) getvariable "voiture_possede_un_neon" select 0;
			(vehicle player) setvariable ["voiture_possede_un_neon",[_couleur_actuelle,0],true];
		}else
		{			
			player globalchat "Néon activé ...";
			_couleur_actuelle = (vehicle player) getvariable "voiture_possede_un_neon" select 0;
			(vehicle player) setvariable ["voiture_possede_un_neon",[_couleur_actuelle,1],true];

			[[[(vehicle player)],"divers\repeindre_voiture\tuning\creation_neon_MP.sqf"],"BIS_fnc_execVM", true, false] spawn BIS_fnc_MP;
		};
	};
};
changement_couleur_neon_vehicule =
{
	if (isnil {cursortarget getvariable "voiture_possede_un_neon"}) exitwith {hint "Désolé, ce véhicule n'a pas de néon ... \n\n Double clique sur 'NEON DE COULEUR' pour en installer un !";};
	
	if (isnil "le_vehicule_a_tunner_by_maxou_changement_de_couleur") then {le_vehicule_a_tunner_by_maxou_changement_de_couleur = cursortarget;};
	if (isnil "le_vehicule_a_tunner_by_maxou_changement_de_couleur") exitwith {hint "Erreur recommence ...";};
	
	if (isnil "attente_fermeture_dialogue_envoi_neon") then
	{
		[] spawn
		{
			attente_fermeture_dialogue_envoi_neon = 1;
			demande_changement_couleur_neon_vehicule = 1;
			waituntil {!dialog};
			
			le_vehicule_a_tunner_by_maxou_changement_de_couleur_info = le_vehicule_a_tunner_by_maxou_changement_de_couleur getvariable "voiture_possede_un_neon";
			
			if (isnil "le_vehicule_a_tunner_by_maxou_changement_de_couleur") exitwith {hint "Erreur envoi info MP néon !";};
			if (isnil "le_vehicule_a_tunner_by_maxou_changement_de_couleur_info") exitwith {hint "Erreur envoi info MP néon !";};
			
			le_vehicule_a_tunner_by_maxou_changement_de_couleur setvariable ["voiture_possede_un_neon",le_vehicule_a_tunner_by_maxou_changement_de_couleur_info, true];
			
			le_vehicule_a_tunner_by_maxou_changement_de_couleur = nil;
			le_vehicule_a_tunner_by_maxou_changement_de_couleur_info = nil;
			attente_fermeture_dialogue_envoi_neon = nil;
			demande_changement_couleur_neon_vehicule = nil;
		};
	};
	
	if (_this select 0 == 1) then 
	{
		[_this, le_vehicule_a_tunner_by_maxou_changement_de_couleur] spawn
		{
			_le_vehicule = _this select 1;
			_couleur_modifie_slider = ((_this select 0 select 1 select 1) * 100);
			_modifie_variable = [[_couleur_modifie_slider, (_le_vehicule getvariable "voiture_possede_un_neon" select 0 select 1), (_le_vehicule getvariable "voiture_possede_un_neon" select 0 select 2)],1];
			if (isnil "_modifie_variable") exitwith {};
			
			_le_vehicule setvariable ["voiture_possede_un_neon",_modifie_variable, false];
		};
	};
	
	if (_this select 0 == 2) then 
	{
		[_this, le_vehicule_a_tunner_by_maxou_changement_de_couleur] spawn
		{
			_le_vehicule = _this select 1;
			_couleur_modifie_slider = ((_this select 0 select 1 select 1) * 100);
			_modifie_variable = [[(_le_vehicule getvariable "voiture_possede_un_neon" select 0 select 0), _couleur_modifie_slider, (_le_vehicule getvariable "voiture_possede_un_neon" select 0 select 2)],1];
			if (isnil "_modifie_variable") exitwith {};
			
			_le_vehicule setvariable ["voiture_possede_un_neon",_modifie_variable, false];
		};
	};
	
	if (_this select 0 == 3) then 
	{
		[_this, le_vehicule_a_tunner_by_maxou_changement_de_couleur] spawn
		{
			_le_vehicule = _this select 1;
			_couleur_modifie_slider = ((_this select 0 select 1 select 1) * 100);
			_modifie_variable = [[(_le_vehicule getvariable "voiture_possede_un_neon" select 0 select 0), (_le_vehicule getvariable "voiture_possede_un_neon" select 0 select 1), (_couleur_modifie_slider)],1];
			if (isnil "_modifie_variable") exitwith {};
			
			_le_vehicule setvariable ["voiture_possede_un_neon",_modifie_variable, false];
		};
	};
};
puce_moteur_vehicule = 
{
	le_vehicule_a_tunner_by_maxou = nil;
	
	_this spawn 
	{
		_puce_selectionne = round ((_this select 0 select 1) + 1);
		
		if (isnil "le_vehicule_a_tunner_by_maxou") then
		{
			if (!isnil {cursortarget getvariable "vehicule_info_parvariable"}) then
			{
				le_vehicule_a_tunner_by_maxou = cursortarget;
			};
		};
		
		_le_vehicule_a_tunner_init_by_maxou = le_vehicule_a_tunner_by_maxou;
	
		if (isnil "_puce_selectionne") exitwith {closedialog 0; hint "Erreur selection puce, recommence ...";};
		if (isnil "_le_vehicule_a_tunner_init_by_maxou") exitwith {closedialog 0; hint "Erreur selection véhicule, recommence ...";};

		if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_une_puce"}) then 
		{			
			// Valeur 1 niveau puce, valeur 2 activé ou non
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_une_puce",[0,0],true];
		};

		_selection_prix_de_la_puce = (prix_des_puces_moteurs select (_this select 0 select 1));
		
		if (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_une_puce" select 0 == _puce_selectionne) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule à déja cette puce. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		if (player getvariable "mon_argent_banque_by_sfp_maxou" < _selection_prix_de_la_puce) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, vous n'avez pas assez d'argent. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
		_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_une_puce",[_puce_selectionne,0],true];
		
		hint format ["! TUNING SFP ! \n ------------------------------------- \n\n La puce de niveau %1 à bien été installé sur ton véhicule de type %2. \n\n Cette puce ta couté %3 Euros.\n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", round (_puce_selectionne),getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName"), _selection_prix_de_la_puce];
		
		if (!isnil "_selection_prix_de_la_puce") then {player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") - _selection_prix_de_la_puce,true]; autorisation_mouvement_argent = true;};
	};	
};
activer_desactiver_puce_moteur =
{
	if (isnil {(vehicle player) getvariable "voiture_possede_une_puce"}) exitwith {hint "Erreur, recommence !";};
	if (speed (vehicle player) > 1) exitwith {titletext ["Désolé, pour activer ou désactiver la puce il faut être à l'arret ...","PLAIN DOWN"];};
	
	if ((vehicle player) getvariable "voiture_possede_une_puce" select 1 >= 1) then
	{
		_puce_actuel = (vehicle player) getvariable "voiture_possede_une_puce" select 0;
		if (!isnil "_puce_actuel") then
		{
			(vehicle player) setvariable ["voiture_possede_une_puce",[_puce_actuel,0],true];
			player globalchat format ["Puce de niveau %1 désactivée ...",_puce_actuel];
		};
	}else
	{
		_puce_actuel = (vehicle player) getvariable "voiture_possede_une_puce" select 0;
		if (!isnil "_puce_actuel") then
		{
			(vehicle player) setvariable ["voiture_possede_une_puce",[_puce_actuel,1],true];		
			player globalchat format ["Puce de niveau %1 activée à partir de 50 Kms/h ...",_puce_actuel];
			
			if (isnil "information_supplementaire_puce") then 
			{
				information_supplementaire_puce = 1;
				0 cutText ["!!!!!!! INFORMATION SUPPLEMENTAIRE PUCE !!!!!!! \n ---------------------------------------------- \n\n 1) La puce s'active ou se désactive complètement avec le menu déroulant. \n 2) Si activée, elle s'active automatiquement à partir de 50 Km/h \n 3) En roulant, vous pouvez la désactiver temporairement en restant appuyer sur SHIFT GAUCHE ou ALT. \n\n Amuse toi bien ;) \n ---------------------------------------------- \n Ce système est unique, puisque creer par Maxou !", "BLACK OUT",2.4]; 
				sleep 10;
				0 cutText ["!!!!!!! INFORMATION SUPPLEMENTAIRE PUCE !!!!!!! \n ---------------------------------------------- \n\n 1) La puce s'active ou se désactive complètement avec le menu déroulant. \n 2) Si activée, elle s'active automatiquement à partir de 50 Km/h \n 3) En roulant, vous pouvez la désactiver temporairement en restant appuyer sur SHIFT GAUCHE ou ALT. \n\n Amuse toi bien ;) \n ---------------------------------------------- \n Ce système est unique, puisque creer par Maxou !", "BLACK IN",6]; 
			};
		};
	};
};
achat_detecteur_de_radar_by_maxou =
{
	if !(isClass(configFile >> "CfgVehicles" >> "SpeedRadar1")) exitwith {hint "Désolé, vous n'avez pas le launcher pour vous amusez avec le detecteur de radar !";};
	if (player getvariable "mon_argent_banque_by_sfp_maxou" < 560) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, vous n'avez pas assez d'argent. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
	
	le_vehicule_a_tunner_by_maxou = nil;
	
	[] spawn 
	{
		if (isnil "le_vehicule_a_tunner_by_maxou") then
		{
			if (!isnil {cursortarget getvariable "vehicule_info_parvariable"}) then
			{
				le_vehicule_a_tunner_by_maxou = cursortarget;
			};
		};
		
		_le_vehicule_a_tunner_init_by_maxou = le_vehicule_a_tunner_by_maxou;
	
		if (isnil "_le_vehicule_a_tunner_init_by_maxou") exitwith {closedialog 0; hint "Erreur choix sur le véhicule, recommence ...";};
		
		_condition_refuse = false;
		if (!isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_detecteur_de_radar"}) then {if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_detecteur_de_radar") > 0) then {_condition_refuse = true;};};
		if (_condition_refuse) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule à déja un detecteur de radar. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

		if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_detecteur_de_radar"}) then 
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_detecteur_de_radar",[1,1],true];
		};
		if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_detecteur_de_radar") < 1) then 
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_detecteur_de_radar",[1,1],true];
		};

		hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Le detecteur de radar à bien été installé sur ton véhicule de type %1. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
	};
};
activer_desactiver_detecteur_de_radar =
{
	if (isnil {(vehicle player) getvariable "voiture_possede_un_detecteur_de_radar"}) exitwith {hint "Erreur, aucun detecteur de radar detecté !";};
	if (count ((vehicle player) getvariable "voiture_possede_un_detecteur_de_radar") < 2) exitwith {hint "Erreur, aucun detecteur de radar detecté !";};
	if (isnil "autorisation_enclenchement_detecteur_de_radar") then {autorisation_enclenchement_detecteur_de_radar = 0;};
	if (autorisation_enclenchement_detecteur_de_radar >= 1) exitwith {player globalchat "Patiente avant de refaire cette action !";};
	autorisation_enclenchement_detecteur_de_radar = 1;
	
	if ((vehicle player) getvariable "voiture_possede_un_detecteur_de_radar" select 1 >= 1) then
	{
		(vehicle player) setvariable ["voiture_possede_un_detecteur_de_radar",[1,0],true];
		player globalchat "Detecteur de radar désactivé !";
		sleep 5;
		autorisation_enclenchement_detecteur_de_radar = nil;
	}else
	{
		(vehicle player) setvariable ["voiture_possede_un_detecteur_de_radar",[1,1],true];
		player globalchat "Detecteur de radar activé ! Il détectera les radars à partir de 40 Kms/h.";
		
		sleep 5;
		autorisation_enclenchement_detecteur_de_radar = nil;
	};
};
achat_radar_de_recul_vehicule_by_maxou =
{
	if (player getvariable "mon_argent_banque_by_sfp_maxou" < 300) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, vous n'avez pas assez d'argent. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
	
	le_vehicule_a_tunner_by_maxou = nil;
	
	[] spawn 
	{
		if (isnil "le_vehicule_a_tunner_by_maxou") then
		{
			if (!isnil {cursortarget getvariable "vehicule_info_parvariable"}) then
			{
				le_vehicule_a_tunner_by_maxou = cursortarget;
			};
		};
		
		_le_vehicule_a_tunner_init_by_maxou = le_vehicule_a_tunner_by_maxou;
	
		if (isnil "_le_vehicule_a_tunner_init_by_maxou") exitwith {closedialog 0; hint "Erreur choix sur le véhicule, recommence ...";};
		
		_condition_refuse = false;
		if (!isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_radar_de_recul"}) then {if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_radar_de_recul") > 0) then {_condition_refuse = true;};};
		if (_condition_refuse) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule à déja un radar de recul. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

		if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_radar_de_recul"}) then 
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_radar_de_recul",[1,1],true];
		};
		if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_radar_de_recul") < 1) then 
		{
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_radar_de_recul",[1,1],true];
		};

		hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Le radar de recul à bien été installé sur ton véhicule de type %1. \n\n Attention, il s'active automatiquement lors d'une marche arrière si il est activé ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
	};
};
activer_desactiver_radar_de_recul =
{
	if (isnil {(vehicle player) getvariable "voiture_possede_un_radar_de_recul"}) exitwith {hint "Erreur, aucun radar de recul detecté !";};
	
	if ((vehicle player) getvariable "voiture_possede_un_radar_de_recul" select 1 >= 1) then
	{
		(vehicle player) setvariable ["voiture_possede_un_radar_de_recul",[1,0],true];
		player globalchat "Radar de recul désactivé !";
		[] call BIS_fnc_PiP;
	}else
	{
		(vehicle player) setvariable ["voiture_possede_un_radar_de_recul",[1,1],true];
		player globalchat "Radar de recul activé ! Il s'activera lorsque tu passeras la marche arrière et que tu seras à 5 Kms/h.";
	};
};
visualiser_changement_poid_du_vehicule =
{
	private "_prix_a_payer";
	tuning_calcul_poid_a_changer = round (_this select 1 select 1);
	if (isnil "tuning_calcul_poid_a_changer") exitwith {};
	
	tuning_calcul_du_poid_pour_appliquer = round (tuning_poids_origine_du_vehicule + tuning_calcul_poid_a_changer);
	_prix_a_payer = round (tuning_calcul_poid_a_changer * 11);
	if (_prix_a_payer < 0) then {_prix_a_payer = abs _prix_a_payer;};
	
	hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Votre véhicule %1 à un poids d'origine de %2 KiloSFP. \n\n Après modification des %3 KiloSFP, son poids sera de %4 KiloSFP. \n\n Vous devrez payer egalement %5 %6.\n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "displayName"), tuning_poids_origine_du_vehicule, tuning_calcul_poid_a_changer, tuning_calcul_du_poid_pour_appliquer, _prix_a_payer, "€"];
};
appliquer_changement_poid_du_vehicule =
{
	if (isnil "tuning_calcul_du_poid_pour_appliquer") exitwith {hint "Erreur, recommence ...";};
		
	le_vehicule_a_tunner_by_maxou setmass tuning_calcul_du_poid_pour_appliquer;
	
	le_vehicule_a_tunner_by_maxou setvariable ["voiture_possede_un_nouveau_poids",[tuning_poids_origine_du_vehicule, tuning_calcul_du_poid_pour_appliquer],true];
};
supprimer_options_vehicule =
{
	private "_le_vehicule_a_tunner_init_by_maxou";
	_le_vehicule_a_tunner_init_by_maxou = le_vehicule_a_tunner_by_maxou;
	_condition = _this select 0;
	if (isnil "_le_vehicule_a_tunner_init_by_maxou") exitwith {closedialog 0; hint "Erreur choix sur le véhicule, recommence ...";};

	switch _condition do
	{
		case 0 :
		{
			if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_neon"}) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de néon. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
			if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_neon") < 1) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de néon. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_neon", nil,true];			
			
			hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Le néon de votre véhicule %1 à bien été supprimé. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
		};
		case 1 :
		{
			if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_une_puce"}) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de puce. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
			if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_une_puce") < 1) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de puce. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_une_puce", nil,true];			
			
			hint format ["! TUNING SFP ! \n ------------------------------------- \n\n La puce de votre véhicule %1 à bien été supprimée. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
		};
		case 2 :
		{
			if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_klaxon"}) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de klaxon personnalisé. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
			if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_klaxon") < 1) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de klaxon personnalisé. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_klaxon", nil,true];			
			
			hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Le klaxon de votre véhicule %1 à bien été supprimée. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
		};
		case 3 :
		{
			if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_detecteur_de_radar"}) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de detecteur de radar. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
			if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_detecteur_de_radar") < 1) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de detecteur de radar. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_detecteur_de_radar", nil,true];			
			
			hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Le detecteur de radar de votre véhicule %1 à bien été supprimé. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
		};
		case 4 :
		{
			if (isnil {_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_radar_de_recul"}) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de radar de recul. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
			if (count (_le_vehicule_a_tunner_init_by_maxou getvariable "voiture_possede_un_radar_de_recul") < 1) exitwith {hint "! TUNING SFP ! \n ------------------------------------- \n\n Désolé, ce véhicule n'à pas de radar de recul. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
			_le_vehicule_a_tunner_init_by_maxou setvariable ["voiture_possede_un_radar_de_recul", nil,true];			
			
			hint format ["! TUNING SFP ! \n ------------------------------------- \n\n Le radar de recul de votre véhicule %1 à bien été supprimé. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule_a_tunner_init_by_maxou >> "displayName")];
		};
	};
};

execvm "divers\repeindre_voiture\tuning\execution_script_tuning_en_vehicule_auto.sqf";

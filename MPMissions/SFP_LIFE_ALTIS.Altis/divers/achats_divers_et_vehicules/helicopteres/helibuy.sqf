// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_position_spawn_vehicule";
if (player distance (markerpos "helico_spawn_gendarmerie") < 40 && revive_mon_side == civilian) exitwith {hint "Seul les gendarmes peuvent achetés des hélicoptères ici ...";};

if (player distance (getpos achatspawnhelico) < 40) then {_position_spawn_vehicule = position achatspawnhelico;};
if (player distance (markerpos "helico_spawn_gendarmerie") < 40) then {_position_spawn_vehicule = getMarkerPos "copchopperspawn";};
if (player distance (getpos base_gang) < 40) then {_position_spawn_vehicule = getMarkerPos "terrorchopperspawn";};
if ([] call nombre_de_vehicule_max_sur_la_carte <= 0) exitwith {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Vous avez trop de véhicules sur la carte ... \n\n Sauvegardez vos véhicules en trop pour éviter Desync et lag du serveur. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil "_position_spawn_vehicule") exitwith {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Pas de spawn détecté ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (count (nearestObjects [_position_spawn_vehicule, ["Car","Ship","Air"], 5]) > 0) exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_numero_tableau = -1;

if (!isnil {player getvariable "license_pilote_news"}) then
{
	if(revive_mon_side == west) then
	{
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			le_nom_de_larticle = "Little Bird";
			le_prix_de_larticle = 15000;
			vehname = "Heli_Light_Gendarme_SFP";
			if (!isnil "je_suis_whiteliste_GIGN") exitwith {hint "Désolé,le GIGN ne peut pas acheter cet hélicoptère!";};

			
			if ((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			if (isnil "je_suis_whiteliste_GIGN") exitwith {hint "Désolé,seul le GIGN peut acheter cet hélicoptère!";};
			le_nom_de_larticle = "KA60 GIGN";
			le_prix_de_larticle = 16000;
			vehname = "O_Heli_Light_GIGN_SFP";
						
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;				
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			if (!isnil "je_suis_whiteliste_GIGN") exitwith {hint "Désolé,le GIGN ne peut pas acheter cet hélicoptère!";};
			le_nom_de_larticle = "KA60 GIGN";
			le_prix_de_larticle = 16800;
			vehname = "O_Heli_Light_Gendarmerie_SFP";
						
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;				
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			if (isnil "je_suis_whiteliste_GIGN") exitwith {hint "Désolé,seul le GIGN peut acheter cet hélicoptère!";};
			le_nom_de_larticle = "WY-55";
			le_prix_de_larticle = 20000;
			vehname = "I_Heli_light_GIGN_SFP";

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
								
				sleep 1;
				[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";
				
				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;				
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			le_nom_de_larticle = "EC 635";
			le_prix_de_larticle = 17000;
			vehname = "SFP_EC635_ADAC_Gendarmerie";
			
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
								
				[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;				
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			if (isnil "je_suis_whiteliste_GIGN") exitwith {hint "Désolé,seul le GIGN peut acheter cet hélicoptère!";};
			le_nom_de_larticle = "UH-80";
			le_prix_de_larticle = 18000;
			vehname = "B_Heli_Transport_GIGN_SFP";
			
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
								
				[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;				
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
	};
	
	if(revive_mon_side == civilian) then
	{
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "Little Bird";
			le_prix_de_larticle = 150000;
			vehname = "Heli_Light_Civil_SFP";

			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "Little Bird Neomedia";
			le_prix_de_larticle = 80000;
			vehname = "Heli_Light_NeoMedia_SFP";

			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			if (isnil {player getvariable "sarl_neomedia"}) exitwith {hint "Désolé, vous ne faite pas partie de l'entreprise Neomedia ...";};
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "ADAC Neomedia";
			le_prix_de_larticle = 220000;
			vehname = "SFP_EC635_ADAC_Neomedia";

			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			if (isnil {player getvariable "sarl_neomedia"}) exitwith {hint "Désolé, vous ne faite pas partie de l'entreprise Neomedia ...";};
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			le_nom_de_larticle = "KA60";
			le_prix_de_larticle = 250000;
			vehname = "O_Heli_Light_Civil_SFP";

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,_position_spawn_vehicule,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;				
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
	};
}else
{
	hint "Vous avez besoin d'une licence de pilote pour acheter un hélicoptère !";
};
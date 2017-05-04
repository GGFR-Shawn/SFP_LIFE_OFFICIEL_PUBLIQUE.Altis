// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private "_direction";
if (player distance (getmarkerpos "boutique_avions") < 20) then {_direction = 40; carspawn = getMarkerPos "achatspawnavion";};
if (player distance (getmarkerpos "boutique_avions_2") < 20) then {_direction = 0; carspawn = getMarkerPos "achatspawnavion_2";};
if ([] call nombre_de_vehicule_max_sur_la_carte <= 0) exitwith {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Vous avez trop de véhicules sur la carte ... \n\n Sauvegardez vos véhicules en trop pour éviter Desync et lag du serveur. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_numero_tableau = -1;

if (!isnil {player getvariable "license_pilote_news"}) then
{
	if(revive_mon_side == civilian) then
	{
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "Montgolfière";
			le_prix_de_larticle = 65000;
			vehname = "R_HotairBalloon";
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "ParaMoteur";
			le_prix_de_larticle = 70000;
			vehname = "sab_paratrike_rainbow";
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "Sab FAAllegro";
			le_prix_de_larticle = 145000;
			vehname = "sab_FAAllegro";
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "Robin DR-400";
			le_prix_de_larticle = 190000;
			vehname = "sab_RobinDR400_2";
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "Avion Non Amphibi 2";
			le_prix_de_larticle = 235000;
			vehname = "Sab_cz_An2";
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "Avion Pseudo Amphibi";
			le_prix_de_larticle = 285000;
			vehname = "Sab_Amphi_An2";
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "Avion Touristique";
			le_prix_de_larticle = 580000;
			vehname = "IVORY_T6A_1";
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "Avion de ligne";
			le_prix_de_larticle = 700000;
			vehname = "ivory_yak42d_1";
			
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
			_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
			_verifierautour_deux_check_ok = _verifierautour_deux select 0;
			if (!isnil "_verifierautour_deux_check_ok") exitwith {hint format ["Achat impossible, l'avion de %1 est déjà sur la zone !",_verifierautour_deux_check_ok getvariable "vehicule_info_parvariable" select 0];};

			le_nom_de_larticle = "Caesar BTT";
			le_prix_de_larticle = 350000;
			vehname = "C_Plane_Civil_01_F";
			
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir _direction;
				
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
			}else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
	};
}else
{
	hint "Vous avez besoin d'une licence de pilote pour acheter un avion !";
};
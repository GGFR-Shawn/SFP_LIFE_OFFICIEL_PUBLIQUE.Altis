// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
carspawn = nil;
_numero_tableau = -1;

if (player distance getmarkerpos "car_spawn_gendarmerie_2" < 50) then  {carspawn = getmarkerpos "car_spawn_gendarmerie_2";};
if (player distance getmarkerpos "copchopperspawn" < 50) then  {carspawn = getmarkerpos "copchopperspawn";};
if (isnil "carspawn") exitwith  {hint "Erreur, position menu stagiaire gendarmerie ...";};

_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 2];
_verifierautour_deux_check_ok = _verifierautour_deux select 0;

_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Taser";
	le_prix_de_larticle = 1000;
	vehname = "hgun_Rook40_F_Taser_Maxou";
	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		[player, vehname, 8] call BIS_fnc_addWeapon;
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Flashball";
	le_prix_de_larticle = 800;
	vehname = "F_Flash_Ball_SFP_Maxou";

	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		[player, vehname, 8] call BIS_fnc_addWeapon;
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Lacrymo";
	le_prix_de_larticle = 800;
	vehname = "Pistolet_Lacrymo_SFP";

	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		[player, vehname, 8] call BIS_fnc_addWeapon;
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Rook";
	le_prix_de_larticle = 1000;
	vehname = "hgun_Rook40_snds_F";

	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		[player, vehname, 8] call BIS_fnc_addWeapon;
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Sting";
	le_prix_de_larticle = 5000;
	vehname = "SMG_02_F";

	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		[player, vehname, 8] call BIS_fnc_addWeapon;
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Habit Gendarme";
	le_prix_de_larticle = 200;

	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		removeHeadgear player;
		player removeWeapon "NVGoggles";
		player addHeadGear "h_beret_blk"; 
		player addvest "V_TacVest_Gendarmerie_SFP"; 
		sleep 0.5; player setObjectTextureGlobal [0, "textures\habit_gendarme.jpg"];
	
		if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then {player addVest "V_TacVest_blk_POLICE";}else{player addVest "V_TacVest_PSIG";};
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Jumelle";
	le_prix_de_larticle = 400;

	if !(player canAdd "Rangefinder") exitwith {hint "Impossible, vous n'avez plus de place !";};
	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		player addWeapon "Rangefinder";  
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Night Vision";
	le_prix_de_larticle = 2000;

	if !(player canAdd "NVGoggles_OPFOR") exitwith {hint "Impossible, vous n'avez plus de place !";};
	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		
		player addItem "NVGoggles_OPFOR";
		player assignitem "NVGoggles_OPFOR";
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Interceptor";
	le_prix_de_larticle = 13100;
	vehname = "DAR_ExplorerPoliceStealth";

	if (!isnil "_verifierautour_deux_check_ok") exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};
	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
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
	le_nom_de_larticle = "Taurus";
	le_prix_de_larticle = 75000;
	vehname = "DAR_TaurusPolice";

	if (!isnil "_verifierautour_deux_check_ok") exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};
	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
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
	le_nom_de_larticle = "Pickup";
	le_prix_de_larticle = 1000;
	vehname = "C_Offroad_Gendarmerie_SFP";

	if (!isnil "_verifierautour_deux_check_ok") exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};
	
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
						
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
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

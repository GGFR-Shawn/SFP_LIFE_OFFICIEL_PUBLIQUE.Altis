// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil {player getvariable "licence_gang_v2"}) exitwith {hint "Vous devez appartenir à un gang pour acheter ce véhicule !";};
if(revive_mon_side != civilian) exitwith {hint "Vous n'etes pas un civil !";};
	
carspawn = getMarkerPos "gangdessfpvehicules";
argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";
_numero_tableau = -1;
_numero_tableau = round (_numero_tableau + 1);

if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Quad";
	le_prix_de_larticle = 600;
	vehname = "B_Quadbike_01_F";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "OffRoad";
	le_prix_de_larticle = 3100;
	vehname = "B_G_Offroad_01_F";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "ifrit non armé";
	le_prix_de_larticle = 110000;
	vehname = "O_MRAP_02_F";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";
		[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
	
		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;				
	}else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "JEEP armé";
	le_prix_de_larticle = 56000;
	vehname = "UAZ_MG";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;				
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "pickup armé";
	le_prix_de_larticle = 59000;
	vehname = "B_G_Offroad_01_armed_F";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;				
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "JEEP Blindé";
	le_prix_de_larticle = 160000;
	vehname = "SFP_jeep_blinde";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;				
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Qilin (Désarmé)";
	le_prix_de_larticle = 26000;
	vehname = "O_T_LSV_02_unarmed_F";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;				
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Qilin (Armé)";
	le_prix_de_larticle = 65000;
	vehname = "O_T_LSV_02_armed_F";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;				
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Jeep DLC";
	le_prix_de_larticle = 6000;
	vehname = "I_C_Offroad_02_unarmed_F";

	
	if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
	{
		closeDialog 0;
	
		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		[0,0,0,[_veh]] execvm "divers\reparation_des_vehicules\rearmer_vehicule_sfp.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;				
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
	};
};

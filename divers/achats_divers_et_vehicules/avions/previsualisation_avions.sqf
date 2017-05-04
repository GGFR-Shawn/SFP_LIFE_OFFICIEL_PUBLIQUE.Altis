// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "message_brut_modele") then
{
	message_brut_modele = 1;
	hint "Attention, les prévualisation sont affichées en version BRUT, c'est à dire en skin d'origine !";
};

if(revive_mon_side == west) then
{
	Hint "Aucuns avions disponibles !";
};

if (revive_mon_side == civilian) then
{
	if((lbCurSel 1500) == 0) then {if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};createdialog "R_HotairBalloon_Dialogue";};
	if((lbCurSel 1500) == 1) then {if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};createdialog "sab_paratrike_rainbow_Dialogue";};
	if((lbCurSel 1500) == 2) then {if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};createdialog "sab_FAAllegro_SFP";};
	if((lbCurSel 1500) == 3) then {if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};createdialog "sab_RobinDR400_2_SFP";};
	if((lbCurSel 1500) == 4) then {if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};createdialog "Sab_cz_An2_SFP";};
	if((lbCurSel 1500) == 5) then {if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};createdialog "Sab_Amphi_An2_SFP";};
	if((lbCurSel 1500) == 6) then {hint "L'addon étant mal fait, il n'y à pas de prévualisation !";};
	if((lbCurSel 1500) == 7) then {if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};createdialog "Ivory_Avion_De_Ligne_SFP";};
	if((lbCurSel 1500) == 8) then {if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};createdialog "C_Plane_Civil_01_F_Dialogue";};
};
ctrlSetText[11172,"By Maxou."];
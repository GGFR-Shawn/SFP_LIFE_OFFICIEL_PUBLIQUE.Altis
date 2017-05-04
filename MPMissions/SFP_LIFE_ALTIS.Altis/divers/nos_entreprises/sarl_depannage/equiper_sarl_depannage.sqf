// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (isnil {player getvariable "sarl_depannage"}) exitwith {hint "! SARL DIR ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de matériels ici puisque vous ne faite pas partie de notre entreprise.\n\n Cordialement.";};
if (player getvariable "bidon_d_essence" >= 2) exitwith {hint "Désolé, tu as atteint le maximum de jerrican !";player setvariable ["bidon_d_essence",0,true];};

if((player getVariable "mon_argent_banque_by_sfp_maxou") >= 49) then
{
	hint format ["! SARL DIR ! \n --------------------------------------- \n\n Bonjour %1,\n\n Pour te faire gagner du temps, j'ai crée un pack du dépanneur qui comprend : \n\n - Un sac à dos. \n - Un jerrican (40 litres gasoil). \n - Un gps. \n - Un kit de soin. \n - Trois toolkits.  \n\n Amuse toi bien :)",name player];

	player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - 49,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then {player addVest "V_TacVest_blk_POLICE";}else{player addVest "V_TacVest_Depannage_SFP";};
	if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then {player addbackpack "B_Kitbag_cbr";}else{player addbackpack "B_Kitbag_cbr_DDE";};
	
	player setVariable ['bidon_d_essence',(player getvariable "bidon_d_essence") + 1,true];
	
	player addItem "itemgps";
	player assignitem "itemgps";

	player addItem "NVGoggles";
	player assignitem "NVGoggles";

	player addItem "FirstAidKit";
	player addItem "ToolKit";
	player addItem "ToolKit";
	player addItem "ToolKit";
	player addItem "ToolKit";
}
else
{
	Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou'),49];
};

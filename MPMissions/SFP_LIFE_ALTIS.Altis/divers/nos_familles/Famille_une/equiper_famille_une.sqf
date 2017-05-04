// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil {player getvariable sfp_config_famille_une_nom_pour_variable}) exitwith {hint format ["! %1 ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas vous équiper ici puisque vous ne faite pas partie de notre famille.\n\n Cordialement.", sfp_config_famille_une_nom];};
if (player getvariable "mon_argent_banque_by_sfp_maxou" < 100) exitwith {hint format ["! %1 ! \n --------------------------------------- \n\n Désolé, il vous faut 100 Euros !", sfp_config_famille_une_nom];};

player setvariable ["mon_argent_banque_by_sfp_maxou", ((player getvariable "mon_argent_banque_by_sfp_maxou") - (100)), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 

_habbitactuel = uniform player;
if (_habbitactuel != "U_O_CombatUniform_oucamo") then {player forceAddUniform "U_O_CombatUniform_oucamo";};

_vestactuel = vest player;
if (_vestactuel != "V_PlateCarrier_Kerry") then {player addVest "V_PlateCarrier_Kerry";};

_foulardactuel = headgear player;
if (_foulardactuel != "H_HelmetSpecB_snakeskin") then {player addHeadGear "H_HelmetSpecB_snakeskin";};

_lunetteactuel = Goggles player;
if (_lunetteactuel != "G_Balaclava_blk") then {player addGoggles "G_Balaclava_blk";};

// Dans l'initialisation FAMILLE UNE
if (!(isnil ("actionpourmequiper"))) then {player removeaction actionpourmequiper;};


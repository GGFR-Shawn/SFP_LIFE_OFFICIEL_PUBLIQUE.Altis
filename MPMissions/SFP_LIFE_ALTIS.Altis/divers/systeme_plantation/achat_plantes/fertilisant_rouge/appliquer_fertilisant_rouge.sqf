// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_displayname = "un fertilisant rouge";
_la_plante = cursortarget;

if !(isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour vous amusez avec le système de plantation !";};
if (player getvariable "item_plante_fertilisant_rouge" < 1) exitwith {hint "Désolé, vous n'avez pas de fertilisant rouge !";};
if (_la_plante getvariable "item_plante_fertilisant_rouge" > 0) exitwith {hint "Désolé, la plante à déja un fertilisant rouge !";};

player setVariable ['item_plante_fertilisant_rouge', round ((player getvariable "item_plante_fertilisant_rouge") - 1),true];
player setVariable ['usedspace', round ((player getvariable "usedspace") - (listes_des_farming_avec_parametre select 48 select 2)),true];
_la_plante setVariable ['item_plante_fertilisant_rouge', 1,true];

hint format['! ACHAT PLANTATION ! \n --------------------------------------- \n\n La plante à bien recu %1. \n\n Ce fertilisant augmentera de 50% ta chance de recolter deux plantes lors de sa récolte. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou',_displayname];


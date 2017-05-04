// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_displayname = "un fertilisant rouge";
_thisprice = 800;
_place_inventaire_plante = listes_des_farming_avec_parametre select 48 select 2;

if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
if (((player getVariable "usedspace") + _place_inventaire_plante) > (player getvariable "totalspace")) exitwith {hint format ["! ACHAT PLANTATION ! \n --------------------------------------- \n\n Il n'y a pas assez de place dans ton inventaire ! \n\n Chaque graine prend %1 de place ... \n Il t'en manque donc %2 ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_place_inventaire_plante, ((player getvariable "totalspace") - _place_inventaire_plante)];};
if (((player getvariable "mon_argent_poche_by_sfp_maxou") - _thisprice) < 0) exitwith {hint format ["! ACHAT PLANTATION ! \n --------------------------------------- \n\n Désolé, vous n'avez pas assez d'argent ! \n\n Il vous manque %1 Euros de poche. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",((player getVariable "mon_argent_poche_by_sfp_maxou") - _thisprice)];};
if !(isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour vous amusez avec le système de plantation !";};

player setVariable ['mon_argent_poche_by_sfp_maxou', (player getvariable "mon_argent_poche_by_sfp_maxou") - _thisprice,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
player setVariable ['item_plante_fertilisant_rouge', round ((player getvariable "item_plante_fertilisant_rouge") + (listes_des_farming_avec_parametre select 48 select 3)),true];
player setVariable ['usedspace', round ((player getvariable "usedspace") + _place_inventaire_plante),true];

hint format['! ACHAT PLANTATION ! \n --------------------------------------- \n\n Vous avez acheté %1 pour %2 Euros ! \n\n Il vous reste %3 Euros ! \n\n Ce fertilisant augmentera de 50% ta chance de recolter deux plantes. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou',_displayname,_thisprice,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
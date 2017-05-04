// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_displayname = ["Pavot","Qat","Stevia","Soma","Iboga","Tabernanthe","Bwiti","Mescaline","Lophophora williamssi","Datura","Ergot de seigle","Pavot"] call BIS_fnc_selectRandom;
_thisprice = 3000;
_place_inventaire_plante = 25;

if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
if (((player getVariable "usedspace") + _place_inventaire_plante) > (player getvariable "totalspace")) exitwith {hint format ["! ACHAT PLANTATION ! \n --------------------------------------- \n\n Il n'y a pas assez de place dans ton inventaire ! \n\n Chaque plante prend %1 de place ... \n Il t'en manque donc %2 ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_place_inventaire_plante, ((player getvariable "totalspace") - _place_inventaire_plante)];};
if (((player getvariable "mon_argent_poche_by_sfp_maxou") - _thisprice) < 0) exitwith {hint format ["! ACHAT PLANTATION ! \n --------------------------------------- \n\n Désolé, vous n'avez pas assez d'argent ! \n\n Il vous manque %1 Euros de poche. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",((player getVariable "mon_argent_poche_by_sfp_maxou") - _thisprice)];};
if !(isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour vous amusez avec le système de plantation !";};
if (player getvariable "item_plante_pour_planter" >= 2) exitwith {hint "! ACHAT PLANTATION ! \n --------------------------------------- \n\n Bonjour, \n\n Vous ne pouvez plus acheter de plante puisque vous en avez déjà deux.\n\n Cordialement. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

player setVariable ['mon_argent_poche_by_sfp_maxou', (player getvariable "mon_argent_poche_by_sfp_maxou") - _thisprice,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
player setVariable ['item_plante_pour_planter', round ((player getvariable "item_plante_pour_planter") + 1),true];
player setVariable ['usedspace', round ((player getvariable "usedspace") + _place_inventaire_plante),true];

hint format['! ACHAT PLANTATION ! \n --------------------------------------- \n\n Vous avez acheté une plante de type : \n "%1" \n\n pour %2 Euros ! Il vous reste %3 Euros ! \n\n PS : Vous pouvez maintenant la planter avec le menu "POSER OBJET". \n\n Celle ci vous rapportera AUX ALENTOURS de 100 000 Euros. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou',_displayname,_thisprice,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
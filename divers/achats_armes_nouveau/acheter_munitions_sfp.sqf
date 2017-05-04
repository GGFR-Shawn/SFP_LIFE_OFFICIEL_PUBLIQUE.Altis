// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Choix 0 = Armes Gangs fusils.
// Choix 1 = Pistolets Illégaux.
// Choix 2 = Fusils Illégaux.
// Choix 3 = Pistolets Légaux.
// Choix 4 = Fusils Légaux.
// Choix 5 = Armes GIGN.

// =======================================================================================================================================================================================
														// INITIALISATION DU TABLEAU ET CONFIGURATION AUTOMATIQUE
// =======================================================================================================================================================================================
private ["_parametrage_du_tableau", "_prise_en_compte_du_tableau"];
_choix_des_munitions = _this select 0;
if (isnil "_choix_des_munitions") exitwith {hint "Erreur numéro du dialogue, recommence !";};

if (_choix_des_munitions == 0) then {_parametrage_du_tableau = parametrage_armes_gang; _prise_en_compte_du_tableau = armes_des_gangs;};
if (_choix_des_munitions == 1) then {_parametrage_du_tableau = parametrage_armes_pistolets_illegaux; _prise_en_compte_du_tableau = armes_pistolets_illegaux;};
if (_choix_des_munitions == 2) then {_parametrage_du_tableau = parametrage_armes_fusils_illegaux; _prise_en_compte_du_tableau = armes_fusils_illegaux;};
if (_choix_des_munitions == 3 && revive_mon_side == civilian) then {_parametrage_du_tableau = parametrage_armes_pistolets_legaux_civil; _prise_en_compte_du_tableau = armes_pistolets_legaux_civil;};
if (_choix_des_munitions == 3 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_pistolets_legaux_gendarmes; _prise_en_compte_du_tableau = armes_pistolets_legaux_gendarmes;};
if (_choix_des_munitions == 4 && revive_mon_side == civilian) then {_parametrage_du_tableau = parametrage_armes_fusils_legaux_civil; _prise_en_compte_du_tableau = armes_fusils_legaux_civil;};
if (_choix_des_munitions == 4 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_fusils_legaux_gendarmes; _prise_en_compte_du_tableau = armes_fusils_legaux_gendarmes;};
if (_choix_des_munitions == 5 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_GIGN; _prise_en_compte_du_tableau = armes_du_GIGN;};

// =======================================================================================================================================================================================
															// !!! LANCEMENT CONFIGURATION NE PAS TOUCHER !!!!!!
// =======================================================================================================================================================================================

if (((_prise_en_compte_du_tableau select (lbCurSel (_parametrage_du_tableau select 3)) select 4) call bis_fnc_selectrandom) == "poignard_item") exitwith {hint "Tu comptes acheter quoi ? Une lame en plastique ;)";};

_position_choix_dans_le_dialogue = (lbCurSel (_parametrage_du_tableau select 3));
_ou_prendre_l_argent = _parametrage_du_tableau select 1;

_son_nom = _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 0;
_choix_des_munitions = (_prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 4) call bis_fnc_selectrandom; 
_son_prix = _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 5;

_munitions_actuellement = 1; 
for "_i" from 0 to (count magazinesAmmoFull player) do 
{
	if (((magazinesAmmoFull player) select _i select 0) == _choix_des_munitions) then 
	{
		_munitions_actuellement = _munitions_actuellement + 1;
	};
};

if (isnil "_position_choix_dans_le_dialogue" or isnil "_ou_prendre_l_argent" or isnil "_son_nom" or isnil "_choix_des_munitions" or isnil "_son_prix") exitwith {hint "Erreur sur le choix, recommence ...";};
if (player getVariable _ou_prendre_l_argent < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et il vous faut %2 Euros",(player getVariable _ou_prendre_l_argent),(_son_prix)];};
if !(player canAdd _choix_des_munitions) exitwith {hint "Impossible, vous n'avez plus de place !";};

player setVariable [_ou_prendre_l_argent, (player getvariable _ou_prendre_l_argent) - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
player addMagazine _choix_des_munitions;
hint format['------------------------------------------------ \n ! ACHAT MUNITIONS ! \n ------------------------------------------------ \n\n Munitions de : %1. \n Actuellement : %2 munitions. \n Prix : %3 Euros. \n\n Il vous reste %4 Euros. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr',_son_nom, _munitions_actuellement,_son_prix, (player getVariable _ou_prendre_l_argent) call retour_formatage_chiffre_sfp];


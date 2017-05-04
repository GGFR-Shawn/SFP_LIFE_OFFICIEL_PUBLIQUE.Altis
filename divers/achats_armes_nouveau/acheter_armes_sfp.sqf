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
_numero_choix_armes = _this select 0;
if (isnil "_numero_choix_armes") exitwith {hint "Erreur numéro du dialogue, recommence !";};

if (_numero_choix_armes == 0) then {_parametrage_du_tableau = parametrage_armes_gang; _prise_en_compte_du_tableau = armes_des_gangs;};
if (_numero_choix_armes == 1) then {_parametrage_du_tableau = parametrage_armes_pistolets_illegaux; _prise_en_compte_du_tableau = armes_pistolets_illegaux;};
if (_numero_choix_armes == 2) then {_parametrage_du_tableau = parametrage_armes_fusils_illegaux; _prise_en_compte_du_tableau = armes_fusils_illegaux;};
if (_numero_choix_armes == 3 && revive_mon_side == civilian) then {_parametrage_du_tableau = parametrage_armes_pistolets_legaux_civil; _prise_en_compte_du_tableau = armes_pistolets_legaux_civil;};
if (_numero_choix_armes == 3 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_pistolets_legaux_gendarmes; _prise_en_compte_du_tableau = armes_pistolets_legaux_gendarmes;};
if (_numero_choix_armes == 4 && revive_mon_side == civilian) then {_parametrage_du_tableau = parametrage_armes_fusils_legaux_civil; _prise_en_compte_du_tableau = armes_fusils_legaux_civil;};
if (_numero_choix_armes == 4 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_fusils_legaux_gendarmes; _prise_en_compte_du_tableau = armes_fusils_legaux_gendarmes;};
if (_numero_choix_armes == 5 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_GIGN; _prise_en_compte_du_tableau = armes_du_GIGN;};

// =======================================================================================================================================================================================
															// !!! LANCEMENT CONFIGURATION NE PAS TOUCHER !!!!!!
// =======================================================================================================================================================================================
_position_choix_dans_le_dialogue = (lbCurSel (_parametrage_du_tableau select 3));
_ou_prendre_l_argent = _parametrage_du_tableau select 1;

_son_nom = _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 0;
_choix_de_l_arme = (_prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 2) call bis_fnc_selectrandom; 
_son_prix = _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 3;

if (isnil "_position_choix_dans_le_dialogue" or isnil "_ou_prendre_l_argent" or isnil "_son_nom" or isnil "_choix_de_l_arme" or isnil "_son_prix") exitwith {hint "Erreur sur le choix, recommence ...";};
if (player getVariable _ou_prendre_l_argent < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et il vous faut %2 Euros",(player getVariable _ou_prendre_l_argent),(_son_prix)];};
if (_choix_de_l_arme in weapons player) exitwith {hint "Vous avez déja cette arme !";};
if (_choix_de_l_arme == "poignard_item") exitwith {[_son_nom, _son_prix] execvm "divers\achats_armes_nouveau\divers\acheter_poignard.sqf";};

player setVariable [_ou_prendre_l_argent, (player getvariable _ou_prendre_l_argent) - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format['------------------------------------------------ \n ! ACHAT ARME ! \n ------------------------------------------------ \n\n Vous avez acheté : %1. \n Prix : %2 Euros. \n\n Il vous reste %3 Euros. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr',_son_nom, (_son_prix) call retour_formatage_chiffre_sfp, (player getVariable _ou_prendre_l_argent) call retour_formatage_chiffre_sfp];
player addweapon _choix_de_l_arme;

// =======================================================================================================================================================================================
																				// !!! DIVERS !!!!!!
// =======================================================================================================================================================================================
// Si armes illégales alors wanted liste de recherche
if (_numero_choix_armes == 1 or _numero_choix_armes == 2) then 
{
	if (isnil {player getvariable "recherche_pour_armes_illegales"}) then {player setVariable["recherche_pour_armes_illegales",true,true];};
	if (isnil "temps_restant_pour_armes_illegales") then {execvm "divers\achats_armes_nouveau\divers\enlever_alerte_armes_illegales_apres_temps.sqf";};
};
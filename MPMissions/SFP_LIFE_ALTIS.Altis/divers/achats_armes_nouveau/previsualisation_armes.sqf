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
private ["_parametrage_du_tableau", "_prise_en_compte_du_tableau","_idee_nom_du_menu"];
_choix_de_la_previsualisation = _this select 0;
if (isnil "_choix_de_la_previsualisation") exitwith {hint "Erreur numéro du dialogue, recommence !";};

if (_choix_de_la_previsualisation == 0) then {_parametrage_du_tableau = parametrage_armes_gang; _prise_en_compte_du_tableau = armes_des_gangs;};
if (_choix_de_la_previsualisation == 1) then {_parametrage_du_tableau = parametrage_armes_pistolets_illegaux; _prise_en_compte_du_tableau = armes_pistolets_illegaux;};
if (_choix_de_la_previsualisation == 2) then {_parametrage_du_tableau = parametrage_armes_fusils_illegaux; _prise_en_compte_du_tableau = armes_fusils_illegaux;};
if (_choix_de_la_previsualisation == 3 && revive_mon_side == civilian) then {_parametrage_du_tableau = parametrage_armes_pistolets_legaux_civil; _prise_en_compte_du_tableau = armes_pistolets_legaux_civil;};
if (_choix_de_la_previsualisation == 3 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_pistolets_legaux_gendarmes; _prise_en_compte_du_tableau = armes_pistolets_legaux_gendarmes;};
if (_choix_de_la_previsualisation == 4 && revive_mon_side == civilian) then {_parametrage_du_tableau = parametrage_armes_fusils_legaux_civil; _prise_en_compte_du_tableau = armes_fusils_legaux_civil;};
if (_choix_de_la_previsualisation == 4 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_fusils_legaux_gendarmes; _prise_en_compte_du_tableau = armes_fusils_legaux_gendarmes;};
if (_choix_de_la_previsualisation == 5 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_armes_GIGN; _prise_en_compte_du_tableau = armes_du_GIGN;};

// =======================================================================================================================================================================================
															// !!! LANCEMENT CONFIGURATION NE PAS TOUCHER !!!!!!
// =======================================================================================================================================================================================

_position_choix_dans_le_dialogue = (lbCurSel (_parametrage_du_tableau select 3));
_selection_du_dialogue = (_prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 1); 
if (isnil "_position_choix_dans_le_dialogue" or isnil "_selection_du_dialogue") exitwith {hint "Erreur sur le choix, recommence ...";};

createdialog _selection_du_dialogue;

ctrlSetText [11172 ,"By Maxou. (Echap pour quitter)"];
((uiNamespace getVariable _selection_du_dialogue) displayCtrl 11173) ctrlSetText format ["Arme :%1.", _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 0];
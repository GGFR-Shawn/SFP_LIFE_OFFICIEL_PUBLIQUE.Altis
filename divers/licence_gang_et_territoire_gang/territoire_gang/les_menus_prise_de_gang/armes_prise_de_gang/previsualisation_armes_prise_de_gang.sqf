// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_parametrage_du_tableau", "_prise_en_compte_du_tableau"];
_parametrage_du_tableau = parametrage_armes_pistolets_prises_de_gang; 
_prise_en_compte_du_tableau = armes_pistolets_prises_de_gang;
if (isnil "_parametrage_du_tableau" or isnil "_prise_en_compte_du_tableau") exitwith {hint "Erreur choix du tableau, recommence ...";};

// =======================================================================================================================================================================================
															// !!! LANCEMENT CONFIGURATION NE PAS TOUCHER !!!!!!
// =======================================================================================================================================================================================

_position_choix_dans_le_dialogue = (lbCurSel (_parametrage_du_tableau select 3));
_selection_du_dialogue = (_prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 1); 
if (isnil "_position_choix_dans_le_dialogue" or isnil "_selection_du_dialogue") exitwith {hint "Erreur sur le choix, recommence ...";};

createdialog _selection_du_dialogue;

ctrlSetText [11172 ,"By Maxou. (Echap pour quitter)"];
((uiNamespace getVariable _selection_du_dialogue) displayCtrl 11173) ctrlSetText format ["Arme :%1.", _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 0];
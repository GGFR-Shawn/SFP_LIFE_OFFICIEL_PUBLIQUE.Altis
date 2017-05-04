// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_selection = lbCurSel ((uiNamespace getVariable "Menu_liste_choix_respawn") displayCtrl 1500);
if (_selection == -1) exitwith {hint "Désolé, aucune position n'a été selectionnée !";};
if (isnil {position_de_mes_respawn select _selection select 1}) exitwith {hint "Erreur sur la position ...";};

_nom_de_la_position = position_de_mes_respawn select _selection select 0;
_position_endroit_de_spawn = position_de_mes_respawn select _selection select 1;

openMap [false, false];
closedialog 0;

jai_le_droit_de_me_tp = 1; 
player setpos _position_endroit_de_spawn;
systemchat format ["%1 à bien été choisit.", _nom_de_la_position];


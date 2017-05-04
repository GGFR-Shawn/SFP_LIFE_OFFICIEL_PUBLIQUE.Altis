// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_selection = lbCurSel ((uiNamespace getVariable "Menu_tablette_sfp_Choix_Vehicule_A_Sauvegarder") displayCtrl 1500);
if (_selection == -1) exitwith {hint "Désolé, aucun véhicule selectionné !";};
if (isnil {position_sauvegarde_de_mes_vehicules select _selection}) exitwith {hint "Erreur sur la position du véhicule.";};

if (isnil "positionnement_carte_sauvegarde_vehicule") then {positionnement_carte_sauvegarde_vehicule = 0;};
if (positionnement_carte_sauvegarde_vehicule >= 1) exitwith {hint "Patiente que le script ce termine.";};
positionnement_carte_sauvegarde_vehicule = 1;
[] spawn {sleep 8; positionnement_carte_sauvegarde_vehicule = nil;};


if (!visibleMap) then 
{
	openMap [true, false];
	cutText["","BLACK IN"];
	sleep 1;
};
waituntil {visibleMap};

waitUntil {!(isNull (findDisplay 12))};
disableSerialization;

_control_carte = (findDisplay 12) displayCtrl 51;	
_control_carte ctrlMapAnimAdd [2, 0.7, position_sauvegarde_de_mes_vehicules select _selection];
ctrlMapAnimCommit _control_carte;

waituntil {ctrlMapAnimDone _control_carte};

sleep 1;
_control_carte ctrlMapAnimAdd [4, 0.002, position_sauvegarde_de_mes_vehicules select _selection];
ctrlMapAnimCommit _control_carte;

waituntil {ctrlMapAnimDone _control_carte};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
openMap [false, false];
// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_selection = lbCurSel ((uiNamespace getVariable "Menu_liste_choix_destination_ferry_sfp") displayCtrl 1500);
if (isnil "_selection") exitwith {};
if (_selection == -1) exitwith {hint "Désolé, aucune position n'a été selectionnée !";};
if (isnil {sfp_config_position_du_ferry_sfp select _selection select 1}) exitwith {hint "Erreur sur la position du ferry ...";};

_nom_de_la_position = sfp_config_position_du_ferry_sfp select _selection select 0;
_position_endroit_de_spawn = sfp_config_position_du_ferry_sfp select _selection select 1;

if (!visibleMap) then {openMap [true, false];};

waituntil {visibleMap};

waitUntil {!(isNull (findDisplay 12))};
disableSerialization;

_control_carte = (findDisplay 12) displayCtrl 51;	
_control_carte ctrlMapAnimAdd [0.5, 0.15, _position_endroit_de_spawn];
ctrlMapAnimCommit _control_carte;

if (isnil "markeur_position_respawn") then
{
	_nom_du_marqueur = format ["%1%2",name player, round (9999)];
	markeur_position_respawn = createMarkerlocal [_nom_du_marqueur, _position_endroit_de_spawn];
	markeur_position_respawn setMarkerShapelocal "ICON";
	markeur_position_respawn setMarkerColorlocal "ColorYellow";
	markeur_position_respawn setMarkerSizelocal [2,2];
	markeur_position_respawn setMarkerTypelocal "mil_objective";
};

markeur_position_respawn setMarkerPosLocal (_position_endroit_de_spawn);


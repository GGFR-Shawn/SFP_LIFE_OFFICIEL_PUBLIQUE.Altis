// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position_endroit_voiture = _this select 0;
_type_de_voiture = _this select 1;

if (isnil "_position_endroit_voiture" or isnil "_type_de_voiture") exitwith {};

["TaskAssigned",[format["Véhicule <t color='#0FC702'>%1</t> offert vers position %2 !",_type_de_voiture, _position_endroit_voiture], "textures\icones\vehicles\veh-hunt-wheels.paa"]] call bis_fnc_showNotification;

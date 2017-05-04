// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position_de_la_station = _this select 0;
if (isnil "_position_de_la_station") exitwith {};
if (!hasInterface) exitwith {};
if (revive_mon_side != west) exitwith {};

titletext ["Braquage d'une station en cours !!! \n\n Consulte ta carte !","PLAIN",1];

_nom_du_marqueur = format ["%1%2%3",name player, _position_de_la_station select 0, round (random 1000)];
_le_marqueur = createMarkerlocal [_nom_du_marqueur, _position_de_la_station];
_le_marqueur setMarkerShapelocal "ICON";
_le_marqueur setMarkerColorlocal "ColorRed";
_le_marqueur setMarkerSizelocal [2,2];
_le_marqueur setMarkerTypelocal "hd_dot";
_le_marqueur setMarkerTextlocal "Braquage Station Service !";

_temps_avant_suppression_marqueur = 100; // Secondes
while {_temps_avant_suppression_marqueur > 0 && player distance _position_de_la_station > 5} do
{
	_temps_avant_suppression_marqueur = round (_temps_avant_suppression_marqueur - 1);
	sleep 1;
};

deletemarkerlocal _le_marqueur;

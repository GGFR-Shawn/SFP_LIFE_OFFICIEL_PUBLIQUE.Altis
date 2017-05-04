// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};

_son_nom = _this select 0;
if (revive_mon_side != west) exitwith {};
if (isnil "_son_nom") exitwith {hint "Erreur appel d'urgence gendarme !";};

cutText [format["Le gendarme %1 à besoin de renfort !! Consulte ta carte pour trouver l'endroit !", name _son_nom], "PLAIN DOWN"];

_nom_du_marqueur = format ["%1", _son_nom];
_le_marqueur = createMarkerlocal [_nom_du_marqueur, [getPosATL _son_nom select 0, (getPosATL _son_nom select 1) - (10), getPosATL _son_nom select 2]];
_le_marqueur setMarkerShapelocal "ICON";
_le_marqueur setMarkerColorlocal "ColorRed";
_le_marqueur setMarkerSizelocal [2,2];
_le_marqueur setMarkerTypelocal "hd_dot";
_le_marqueur setMarkerTextlocal " Demande policière !";
_le_marqueur setMarkerPoslocal [getPosATL _son_nom select 0, (getPosATL _son_nom select 1) - (10), getPosATL _son_nom select 2];

tempsavanteffacement = 50;
while {alive _son_nom && tempsavanteffacement > 0} do
{
	sleep 1;
	_le_marqueur setMarkerPoslocal [getPosATL _son_nom select 0, (getPosATL _son_nom select 1) - (10), getPosATL _son_nom select 2];
	tempsavanteffacement = tempsavanteffacement - 1;
};

deletemarkerlocal _le_marqueur;
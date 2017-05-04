// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};
_le_prisonnier = _this select 0;
if (isnil "_le_prisonnier") exitwith {};


_nom_du_marker_prisonnier = format ["marker_%1",getPosATL _le_prisonnier];
createMarkerLocal [_nom_du_marker_prisonnier, (getPosATL (_le_prisonnier))];
_nom_du_marker_prisonnier setMarkerShapeLocal "ICON";
_nom_du_marker_prisonnier setMarkerColorLocal "ColorRED";	
_nom_du_marker_prisonnier setMarkerSizeLocal [1.5,1.5];
_nom_du_marker_prisonnier setMarkerTypeLocal "hd_dot";
_nom_du_marker_prisonnier setMarkerTextLocal "Prisonnier Apercu !";

if (revive_mon_side == west) then
{
	player globalchat "A tous les gendarmes, un prisonnier a été aperçu par un commerçant il y à peu. Consulte ta carte pour l'attraper au cas ou.";
}else
{
	player globalchat "A tous les civils, un prisonnier à été aperçu par un commerçant il y à peu. Consulte ta carte pour aider les gendarmes à l'attraper au cas ou.";
};

sleep 30;
deletemarkerlocal _nom_du_marker_prisonnier;
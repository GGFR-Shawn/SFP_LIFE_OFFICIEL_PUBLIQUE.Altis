// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_position = _this select 0;
_le_joueur = _this select 1;

if (isnil "_la_position") exitwith {};
if (isnil "_le_joueur") exitwith {};
if (!hasInterface) exitwith {};
if (revive_mon_side != west) exitwith {};

titletext ["Attention, un habitant est entrain de détruire une antenne ... Consultez votre carte !","PLAIN DOWN"];

_nom_marqueur = format ["%1%2%3",_la_position,_le_joueur,round (random 100000)];
_marqueur_antenne_relais_destruction = createMarkerLocal [_nom_marqueur, _la_position];
_marqueur_antenne_relais_destruction setMarkerColorLocal "ColorRed";
_marqueur_antenne_relais_destruction setMarkerShapeLocal "ICON";
_marqueur_antenne_relais_destruction setMarkerTypeLocal "mil_warning";
_marqueur_antenne_relais_destruction setMarkerTextLocal " Antenne en sabotage !";
_marqueur_antenne_relais_destruction setMarkerSizeLocal [0.5, 0.5];

sleep 60;
deletemarkerlocal _nom_marqueur;

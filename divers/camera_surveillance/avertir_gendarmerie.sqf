// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_position = _this select 0;
_le_joueur = _this select 1;

if (isnil "_la_position") exitwith {};
if (isnil "_le_joueur") exitwith {};

if (player == _le_joueur) exitwith {player globalchat "Surpriseeeeeeeeeeeeeeeeeee ... :)";};

titletext ["Attention, une détérioration de caméra de vidéo surveillance à lieu ... Consultez votre carte !","PLAIN DOWN"];

_nom_marqueur = format ["%1%2%3",_la_position,_le_joueur,round (random 1000)];
_marqueur_camera_videosurveillance = createMarkerLocal [_nom_marqueur, _la_position];sleep 0.045;
_marqueur_camera_videosurveillance setMarkerColorLocal "ColorRed";sleep 0.045;
_marqueur_camera_videosurveillance setMarkerShapeLocal "ICON";sleep 0.045;
_marqueur_camera_videosurveillance setMarkerTypeLocal "mil_warning";sleep 0.045;
_marqueur_camera_videosurveillance setMarkerTextLocal " Camera en sabotage !";sleep 0.045;
_marqueur_camera_videosurveillance setMarkerSizeLocal [0.5, 0.5];sleep 0.045;

sleep 60;
deletemarkerlocal _nom_marqueur;


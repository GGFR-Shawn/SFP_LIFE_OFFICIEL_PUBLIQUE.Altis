// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position = _this select 0;
if (isnil "_position") exitwith {};
if (revive_mon_side != west) exitwith {};

cutText ["Un cambriolage est en cours ! Consultes ta carte pour le trouver.","PLAIN"];
hint "Un cambriolage est en cours, consultes ta carte pour le trouver !";

_nom_du_marqueur = format ["%1%2",name player, _this select 0];
_le_marqueur = createMarkerlocal [_nom_du_marqueur, _position];
_le_marqueur setMarkerShapelocal "ICON";
_le_marqueur setMarkerColorlocal "Coloryellow";
_le_marqueur setMarkerSizelocal [3,3];
_le_marqueur setMarkerTypelocal "hd_dot";
_le_marqueur setMarkerTextlocal "Cambriolage En Cours !";

_temps = time + 300;
waituntil {sleep 1; time > _temps or player distance _position < 6};

deletemarkerlocal _le_marqueur;
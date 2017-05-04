// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position_des_fissures_sur_la_route = _this select 0;
if (isnil "_position_des_fissures_sur_la_route") exitwith {};
if (!hasInterface) exitwith {};

["Warning",["Des routes fissurées ont étées signalées sur Altis !", ""]] call bis_fnc_showNotification;

for "_i" from 0 to 3 do
{
	player globalchat "Attention, des fissures ont étées détectées sur Altis ! La DIR va refaire la route !";
};

while {!isnil "route_hs_pour_la_DIR_en_cours"} do
{
	_distance = player distance _position_des_fissures_sur_la_route;
	sleep 0.1;
	if (_distance < 100 && player distance _position_des_fissures_sur_la_route < _distance) then
	{
		if (vehicle player != player) then
		{
			titletext ["Attention, vous approchez d'une route fissurée ! \n\n Ne dépassez pas 50 Kms/heures ...","PLAIN DOWN"];
		};
	};
	
	sleep 1;
};

["Warning",["La route fissurée à bien été refaite par la DIR !", ""]] call bis_fnc_showNotification;

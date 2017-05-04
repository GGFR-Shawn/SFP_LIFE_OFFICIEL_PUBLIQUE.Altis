// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_mon_chien = _this select 0;
if (isnull _mon_chien) exitwith {};

while {alive _mon_chien} do
{
	_distance_max_du_chien_a_moi = 1;
	waituntil {!alive _mon_chien or player distance _mon_chien < _distance_max_du_chien_a_moi};

	if (!alive _mon_chien ) exitwith {};

	while {player distance _mon_chien < _distance_max_du_chien_a_moi} do
	{
		_pos_du_chien = getPosATL _mon_chien;
		_pos_deux_du_chien = [_pos_du_chien select 0,(_pos_du_chien select 1) + (1),0.1];
		_mon_chien setPosATL _pos_deux_du_chien;
	};
};
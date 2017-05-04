// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isNil "serverID"};

_types_de_lampadaires = ["Land_LampStreet_small_F","Land_LampStreet_F","Land_LampSolar_F","Land_LampShabby_F","Land_LampAirport_F","Lamps_Base_F", "PowerLines_base_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_la_positionhabby_F","Land_NavigLight","Land_runway_edgelight","Land_PowerPoleWooden_L_F"];
_application = _this select 0;

for [{_i=0},{_i < (count _types_de_lampadaires)},{_i=_i+1000}] do
{
    _la_position = getPosATL Neochori nearObjects [_types_de_lampadaires select _i, 1000];
    _la_position_deux = getPosATL Neochori nearObjects ["Lamps_base_F", 1000];
    sleep 1;
    {_x setDamage _application;} forEach _la_position;
    {_x setHit ["light_1_hitpoint", _application];} forEach _la_position_deux;
};  

sleep (4 + (random 5));
if (_application == 0.95) then {titleText ["\n\n\n\n\n\n Neochori et ses alentours rencontre actuellement des problèmes d'éclairage, nos techniciens sont sur le coup ! \n Patientez le temps qu'ils trouvent la panne ...","PLAIN"];};
if (_application == 0) then {titleText ["\n\n\n\n\n\n Nos techniciens ont trouvés la panne et l'éclairage est maintenant réparé !","PLAIN"];};


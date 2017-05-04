// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_pos = _this select 0;
_x1 = _pos select 0;
_y1 = _pos select 1;
_deltat = 10;
_vx0 = 100;
_vy0 = 100;
_x0 = _x1 -_vx0 * _deltat;
_y0 = _y1 - _vy0 * _deltat;
_r = random 1500;
_theta = random 360;
_z = 700 + (random 500);
_pos1 = [_x0 + _r * (Cos _theta), _y0 + _r * (Sin _theta), _z];
_object = "Land_Bucket_F" createVehicle _pos1;
_object setpos _pos1;
_z0 = (200 + (random 750));
_vz= -(_z0/_deltat+random 10);

_la_meteorite = [[[_object],"divers\divers\meteorite_effet_client.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

_direction = [80,-80] call bis_fnc_selectrandom;
_object setvelocity [(_direction + (random _direction)), (_direction + (random _direction)), _vz];
waituntil {sleep 0.01; ((position _object) select 2) < 2};

_explosion = "HelicopterExploBig" createvehicle (position _object);

deletevehicle _object;
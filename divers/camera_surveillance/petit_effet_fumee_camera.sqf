// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_position = _this select 0;
if (isnil "_la_position") exitwith {};

_fumee_camera_surveillance = "#particlesource" createVehiclelocal _la_position;
_fumee_camera_surveillance setParticleClass "SmallDestructionSmoke";
_fumee_camera_surveillance setPosATL _la_position;
_fumee_camera_surveillance attachto [_la_position];

waituntil {sleep 4; !alive _fumee_camera_surveillance};

deletevehicle _fumee_camera_surveillance;

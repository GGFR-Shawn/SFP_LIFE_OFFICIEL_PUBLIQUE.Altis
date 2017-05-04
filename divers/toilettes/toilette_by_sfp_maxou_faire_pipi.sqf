// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (count (nearestObjects [getPosATL player, ["HOUSE"], 15]) < 1) exitwith {hint "Désolé, tu ne peux faire pipi que près des maisons !";};

private ["_creation_camera_sfp_maxou","_pisseur", "_array", "_delta", "_arcini", "_deg", "_spd", "_spdv", "_numdrops", "_size", "_color", "_dur", "_rot", "_mass", "_vol", "_pos", "_i", "_ang", "_vel"];
_pisseur   = player;
_delta    = [0,0,0.85];
_arcini   = 0;
_deg      = 1;
_spd      = 1;
_spdv     = 1;
_numdrops = 10;
_size = [0.01,0.01,0.01,0.01,0.01,0.01];
_color = [[1,1,0.2,0.2],[1,1,0.2,0.2],[1,1,0.2,0.2],[1,1,0.2,0.2],[1,1,0.2,0.2],[1,1,0.2,0.2],[1,1,0.2,0.2],[1,1,0.2,0.2]];
_dur      = 1;
_rot  = 1;
_mass = 2.0;
_vol  = 1;

player say "Jefaispipibysfpmaxou";
player switchMove "Acts_AidlPercMstpSlowWrflDnon_pissing";

[[[player,"Acts_AidlPercMstpSlowWrflDnon_pissing"],"divers\toilettes\synchro_animation_toilette.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

_creation_camera_sfp_maxou = "camera" camCreate (player modelToWorld [0,2,4]);
_creation_camera_sfp_maxou camSetTarget [position player select 0, position player select 1, (position player select 2) + 0.4];
_creation_camera_sfp_maxou camSetRelPos [0.5, 0.2,1.5];
_creation_camera_sfp_maxou cameraEffect ["internal", "back"];
_creation_camera_sfp_maxou camCommit 0;

while {player getvariable "toilette_by_sfp_maxou" < 100} do
{
	hintsilent "Pipi en cours ...";
	
	player setvariable ["toilette_by_sfp_maxou",(player getvariable "toilette_by_sfp_maxou") + 0.25,false];
	if (player getvariable "toilette_by_sfp_maxou" > 100) then {player setvariable ["toilette_by_sfp_maxou",100,false];};
	if (player getvariable "toilette_by_sfp_maxou" > 99) then {waitUntil {animationState player != "Acts_AidlPercMstpSlowWrflDnon_pissing"}; hint "Pipi terminée :)";};
	_pos = _delta;
	for [{_i=0},{_i<_numdrops/2},{_i=_i+1}] do
	{
		_ang = (_arcini - _deg/2 + random(_deg));
		_vel = [sin(_ang)*_spd, cos(_ang)*_spd, _spdv];
		drop[ ["\A3\data_f\cl_water", 4, 1, 1],"","Billboard",100,_dur,_pos,_vel,_rot,_mass,_vol,0,_size,_color,[1,0,1,0,1],1,0.9,"","",_pisseur];
		_ang = (_arcini - _deg/2 + random(_deg));
		_vel = [sin(_ang)*_spd, cos(_ang)*_spd, _spdv];
		drop[["\A3\data_f\cl_water", 4, 0, 1],"","Billboard",100,_dur,_pos,_vel,_rot,_mass,_vol,0,_size,_color,[1,0,1,0,1],1,0.9,"","",_pisseur];
	};
	sleep 0.02;	
};

_creation_camera_sfp_maxou cameraEffect ["terminate","back"];
camDestroy _creation_camera_sfp_maxou;

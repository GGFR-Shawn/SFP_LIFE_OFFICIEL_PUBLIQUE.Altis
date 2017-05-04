// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


// ==========================================================================================================================================================================================
																	// INITIALISATION DE L'OBJET
// ==========================================================================================================================================================================================
_objet_position_by_sfp_maxou = _this select 0;

// ==========================================================================================================================================================================================
																	// CREATION DU MAT PRINCIPAL
// ==========================================================================================================================================================================================
mat_principal = createVehicle ["Pole_F", _objet_position_by_sfp_maxou, [], 0, "CAN_COLLIDE"];
mat_principal enablesimulation false;
mat_principal allowdamage false;
[mat_principal, 0, 0] call BIS_fnc_setPitchBank;
sleep 1;

// ==========================================================================================================================================================================================
																	// CREATION DU/DES MAT
// ==========================================================================================================================================================================================
_hauteur_camera = round (2 + (random 3));
_position_supplementaire_by_sfp_maxou = 0;
for "_i" from 0 to (_hauteur_camera - 1) do
{ 
	_position_supplementaire_by_sfp_maxou = round (_position_supplementaire_by_sfp_maxou + 2);
	mat_supplementaire = createVehicle ["Pole_F", _objet_position_by_sfp_maxou, [], 0, "CAN_COLLIDE"];
	mat_supplementaire attachto [mat_principal,[0,0,_position_supplementaire_by_sfp_maxou],""];
	mat_supplementaire enablesimulation false;
	mat_supplementaire allowdamage false;
	[mat_supplementaire, 0, 0] call BIS_fnc_setPitchBank;
	sleep 1;
};

// ==========================================================================================================================================================================================
																	// CREATION DE LA CAMERA
// ==========================================================================================================================================================================================
_objet_position_by_sfp_maxou = [(getPosATL mat_supplementaire select 0) - (0),(getPosATL mat_supplementaire select 1) - (0),(getPosATL mat_supplementaire select 2) + (1.5)];

_camera_surveillance_by_sfp_maxou = createVehicle ["Land_HandyCam_F", _objet_position_by_sfp_maxou, [], 0, "CAN_COLLIDE"];
_camera_surveillance_by_sfp_maxou attachto [mat_supplementaire,[0,0,1.1],""];
detach _camera_surveillance_by_sfp_maxou;
_camera_surveillance_by_sfp_maxou enablesimulation false;
_camera_surveillance_by_sfp_maxou allowdamage false;
_camera_surveillance_by_sfp_maxou setvariable ["camera_de_videosurveillance",1,true];

debut_contruction_camera = 0;
// ==========================================================================================================================================================================================
																	// ANIMATION DE LA CAMERA
// ==========================================================================================================================================================================================
_tourner = (100 + (random 260));
while {alive _camera_surveillance_by_sfp_maxou && isnil {_camera_surveillance_by_sfp_maxou getvariable "camera_video_surveillance_detruite"}} do
{
	// for "_i" from 0 to (_tourner - 1) do
	// {
		// sleep 1;
		// _camera_surveillance_by_sfp_maxou setdir (getdir _camera_surveillance_by_sfp_maxou + 2);
		// [_camera_surveillance_by_sfp_maxou, 33, 0.000023] call BIS_fnc_setPitchBank;
	// };
	
	// sleep (2 + (random 5));
	
	// for "_i" from 0 to (_tourner - 1) do
	// {
		// sleep 1;
		// _camera_surveillance_by_sfp_maxou setdir (getdir _camera_surveillance_by_sfp_maxou - 2);
		// [_camera_surveillance_by_sfp_maxou, 33, 0.000023] call BIS_fnc_setPitchBank;
	// };
	
	// sleep (2 + (random 5));

	sleep 5;
};

// ==========================================================================================================================================================================================
																	// SUPPRESSION DU MAT ET CAMERA SI BESOIN QUAND DETRUIT
// ==========================================================================================================================================================================================
// Laisser la fumee pendant ce temps et ensuite supprimer
sleep 1800;
{
	deletevehicle _x;
} foreach (nearestObjects [_objet_position_by_sfp_maxou, ["Land_HandyCam_F","Pole_F"], 15]);
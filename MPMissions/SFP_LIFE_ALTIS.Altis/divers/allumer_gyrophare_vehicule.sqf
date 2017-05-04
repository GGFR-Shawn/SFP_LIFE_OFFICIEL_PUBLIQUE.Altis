// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_vehicle","_fonction","_couleur","_puissance_gyroled_sfp_maxou","_lumiere_cote_maxou"];
_vehicle = _this select 0; 
_fonction = _this select 1;
 if (isnil "_vehicle" or isnil "_fonction") exitwith {hint "Erreur couleur gyrophare ...";};
if (!hasInterface) exitwith {};
 
if (_fonction == "bleu") then 
{
	_couleur = [1.5, 1.5, 29]; /* Bleu */
	_puissance_gyroled_sfp_maxou = 1;

	if (dayTime > 7) then {_puissance_gyroled_sfp_maxou = 2;};
	if (dayTime > 8) then {_puissance_gyroled_sfp_maxou = 5;};
	if (dayTime > 9) then {_puissance_gyroled_sfp_maxou = 10;};
	if (dayTime > 13) then {_puissance_gyroled_sfp_maxou = 13;};
	if (dayTime > 16) then {_puissance_gyroled_sfp_maxou = 6;};
	if (dayTime > 17) then {_puissance_gyroled_sfp_maxou = 4;};
	if (dayTime > 18) then {_puissance_gyroled_sfp_maxou = 1;};
};

if (_fonction == "orange") then 
{
	_couleur = [209,152,0]; /* Orange */
	_puissance_gyroled_sfp_maxou = 0.1;
		
	if (dayTime > 7) then {_puissance_gyroled_sfp_maxou = 0.25;};
	if (dayTime > 8) then {_puissance_gyroled_sfp_maxou = 1;};
	if (dayTime > 9) then {_puissance_gyroled_sfp_maxou = 1.5;};
	if (dayTime > 10) then {_puissance_gyroled_sfp_maxou = 2;};
	if (dayTime > 13) then {_puissance_gyroled_sfp_maxou = 3;};
	if (dayTime > 15) then {_puissance_gyroled_sfp_maxou = 2;};
	if (dayTime > 16) then {_puissance_gyroled_sfp_maxou = 1.5;};
	if (dayTime > 17) then {_puissance_gyroled_sfp_maxou = 0.54;};
	if (dayTime > 18) then {_puissance_gyroled_sfp_maxou = 0.24;};
	if (dayTime > 19) then {_puissance_gyroled_sfp_maxou = 0.11;};
};

_lumiere_cote_maxou = "#lightpoint" createVehicleLocal getPosATL _vehicle;  
_lumiere_cote_maxou setLightColor _couleur;
_lumiere_cote_maxou setLightBrightness _puissance_gyroled_sfp_maxou; 
_lumiere_cote_maxou setLightAmbient _couleur;
_lumiere_cote_maxou lightAttachObject [_vehicle, [-3, 0.8, 6]]; 
_lumiere_cote_maxou setLightAttenuation [4, 12, 0, 1];
_lumiere_cote_maxou setLightDayLight true;

_distance_sfp = 6;
_rapidite_maxou = 0.015;
while {(alive _vehicle) && !isnil {_vehicle getvariable "gyrophare_vehicule_allume"}} do 
{	
	for [{_i = -_distance_sfp}, {_i < _distance_sfp}, {_i = _i + 1}] do 
	{
		_lumiere_cote_maxou lightAttachObject [_vehicle, [_i, 0.8, _i]]; 
		
		if ((alive _vehicle) && !isnil {_vehicle getvariable "gyrophare_vehicule_allume"}) then {sleep _rapidite_maxou;};
	};
	
	for [{_i = _distance_sfp}, {_i != -_distance_sfp}, {_i = _i - 1}] do 
	{
		_lumiere_cote_maxou lightAttachObject [_vehicle, [_i, 0.8, _i]]; 
		
		if ((alive _vehicle) && !isnil {_vehicle getvariable "gyrophare_vehicule_allume"}) then {sleep _rapidite_maxou;};
	};
};

deletevehicle _lumiere_cote_maxou;

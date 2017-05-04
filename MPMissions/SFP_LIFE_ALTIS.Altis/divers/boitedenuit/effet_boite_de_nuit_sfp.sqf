// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_discotheque","_boitedroite","_boitegauche","_lightgauche","_lightdroite"];

_discotheque = _this select 0;
_duree_repetitif = _this select 1;
_temps_chanson = _this select 2;
if (isnil "_discotheque" or isnil "_duree_repetitif" or isnil "_temps_chanson") exitwith {systemchat "Erreur discothèque ...";};
boitedenuit = 1;

[_discotheque,_duree_repetitif,_temps_chanson] spawn
{
	_discotheque = _this select 0;
	_duree_repetitif = _this select 1;
	_temps_chanson = _this select 2;
	
	for "_i" from 0 to _duree_repetitif do
	{
		_discotheque say "boitedenuitun";
		sleep _temps_chanson;
	};
	boitedenuit = 0;
};


_boitedroite = [9, 14.5, 0.5];
_boitegauche = [0.5, 8.5, 9];
	
_lightgauche = "#lightpoint" createVehicleLocal getPosATL _discotheque;  
_lightgauche setLightColor _boitedroite;
_lightgauche setLightBrightness 0.3; 
_lightgauche setLightAmbient _boitedroite;
_lightgauche lightAttachObject [_discotheque, [-3, 0.8, 0]]; 
_lightgauche setLightAttenuation [4, 1, 0, 0.6];
_lightgauche setLightDayLight true;

__lightdroite = "#lightpoint" createVehicleLocal getPosATL _discotheque;  
__lightdroite setLightColor _boitegauche;
__lightdroite setLightBrightness 0.3; 
__lightdroite setLightAmbient _boitegauche;
__lightdroite lightAttachObject [_discotheque, [3, 0.8, 0]]; 
__lightdroite setLightAttenuation [4, 1, 0, 0.6];
__lightdroite setLightDayLight true;

_cote_couleur = true; 
while {boitedenuit >= 1} do 
{ 
	if (_cote_couleur) then 
	{ 
		_cote_couleur = false; 
		_lightgauche setLightColor _boitedroite;
		_lightgauche setLightAmbient _boitedroite;
		__lightdroite setLightColor _boitegauche;
		__lightdroite setLightAmbient _boitegauche;
	}else 
	{ 
		_cote_couleur = true; 
		_lightgauche setLightColor _boitegauche;
		_lightgauche setLightAmbient _boitegauche;
		__lightdroite setLightColor _boitedroite;
		__lightdroite setLightAmbient _boitedroite;
	}; 
	sleep (random 1); 
};
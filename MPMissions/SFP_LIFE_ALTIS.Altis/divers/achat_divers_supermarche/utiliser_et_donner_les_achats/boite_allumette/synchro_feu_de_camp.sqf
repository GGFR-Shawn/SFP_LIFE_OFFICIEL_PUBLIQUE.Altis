// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_temps_avant_suppression","_le_feu_de_camp_sfp","_fumee_sfp","_feu_sfp","_lumiere_sfp","_pos","_temps_actuel","_config_sfp"];

_suppression_incendie_vehicule_valeur_sfp =
{
	waituntil {sleep 0.5; !alive (_this select 0)};
	
	deletevehicle (_this select 0);
	deletevehicle (_this select 1);
};

_le_feu_de_camp_sfp = _this select 0;;
_temps_avant_suppression = _this select 1;
_pos = getPosATL _le_feu_de_camp_sfp;
_temps_actuel = 0;
_temps_petite_flamme = 0;
_temps_moyenne_flamme = 30;
_config_sfp = ["","",0];
_config_actuel_sfp = _config_sfp;

_config_couleur_sfp = [0.99,0.05,1];
_config_ambiance_sfp = [1,0.3,0];
_config_brightness_sfp	= 1.0;
_config_attenuation_sfp = [0,0,0,1.6];

while {alive _le_feu_de_camp_sfp && _temps_avant_suppression >= 0} do
{
	if (player distance _le_feu_de_camp_sfp <= 5) then {titleText ["Attention, vous approchez d'un feu de camp et risquez de vous bruler !", "PLAIN DOWN"];};
	
	if (_temps_actuel >= _temps_petite_flamme) then {_config_sfp = ["SmallDestructionSmoke","SmallDestructionFire",300];}; // Feu, fumée, intensensité lumiere
	if (_temps_actuel > _temps_moyenne_flamme) then {_config_sfp = ["SmallDestructionSmoke","MediumDestructionFire",1600];}; // Feu, fumée, intensensité lumiere
	
	if (_config_sfp select 2 != _config_actuel_sfp select 2) then
	{	
		_config_actuel_sfp = _config_sfp;
		
		_fumee_sfp = "#particlesource" createVehicleLocal _pos;
		_fumee_sfp setParticleClass (_config_sfp select 0);
		_fumee_sfp setPosATL _pos;
		_fumee_sfp attachto [_le_feu_de_camp_sfp];
		[_le_feu_de_camp_sfp, _fumee_sfp] spawn _suppression_incendie_vehicule_valeur_sfp;
		
		_feu_sfp = "#particlesource" createVehicleLocal _pos;
		_feu_sfp setParticleClass (_config_sfp select 1);
		_feu_sfp setPosATL _pos;
		_feu_sfp attachto [_le_feu_de_camp_sfp];
		[_le_feu_de_camp_sfp, _feu_sfp] spawn _suppression_incendie_vehicule_valeur_sfp;
		
		_lumiere_sfp = "#lightpoint" createVehicleLocal _pos;
		_lumiere_sfp setPosATL _pos;
		_lumiere_sfp setLightBrightness _config_brightness_sfp;
		_lumiere_sfp setLightColor _config_couleur_sfp;
		_lumiere_sfp setLightAmbient _config_ambiance_sfp;
		_lumiere_sfp setLightIntensity (_config_sfp select 2);
		_lumiere_sfp setLightAttenuation _config_attenuation_sfp;
		_lumiere_sfp attachto [_le_feu_de_camp_sfp];
		[_le_feu_de_camp_sfp, _lumiere_sfp] spawn _suppression_incendie_vehicule_valeur_sfp;
	};

	sleep 1;
	
	_temps_actuel = round (_temps_actuel + 1);
	_temps_avant_suppression = round (_temps_avant_suppression - 1);
};

if (alive _le_feu_de_camp_sfp) then {deletevehicle _le_feu_de_camp_sfp;};

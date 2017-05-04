// =======================================================================================================================================================================================
															// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
															  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_fumee_sfp";

if !(player in list sarl_pompier) then
{
	["Incendie",["Incendie poubelle, soyez vigilant !", ""]] call bis_fnc_showNotification;
};

if (isnil "je_desactive_les_incendies") then {je_desactive_les_incendies = 0;};

if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then
{
	[] spawn
	{
		for "_i" from 0 to 4 do
		{
			player say "beeper_pompier_sfp";
			sleep 1;
		};
	};
};
tombe_sirene_pompier say "pompier_depart_normal";

// -------------------------------------------------------------- Initialisation des effets poubelle --------------------------------------------------------------------

_config_couleur_sfp = [0.99,0.05,1];
_config_ambiance_sfp = [1,0.3,0];
_config_feu_sfp = "BigDestructionFire";
_config_fumee_sfp = "BigDestructionSmoke";
_config_brightness_sfp	= 1.0;
_config_intensite_sfp = 3200;
_config_attenuation_sfp = [0,0,0,1.6];

_pos = [getPosATL creation_de_la_poubelle select 0,getPosATL creation_de_la_poubelle select 1,(getPosATL creation_de_la_poubelle select 2)+1];

_flamme_sfp = "#particlesource" createVehicleLocal _pos;
_flamme_sfp setParticleClass _config_feu_sfp;
_flamme_sfp setPosATL _pos;

if (je_desactive_les_incendies < 1) then 
{
	_fumee_sfp = "#particlesource" createVehicleLocal _pos;
	_fumee_sfp setParticleClass _config_fumee_sfp;
	_fumee_sfp setPosATL _pos;
};

_lumiere_sfp = "#lightpoint" createVehicleLocal _pos;
_lumiere_sfp setPosATL _pos;_lumiere_sfp setLightBrightness _config_brightness_sfp;
_lumiere_sfp setLightColor _config_couleur_sfp;_lumiere_sfp setLightAmbient _config_ambiance_sfp;
_lumiere_sfp setLightIntensity _config_intensite_sfp;
_lumiere_sfp setLightAttenuation _config_attenuation_sfp;

// -------------------------------------------------------------- Attente fin de mission --------------------------------------------------------------------
waituntil {sleep 1; isnil "creation_de_la_poubelle";};

if (!isnil "_fumee_sfp") then {deletevehicle _fumee_sfp;};
deletevehicle _flamme_sfp;
deletevehicle _lumiere_sfp;

player globalChat format ["Salut %1, la SARL POMPIER à réussi à maitriser l'incendie de poubelle déclaré il y à peu ! Félicitation à eux pour leur bravoure.",name player];

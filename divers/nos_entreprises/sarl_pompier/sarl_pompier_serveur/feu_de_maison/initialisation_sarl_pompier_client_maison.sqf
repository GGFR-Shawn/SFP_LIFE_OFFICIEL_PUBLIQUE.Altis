// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_fumee_sfp_un","_fumee_sfp_deux","_fumee_sfp_trois","_fumee_sfp_quatre","_fumee_sfp_cinq"];

if (isnil "je_desactive_les_incendies") then {je_desactive_les_incendies = 0;};

if !(player in list sarl_pompier) then
{
	["Incendie",["Incendie maison, soyez vigilant !", ""]] call bis_fnc_showNotification;
};

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

// -------------------------------------------------------------- Initialisation des effets déchets --------------------------------------------------------------------
_config_couleur_sfp = [0.99,0.05,1];
_config_ambiance_sfp = [1,0.3,0];
_config_feu_sfp = "BigDestructionFire";
_config_fumee_sfp = "BigDestructionSmoke";
_config_brightness_sfp	= 1.0;
_config_intensite_sfp = 3200;
_config_attenuation_sfp = [0,0,0,1.6];


// -------------------------------------------------------------- Création des flammes et fumee --------------------------------------------------------------------

// ---------- Hauteur niveau 1 ---------------------------
_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,(getPosATL creation_du_feu_maison_sfp select 2) + 1];

_flamme_sfp_un = "#particlesource" createVehicleLocal _pos; _flamme_sfp_un setParticleClass _config_feu_sfp; _flamme_sfp_un setPosATL _pos;
_lumiere_sfp_un = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp_un setPosATL _pos;_lumiere_sfp_un setLightBrightness _config_brightness_sfp;_lumiere_sfp_un setLightColor _config_couleur_sfp;_lumiere_sfp_un setLightAmbient _config_ambiance_sfp;_lumiere_sfp_un setLightIntensity _config_intensite_sfp;_lumiere_sfp_un setLightAttenuation _config_attenuation_sfp;
_fumee_sfp_un = "";

if (je_desactive_les_incendies < 1) then 
{
	_fumee_sfp_un = "#particlesource" createVehicleLocal _pos; _fumee_sfp_un setParticleClass _config_fumee_sfp; _fumee_sfp_un setPosATL _pos;
};

[_flamme_sfp_un, _fumee_sfp_un, _lumiere_sfp_un] spawn
{
	_flamme_sfp_un = _this select 0; _fumee_sfp_un = _this select 1; _lumiere_sfp_un = _this select 2;
	waituntil {sleep 1; isnil "creation_du_feu_maison_sfp"};
	deletevehicle _flamme_sfp_un;
	deletevehicle _lumiere_sfp_un;
	deletevehicle _fumee_sfp_un;
};

// ---------- Hauteur niveau 2 ---------------------------
if (choix_hauteur_de_flamme_niveau_deux == 1) then 
{
	_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,(getPosATL creation_du_feu_maison_sfp select 2) + 3];

	_flamme_sfp_deux = "#particlesource" createVehicleLocal _pos; _flamme_sfp_deux setParticleClass _config_feu_sfp; _flamme_sfp_deux setPosATL _pos;
	_lumiere_sfp_deux = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp_deux setPosATL _pos;_lumiere_sfp_deux setLightBrightness _config_brightness_sfp;_lumiere_sfp_deux setLightColor _config_couleur_sfp;_lumiere_sfp_deux setLightAmbient _config_ambiance_sfp;_lumiere_sfp_deux setLightIntensity _config_intensite_sfp;_lumiere_sfp_deux setLightAttenuation _config_attenuation_sfp;
	_fumee_sfp_deux = "";

	if (je_desactive_les_incendies < 1) then 
	{
		_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,getPosATL creation_du_feu_maison_sfp select 2];
		_fumee_sfp_deux = "#particlesource" createVehicleLocal _pos; _fumee_sfp_deux setParticleClass _config_fumee_sfp; _fumee_sfp_deux setPosATL _pos;
	};

	[_flamme_sfp_deux, _fumee_sfp_deux, _lumiere_sfp_deux] spawn
	{
		_flamme_sfp_deux = _this select 0; _fumee_sfp_deux = _this select 1; _lumiere_sfp_deux = _this select 2;
		waituntil {sleep 1; isnil "creation_du_feu_maison_sfp"};
		deletevehicle _flamme_sfp_deux;
		deletevehicle _lumiere_sfp_deux;
		deletevehicle _fumee_sfp_deux;
	};
};

// ---------- Hauteur niveau 3 ---------------------------
if (choix_hauteur_de_flamme_niveau_deux == 1) then
{
	if (choix_hauteur_de_flamme_niveau_trois == 3) then 
	{
		_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,(getPosATL creation_du_feu_maison_sfp select 2) + 5];

		_flamme_sfp_trois = "#particlesource" createVehicleLocal _pos; _flamme_sfp_trois setParticleClass _config_feu_sfp; _flamme_sfp_trois setPosATL _pos;
		_lumiere_sfp_trois = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp_trois setPosATL _pos;_lumiere_sfp_trois setLightBrightness _config_brightness_sfp;_lumiere_sfp_trois setLightColor _config_couleur_sfp;_lumiere_sfp_trois setLightAmbient _config_ambiance_sfp;_lumiere_sfp_trois setLightIntensity _config_intensite_sfp;_lumiere_sfp_trois setLightAttenuation _config_attenuation_sfp;
		_fumee_sfp_trois = "";

		if (je_desactive_les_incendies < 1) then 
		{
			_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,getPosATL creation_du_feu_maison_sfp select 2];
			_fumee_sfp_trois = "#particlesource" createVehicleLocal _pos; _fumee_sfp_trois setParticleClass _config_fumee_sfp; _fumee_sfp_trois setPosATL _pos;
		};

		[_flamme_sfp_trois, _fumee_sfp_trois, _lumiere_sfp_trois] spawn
		{
			_flamme_sfp_trois = _this select 0; _fumee_sfp_trois = _this select 1; _lumiere_sfp_trois = _this select 2;
			waituntil {sleep 1; isnil "creation_du_feu_maison_sfp"};
			deletevehicle _flamme_sfp_trois;
			deletevehicle _lumiere_sfp_trois;
			deletevehicle _fumee_sfp_trois;
		};
	};
};
// ---------- Hauteur niveau 4 ---------------------------
if (choix_hauteur_de_flamme_niveau_trois == 3) then
{
	if (choix_hauteur_de_flamme_niveau_quatre == 5) then 
	{
		_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,(getPosATL creation_du_feu_maison_sfp select 2) + 7];

		_flamme_sfp_quatre = "#particlesource" createVehicleLocal _pos; _flamme_sfp_quatre setParticleClass _config_feu_sfp; _flamme_sfp_quatre setPosATL _pos;
		_lumiere_sfp_quatre = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp_quatre setPosATL _pos;_lumiere_sfp_quatre setLightBrightness _config_brightness_sfp;_lumiere_sfp_quatre setLightColor _config_couleur_sfp;_lumiere_sfp_quatre setLightAmbient _config_ambiance_sfp;_lumiere_sfp_quatre setLightIntensity _config_intensite_sfp;_lumiere_sfp_quatre setLightAttenuation _config_attenuation_sfp;
		_fumee_sfp_quatre = "";

		if (je_desactive_les_incendies < 1) then 
		{
			_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,getPosATL creation_du_feu_maison_sfp select 2];
			_fumee_sfp_quatre = "#particlesource" createVehicleLocal _pos; _fumee_sfp_quatre setParticleClass _config_fumee_sfp; _fumee_sfp_quatre setPosATL _pos;
		};

		[_flamme_sfp_quatre, _fumee_sfp_quatre, _lumiere_sfp_quatre] spawn
		{
			_flamme_sfp_quatre = _this select 0; _fumee_sfp_quatre = _this select 1; _lumiere_sfp_quatre = _this select 2;
			waituntil {sleep 1; isnil "creation_du_feu_maison_sfp"};
			deletevehicle _flamme_sfp_quatre;
			deletevehicle _lumiere_sfp_quatre;
			deletevehicle _fumee_sfp_quatre;
		};
	};
};
// ---------- Hauteur niveau 5 ---------------------------
if (choix_hauteur_de_flamme_niveau_quatre == 5) then
{
	if (choix_hauteur_de_flamme_niveau_cinq == 7) then 
	{
		_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,(getPosATL creation_du_feu_maison_sfp select 2) + 9];

		_flamme_sfp_cinq = "#particlesource" createVehicleLocal _pos; _flamme_sfp_cinq setParticleClass _config_feu_sfp; _flamme_sfp_cinq setPosATL _pos;
		_lumiere_sfp_cinq = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp_cinq setPosATL _pos;_lumiere_sfp_cinq setLightBrightness _config_brightness_sfp;_lumiere_sfp_cinq setLightColor _config_couleur_sfp;_lumiere_sfp_cinq setLightAmbient _config_ambiance_sfp;_lumiere_sfp_cinq setLightIntensity _config_intensite_sfp;_lumiere_sfp_cinq setLightAttenuation _config_attenuation_sfp;
		_fumee_sfp_cinq = "";

		if (je_desactive_les_incendies < 1) then 
		{
			_pos = [getPosATL creation_du_feu_maison_sfp select 0,getPosATL creation_du_feu_maison_sfp select 1,(getPosATL creation_du_feu_maison_sfp select 2) + 10];
			_fumee_sfp_cinq = "#particlesource" createVehicleLocal _pos; _fumee_sfp_cinq setParticleClass _config_fumee_sfp; _fumee_sfp_cinq setPosATL _pos;
		};

		[_flamme_sfp_cinq, _fumee_sfp_cinq, _lumiere_sfp_cinq] spawn
		{
			_flamme_sfp_cinq = _this select 0; _fumee_sfp_cinq = _this select 1; _lumiere_sfp_cinq = _this select 2;
			waituntil {sleep 1; isnil "creation_du_feu_maison_sfp"};
			deletevehicle _flamme_sfp_cinq;
			deletevehicle _lumiere_sfp_cinq;
			deletevehicle _fumee_sfp_cinq;
		};
	};
};

// -------------------------------------------------------------- Création des effets feu de maison --------------------------------------------------------------------

waituntil {sleep 2; isnil "creation_du_feu_maison_sfp";};

player globalChat format ["Salut %1, la SARL POMPIER à réussi à maitriser l'incendie d'habitation déclaré il y à peu ! Félicitation à eux pour leur sueur.",name player];

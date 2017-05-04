// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "je_desactive_les_incendies") then {je_desactive_les_incendies = 0;};

if !(player in list sarl_pompier) then
{
	["Incendie",["Incendie dechets, soyez vigilant !", ""]] call bis_fnc_showNotification;
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

// -------------------------------------------------------------- Création des effets déchets --------------------------------------------------------------------
if (!isnil "quel_objet_prendre_choisit_dechets") then 
{
	_pos = [getPosATL creation_des_dechets select 0, getPosATL creation_des_dechets select 1, (getPosATL creation_des_dechets select 2) + (1)]; 
	
	_flamme_sfp = "#particlesource" createVehicleLocal _pos; _flamme_sfp setParticleClass _config_feu_sfp; _flamme_sfp setPosATL _pos;
	_lumiere_sfp = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp setPosATL _pos;_lumiere_sfp setLightBrightness _config_brightness_sfp;_lumiere_sfp setLightColor _config_couleur_sfp;_lumiere_sfp setLightAmbient _config_ambiance_sfp;_lumiere_sfp setLightIntensity _config_intensite_sfp;_lumiere_sfp setLightAttenuation _config_attenuation_sfp;
	_fumee_sfp = "";
	
	if (je_desactive_les_incendies < 1) then 
	{
		_fumee_sfp = "#particlesource" createVehicleLocal _pos; _fumee_sfp setParticleClass _config_fumee_sfp; _fumee_sfp setPosATL _pos;
	};

	[_flamme_sfp, _fumee_sfp, _lumiere_sfp] spawn
	{
		_flamme_sfp = _this select 0; _fumee_sfp = _this select 1; _lumiere_sfp = _this select 2;
		waituntil {sleep 0.5; !alive creation_des_dechets};
		deletevehicle _flamme_sfp;
		deletevehicle _fumee_sfp;
		deletevehicle _lumiere_sfp;
	};
};

if (!isnil "quel_objet_prendre_choisit_deux_dechets") then 
{
	_pos = [getPosATL creation_des_dechets_deux select 0,getPosATL creation_des_dechets_deux select 1,(getPosATL creation_des_dechets_deux select 2)+1];
	
	if (decider_si_en_flamme_ou_pas_deux_dechets == 1) then 
	{
		_flamme_sfp_deux = "#particlesource" createVehicleLocal _pos; _flamme_sfp_deux setParticleClass _config_feu_sfp; _flamme_sfp_deux setPosATL _pos;
		_lumiere_sfp_deux = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp_deux setPosATL _pos;_lumiere_sfp_deux setLightBrightness _config_brightness_sfp;_lumiere_sfp_deux setLightColor _config_couleur_sfp;_lumiere_sfp_deux setLightAmbient _config_ambiance_sfp;_lumiere_sfp_deux setLightIntensity _config_intensite_sfp;_lumiere_sfp_deux setLightAttenuation _config_attenuation_sfp;
		_fumee_sfp_deux = "";
		
		if (je_desactive_les_incendies < 1) then 
		{
			_fumee_sfp_deux = "#particlesource" createVehicleLocal _pos; _fumee_sfp_deux setParticleClass _config_fumee_sfp; _fumee_sfp_deux setPosATL _pos;
		};

		[_flamme_sfp_deux, _fumee_sfp_deux, _lumiere_sfp_deux] spawn
		{
			_flamme_sfp_deux = _this select 0; _fumee_sfp_deux = _this select 1; _lumiere_sfp_deux = _this select 2;
			waituntil {sleep 1; !alive creation_des_dechets_deux};
			deletevehicle _flamme_sfp_deux;
			deletevehicle _fumee_sfp_deux;
			deletevehicle _lumiere_sfp_deux;
		};
	};
};

if (!isnil "quel_objet_prendre_choisit_trois_dechets") then 
{
	_pos = [getPosATL creation_des_dechets_trois select 0,getPosATL creation_des_dechets_trois select 1,(getPosATL creation_des_dechets_trois select 2)+1];
	
	if (decider_si_en_flamme_ou_pas_trois_dechets == 1) then 
	{
		_flamme_sfp_trois = "#particlesource" createVehicleLocal _pos; _flamme_sfp_trois setParticleClass _config_feu_sfp; _flamme_sfp_trois setPosATL _pos;
		_lumiere_sfp_trois = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp_trois setPosATL _pos;_lumiere_sfp_trois setLightBrightness _config_brightness_sfp;_lumiere_sfp_trois setLightColor _config_couleur_sfp;_lumiere_sfp_trois setLightAmbient _config_ambiance_sfp;_lumiere_sfp_trois setLightIntensity _config_intensite_sfp;_lumiere_sfp_trois setLightAttenuation _config_attenuation_sfp;
		_fumee_sfp_trois = "";
		
		if (je_desactive_les_incendies < 1) then 
		{
			_fumee_sfp_trois = "#particlesource" createVehicleLocal _pos; _fumee_sfp_trois setParticleClass _config_fumee_sfp; _fumee_sfp_trois setPosATL _pos;
		};

		[_flamme_sfp_trois, _fumee_sfp_trois, _lumiere_sfp_trois] spawn
		{
			_flamme_sfp_trois = _this select 0; _fumee_sfp_trois = _this select 1; _lumiere_sfp_trois = _this select 2;
			waituntil {sleep 1; !alive creation_des_dechets_trois};
			deletevehicle _flamme_sfp_trois;
			deletevehicle _fumee_sfp_trois;
			deletevehicle _lumiere_sfp_trois;
		};
	};
};

if (!isnil "quel_objet_prendre_choisit_quatre_dechets") then 
{
	_pos = [getPosATL creation_des_dechets_quatre select 0,getPosATL creation_des_dechets_quatre select 1,(getPosATL creation_des_dechets_quatre select 2)+1]; 
	
	if (decider_si_en_flamme_ou_pas_quatre_dechets == 1) then 
	{
		_flamme_sfp_quatre = "#particlesource" createVehicleLocal _pos; _flamme_sfp_quatre setParticleClass _config_feu_sfp; _flamme_sfp_quatre setPosATL _pos;
		_lumiere_sfp_quatre = "#lightpoint" createVehicleLocal _pos;_lumiere_sfp_quatre setPosATL _pos;_lumiere_sfp_quatre setLightBrightness _config_brightness_sfp;_lumiere_sfp_quatre setLightColor _config_couleur_sfp;_lumiere_sfp_quatre setLightAmbient _config_ambiance_sfp;_lumiere_sfp_quatre setLightIntensity _config_intensite_sfp;_lumiere_sfp_quatre setLightAttenuation _config_attenuation_sfp;
		_fumee_sfp_quatre = "";
		
		if (je_desactive_les_incendies < 1) then 
		{
			_fumee_sfp_quatre = "#particlesource" createVehicleLocal _pos; _fumee_sfp_quatre setParticleClass _config_fumee_sfp; _fumee_sfp_quatre setPosATL _pos;
		};

		[_flamme_sfp_quatre, _fumee_sfp_quatre, _lumiere_sfp_quatre] spawn
		{
			_flamme_sfp_quatre = _this select 0; _fumee_sfp_quatre = _this select 1; _lumiere_sfp_quatre = _this select 2;
			waituntil {sleep 1; !alive creation_des_dechets_quatre};
			deletevehicle _flamme_sfp_quatre;
			deletevehicle _fumee_sfp_quatre;
			deletevehicle _lumiere_sfp_quatre;
		};
	};
};

waituntil {sleep 3; isnil "creation_des_dechets" && isnil "creation_des_dechets_deux" && isnil "creation_des_dechets_trois" && isnil "creation_des_dechets_quatre"};

player globalChat format ["Salut %1, la SARL POMPIER à réussi à maitriser l'incendie de déchets déclaré il y à peu ! Félicitation à eux pour leur sang froid.",name player];

// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};
if (isnil "je_desactive_les_incendies") then {je_desactive_les_incendies = 0;};

_suppression_incendie_vehicule_valeur_sfp =
{
	waituntil {sleep 0.1; !alive (_this select 0) or isnil "creation_feu_voiture_joueur" or isnil {(_this select 0) getvariable "jesuisenfeu"}};
	
	deletevehicle (_this select 1);
};

_bruit_incendie_du_vehicule_sfp =
{
	_son_vehicule = _this select 0;
	if (isnil "_son_vehicule") exitwith {};
	
	while {alive _son_vehicule && !isnil "creation_feu_voiture_joueur" && !isnil {_son_vehicule getvariable "jesuisenfeu"}} do
	{
		if (player distance _son_vehicule < 20) then
		{
			playSound "voiture_brule";
		};
		sleep 2.18;
	};
};

while {true} do
{
	private ["_le_vehicule","_fumee_sfp","_feu_sfp","_lumiere_sfp","_pos","_temps_actuel","_config"];
	
	waituntil {sleep 0.2; !isnil "fin_verification_apres_chargement"};
	waituntil {sleep 1; !isnil "creation_feu_voiture_joueur"};
	
	if !(player in list sarl_pompier) then
	{
		["Incendie",["ATTENTION ! Incendie véhicule joueur.", ""]] call bis_fnc_showNotification;
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
	
	// -------------------------------------------------------------- Initialisation des effets véhicules --------------------------------------------------------------------
	_le_vehicule = creation_feu_voiture_joueur;
	
	_config_couleur_sfp = [0.99,0.05,1];
	_config_ambiance_sfp = [1,0.3,0];
	_config_brightness_sfp	= 1.0;
	_config_intensite_sfp = 3200;
	_config_attenuation_sfp = [0,0,0,1.6];
	_firepetit = "SmallDestructionFire";
	_firemoyen = "MediumDestructionFire";
	_firegrand = "BigDestructionFire";
	_smokepetit = "SmallDestructionSmoke";
	_smokemoyen = "MediumDestructionSmoke";
	_smokegrand = "BigDestructionSmoke";
	
	_temps_actuel = 0;
	_temps_petite_flamme = 0;
	_temps_moyenne_flamme = 30;
	_temps_grande_flamme = 60;
	_temps_deuxieme_flamme_petite = 61;
	_temps_deuxieme_flamme_moyenne = 90;
	_temps_deuxieme_flamme_grande = 200;
	_config = ["","",0];
	_config_actuel = _config;
	
	_pos = [getPosATL _le_vehicule select 0,(getPosATL _le_vehicule select 1) + (0.6),(getPosATL _le_vehicule select 2)+1];
	
	[_le_vehicule] spawn _bruit_incendie_du_vehicule_sfp;
	
	_le_vehicule allowdamage false;
	
	while {alive _le_vehicule && !isnil "_le_vehicule" && !isnil "creation_feu_voiture_joueur" && !isnil {_le_vehicule getvariable "jesuisenfeu"}} do
	{
		if (_temps_actuel >= _temps_petite_flamme) then {_config = ["SmallDestructionSmoke","SmallDestructionFire",300];}; // Feu, fumée, intensensité lumiere
		if (_temps_actuel > _temps_moyenne_flamme) then {_config = ["MediumDestructionSmoke","MediumDestructionFire",2000];}; // Feu, fumée, intensensité lumiere
		if (_temps_actuel > _temps_grande_flamme) then {_config = ["BigDestructionSmoke","BigDestructionFire",3000];};
		if (_temps_actuel > _temps_deuxieme_flamme_petite) then {_config = ["SmallDestructionSmoke","SmallDestructionFire",300]; _pos = [getPosATL _le_vehicule select 0,(getPosATL _le_vehicule select 1) - (1.6),(getPosATL _le_vehicule select 2)+1];};
		if (_temps_actuel > _temps_deuxieme_flamme_moyenne) then {_config = ["MediumDestructionSmoke","MediumDestructionFire",2000];};
		if (_temps_actuel > _temps_deuxieme_flamme_grande) then {_config = ["BigDestructionSmoke","BigDestructionFire",3000];};
		
		if (_config select 2 != _config_actuel select 2) then
		{
			_config_actuel = _config;
			
			if (je_desactive_les_incendies < 1) then 
			{
				_fumee_sfp = "#particlesource" createVehicleLocal _pos;
				_fumee_sfp setParticleClass (_config select 0);
				_fumee_sfp setPosATL _pos;
				_fumee_sfp attachto [_le_vehicule];
				[_le_vehicule, _fumee_sfp] spawn _suppression_incendie_vehicule_valeur_sfp;
			};
			
			_feu_sfp = "#particlesource" createVehicleLocal _pos;
			_feu_sfp setParticleClass (_config select 1);
			_feu_sfp setPosATL _pos;
			_feu_sfp attachto [_le_vehicule];
			[_le_vehicule, _feu_sfp] spawn _suppression_incendie_vehicule_valeur_sfp;
			
			_lumiere_sfp = "#lightpoint" createVehicleLocal _pos;
			_lumiere_sfp setPosATL _pos;
			_lumiere_sfp setLightBrightness _config_brightness_sfp;
			_lumiere_sfp setLightColor _config_couleur_sfp;
			_lumiere_sfp setLightAmbient _config_ambiance_sfp;
			_lumiere_sfp setLightIntensity (_config select 2);
			_lumiere_sfp setLightAttenuation _config_attenuation_sfp;
			_lumiere_sfp attachto [_le_vehicule];
			[_le_vehicule, _lumiere_sfp] spawn _suppression_incendie_vehicule_valeur_sfp;
		};

		sleep 1;
		_temps_actuel = round (_temps_actuel + 1);
	};
	
	if (alive _le_vehicule) then {_le_vehicule allowdamage true; player globalChat format ["Salut %1, la SARL POMPIER à réussi à maitriser l'incendie du véhicule déclaré dernièrement !",name player];};
	if (!alive _le_vehicule) then {player globalChat format ["Salut %1, la SARL POMPIER n'à pas réussi à maitriser l'incendie du véhicule déclaré dernièrement ! Il à explosé ...",name player];};
		
	waituntil {isnil "creation_feu_voiture_joueur"};
};
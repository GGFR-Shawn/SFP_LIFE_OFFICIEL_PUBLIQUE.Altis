// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "je_desactive_les_incendies") then {je_desactive_les_incendies = 0;};

_compilation_feu_de_champs_sfp =
{
	private ["_source02","_choix_fumee"];
	_l_objet_en_feu = _this select 0;
	_sa_position = getPosATL _l_objet_en_feu;

	if (isnil "_l_objet_en_feu") exitwith {};
	if (!alive _l_objet_en_feu) exitwith {};

	_source01 = "#particlesource" createVehicleLocal _sa_position;
	_source01 setParticleClass "ObjectDestructionFire1Smallx";
	_source01 attachto [_l_objet_en_feu,[0,0,0]];

	_choix_fumee = round (random 2);
	if (_choix_fumee == 1) then
	{
		_source02 = "#particlesource" createVehicleLocal _sa_position;
		_source02 setParticleClass "ObjectDestructionSmoke1_2Smallx";
		_source02 attachto [_l_objet_en_feu,[0,0,0]];
	};
	
	_li = "#lightpoint" createVehicleLocal _sa_position;
	_li setLightBrightness 0.08;
	_li setLightAmbient [1,0.28,0.05];
	_li setLightColor [1,0.28,0.05];
	_li lightAttachObject [_l_objet_en_feu, [0,0,0]];

	while {alive _l_objet_en_feu} do
	{
		sleep 1;
		if (je_desactive_les_incendies >= 1) then 
		{
			if (_choix_fumee == 1) then {if (alive _source02) then {deletevehicle _source02;};};
		}else
		{
			if (_choix_fumee == 1) then {if (!alive _source02) then {_source02 = "#particlesource" createVehicleLocal _sa_position;_source02 setParticleClass "ObjectDestructionSmokeSmallx";_source02 attachto [_l_objet_en_feu,[0,0,0]];};};
		};
	};

	if (alive _source01) then {deletevehicle _source01;};
	if (_choix_fumee == 1) then {if (alive _source02) then {deletevehicle _source02;};};
	if (alive _li) then {deletevehicle _li;};
};

{
	if (!isnil {_x getvariable "jesuisenfeu"}) then
	{
		[_x] spawn _compilation_feu_de_champs_sfp;
	};
	sleep 0.01;
} foreach (nearestObjects [position_de_depart_feu_de_champs, [objet_creation_du_feu_de_champs], 1500]);
 
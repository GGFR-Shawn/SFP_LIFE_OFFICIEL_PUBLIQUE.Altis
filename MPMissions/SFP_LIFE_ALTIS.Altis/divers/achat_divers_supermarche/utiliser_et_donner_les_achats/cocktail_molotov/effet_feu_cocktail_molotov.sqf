// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_l_objet_en_feu_sfp = _this select 0;
_le_joueur_sfp = _this select 1;
_sa_position_sfp = getPosATL _l_objet_en_feu_sfp;
if (isnil "_l_objet_en_feu_sfp" or !alive _l_objet_en_feu_sfp) exitwith {};

_l_objet_en_feu_sfp setvariable ["jesuisenfeu",1,false];

_source01 = "#particlesource" createVehicleLocal _sa_position_sfp;
_source01 setParticleClass "SmallDestructionFire";
_source01 attachto [_l_objet_en_feu_sfp,[0,0,0]];

_source02 = "#particlesource" createVehicleLocal _sa_position_sfp;
_source02 setParticleClass "SmallDestructionSmoke";
_source02 attachto [_l_objet_en_feu_sfp,[0,0,0]];

_source03 = "#particlesource" createVehicleLocal _sa_position_sfp;
_source03 setParticleClass "FireSparks";
_source03 attachto [_l_objet_en_feu_sfp,[0,0,0]];


waituntil {_l_objet_en_feu_sfp distance _le_joueur_sfp > 4};


_source04 = "#particlesource" createVehicleLocal _sa_position_sfp;
_source04 setParticleClass "MediumDestructionFire";
_source04 attachto [_l_objet_en_feu_sfp,[0,0,0]];

_source05 = "#particlesource" createVehicleLocal _sa_position_sfp;
_source05 setParticleClass "MediumDestructionSmoke";
_source05 attachto [_l_objet_en_feu_sfp,[0,0,0]];

_li = "#lightpoint" createVehicleLocal _sa_position_sfp;
_li setLightBrightness 0.08;
_li setLightAmbient [1,0.28,0.05];
_li setLightColor [1,0.28,0.05];
_li lightAttachObject [_l_objet_en_feu_sfp, [0,0,0]];

_temps_maximum_effet_cocktail_molotov = round (40 + (random 40));
while {alive _l_objet_en_feu_sfp && _temps_maximum_effet_cocktail_molotov > 0} do
{
	sleep 1;
	_temps_maximum_effet_cocktail_molotov = round (_temps_maximum_effet_cocktail_molotov - 1);
};

if (alive _source01) then {deletevehicle _source01;};
if (alive _source02) then {deletevehicle _source02;};
if (alive _source03) then {deletevehicle _source03;};
if (alive _source04) then {deletevehicle _source04;};
if (alive _source05) then {deletevehicle _source05;};
if (alive _li) then {deletevehicle _li;};
if (alive _l_objet_en_feu_sfp) then {deletevehicle _l_objet_en_feu_sfp;};

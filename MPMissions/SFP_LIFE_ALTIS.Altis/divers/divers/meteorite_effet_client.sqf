// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_meteorite_by_maxou = _this select 0;
if (isnil "_la_meteorite_by_maxou") exitwith {};
if (!hasInterface) exitwith {};

_lumiere_by_maxou = "#lightpoint" createVehicleLocal (position _la_meteorite_by_maxou);
_lumiere_by_maxou setLightBrightness 7;
_lumiere_by_maxou setLightAmbient [1,0.5,0];
_lumiere_by_maxou setLightColor [1, 0.5, 0];
_lumiere_by_maxou lightAttachObject [_la_meteorite_by_maxou, [0,0,0.1]];


_fumee_un_by_maxou = "#particlesource" createVehicleLocal (position _la_meteorite_by_maxou);
_fumee_un_by_maxou setParticleCircle [0, [0, 0, 0]];
_fumee_un_by_maxou setParticleRandom [5, [0.1, 0.1, 0], [0.2, 0.2, 0.5], 0.3, 0.5, [0, 0, 0, 0.5], 0, 0];
_fumee_un_by_maxou setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7,48,1], "", "Billboard", 1, 20, [0, 0, 0], [0, 0, 0.5], 0, 10.1, 7.9, 0.01, [1,5,8], [[0.1,0.1,0.1,0.9], [0.6,0.6,0.6,0.6], [0.8,0.8,0.8,0.4],[0.9,0.9,0.9,0.3],[1,1,1,0.1]], [0.125], 1, 0, "", "", _la_meteorite_by_maxou];
_fumee_un_by_maxou setDropInterval 0.002;


_fumee_deux_by_maxou = "#particlesource" createVehicleLocal (position _la_meteorite_by_maxou);
_fumee_deux_by_maxou setParticleCircle [0, [0, 0, 0]];
_fumee_deux_by_maxou setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_fumee_deux_by_maxou setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 0, 1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.075, [1, 1.5, 2], [[0.4,0.4,0.4,0],[0.4,0.4,0.4,0.5],[0.4,0.4,0.4,0.25],[0.6,0.6,0.6,0.12],[1,1,1,0]], [0.08], 1, 0, "", "", _la_meteorite_by_maxou];
_fumee_deux_by_maxou setDropInterval 0.003;


waituntil {sleep 0.0001; ((position _la_meteorite_by_maxou) select 2) < 2};


_lumiere_deux_by_maxou = "#lightpoint" createVehicleLocal position _la_meteorite_by_maxou;
_lumiere_deux_by_maxou setLightBrightness 15;
_lumiere_deux_by_maxou setLightAmbient[1,0.5,0];
_lumiere_deux_by_maxou setLightColor[1, 0.5, 0];
_lumiere_deux_by_maxou lightAttachObject [_la_meteorite_by_maxou, [0,0,0.1]];


if (player distance _la_meteorite_by_maxou < 1000) then
{
	enableCamShake true;
	_shake_by_maxou = (-(20/400) * ((player distance _la_meteorite_by_maxou) + 20));
	addCamShake [_shake_by_maxou,1,5];
};

sleep 0.5;
enableCamShake false;

deletevehicle _lumiere_by_maxou;
deletevehicle _lumiere_deux_by_maxou;
deletevehicle _fumee_un_by_maxou;
deletevehicle _fumee_deux_by_maxou;
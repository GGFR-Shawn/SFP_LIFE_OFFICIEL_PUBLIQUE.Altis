// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_joueur","_nombre_de_sons_sfp"];
_le_joueur = _this select 0;
_nombre_de_sons_sfp = _this select 1;
if (isnull _le_joueur or isnil "_nombre_de_sons_sfp") exitwith {};
if (!hasInterface) exitwith {};

[_le_joueur, _nombre_de_sons_sfp] spawn
{
	for "_i" from 0 to (_this select 1) do
	{
		(_this select 0) say "toux_lacrymo_sfp";
		sleep 3.2;
	};
};

if (_le_joueur == player) then
{
	titleText["Vous venez de prendre de la lacrymogène !", "PLAIN DOWN",0];	

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [100];
	"dynamicBlur" ppEffectCommit 16;
	
	enableCamShake true;
	addCamShake [random 20, random 50, random 20];
	[] spawn {while {getStamina player > 10} do {player SetStamina (getStamina player - (random 3)); sleep 0.1;};};
	5 fadeSound 0.1;
	
	waituntil {ppEffectCommitted "dynamicBlur"};
	
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 10;
	
	[] spawn 
	{
		for "_i" from 0 to 20 do
		{
			addCamShake [_i, _i, _i];
			sleep 0.63;
		};
		resetCamShake;
	};
	10 fadeSound 1;
};


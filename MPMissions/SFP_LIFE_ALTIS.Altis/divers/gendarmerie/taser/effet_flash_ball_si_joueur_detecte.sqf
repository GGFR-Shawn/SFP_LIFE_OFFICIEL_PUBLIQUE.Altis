// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


_le_joueur = _this select 0;
if (isnull _le_joueur) exitwith {};

_le_joueur say "joueur_douleur_flash_ball";

if (_le_joueur == player) then
{
	[[[_le_joueur,"Acts_UnconsciousStandUp_part1"],"divers\gendarmerie\taser\synchro_animation_taser.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	
	titleText["\n\n\n\n\n\n\n\n Vous venez de vous prendre une balle de Flash-Ball !", "PLAIN",0];	
	_le_joueur allowdamage false;
	jesuistaze = 1;
	sleep 31.8;
	jesuistaze = 0;
	_le_joueur switchmove "";
	_le_joueur allowdamage true; sleep 1; _le_joueur allowdamage true;
};


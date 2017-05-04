// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_le_joueur_arrete","_le_gendarme"];
_le_joueur_arrete = _this select 0;
_le_gendarme = _this select 1;
if (isnil "_le_joueur_arrete" or isnil "_le_gendarme") exitwith {};

_le_joueur_arrete say "son_menottage_sfp";

if (_le_joueur_arrete == player) then
{
	noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 47) then {true}"];
	[_le_joueur_arrete] execvm "divers\gendarmerie\menotter\demenottage_auto_by_sfp_maxou.sqf";
	hint format ["Vous avez été menotté par %1 \n\n Par ailleur, si vous etiez groupé à un joueur, vous avez été automatiquement kické ...",name _le_gendarme];
	
	[player] join grpNull;
	
	while {!isnil {player getvariable "joueur_menotte"}} do
	{
		sleep 0.02;
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
		if (driver vehicle player == player) then {player action ["Eject", vehicle player];};
		waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || (isnil {player getvariable "joueur_menotte"})};
		if (!alive player) exitwith
		{
			if (!isnil {player getvariable "joueur_menotte"}) then {player setVariable ["joueur_menotte",nil,true];};
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];
		};
	};
};

// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_unit"];
_unit = _this select 0;

if(_unit == player && alive _unit) then
{
	sleep 2;
	titleText[format["Tu as été démenotté. Appuis sur V pour avancer %1 !",name _unit],"PLAIN"];
	if (!isnil "noesckey") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};
};
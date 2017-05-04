// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_unit","_anim"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_anim = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

_unit spawn
{
	if (_this == player) then
	{
		disableUserInput true;
		sleep 31.8;
		disableUserInput false;
	};
};

if (IsClass (configFile  >> "CfgMovesMaleSdr" >> "States" >> "ActsPknlMstpSnonWnonDnon_TreatingInjured_NikitinDead")) then
{
	_unit switchMove "ActsPknlMstpSnonWnonDnon_TreatingInjured_NikitinDead";
}else
{
	_unit switchMove _anim;
};

sleep 31.8;
_unit playmove "";
sleep 0.1;
_unit switchmove "";

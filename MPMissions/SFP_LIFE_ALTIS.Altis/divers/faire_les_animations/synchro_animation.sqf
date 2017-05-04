// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_le_joueur","_anim","_lafonction"];
_le_joueur = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_anim = [_this,1,"",[""]] call BIS_fnc_param;
_lafonction = [_this,2,"",[""]] call BIS_fnc_param;
if (isNull _le_joueur) exitWith {};
if (_anim == "") exitwith {_le_joueur switchmove "";};
if !(IsClass (configFile  >> "CfgMovesMaleSdr" >> "States" >> _anim)) exitwith {};


if (_lafonction == "1") then {_le_joueur playMoveNow _anim;};
if (_lafonction == "2") then {_le_joueur playMove _anim;};
if (_lafonction == "3") then {_le_joueur switchmove _anim;};



/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/

private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

player setvariable ["je_me_suis_prit_un_coup_de_poing",true,true];

titleText[format["%1 vous à mit un coup de poing !",_who],"PLAIN"];
player playMoveNow "Incapacitated";

_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];

sleep 22;

player playMoveNow "amovppnemstpsraswrfldnon";
detach player;
deleteVehicle _obj;

player setvariable ["je_me_suis_prit_un_coup_de_poing",nil,true];

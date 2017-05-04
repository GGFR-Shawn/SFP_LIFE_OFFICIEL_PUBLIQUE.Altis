
private["_target","_who"];

_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};

player globalChat format["%1 c'est prit un coup de poignard par %2 !",_target,_who];
_choix_dommage = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
_choix_dommage_ok = _choix_dommage call BIS_fnc_selectRandom;
_mon_dommage = getdammage _target;
_savie = (_mon_dommage + _choix_dommage_ok);
_savie_deux = _savie * 100;

if(_who == name player) exitWith {titleText[format["%1 c'est bien prit le coup de poignard ! Il lui reste %2 de vie !",_target,round _savie_deux],"PLAIN"];};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

titleText[format["%1 vous à mit un coup de poignard !",_who],"PLAIN"];

player setdamage _savie;

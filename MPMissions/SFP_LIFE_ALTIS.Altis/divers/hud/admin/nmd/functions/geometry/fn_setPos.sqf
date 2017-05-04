private[ "_unit", "_pos" ];

_unit = [ _this, 0, objNull, [objNull] ] call BIS_fnc_param;
_pos = [ _this, 1, [0,0,0], [[]] ] call BIS_fnc_param;

_unit setPos _pos;
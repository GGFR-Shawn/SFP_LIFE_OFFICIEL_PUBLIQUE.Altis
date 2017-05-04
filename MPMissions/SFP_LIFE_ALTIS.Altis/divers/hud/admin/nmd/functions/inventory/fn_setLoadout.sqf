private [ "_unit", "_gear" ];

_unit = [ _this, 0, player, [objNull] ] call BIS_fnc_param;
_gear = [ _this, 1, [], [[]] ] call BIS_fnc_param;

if ( _unit == objNull ) exitwith { [ "No unit object" ] call BIS_fnc_error };
if ( count _gear == 0 ) exitwith { [ "No gear array" ] call BIS_fnc_error };

//--- Remove gear
removeAllAssignedItems _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;

//--- Remove weapons
_unit removeWeapon ( primaryWeapon _unit );
_unit removeWeapon ( secondaryWeapon _unit );
_unit removeWeapon ( handgunWeapon _unit );


//--- Add temp storage
_unit addBackpack "B_Kitbag_mcamo";


//--- Add assigned items
{

	if( getNumber ( configFile >> "CfgWeapons" >> _x >> "type" ) == 4096 ) then {

		_unit addWeapon _x;

	} else {

		_unit addItem _x;
		_unit assignItem _x;

	};

} forEach ( _gear select 0 );


//--- Add headgear
_unit addHeadgear ( _gear select 1 );


//--- Add goggles
_unit addGoggles ( _gear select 2 );


//--- Add weapon (primary)
if( ( ( _gear select 3 ) select 0 ) != "" ) then {

	{ _unit addMagazine _x } forEach ( ( _gear select 3 ) select 2 );

	_unit addWeapon ( ( _gear select 3 ) select 0 );
	{ if( _x != "" ) then { _unit addPrimaryWeaponItem _x } } forEach ( ( _gear select 3 ) select 1 );

};


//--- Add weapon (secondary)
if( ( ( _gear select 4 ) select 0 ) != "" ) then {

	{ _unit addMagazine _x } forEach ( ( _gear select 4 ) select 2 );

	_unit addWeapon ( ( _gear select 4 ) select 0 );
	{ if( _x != "" ) then { _unit addSecondaryWeaponItem _x } } forEach ( ( _gear select 4 ) select 1 );

};


//--- Add weapon (handgun)
if( ( ( _gear select 5 ) select 0 ) != "" ) then {

	{ _unit addMagazine _x } forEach ( ( _gear select 5 ) select 2 );

	_unit addWeapon ( ( _gear select 5 ) select 0 );
	{ if( _x != "" ) then { _unit addHandgunItem _x } } forEach ( ( _gear select 5 ) select 1 );

};

//--- Remove temp storage
removeBackpack _unit;


//--- Add uniform
if( ( ( _gear select 6 ) select 0 ) != "" ) then {

	_unit forceAddUniform ( ( _gear select 6 ) select 0 );
	{ _unit addItemToUniform _x } forEach ( ( _gear select 6 ) select 1 );

};


//--- Add vest
if( ( ( _gear select 7 ) select 0 ) != "" ) then {

	_unit addVest ( ( _gear select 7 ) select 0 );
	{ _unit addItemToVest _x } forEach ( ( _gear select 7 ) select 1 );

};


//--- Add backpack
if( ( ( _gear select 8 ) select 0 ) != "" ) then {

	_unit addBackpack ( ( _gear select 8 ) select 0 );
	{ _unit addItemToBackpack _x } forEach ( ( _gear select 8 ) select 1 );

};
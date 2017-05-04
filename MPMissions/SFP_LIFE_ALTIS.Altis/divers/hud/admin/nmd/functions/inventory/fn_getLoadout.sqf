private [ "_unit", "_gear" ];

_unit = [ _this, 0, objNull, [objNull] ] call BIS_fnc_param;

if ( _unit == objNull ) exitwith { [ "No unit object" ] call BIS_fnc_error };

_gear = [

	assignedItems _unit,
	headgear _unit,
	goggles _unit,
	
	[ primaryWeapon _unit, primaryWeaponItems _unit, primaryWeaponMagazine _unit ],
	[ secondaryWeapon _unit, secondaryWeaponItems _unit, secondaryWeaponMagazine _unit ],
	[ handgunWeapon _unit, handgunItems _unit, handgunMagazine _unit ],
	
	[ uniform _unit, uniformItems _unit ],
	[ vest _unit, vestItems _unit ],
	[ backpack _unit, backpackItems _unit ]
	
];

_gear
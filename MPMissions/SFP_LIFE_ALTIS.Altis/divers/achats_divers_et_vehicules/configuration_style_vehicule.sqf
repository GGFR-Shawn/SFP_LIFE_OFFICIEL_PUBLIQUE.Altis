// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_le_vehicule";
_le_vehicule = _this select 0;
_condition = _this select 1;
if (isNull _le_vehicule or isnil "_le_vehicule" or isnil "_condition") exitWith {}; 

_le_vehicule setVariable ["BIS_enableRandomization", false];

switch (typeof _le_vehicule) do
{
	case "B_G_Offroad_01_F" :
	{
		_le_vehicule setVariable ["BIS_enableRandomization", true];
		(_le_vehicule) execVM "\A3\Soft_F_Bootcamp\Offroad_01\scripts\randomize_colors.sqf";
	};
	case "C_Van_01_fuel_F" :
	{
		_le_vehicule setVariable ["BIS_enableRandomization", true];
	};
};

clearWeaponCargoGlobal _le_vehicule;
clearMagazineCargoGlobal _le_vehicule;
clearItemCargoGlobal _le_vehicule;
clearBackpackCargoGlobal _le_vehicule;

[[[_le_vehicule,2],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

if (_condition) then {[_le_vehicule] execvm "divers\achats_divers_et_vehicules\configuration_couleur_vehicule.sqf";};

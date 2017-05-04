
_le_joueur = _this select 0;

if (player == _le_joueur) then 
{
	removeAllActions player;
    
	waitUntil {!alive player};
	
    _armes_actuels = weapons player;
    _magazines_actuels = magazines player;
    
	waitUntil {alive player};
	
    removeAllItems player;
    removeAllWeapons player;
	
    {player addMagazine _x} forEach _magazines_actuels;
    {player addWeapon _x} forEach _armes_actuels;
    
	_arme_principale = primaryWeapon player;
    if (_arme_principale != "") then 
	{
        player selectWeapon _arme_principale;

        _muzzles = getArray(configFile>>"cfgWeapons" >> _arme_principale >> "muzzles");
        player selectWeapon (_muzzles select 0);
	};
};
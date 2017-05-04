// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_joueur = _this select 0; 
_nom = _this select 1; 
_uid_joueur  = _this select 2;

if (_nom != "__SERVER__") then 
{
	_player = objNull;
	{
		if (getPlayerUID _x == _uid_joueur) exitWith
		{
			_player = _x;
		};
	} forEach playableUnits; 
	
	if (!(isNull _player)) then 
	{		
		hideBody  _player;
		
		_player setpos [0,0,0];
		
		_player removeWeapon (primaryWeapon _player);
		_player removeWeapon (handGunWeapon _player);
		
		removeAllWeapons _player;
		removeAllAssignedItems _player;
		removeAllItems _player;
		removeBackpack _player;
		removeAllHandgunItems _player;
		removeAllContainers _player;

		_player spawn
		{
			sleep 1;
			{
				deleteVehicle _x
			} forEach nearestObjects [_this, ["GroundWeaponHolder","weaponholder","WeaponHolderSimulated"], 5];
		};
	};
};
//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !

private ["_herse","_herse_ok_protection"];
_herse = _this select 0;
_herse allowdamage false;

while {isnil "_herse_ok_protection" && alive player} do
{
	_voitures = nearestobjects [getPosATL _herse,["car"], 10];
	_nombre_de_voiture = count _voitures;
	
	if (_nombre_de_voiture > 0 && (getPosATL _herse select 2) <= 0.1 && speed _herse <= 0) then
	{
		_voiture = _voitures select 0;
		if (speed _voiture > 3) then 
		{
			[[_voiture],"SFP_creuver_pneu",nil,false] spawn BIS_fnc_MP;
			_herse_ok_protection = true;
		};
	};
	sleep 0.01;
};

deletevehicle _herse;
jepeuxreprendreuneherse = 0;
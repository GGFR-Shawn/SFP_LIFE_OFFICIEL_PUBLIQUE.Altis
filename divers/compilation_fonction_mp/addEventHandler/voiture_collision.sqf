// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
waitUntil {!isNil "fin_verification_apres_chargement"};

_veh = _this select 0;
_choix_Eventhandler_maxou = _this select 1;

if (isnull _veh) exitwith {};
if (isnil "_choix_Eventhandler_maxou") exitwith {};
if (!alive _veh) exitwith {};

switch _choix_Eventhandler_maxou do 
{
	case 1: 
	{
		_veh addEventHandler
		[
			"EpeContact",
			{
				_nom_du_declencheur = _this select 0;
				_type_collision_by_maxou = _this select 1;
				_force_by_maxou = _this select 4;
			   			   				
				if (_type_collision_by_maxou iskindof "house" && _force_by_maxou > 100 && name player == name _nom_du_declencheur) then 
				{
					_liste_endroit_kick_by_maxou = [Neochori];

					for "_i" from 0 to ((count _liste_endroit_kick_by_maxou) - 1) do 
					{
						if ((vehicle player) in list (_liste_endroit_kick_by_maxou select _i)) then 
						{
							["Comportement_anormal_collision_vehicule",false,true] call BIS_fnc_endMission;
						};
					};
				};
			}
		];
	};
};


// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_discotheque";
if (isnil "boitedenuit") then {boitedenuit = 0;};
if (player getVariable "mon_argent_poche_by_sfp_maxou" < 100) exitwith {Hint format ["Tu n'as pas assez d'argent. Tu as actuellement %1 Euros et tu as besoin de %2 Euros pour faire danser la foule ;)",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(100)];};
if (boitedenuit >= 1) exitwith {hint "La boite de nuit est déja ouverte :)";}; 

{
	if (!isnil {_x getvariable "sfp_discotheque"}) then
	{
		_discotheque = _x;
	};
} foreach (nearestObjects [getPosATL player, [], 50]);
if (isnil "_discotheque") exitwith {hint "Désolé pas de discothèque trouvée ...";}; 


_duree_repetitif = 5; // Nombres de fois
_temps_chanson = 29;

[_discotheque, _duree_repetitif,_temps_chanson] spawn
{
	_discotheque = _this select 0;
	_duree_repetitif = _this select 1;
	_temps_chanson = _this select 2;
	
	for "_i" from 0 to _duree_repetitif do
	{
		_random = [3,-3];
		_fumigene1 = "SmokeShell" createVehicle [(getPosATL _discotheque select 0) + (_random call bis_fnc_selectrandom),(getPosATL _discotheque select 1) + (_random call bis_fnc_selectrandom),0];
		_fumigene2 = "SmokeShell" createVehicle [(getPosATL _discotheque select 0) + (_random call bis_fnc_selectrandom),(getPosATL _discotheque select 1) + (_random call bis_fnc_selectrandom),0];
		sleep _temps_chanson;
	};
};

[[[_discotheque,_duree_repetitif,_temps_chanson],"divers\boitedenuit\effet_boite_de_nuit_sfp.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
sleep (_temps_chanson * _duree_repetitif);

player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") - 100,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format['Vous avez payé %1 d''un montant de %2 Euros ! Il vous reste %3 Euros !',"votre entrée en boite de nuit", 100, (player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];


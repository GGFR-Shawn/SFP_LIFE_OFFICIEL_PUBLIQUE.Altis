// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_les_valeurs","_mon_vehicule"];
_mon_vehicule = vehicle player;

if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then {_les_valeurs = [_mon_vehicule, "SirenlongPompier", 1.94];}; // Pompiers
if (revive_mon_side == west) then {_les_valeurs = [_mon_vehicule, "sirenlong", 4.36];}; // Gendarmes

if (isnil "_les_valeurs") exitwith {hint "Erreur sur la detection de votre sirène !";};
if (isnil "_mon_vehicule") then {hint "Erreur sur le véhicule, recommence ...";};
if (vehicle player == player) exitwith {hint "Tu n'es pas dans un véhicule !";};
if (((assignedVehicleRole player) select 0) != "Driver") exitwith {hint "Désolé, tu n'es pas le conducteur !";};

if (isnil {vehicle player getvariable "sirene_sur_vehicule_active"}) then 
{
	sirene_du_vehicule_active = 1;
	hint "La sirène du véhicule est activée !";
	(vehicle player) setvariable ["sirene_sur_vehicule_active",true,true];
	[[_les_valeurs,"divers\allumer_sirene_vehicule_envoyer_sur_joueur.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
}else 
{
	sirene_du_vehicule_active = nil;
	hint "La sirène du véhicule est désactivée !";
	(vehicle player) setvariable ["sirene_sur_vehicule_active",nil,true];
};

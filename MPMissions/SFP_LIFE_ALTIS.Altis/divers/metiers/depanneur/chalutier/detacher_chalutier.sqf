// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {cursortarget getvariable "vehicule_depannage_en_cours_d_utilisation"}) exitwith {hint "Vehicule en cours d'utilisation par un dépanneur !";};

private ["_mon_vehicule_de_depanneur"];
_mon_vehicule_de_depanneur = cursortarget;

_mon_vehicule_de_depanneur setVariable ["vehicule_depanneur_attache_au_vehicule",nil,true]; // Mon véhicule de dépannage
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",true,true];

hint "! DETACHER CHALUTIER ! \n\n Le fonctionnement est le même : \n\n Pour detacher un chalutier de ta dépanneuse, il te suffit de : \n\n 1) Pointer ta souris vers le chalutier que tu souhaites detacher.\n 2) C'est tout, rien de plus. \n\n C'est aussi simple que ca ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";

waitUntil {(typeof cursortarget == "chalutier_SFP") &&  !isnil {cursortarget getvariable "jesuisattacher"} && (player distance cursortarget) < 30};
// ---------------------------------------

_veh = cursortarget;

_veh setvariable ["jesuisattacher",nil,true];

hint "Patiente quelques secondes.";

detach _veh;
[[[_veh],"divers\metiers\depanneur\lourde\debug_quand_vehicule_detacher.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
hint "Chalutier détaché.";

sleep 3;
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",nil,true];

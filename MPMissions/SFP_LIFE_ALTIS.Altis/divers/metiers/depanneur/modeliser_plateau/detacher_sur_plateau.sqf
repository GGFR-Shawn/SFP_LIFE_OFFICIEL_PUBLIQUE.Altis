// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {cursortarget getvariable "vehicule_depannage_en_cours_d_utilisation"}) exitwith {hint "Vehicule en cours d'utilisation par un dépanneur !";};
private ["_mon_vehicule_de_depanneur"];
_mon_vehicule_de_depanneur = cursortarget;

_mon_vehicule_de_depanneur setVariable ["vehicule_depanneur_attache_au_plateau",nil,true]; // Mon véhicule de dépannage
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",true,true];

hint "! DETACHER VEHICULE ! \n\n Le fonctionnement est le même : \n\n Pour detacher un véhicule de ta dépanneuse, il te suffit de : \n\n 1) Pointer ta souris vers le véhicule que tu souhaites detacher.\n 2) C'est tout, rien de plus. \n\n C'est aussi simple que ca ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";

waitUntil {(cursortarget isKindOf "LandVehicle") &&  !isnil {cursortarget getvariable "jesuisattacher_sur_plateau"} && (player distance cursortarget) < 6};
// ---------------------------------------

_veh = cursortarget;

_veh setvariable ["jesuisattacher_sur_plateau",nil,true];
player playMove "AinvPknlMstpSlayWrflDnon_healed";

sleep 3;

_veh attachTo [_mon_vehicule_de_depanneur, [
	(boundingCenter _veh select 0),
	(boundingBoxReal _mon_vehicule_de_depanneur select 0 select 1) + ((boundingBoxReal _veh select 0 select 1) - 2),
	(boundingBoxReal _mon_vehicule_de_depanneur select 0 select 2) - (boundingBoxReal _veh select 0 select 2)
]];

sleep 1;

detach _veh;
hint "Véhicule détaché.";

sleep 3;
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",nil,true];

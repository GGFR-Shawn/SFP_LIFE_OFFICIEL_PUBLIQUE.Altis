// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_mon_vehicule_de_depanneur"];

if (!isnil {cursortarget getvariable "vehicule_depannage_en_cours_d_utilisation"}) exitwith {hint "Vehicule en cours d'utilisation par un dépanneur !";};

_mon_vehicule_de_depanneur = cursortarget;

_mon_vehicule_de_depanneur setVariable ["vehicule_depanneur_attache_au_plateau",true, true];
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",true,true];

hint "! MONTER VEHICULE ! \n\n Le fonctionnement est simple : \n\n Pour monter un véhicule sur ta dépanneuse, il te suffit de : \n\n 1) Pointer ta souris vers le véhicule que tu souhaites dépanner.\n 2) Ensuite de (re)pointer ta souris vers ta dépanneuse. \n\n Et te voila maintenant entrain de remorquer ;) \n\n\n Attention, tu ne peux remorquer que des véhicules LOURDS (ainsi que divers objets au cas ou) et à moins de 4 mètres de ta dépanneuse ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";

waitUntil {!(cursortarget in (attachedObjects _mon_vehicule_de_depanneur)) && (cursortarget isKindOf "LandVehicle") && isnil {cursortarget getvariable "vehicule_depanneur_attache_au_plateau"} && !(cursortarget isKindOf "Air") && (player distance cursortarget) < 8};
// ---------------------------------------

_levehiculearemorquer = cursortarget;

_levehiculearemorquer setvariable ["jesuisattacher_sur_plateau",1,true];

hint format ['Ok, véhicule de type %1 à bien été selectionné !\n\n Repointes maintenant ta souris sur ton véhicule !',typeOf _levehiculearemorquer];

waitUntil {!isnil {cursortarget getvariable "vehicule_depanneur_attache_au_plateau"} && (player distance cursortarget) < 8}; 
// ---------------------------------------

_madepanneuse = cursortarget;

hint "Patiente, je monte ton véhicule";

player playMove "AinvPknlMstpSlayWrflDnon_healed";

_levehiculearemorquer attachTo [_madepanneuse, 
[
	(boundingCenter _levehiculearemorquer select 0),
	(boundingBoxReal _levehiculearemorquer select 0 select 1) - (boundingBoxReal _madepanneuse select 0 select 1) - 2.5,
	((boundingBoxReal _madepanneuse select 0 select 2) - (boundingBoxReal _levehiculearemorquer select 0 select 2)) + 1.12
]];

hint format['Le véhicule de type %1 à bien été monté à ta dépanneuse !',typeOf _levehiculearemorquer];

sleep 3;
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",nil,true];

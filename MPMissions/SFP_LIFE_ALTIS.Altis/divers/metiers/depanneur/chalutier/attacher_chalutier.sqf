// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {cursortarget getvariable "vehicule_depannage_en_cours_d_utilisation"}) exitwith {hint "Chalutier en cours d'utilisation par un dépanneur !";};

private ["_mon_vehicule_de_depanneur"];
_mon_vehicule_de_depanneur = cursortarget;

_mon_vehicule_de_depanneur setVariable ["vehicule_depanneur_attache_au_vehicule",true, true];
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",true,true];

hint "! ATTACHER CHALUTIER ! \n\n Le fonctionnement est simple : \n\n Pour attacher un chalutier au tien, il te suffit de : \n\n 1) Pointer ta souris vers le chalutier que tu souhaites dépanner.\n 2) Ensuite de (re)pointer ta souris vers ton chalutier. \n\n Et te voila maintenant entrain de remorquer ;) \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";

waitUntil {!(cursortarget in (attachedObjects _mon_vehicule_de_depanneur)) && (typeof cursortarget == "chalutier_SFP") && isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && (player distance cursortarget) < 30};
// ---------------------------------------

_levehiculearemorquer = cursortarget;

_levehiculearemorquer setvariable ["jesuisattacher",1,true];

hint format ['Ok, véhicule de type %1 à bien été selectionné !\n\n Repointes maintenant ta souris sur ton chalutier !',typeOf _levehiculearemorquer];

waitUntil {!isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && (player distance cursortarget) < 30}; 
// ---------------------------------------

_madepanneuse = cursortarget;

hint "Patiente, j'attache ton chalutier";

_levehiculearemorquer attachTo [_madepanneuse,[0,-45, 0]];

sleep 5;

hint format['Le véhicule de type %1 à bien été attacher à ton chalutier !',typeOf _levehiculearemorquer];

sleep 3;
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",nil,true];

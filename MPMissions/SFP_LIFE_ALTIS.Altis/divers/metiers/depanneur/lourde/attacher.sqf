// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {cursortarget getvariable "vehicule_depannage_en_cours_d_utilisation"}) exitwith {hint "Vehicule en cours d'utilisation par un dépanneur !";};

private ["_mon_vehicule_de_depanneur"];
_mon_vehicule_de_depanneur = cursortarget;

_mon_vehicule_de_depanneur setVariable ["vehicule_depanneur_attache_au_vehicule",true, true];
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",true,true];

hint "! ATTACHER VEHICULE ! \n\n Le fonctionnement est simple : \n\n Pour attacher un véhicule à ta dépanneuse, il te suffit de : \n\n 1) Pointer ta souris vers le véhicule que tu souhaites dépanner.\n 2) Ensuite de (re)pointer ta souris vers ta dépanneuse. \n\n Et te voila maintenant entrain de remorquer ;) \n\n\n Attention, tu ne peux remorquer que des véhicules LOURDS (ainsi que divers objets au cas ou) et à moins de 4 mètres de ta dépanneuse ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";

waitUntil {!(cursortarget in (attachedObjects _mon_vehicule_de_depanneur)) && (cursortarget isKindOf "LandVehicle") && isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && !(cursortarget isKindOf "Air") && (player distance cursortarget) < 8};
// ---------------------------------------

_levehiculearemorquer = cursortarget;

_levehiculearemorquer setvariable ["jesuisattacher",1,true];

hint format ['Ok, véhicule de type %1 à bien été selectionné !\n\n Repointes maintenant ta souris sur ton véhicule !',typeOf _levehiculearemorquer];

waitUntil {!isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && (player distance cursortarget) < 8}; 
// ---------------------------------------

_madepanneuse = cursortarget;

hint "Patiente, j'attache ton véhicule";

player playMove "AinvPknlMstpSlayWrflDnon_healed";

_levehiculearemorquer attachTo [_madepanneuse,[0,-10, (getposatl _levehiculearemorquer select 2)]];

_object = createVehicle ["Target_Rail_End_F", getPosATL player, [], 0, "NONE"];
_object attachto [_madepanneuse,[0,-9,-1.5]];
sleep 1;
_object = createVehicle ["Target_Rail_End_F", getPosATL player, [], 0, "NONE"];
_object attachto [_madepanneuse,[0,-8,-1.5]];
sleep 1;
_object = createVehicle ["Target_Rail_End_F", getPosATL player, [], 0, "NONE"];
_object attachto [_madepanneuse,[0,-7,-1.5]];
sleep 1;
_object = createVehicle ["Target_Rail_End_F", getPosATL player, [], 0, "NONE"];
_object attachto [_madepanneuse,[0,-6,-1.5]];
sleep 1;
_object = createVehicle ["Target_Rail_End_F", getPosATL player, [], 0, "NONE"];
_object attachto [_madepanneuse,[0,-5,-1.5]];
sleep 1;
_object = createVehicle ["Target_Rail_End_F", getPosATL player, [], 0, "NONE"];
_object attachto [_madepanneuse,[0,-4,-1.5]];

hint format['Le véhicule de type %1 à bien été attacher à ta dépanneuse !',typeOf _levehiculearemorquer];

sleep 3;
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",nil,true];

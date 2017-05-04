// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

hint "! TREUILLER UN VEHICULE ! \n\n Le fonctionnement est simple : \n\n Pour treuiller un véhicule à ta dépanneuse, il te suffit de : \n\n 1) Pointer ta souris vers le véhicule que tu souhaites dépanner.\n 2) Ensuite de (re)pointer ta souris vers ta dépanneuse. \n\n Et te voila maintenant entrain de treuiller un véhicule ;) \n\n\n Attention, tu ne peux treuiller que des véhicules LOURDS (ainsi que divers objets au cas ou) et à plus de 30 mètres de ta dépanneuse et inférieur à 60 ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";

cursortarget setVariable ["c_est_mon_vehicule_lourd_de_depannage",1,false];	

_madepanneuse = cursortarget;

waitUntil {((cursortarget isKindOf "LandVehicle") or (cursortarget isKindOf "Air")) && (isnil {cursortarget getvariable "c_est_mon_vehicule_lourd_de_depannage"}) && (player distance cursortarget) < 6};

_levehiculearemorquer = cursortarget;

_levehiculearemorquer setvariable ["jesuisattacher",1,true];

hint format['Ok, véhicule de type %1 à bien été selectionné !\n\n Repointes maintenant ta souris sur ton véhicule !',typeOf _levehiculearemorquer];

waitUntil {(!isnil {cursortarget getvariable "c_est_mon_vehicule_lourd_de_depannage"}) && (player distance cursortarget) < 6}; 

la_distance = _madepanneuse distance _levehiculearemorquer;
if (la_distance < 30) exitwith {hint format ["Désolé, le véhicule est trop près de ta dépanneuse, soit %1/30 mètres. \n\n Recommence !",round la_distance]; _levehiculearemorquer setvariable ["jesuisattacher",nil,true];};
if (la_distance > 60) exitwith {hint format ["Désolé, le véhicule est trop loin de ta dépanneuse, soit %1/60 mètres. \n\n Recommence !",round la_distance]; _levehiculearemorquer setvariable ["jesuisattacher",nil,true];};

player playMove "AinvPknlMstpSlayWrflDnon_healed";

hint format ["Distance à treuiller : %1 mètres.",round la_distance];

_levehiculearemorquer attachTo [_madepanneuse,[0, -la_distance,0]];
sleep 1;
detach _levehiculearemorquer;
sleep 1;
_levehiculearemorquer enablesimulation false;

_creation_corde_sfp = ropeCreate [_madepanneuse, [0,-3.8,-1.2], _levehiculearemorquer, [0,0,-0.6], ((_madepanneuse distance _levehiculearemorquer) - 3)];
sleep 1;

_vitesse_du_treuil_sfp = 1;
while {(_madepanneuse distance _levehiculearemorquer) >= 10 && alive player} do
{
	hintsilent format ["Distance à treuiller : %1 mètres.",round (_madepanneuse distance _levehiculearemorquer)];

	player playMove "AinvPknlMstpSlayWrflDnon_healed";

	_levehiculearemorquer attachTo [_madepanneuse,[0, - ((_madepanneuse distance _levehiculearemorquer) - _vitesse_du_treuil_sfp),0]];
	
	ropeUnwind [_creation_corde_sfp, (_vitesse_du_treuil_sfp * 51), (_madepanneuse distance _levehiculearemorquer) - 4];

	sleep (_vitesse_du_treuil_sfp / 5);
};

player switchmove "";

detach _levehiculearemorquer;
ropeDestroy _creation_corde_sfp;

[[[_levehiculearemorquer],"divers\metiers\depanneur\lourde\debug_quand_vehicule_detacher.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
waitUntil {sleep 2; velocityModelSpace _levehiculearemorquer select 2 == 0};

_levehiculearemorquer setvariable ["jesuisattacher",nil,true];
_levehiculearemorquer enablesimulation true;

hint format['Le véhicule de type %1 à bien été treuillé à ta dépanneuse !',typeOf _levehiculearemorquer];

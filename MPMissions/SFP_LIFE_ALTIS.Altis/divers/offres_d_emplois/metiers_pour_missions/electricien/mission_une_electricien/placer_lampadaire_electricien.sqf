// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


// -------------------------- Vérification du joueur dans le trigger ----------------------------------- //
if (player distance (getpos nomdusecteur_valide_pour_marker) > 100) exitwith {hint "Désolé, tu n'es pas dans l'endroit demandé par ton patron !";};
hint "! TRAVAIL ! \n -------------------------------------------- \n \n Place maintenant le lampadaire dans un endroit adéquat pour terminer ta mission ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";


// -------------------------- Création du lampadaire ----------------------------------- //
_lampadairecreer = createVehicle ["Land_LampDecor_F", getPosATL player, [], 0, '']; 
_lampadairecreer attachTo [player,[0,0.8,1]];

// -------------------------- Installation du lampadaire si condition ok ----------------------------------- //
jeposelelampadaire = 0;

poser_le_lampadaire = 
{
	_surface = surfaceType getPosATL player;
	_verificationsurface = ["#GdtGrassShort","#GdtGrassTall","#GdtBeach","#GdtDesert","#GdtSoil","#GdtDirt","#GdtGrassGreen","#GdtGrassDry","#GdtForestPine","#GdtDead"];
	if !(_surface in _verificationsurface) exitwith {hint "Tu ne peux pas mettre de lampadaire ici ! \n\n Tu ne peux le mettre que dans la terre et l'herbe !";};
	if (speed player > 0.1) exitwith {hint "Arrete toi avant de poser un lampadaire !";};
	jeposelelampadaire = 1;
};

// -------------------------- Menu Addaction ----------------------------------- //
menumissionsupprimerlampadaireelectricien = player addAction ["<t color=""#ff0000"">" + "Poser Le Lampadaire",poser_le_lampadaire,"",10,true,true,"",""];
player removeAction menumissioncreerlampadaireelectricien;


// -------------------------- Fin quand Lampadaire posé ----------------------------------- //
waituntil {alive player && jeposelelampadaire == 1};
detach _lampadairecreer;
player removeAction menumissionsupprimerlampadaireelectricien;


_prime = (20 + (random 50));
hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Le lampadaire à bien été posé ! \n\n Une prime de %1 Euros ta été donné pour le bon boulot accompli ;) \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_prime];	
player setVariable ["mon_argent_banque_by_sfp_maxou", (player getVariable "mon_argent_banque_by_sfp_maxou") + _prime,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
jepeuxchoisiruntravail = 0;
deleteMarkerLocal "missionelectricien";
player setVariable["jesuisalleralamissiondemonpatron",1,false];
execvm "divers\offres_d_emplois\metiers_pour_missions\electricien\demarrer_mission_electricien.sqf";
sleep 300;
deletevehicle _lampadairecreer;
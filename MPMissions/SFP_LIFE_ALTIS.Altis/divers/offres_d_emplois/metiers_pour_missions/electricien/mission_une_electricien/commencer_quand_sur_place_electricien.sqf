// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position_a_rechercher = getpos nomdusecteur_valide_pour_marker;
waituntil {player distance _position_a_rechercher < 20};

hint "! TRAVAIL ! \n -------------------------------------------- \n Très bien ! \n\n Maintenant que tu es sur place, il te suffit, avec le menu déroulant de placer un lampadaire dans une zone adéquate ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";	
menumissioncreerlampadaireelectricien = player addAction ["<t color=""#ff0000"">" + "Placer Un Lampadaire","divers\offres_d_emplois\metiers_pour_missions\electricien\mission_une_electricien\placer_lampadaire_electricien.sqf","",10,true,true,"",""];

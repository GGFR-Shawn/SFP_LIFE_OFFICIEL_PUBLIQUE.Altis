// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


waituntil {player distance position_tondre_herbe < 40};

hint "! TRAVAIL ! \n -------------------------------------------- \n Très bien ! \n\n Maintenant que tu es sur place, il te suffit, avec le menu déroulant de tondre l'herbe à proximité de ta position ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";	

menumissiontondrelapelouse = player addAction ["<t color=""#ff0000"">" + "Tondre La Pelouse","divers\offres_d_emplois\metiers_pour_missions\tondre_pelouse\mission_une_tondre_pelouse\tondre_la_pelouse.sqf","",10,true,true,"",""];

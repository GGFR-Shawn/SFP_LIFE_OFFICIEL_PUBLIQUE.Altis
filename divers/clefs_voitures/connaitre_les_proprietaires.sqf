// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if((lbCurSel 1501) == -1) exitwith {Hint "! PRET DE CLEFS ! \n\n Désolé, tu n'as pas selectionné de voitures ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if(lbtext [1501,0] == "Aucun véhicules trouvés !") exitwith {Hint "! PRET DE CLEFS ! \n\n Désolé mais aucun véhicules trouvés n'est pas valable ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

_numero_liste_deroulante = lbCurSel 1501;
voiture_selectionne = les_voitures_trouves select _numero_liste_deroulante;
if (voiture_selectionne getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "Désolé, tu n'es pas le propriétaire principal !";};

_les_proprietaires = voiture_selectionne getvariable 'vehicule_info_parvariable';

hint format ["! PRET DE CLEFS ! \n ------------------------------------------ \n Voici la liste des personnes possédant les clefs du %1 : \n\n %2 !\n --------------------------------------------- \n SFP TEAM \n www.sfpteam.fr ",getText ( configFile >> "CfgVehicles" >> typeOf(voiture_selectionne) >> "displayName"),_les_proprietaires];
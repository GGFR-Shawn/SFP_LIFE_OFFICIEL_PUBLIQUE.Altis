// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
	
if((lbCurSel 1500) == -1) exitwith {Hint "! PRET DE CLEFS ! \n\n Désolé, tu n'as pas selectionné de joueurs ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if((lbCurSel 1501) == -1) exitwith {Hint "! PRET DE CLEFS ! \n\n Désolé, tu n'as pas selectionné de voitures ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if(lbtext [1500,0] == "Aucun joueurs trouvés !") exitwith {Hint "! PRET DE CLEFS ! \n\n Désolé mais aucun véhicules/joueurs trouvés n'est pas valable ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if(lbtext [1501,0] == "Aucun véhicules trouvés !") exitwith {Hint "! PRET DE CLEFS ! \n\n Désolé mais aucun véhicules/joueurs trouvés n'est pas valable ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

_numero_liste_vehicules = lbCurSel 1501;
voiture_selectionne = les_voitures_trouves select _numero_liste_vehicules;
if (voiture_selectionne getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "Désolé, tu n'es pas le propriétaire principal !";};
if (isnil "voiture_selectionne") exitwith {hint "Erreur selection de la voiture, recommence !"; closedialog 0;};

_nom_ajout_proprietaire = lbtext [1500, lbCurSel 1500];
if (isnil "_nom_ajout_proprietaire") exitwith {hint "Erreur selection joueur, recommence !"; closedialog 0;};
_nouveau_proprietaire = voiture_selectionne getvariable 'vehicule_info_parvariable';
if !(_nom_ajout_proprietaire in _nouveau_proprietaire) exitwith {hint format ["Désolé, %1 n'à pas les clefs du %2 !",_nom_ajout_proprietaire,getText ( configFile >> "CfgVehicles" >> typeOf(voiture_selectionne) >> "displayName")];};
_nouveau_proprietaire = _nouveau_proprietaire - [_nom_ajout_proprietaire];

voiture_selectionne setvariable ["vehicule_info_parvariable",_nouveau_proprietaire,true];

[[[voiture_selectionne,_nouveau_proprietaire],"divers\clefs_voitures\syncro_JIP_pret_clefs.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

hint format ["! PRET DE CLEFS ! \n ------------------------------------------ \n Les clefs de la voiture de type %1 ont bien étées reprit à %2 ! \n\n La nouvelle liste des personnes possédant les clefs du %1 sont : \n\n %3 !\n --------------------------------------------- \n SFP TEAM \n www.sfpteam.fr ",getText ( configFile >> "CfgVehicles" >> typeOf(voiture_selectionne) >> "displayName"),_nom_ajout_proprietaire,_nouveau_proprietaire];


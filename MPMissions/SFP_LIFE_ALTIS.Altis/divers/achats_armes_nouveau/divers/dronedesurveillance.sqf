// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
_argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_choix_selectionne_drone = lbCurSel 1500;
_drone_a_creer = liste_recherche_informations_armes select _choix_selectionne_drone;
_son_nom = getText ( configFile >> "CfgVehicles" >> _drone_a_creer >> "displayName");
_son_prix = prix_de_depart select _choix_selectionne_drone; 

if (isnil "_argent_actuellement") exitwith {hint "Erreur, recommence ...";};
if (isnil "_choix_selectionne_drone") exitwith {hint "Erreur, recommence ...";};
if (isnil "_drone_a_creer") exitwith {hint "Erreur, recommence ...";};
if (isnil "_son_nom") exitwith {hint "Erreur, recommence ...";};
if (isnil "_son_prix") exitwith {hint "Erreur, recommence ...";};

if (_argent_actuellement < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];};
if (!isClass (configFile >> "CfgVehicles" >> (liste_recherche_informations_armes select (lbCurSel 1500)))) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
if(revive_mon_side != west) exitwith {hint "Impossible, vous n'etes pas du GIGN drone !";};


closeDialog 0;

player setVariable ['mon_argent_banque_by_sfp_maxou', _argent_actuellement - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

hint format['Vous avez acheté un %1 pour %2 Euros! Il vous reste %3 Euros !', _son_nom, (_son_prix) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

player addBackpack _drone_a_creer;
player addItem "B_UavTerminal"; 
player assignItem "B_UavTerminal"

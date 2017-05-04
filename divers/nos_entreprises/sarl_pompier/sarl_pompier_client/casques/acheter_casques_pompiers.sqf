// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private ["_son_prix","_remise"];
_argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_choix_selectionne_casque = lbCurSel 1500;
_casque_a_creer = liste_recherche_informations_casques_pompier select _choix_selectionne_casque;
_son_nom = getText ( configFile >> "cfgWeapons" >> _casque_a_creer >> "displayName");
_son_prix = prix_de_depart select _choix_selectionne_casque; 


if (isnil "_argent_actuellement") exitwith {hint "Erreur, recommence ...";};
if (isnil "_choix_selectionne_casque") exitwith {hint "Erreur, recommence ...";};
if (isnil "_casque_a_creer") exitwith {hint "Erreur, recommence ...";};
if (isnil "_son_nom") exitwith {hint "Erreur, recommence ...";};
if (isnil "_son_prix") exitwith {hint "Erreur, recommence ...";};
if (_argent_actuellement < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];};
if (!isClass (configFile >> "cfgWeapons" >> (liste_recherche_informations_casques_pompier select _choix_selectionne_casque))) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce casque ! \n\n Télécharger le sur www.sfpteam.fr ...";};

player addheadgear (liste_recherche_informations_casques_pompier select _choix_selectionne_casque);

player setVariable ['mon_argent_banque_by_sfp_maxou', _argent_actuellement - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format ['! ACHAT CASQUE ! \n -------------------- \n\n Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou', _son_nom, _son_prix, (player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

closeDialog 0;
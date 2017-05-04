// =======================================================================================================================================================================================
												// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
												  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil {player getvariable "je_possede_un_telephone_sfp"}) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de téléphone ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 1 < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, votre téléphone est eteint ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 2 <= 0) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez plus de SMS ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (blackout_reseau_telecom > 0) exitwith {Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Désolé, un black-out réseau est en cours ! \n\n Réparation estimé : %1 Minutes. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr",round (blackout_reseau_telecom)];};
if (force_du_signal_telephone_by_maxou < 1) exitwith {Hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé, vous n'avez pas de reseaux ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

le_nom_selectionne = lbText [1500,lbCurSel 1500];
if (le_nom_selectionne == "Aucun message reçu") exitwith {hint "Personne n'est selectionné ...";};
if (lbCurSel 1500 == -1) exitwith {hint "Personne n'est selectionné ...";};


if (le_nom_selectionne == "Aux Civils") exitwith {hint "Vous ne pouvez repondre qu'a un joueur directement ...";};
if (le_nom_selectionne == "Aux Gendarmes") exitwith {hint "Vous ne pouvez repondre qu'a un joueur directement ...";};
if (le_nom_selectionne == "Aux Pompiers") exitwith {hint "Vous ne pouvez repondre qu'a un joueur directement ...";};
if (le_nom_selectionne == "Aux Depanneurs") exitwith {hint "Vous ne pouvez repondre qu'a un joueur directement ...";};
if (le_nom_selectionne == "Aux Taxis") exitwith {hint "Vous ne pouvez repondre qu'a un joueur directement ...";};

createdialog "Chat_Repondre_A_Un_Joueur";
ctrlSetText[1001,format["%1",le_nom_selectionne]];
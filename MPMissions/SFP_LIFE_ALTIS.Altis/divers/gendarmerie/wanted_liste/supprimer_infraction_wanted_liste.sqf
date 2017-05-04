// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "heure_serveur"};

if (revive_mon_side != west) exitwith {hint "Vous n'etes pas gendarme ...";};
if ((lbtext [1500, lbCursel 1500]) == "Aucune infraction signalée ...") exitwith {hint "Désolé, il n'y à rien à supprimer !";}; 
if (lbCurSel 1500 == -1) exitwith {hint "Selectionne une infraction ...";}; 
if (isnil {(joueur_wanted_liste getvariable 'infraction_wanted_liste') select (lbCurSel 1500)}) exitwith {hint "Selectionne une infraction ...";}; 

_check_info_une_nom = name joueur_wanted_liste;
_quoi_supprimer = lbCurSel 1500;
_le_text = (joueur_wanted_liste getvariable 'infraction_wanted_liste') select _quoi_supprimer;

_action_le_joueur_wanted_liste = joueur_wanted_liste getvariable 'infraction_wanted_liste';
_action_le_joueur_wanted_liste = _action_le_joueur_wanted_liste - [_le_text];

joueur_wanted_liste setvariable ["infraction_wanted_liste",_action_le_joueur_wanted_liste,true];

hint format ["! INFRACTIONS ALTIS ! \n ------------------------------------- \n\n Salut %1, \n L'infraction concernant %2 à bien été supprimée de son casier ! \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name player, _check_info_une_nom];

execvm "divers\gendarmerie\wanted_liste\mise_a_jour_wanted_liste.sqf";


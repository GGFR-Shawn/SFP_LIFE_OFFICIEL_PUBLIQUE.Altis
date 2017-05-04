// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "heure_serveur"};

private ["_heure_wanted_liste","_check_info_une_agent","_check_info_une_linfraction","_check_info_une_nom"];
if (count (joueur_wanted_liste getvariable "infraction_wanted_liste") >= 15) exitwith {hint "Désolé, la liste d'infraction du joueur est pleine ... \n\n Supprime en ...";};
if (revive_mon_side != west) exitwith {hint "Vous n'etes pas gendarme ...";};

choix_texte_wanted_liste = nil;
createDialog "Menu_Choix_texte_wanted_liste";
waituntil {!isnil "choix_texte_wanted_liste" or !dialog};
if (isnil "choix_texte_wanted_liste") exitwith {hint "Opération annulée ...";};

_heure_wanted_liste = format ["%1/%2/%3",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0];
_check_info_une_agent = name player;
_check_info_une_linfraction = choix_texte_wanted_liste;
_check_info_une_nom = name joueur_wanted_liste; // Non enregistré

_inscription_personnalise = format ["%1 %2 : %3",_heure_wanted_liste, _check_info_une_agent, _check_info_une_linfraction];

_action_le_joueur_wanted_liste = joueur_wanted_liste getvariable 'infraction_wanted_liste';
_action_le_joueur_wanted_liste pushback _inscription_personnalise;

joueur_wanted_liste setvariable ["infraction_wanted_liste",_action_le_joueur_wanted_liste,true];

hint format ["! INFRACTIONS ALTIS ! \n ------------------------------------- \n\n Salut %1, \n\n L'infraction : \n\n %2 \n\n concernant %3 à bien été émise ! \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name player,_check_info_une_linfraction,_check_info_une_nom];

execvm "divers\gendarmerie\wanted_liste\mise_a_jour_wanted_liste.sqf";

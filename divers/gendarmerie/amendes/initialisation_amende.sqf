// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

le_joueur_pour_mettre_amende = cursorTarget;

if (isNull le_joueur_pour_mettre_amende) exitWith {hint "Personne n'est selectionné pour se prendre une amende !"};
if (!isnil {le_joueur_pour_mettre_amende getvariable "besoin_d_un_revive_news"}) exitwith {hint "Désolé, tu ne peux pas faire cette action puisque le joueur attend d'etre revive !";};
if (side le_joueur_pour_mettre_amende == west) exitWith {hint "Tu ne peux pas mettre d'amende à un gendarme !"};
if !(le_joueur_pour_mettre_amende iskindof "man") exitwith {hint "Désolé, ce n'est pas un joueur";};
if ((cursortarget distance player) >= 8) exitWith {hint "La personne est trop loin pour se prendre une amende !"};

execvm "divers\gendarmerie\amendes\ouvrir_menu_amendes.sqf";

waituntil {dialog;};
waituntil {!dialog;};

hint "! INFRACTIONS ALTIS ! \n ------------------------------------- \n\n Merci d'indiquer SANS APPOSTROCHE NI D'ACCENT la raison de votre amende pour l'inscrire dans le casier judiciaire ! \n\n Merci. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
[0,0,0,[1]] execvm "divers\gendarmerie\wanted_liste\check_wanted_liste_nouveau.sqf";

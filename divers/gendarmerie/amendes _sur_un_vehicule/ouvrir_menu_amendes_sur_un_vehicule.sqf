// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = cursortarget;
if (isnil "_le_vehicule") exitwith {hint "Erreur sur le véhicule, recommence ...";};
if (isnil {_le_vehicule getvariable "plaque_immatriculation_news"}) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Ce n'est pas le véhicule d'un joueur ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (_le_vehicule getvariable "vehicule_info_parvariable" select 0 == name player) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Tu ne peux pas mettre d'amende sur ton véhicule ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (!isnil {_le_vehicule getvariable "amende_vehicule"}) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Le véhicule a déja une amende ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (!alive _le_vehicule) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Ce véhicule est HS ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Le serveur redemarre bientot ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Amende_Sur_Un_Vehicule";

createDialog _nom_du_menu;
disableSerialization;

waituntil {!dialog;};
cutText["","BLACK IN"];
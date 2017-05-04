// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (floor parseNumber (ctrlText 1400) <= 0) exitwith {hint "! ARGENT GENDARMERIE ! \n -------------------------------------------- \n Désolé, \n\n Le montant n'est pas valable ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
if (floor parseNumber (ctrlText 1400) > argent_de_la_gendarmerie select 1) exitwith {hint "! ARGENT GENDARMERIE ! \n -------------------------------------------- \n Désole, \n\n Pas assez de fond sur le compte de la gendarmerie ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 

_argent_actuel = argent_de_la_gendarmerie select 1;
_argent_demande = floor parseNumber (ctrlText 1400);

hint format ["! ARGENT GENDARMERIE ! \n -------------------------------------------- \n\n Le montant de %1 %2 des %3 %2 du compte de la gendarmerie ont bien étés virés sur votre compte banquaire ! \n\n Il reste donc %4 %2. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", (_argent_demande) call retour_formatage_chiffre_sfp, "€", (round (argent_de_la_gendarmerie select 1)) call retour_formatage_chiffre_sfp, (round ((argent_de_la_gendarmerie select 1) - _argent_demande)) call retour_formatage_chiffre_sfp];

player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + _argent_demande,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 
argent_de_la_gendarmerie = [argent_de_la_gendarmerie select 0, round ((argent_de_la_gendarmerie select 1) - _argent_demande)];
publicvariable "argent_de_la_gendarmerie";

_heure_du_log = format ["%1/%2/%3 à %4H%5Min:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
_format_du_log = format ["%1 a prit %2 %3 des %4 %3 du compte de la gendarmerie.", name player, (_argent_demande) call retour_formatage_chiffre_sfp, "€", (round ((argent_de_la_gendarmerie select 1) + _argent_demande)) call retour_formatage_chiffre_sfp];
["Historique fond_argent_de_la_gendarmerie", "Historique fond_argent_de_la_gendarmerie", _heure_du_log, _format_du_log] call fn_SaveToServer;

closedialog 0;
execvm "divers\gendarmerie\compte_de_la_gendarmerie\menu_argent_gendarmerie.sqf";
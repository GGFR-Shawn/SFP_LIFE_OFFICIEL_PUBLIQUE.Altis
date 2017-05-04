// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if(floor parseNumber (ctrlText 22228) == -1) exitwith {Hint "! SARL DIR ! \n -------------------------------------------- \n \n Il faut obligatoirement définir un taux ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
if(floor parseNumber (ctrlText 22228) > 1000) exitwith {Hint "! SARL DIR ! \n -------------------------------------------- \n \n Désolé tu ne peux pas mettre un taux au dessus de 1000 ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
if(floor parseNumber (ctrlText 22228) == 0) exitwith {Hint "! SARL DIR ! \n -------------------------------------------- \n \n Désolé, 0 n'est pas valable ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
if((ctrlText 22228) == "") exitwith {Hint "! SARL DIR ! \n -------------------------------------------- \n \n Il faut obligatoirement définir un taux ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 


le_taux_choisit_sarl_depannage = parseNumber (ctrlText 22228);
closeDialog 0;
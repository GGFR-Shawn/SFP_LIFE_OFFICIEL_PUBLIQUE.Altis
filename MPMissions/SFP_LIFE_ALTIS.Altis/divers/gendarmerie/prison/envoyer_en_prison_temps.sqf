// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nomducivil = cursortarget;
if(floor parseNumber (ctrlText 11116) > 30) exitwith {Hint "! PRISON ! \n\n Désolé, tu ne peux pas mettre un joueur plus de 30 minutes en prison ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";}; 
if((ctrlText 11116) == "") exitwith {Hint "! PRISON ! \n\n Tu n'as rien entré en minutes ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

if(floor parseNumber (ctrlText 11116) > 0) then 
{
		closeDialog 0;		
		tempsdeprisonenminutes = (floor parseNumber (ctrlText 11116));
};
// =====================================================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

if ((ctrlText 1400) == "") exitwith {hint "Désolé, rien n'est tapé !";}; 
if ((ctrlText 1400) == "   Taper votre texte ...") exitwith {hint "Désolé, rien n'est tapé !";}; 

choix_texte_wanted_liste = (ctrlText 1400);

closeDialog 0;

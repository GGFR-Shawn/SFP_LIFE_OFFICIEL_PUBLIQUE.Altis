// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (player getvariable "gelule_amphetamines" >= 2) exitwith {hint "Désolé, tu as atteint le maximum d'amphétamines !";};

hint format ["Salut %1, \n\n Grace aux amphétamines tu vas pouvoir courir plus longtemps et récupérer plus rapidement ! \n\n Tu es limité à deux gélules par achat ! \n Egalement l'effet dure environ 30 minutes par gélule !",name player];
player setvariable ["gelule_amphetamines",(player getvariable "gelule_amphetamines") + 1,true];


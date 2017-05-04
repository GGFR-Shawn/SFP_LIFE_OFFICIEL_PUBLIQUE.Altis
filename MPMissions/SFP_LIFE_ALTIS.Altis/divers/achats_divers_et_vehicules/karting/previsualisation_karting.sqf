// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "message_brut_modele") then
{
	message_brut_modele = 1;
	hint "Attention, les prévualisation sont affichées en version BRUT, c'est à dire en skin d'origine !";
};

if((lbCurSel 1500) == 0) then {hint "Désolé, arma n'a pas rendu possible la prévisualisation !";};

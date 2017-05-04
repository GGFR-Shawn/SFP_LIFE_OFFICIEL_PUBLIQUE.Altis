// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "jaijouerauloto") then {jaijouerauloto = 0;};
if (isnil "jaijoueraleurommillion") then {jaijoueraleurommillion = 0;};

createDialog "FrancaiseDesJeux";
ctrlSetText[11172,format["Argent : %1 Euros",(player getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp]];
	
lbAdd[11173,"Loto : Taper votre mise"];
lbAdd[11173,"Euromillion : Taper votre mise"];

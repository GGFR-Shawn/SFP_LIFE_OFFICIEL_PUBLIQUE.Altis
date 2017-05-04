// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "message_brut_modele") then
{
	message_brut_modele = 1;
	hint "Attention, les prévualisation sont affichées en version BRUT, c'est à dire en skin d'origine !";
};

if(revive_mon_side == west) then
{
	hint "Aucune prévualisation disponible !";
};

if (revive_mon_side == civilian) then
{
	if((lbCurSel 1500) == 0) then {createdialog "O_Heli_Light_SFP";};
	if((lbCurSel 1500) == 1) then {createdialog "O_Heli_Light_SFP";};
	if((lbCurSel 1500) == 2) then {createdialog "LittleBird_SFP";};
};
ctrlSetText[11172,"By Maxou."];
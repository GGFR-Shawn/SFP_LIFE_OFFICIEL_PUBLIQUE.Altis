// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "message_brut_modele") then {message_brut_modele = 1; hint "Attention, les prévualisation sont affichées en version BRUT, c'est à dire en skin d'origine !";};

_numero_add = 0;
if (revive_mon_side == civilian) then
{
	if((lbCurSel 1500) == _numero_add) then {createdialog "quad_sfp";}; _numero_add = round (_numero_add + 1);
	if((lbCurSel 1500) == _numero_add) then {createdialog "OffRoad_sfp";}; _numero_add = round (_numero_add + 1);
	if((lbCurSel 1500) == _numero_add) then {createdialog "Ifrit_Non_Arme_SFP";}; _numero_add = round (_numero_add + 1);
	if((lbCurSel 1500) == _numero_add) then {createdialog "UAZ_Arme_SFP";}; _numero_add = round (_numero_add + 1);
	if((lbCurSel 1500) == _numero_add) then {createdialog "OffRoad_sfp";}; _numero_add = round (_numero_add + 1);
	if((lbCurSel 1500) == _numero_add) then {createdialog "SFP_jeep_blinde_Dialogue";}; _numero_add = round (_numero_add + 1);
	if((lbCurSel 1500) == _numero_add) then {createdialog "O_T_LSV_02_armed_F_SFP";}; _numero_add = round (_numero_add + 1);
	if((lbCurSel 1500) == _numero_add) then {createdialog "O_T_LSV_02_armed_F_SFP";}; _numero_add = round (_numero_add + 1);
	if((lbCurSel 1500) == _numero_add) then {createdialog "I_C_Offroad_02_unarmed_F_SFP";}; _numero_add = round (_numero_add + 1);
};

ctrlSetText[11172,"By Maxou."];
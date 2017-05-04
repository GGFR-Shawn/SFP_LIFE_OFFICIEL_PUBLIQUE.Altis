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
	if((lbCurSel 1500) == 0) then {createdialog "B_Boat_Transport_SFP";};
	if((lbCurSel 1500) == 1) then {createdialog "B_Boat_Civil_SFP";};
	if((lbCurSel 1500) == 2) then {createdialog "B_Boat_Minigun_SFP";};
	if((lbCurSel 1500) == 3) then {createdialog "Sous_Marin_SFP";};
	if((lbCurSel 1500) == 4) then {createdialog "I_C_Boat_Transport_02_F_SFP";};
};

if (revive_mon_side == civilian) then
{
	if((lbCurSel 1500) == 0) then {createdialog "Barque_Civil_SFP";};
	if((lbCurSel 1500) == 1) then {createdialog "B_Boat_Civil_SFP";};
	if((lbCurSel 1500) == 2) then {createdialog "Chalutier_SFP_Dialogue";};
	if((lbCurSel 1500) == 3) then {createdialog "Burnes_MK10_1_Dialogue";};
	if((lbCurSel 1500) == 4) then {createdialog "I_C_Boat_Transport_02_F_SFP";};
	if((lbCurSel 1500) == 5) then {createdialog "C_Scooter_Transport_01_F_SFP";};
};
ctrlSetText[11172,"By Maxou."];
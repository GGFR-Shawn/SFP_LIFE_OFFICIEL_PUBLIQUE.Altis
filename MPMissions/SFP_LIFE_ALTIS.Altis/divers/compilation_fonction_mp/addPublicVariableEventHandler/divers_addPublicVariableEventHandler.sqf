// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"joueuravertitpaiement" addPublicVariableEventHandler 
{
	if (name player == nomjoueuravertitpaiementamende) then
	{
		createdialog "Dialogue_banque_amende_sur_joueur";
		montantdelamende = tresorpublique;
		ctrlSetText[11115,format["Argent en banque : %1 Euros",(player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp]];
		ctrlSetText[11116,format["Montant Amende : %1", montantdelamende]];
		noesckeydeux = (findDisplay 4844) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
	};
};


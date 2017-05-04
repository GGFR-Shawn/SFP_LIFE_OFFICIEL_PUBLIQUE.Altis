// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


waituntil {!isnil "j_accepte_de_payer_l_amende"};

if (j_accepte_de_payer_l_amende == 1) then
{
	player globalChat format["%1 a accepter de payer l'amende d'un montant de %2 Euros adressé par le gendarme %3.",nomjoueuravertitpaiementamende,tresorpublique,nomflicdresseamende];
};

if (j_accepte_de_payer_l_amende == 2) then
{
	player globalChat format["%1 n'a pas voulu payer l'amende d'un montant de %2 Euros adressé par le gendarme %3.",nomjoueuravertitpaiementamende,tresorpublique,nomflicdresseamende];
};

if (j_accepte_de_payer_l_amende == 3) then
{
	player globalChat format["%1 n'a pas voulu payer l'amende d'un montant de %2 Euros adressé par le gendarme %3. Au vu de ses nombreux refus il à du la payer obligatoirement !",nomjoueuravertitpaiementamende,tresorpublique,nomflicdresseamende];
};

j_accepte_de_payer_l_amende = nil;
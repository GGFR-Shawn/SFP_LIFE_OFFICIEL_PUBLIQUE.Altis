// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nomduflic = player;
_nomducivil = le_joueur_pour_mettre_amende;
if (isnil "_nomducivil") exitwith {hint "Erreur sur le civil, recommence ...";};

if (floor parseNumber (ctrlText 22228) > 0) then 
{
	if ((_nomducivil getVariable 'mon_argent_banque_by_sfp_maxou') >= floor parseNumber (ctrlText 22228)) then 
	{
		hint format["L'avis de contravention vient d'être envoyé à %1 ! Patiente qu'il prend une décision ...",name _nomducivil];
		closeDialog 0;		
		tresorpublique = (floor parseNumber (ctrlText 22228));
		publicVariable 'tresorpublique';
		nomjoueuravertitpaiementamende = name _nomducivil;
		publicVariable 'nomjoueuravertitpaiementamende';
		sleep 0.045;
		nomflicdresseamende = name _nomduflic;
		publicVariable 'nomflicdresseamende';
		sleep 0.045;
		publicVariable 'joueuravertitpaiement';
	}else
	{
		// hint format ["Désolé, %1 n'a pas assez d'argent, il n'à que %2 Euros en banque !", name _nomducivil, (_nomducivil getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		hint "Désolé, le joueur n'a pas assez d'argent ...";
	};
};
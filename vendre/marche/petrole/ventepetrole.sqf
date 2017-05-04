// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

hint format ["! MARCHE SFP ! \n -------------------------- \n\n Le prix actuel est de \n\n %1 euros l'unité ! \n\n Il suit les cours du marché ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou",prixdupetrole];
	
_valeurdufloor = floor parseNumber (ctrlText 11145);
if(_valeurdufloor > 0) then 
{
	if((player getVariable 'item_petrole_traite_sfp') >= _valeurdufloor) then 
	{
		_valeurdufloor spawn 
		{
			maj_prix_du_marche = ["prixdupetrole",_this,"-"]; publicvariable "maj_prix_du_marche";
			sleep 0.5;
			maj_prix_du_marche = ["prixdubois",_this,"+"]; publicvariable "maj_prix_du_marche";
		};

		player setVariable['item_petrole_traite_sfp',(player getVariable 'item_petrole_traite_sfp') - _valeurdufloor,true];
		player setVariable['mon_argent_poche_by_sfp_maxou',(player getVariable 'mon_argent_poche_by_sfp_maxou') + (prixdupetrole * _valeurdufloor),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable['usedspace',(player getVariable 'usedspace') - (10 * _valeurdufloor),true];
		closeDialog 0; // Ne pas oublier
		sleep 5; // Ne pas oublier
		hint format ["Vous avez gagné %1 Euros !",(prixdupetrole * _valeurdufloor)];
		sleep 3;
		hint format ["Vous avez maintenant %1 euros sur vous.", (player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 et devez avoir %2",(player getVariable 'item_petrole_traite_sfp'),(_valeurdufloor)];
	};
};
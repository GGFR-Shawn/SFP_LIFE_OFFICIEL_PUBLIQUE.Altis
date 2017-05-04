// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private "_cuivreprocessprice";
_cuivreprocessprice = 2;

if(floor parseNumber (ctrlText 11133) >= 1) then 
{
	if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= (_cuivreprocessprice * floor parseNumber (ctrlText 11133))) then 
		{
			if((player getVariable 'item_cuivre_non_transforme_sfp') >= floor parseNumber (ctrlText 11133)) then 
			{
				hint format ["Vous avez payé %1 euros de traitement du cuivre !",(_cuivreprocessprice * floor parseNumber (ctrlText 11133)),true];
				player setVariable['item_cuivre_non_transforme_sfp',(player getVariable 'item_cuivre_non_transforme_sfp') - floor parseNumber (ctrlText 11133),true];
				player setVariable['item_cuivre_transforme_sfp',(player getVariable 'item_cuivre_transforme_sfp') +  floor parseNumber (ctrlText 11133),true];
				player setVariable['mon_argent_poche_by_sfp_maxou',(player getVariable 'mon_argent_poche_by_sfp_maxou') - (_cuivreprocessprice * floor parseNumber (ctrlText 11133)),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				closeDialog 0;
				sleep 3;
				hint format ["Vous avez %1 lingot de cuivre sur vous !",player getVariable 'item_cuivre_transforme_sfp'];
			}
			else
			{
				Hint format ["Vous avez %1 unités de cuivre non transformées et devez avoir %2 !",(player getVariable 'item_cuivre_non_transforme_sfp'),(floor parseNumber (ctrlText 11133))];
			};
		}
		else
		{
			Hint format ["Vous avez %1 euros et vous devez avoir %2 euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(_cuivreprocessprice * floor parseNumber (ctrlText 11133)),true];
		};
};

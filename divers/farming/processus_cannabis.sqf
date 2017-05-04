// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private "_cannabisfraisdetransformation";
_cannabisfraisdetransformation = sfp_config_prix_transformation_cannabis;

if (!isnil {player getvariable "licence_cannabis"}) then
{
	if(floor parseNumber (ctrlText 11133) >= 1) then 
	{
		if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= (_cannabisfraisdetransformation * floor parseNumber (ctrlText 11133))) then 
			{
				if((player getVariable 'item_cannabis_non_traite_sfp') >= floor parseNumber (ctrlText 11133)) then 
				{
					player setVariable['item_cannabis_non_traite_sfp',(player getVariable 'item_cannabis_non_traite_sfp') - floor parseNumber (ctrlText 11133),true];
					player setVariable['item_cannabis_traite_sfp',(player getVariable 'item_cannabis_traite_sfp') +  floor parseNumber (ctrlText 11133),true];
					player setVariable['mon_argent_poche_by_sfp_maxou',(player getVariable 'mon_argent_poche_by_sfp_maxou') - (_cannabisfraisdetransformation * floor parseNumber (ctrlText 11133)),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
					closeDialog 0;
					hint format ["Vous avez maintenant moins de %1 kilos de cannabis traités sur vous ! Attention de ne pas vous faire attraper par les gendarmes ... \n Maintenant apporter le cannabis au marché noir !",player getVariable 'item_cannabis_traite_sfp'];
				}
				else
				{
					Hint format ["Vous avez %1 kgs de cannabis non traité et devez en avoir %2 !",(player getVariable 'item_cannabis_non_traite_sfp'),(floor parseNumber (ctrlText 11133))];
				};
			}
			else
			{
				Hint format ["Vous avez %1 euros et vous devez avoir %2 euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(oilprocessprice * floor parseNumber (ctrlText 11133))];
			};
	};
}
else
{
	Hint "Vous avez besoin d'une formation pour traiter le cannabis ! Vous trouverez cette formation au sud de la carte !"
};
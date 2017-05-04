// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private "_prix_traitement_heroine";
_prix_traitement_heroine = sfp_config_prix_transformation_heroine;

if (!isnil {player getvariable "licence_heroine"}) then
{
	if(floor parseNumber (ctrlText 11133) >= 1) then 
	{
		if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= (_prix_traitement_heroine * floor parseNumber (ctrlText 11133))) then 
			{
				if((player getVariable 'item_heroine_non_traite_sfp') >= floor parseNumber (ctrlText 11133)) then 
				{
					player setVariable['item_heroine_non_traite_sfp',(player getVariable 'item_heroine_non_traite_sfp') - floor parseNumber (ctrlText 11133),true];
					player setVariable['item_heroine_traite_sfp',(player getVariable 'item_heroine_traite_sfp') +  floor parseNumber (ctrlText 11133),true];
					player setVariable['mon_argent_poche_by_sfp_maxou',(player getVariable 'mon_argent_poche_by_sfp_maxou') - (_prix_traitement_heroine * floor parseNumber (ctrlText 11133)),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
					closeDialog 0;
					hint format ["Vous avez %1 sachet d'héroïne traités sur vous ! Attention de ne pas vous faire attrapé par les flics ... Maintenant apporter l'héroine au marché noir !",player getVariable 'item_heroine_traite_sfp'];
				}
				else
				{
					Hint format ["Vous avez %1 et devez avoir %2",(player getVariable 'item_heroine_non_traite_sfp'),(floor parseNumber (ctrlText 11133))];
				};
			}
			else
			{
				Hint format ["Vous avez %1 euros et vous devez avoir %2 euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (oilprocessprice * floor parseNumber (ctrlText 11148))];
			};
	};
}
else
{
	Hint "Vous avez besoin d'une formation pour traiter l'héroïne ! Vous trouverez cette formation au sud de la carte !"
};
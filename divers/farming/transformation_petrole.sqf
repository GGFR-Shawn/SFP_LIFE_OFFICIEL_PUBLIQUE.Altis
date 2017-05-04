// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if(!isnil {player getvariable "licence_petrole"}) then
{
	if(floor parseNumber (ctrlText 11148) >= 1) then 
	{
		if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= (sfp_config_prix_transformation_petrole * floor parseNumber (ctrlText 11148))) then 
		{
			if((player getVariable 'item_petrole_non_traite_sfp') >= floor parseNumber (ctrlText 11148)) then 
			{
				player setVariable['item_petrole_non_traite_sfp',(player getVariable 'item_petrole_non_traite_sfp') - floor parseNumber (ctrlText 11148),true];
				player setVariable['item_petrole_traite_sfp',(player getVariable 'item_petrole_traite_sfp') +  floor parseNumber (ctrlText 11148),true];
				closeDialog 0;
				hint format ["Vous avez %1 baril de Petrole traité sur vous.",player getVariable 'item_petrole_traite_sfp'];
				player setVariable['mon_argent_poche_by_sfp_maxou',((player getVariable 'mon_argent_poche_by_sfp_maxou') - (sfp_config_prix_transformation_petrole * floor parseNumber (ctrlText 11148))),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format ["Vous avez %1 baril de Petrole traité sur vous ! Vous avez payez 50 Euros par baril traité.",player getVariable 'item_petrole_traite_sfp'];
			}
			else
			{
				Hint format ["Vous avez 1% de Petrole non transformés et avez besoin d'%2.",(player getVariable 'item_petrole_non_traite_sfp'),floor parseNumber (ctrlText 11148),true];
			};
		}
		else
		{
			Hint format ["Vous avez %1 Euros et devez avoir %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(sfp_config_prix_transformation_petrole * floor parseNumber (ctrlText 11148)),true];
		};
	};
}
else
{
	Hint "Vous avez besoin d'un permis de transformation du Petrole !";
};
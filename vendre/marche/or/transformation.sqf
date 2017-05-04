// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private "_orprocessprice";
_orprocessprice = 11;

if(floor parseNumber (ctrlText 11133) >= 50) then 
{
	if((player getVariable 'mon_argent_poche_by_sfp_maxou') >= (_orprocessprice * floor parseNumber (ctrlText 11133))) then 
	{
		if((player getVariable 'item_or_non_transforme_sfp') >= 50) then 
		{
			hint format ["Vous avez payé %1 euros de traitement de l'or !",(_orprocessprice * floor parseNumber (ctrlText 11133)),true];
			player setVariable['item_or_non_transforme_sfp',(player getVariable 'item_or_non_transforme_sfp') - 50,true];
			player setVariable['item_or_transforme_sfp',(player getVariable 'item_or_transforme_sfp') +  1,true];
			player setVariable['mon_argent_poche_by_sfp_maxou',(player getVariable 'mon_argent_poche_by_sfp_maxou') - (_orprocessprice * floor parseNumber (ctrlText 11133)),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			closeDialog 0;
			sleep 3;
			hint format ["Vous avez %1 lingot d'or sur vous !",player getVariable 'item_or_transforme_sfp'];
		}else
		{
			Hint format ["Vous avez %1 grammes d'or non transformés et devez en avoir au minimum 50 !",(player getVariable 'item_or_non_transforme_sfp'),(floor parseNumber (ctrlText 11133))];
		};
	}else
	{
		Hint format ["Vous avez %1 euros et vous devez avoir %2 euros !",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp,(_orprocessprice * floor parseNumber (ctrlText 11133))];
	};
}else
{
	hint "Désolé, vous devez taper au minimum 50 !"
};

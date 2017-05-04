// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if(floor parseNumber (ctrlText 11139) > 0) then 
{
	if((player getVariable 'item_poissons_sfp') >= floor parseNumber (ctrlText 11139)) then 
	{
		player setVariable['item_poissons_sfp',(player getVariable 'item_poissons_sfp') - floor parseNumber (ctrlText 11139),true];
		player setVariable['usedspace',(player getVariable 'usedspace') - (floor parseNumber (ctrlText 11139)),true];
		closeDialog 0;
		player setVariable['itemfishpoissonspanes',(player getVariable 'itemfishpoissonspanes') + floor parseNumber (ctrlText 11139),true];
		player setVariable['usedspace',(player getVariable 'usedspace') + (floor parseNumber (ctrlText 11139)),true];
		hint format ["Vous avez maintenant %1 poissons panés !",(player getVariable 'itemfishpoissonspanes')];
		sleep 3;
	}
	else
	{
		Hint format ["Vous avez %1 poissons et vous devez en avoir %2 !",(player getVariable 'item_poissons_sfp'),(floor parseNumber (ctrlText 11139))];
	};
};
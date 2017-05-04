// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {player getvariable "licence_heroine"}) then 
{
	hassheroinprocesslicense = "Oui";
}else 
{
	hassheroinprocesslicense = "Non";
};
createDialog "HeroinProMenu";
ctrlSetText[11132,format["Héroïne non transformés: %1 II %2$/Unité",(player getVariable "item_heroine_non_traite_sfp"), sfp_config_prix_transformation_heroine]];
ctrlSetText[11163,format["%1",hassheroinprocesslicense]];
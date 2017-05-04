
if (!isnil {player getvariable "licence_cannabis"}) then 
{
	jailatransformationdecannabis = "Oui";
}else 
{
	jailatransformationdecannabis = "Non";
};
createDialog "CannabisProMenu";
ctrlSetText[11132,format["Cannabis non transformés: %1 II %2$/Unité",(player getVariable "item_cannabis_non_traite_sfp"), sfp_config_prix_transformation_cannabis]];
ctrlSetText[11163,format["%1",jailatransformationdecannabis]];
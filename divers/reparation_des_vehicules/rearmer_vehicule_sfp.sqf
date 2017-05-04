// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_nombre_munition";
_le_vehicule_sfp = _this select 3 select 0;
_le_type = typeof _le_vehicule_sfp;
_le_nom_du_vehicule_sfp = getText (configFile >> "cfgVehicles" >> _le_type >> "displayName");
_condition_trouve = false;
_tarif = 10000;
if (isnil"_le_vehicule_sfp" or isnil"_le_type" or isnil"_le_nom_du_vehicule_sfp") exitwith {hint "Erreur detection véhicule ...";};

switch _le_type do
{	
	case "B_Heli_Transport_GIGN_SFP" :
	{
		_nombre_munition = 0.3;
		_condition_trouve = true;
	};
	
	case "UAZ_MG" :
	{
		_nombre_munition = 3;
		_condition_trouve = true;
	};
	
	case "B_G_Offroad_01_armed_F" :
	{
		_nombre_munition = 0.8;
		_condition_trouve = true;
	};
};

if (_condition_trouve) then
{
	_le_vehicule_sfp setvehicleammo 0; 
	_le_vehicule_sfp setVehicleAmmo _nombre_munition;
	
	if (vehicle player != player) then
	{
		systemchat format ["%1 réarmé pour %2 Euros ...", _le_nom_du_vehicule_sfp, _tarif];
		player setVariable ["mon_argent_banque_by_sfp_maxou", (player getvariable "mon_argent_banque_by_sfp_maxou") - _tarif,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	}else
	{
		systemchat format ["%1 réarmé pour 0 Euros ...", _le_nom_du_vehicule_sfp];
	};
}else
{
	if (vehicle player != player) then
	{
		systemchat "Ce véhicule n'a pas besoin d'être réarmé ...";
	};
};
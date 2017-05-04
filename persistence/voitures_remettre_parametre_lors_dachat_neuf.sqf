// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_obj = _this select 0;
_vehicule_info_parvariable = _this select 1;
_numero_de_plaque = _this select 2;
_son_prix = _this select 3;
if (isnull _obj) exitwith {};	
waituntil {!isnil "sfp_config_listes_des_vehicules_interdit_de_plaques"};

if (isnil {_obj getvariable "vehicule_info_parvariable"}) then 
{
	if (!isnil "_vehicule_info_parvariable") then 
	{
		_obj setvariable ["vehicule_info_parvariable",_vehicule_info_parvariable,true];
	};
};

_condition = {_retour = false;if (isnil {_obj getvariable "plaque_immatriculation_news"}) then {_retour = true;};if !(isnil {_obj getvariable "plaque_immatriculation_news"}) then {if (count (_obj getvariable "plaque_immatriculation_news") < 2) then {_retour = true;};};_retour};
if ([] call _condition) then 
{
	if (!isnil "_numero_de_plaque") then 
	{
		if (typeof _obj in sfp_config_listes_des_vehicules_interdit_de_plaques) then 
		{
			_numero_de_plaque = [sfp_config_listes_des_plaques_non_flashables select 0, sfp_config_listes_des_plaques_non_flashables select 0];
		};
		_obj setvariable ["plaque_immatriculation_news",_numero_de_plaque,true];
	};
};

if (isnil {_obj getvariable "prix_du_vehicule_neuf"}) then 
{
	if (!isnil "_son_prix") then 
	{
		_obj setvariable ["prix_du_vehicule_neuf",_son_prix,true];
	};
};

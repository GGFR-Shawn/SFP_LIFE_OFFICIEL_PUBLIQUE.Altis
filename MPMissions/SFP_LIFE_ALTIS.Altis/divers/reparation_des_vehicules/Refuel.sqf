// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = _this select 3 select 0;
if (isnil "_condition") exitwith {};

if (_condition == 1) then
{
	if (vehicle player == player) exitwith {titletext ["Vous n'etes pas en véhicule !","PLAIN DOWN"];};
	if (driver assignedVehicle player != player) exitwith {titletext ["Vous n'etes pas le conducteur !","PLAIN DOWN"];};
	if (fuel vehicle player >= 1) exitwith {titletext ["Vous avez déja le reservoir plein !","PLAIN DOWN"];};
	if (isnil "operation_en_cours_refuel") then {operation_en_cours_refuel = 0;};
	if (operation_en_cours_refuel >= 1) exitwith {};
	operation_en_cours_refuel = 1;
	
	_veh = vehicle player;

	if (isEngineOn _veh) exitwith {operation_en_cours_refuel = nil; titletext ["Tu dois eteindre ton moteur pour remettre le plein !","PLAIN DOWN"];};
	if (((vehicle player) == player) && isnil {(vehicle player) getvariable "vehicule_info_parvariable"}) exitwith {operation_en_cours_refuel = nil; titletext ["Vous devez être dans un véhicule pour mettre le plein !","PLAIN DOWN"];};
	if (isnil "position_actuel_gasoil") then {position_actuel_gasoil = position vehicle player;};
	if (isnil "prix_du_gasoil_station") then {prix_du_gasoil_station = ((random 3) + 1);};
	
	if (!isnil "position_actuel_gasoil") then
	{
		if (position vehicle player distance position_actuel_gasoil > 50) then
		{
			position_actuel_gasoil = position vehicle player;
			prix_du_gasoil_station = ((random 3) + 1);
		};
	};

	_cout_actuel = 0;
	_puissance_de_calcul = 37;
	_gasoil_actuel = fuel _veh;
	_ok = true;

	while {fuel _veh < 1 && _ok} do
	{
		_cout_actuel = (((fuel (vehicle player) - _gasoil_actuel) * prix_du_gasoil_station) * _puissance_de_calcul);
		_veh setfuel (fuel _veh) + 0.05;
		
		titletext [format["Plein en cours ... Le prix est de %1 %2 pour cette station. \n Niveau actuel : %3 Pourcent. Cout actuel %4 €.",prix_du_gasoil_station, "€", ((fuel (vehicle player)) * 100), _cout_actuel, "€"],"PLAIN DOWN"];
		
		if (isEngineOn _veh) then {_ok = false;};
		sleep 1;
	};

	sleep 1;

	if (!isnil "_cout_actuel") then
	{
		player setVariable["mon_argent_banque_by_sfp_maxou",((player getVariable "mon_argent_banque_by_sfp_maxou") -  (round (_cout_actuel))),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		titletext [format["Le prix du service est de %1 Euros. Vous avez maintenant %2 %3.",round (_cout_actuel),(player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp,"€"],"PLAIN DOWN"];
	}else
	{
		titletext ["Alimentation en gasoil terminée ...","PLAIN DOWN"];	
	};
	[[[_veh, fuel _veh,0,[2]],"divers\reparation_des_vehicules\Refuel.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	
	operation_en_cours_refuel = nil;
}else
{
	_le_vehicule = _this select 0;
	_niveau_fuel = _this select 1;
	if (isnil "_le_vehicule" or isnil "_niveau_fuel") exitwith {};
	
	_le_vehicule setfuel _niveau_fuel;
};
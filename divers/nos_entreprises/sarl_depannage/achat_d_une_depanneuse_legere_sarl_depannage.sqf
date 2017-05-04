//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (isnil {player getvariable "sarl_depannage"}) exitwith {hint "! SARL DIR ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de véhicule ici puisque vous ne faite pas partie de notre entreprise.\n\n Cordialement.";};
argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
carspawn = getMarkerPos "spawn_vehicule_dir";
le_nom_de_larticle = "une depanneuse légère spéciale SARL DIR";
le_prix_de_larticle = 250;
vehname = "Offroad_01_depanneur_sfp";

if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
{
	if((player getVariable "license_permis_de_conduire_by_sfp_maxou") >= 1) then
	{
		_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
		_verifierautour_deux_check_ok = _verifierautour_deux select 0;
		if (!isnil "_verifierautour_deux_check_ok") exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};

		_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
		_veh setdir 30;
		
		if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		_numero_de_plaque = [] call compil_plaque_immatriculation;
		[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
		[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

		waituntil {sleep 1;vehicle player != player};
		hint "Le vehicule a bien ete declare a votre nom.";
		_veh setdamage 0;
	}else
	{
		hint "Désolé, vous devez posséder le permis véhicule léger !";
	};
}
else
{
	Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
};

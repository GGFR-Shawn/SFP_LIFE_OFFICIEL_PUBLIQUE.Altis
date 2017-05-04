// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";
carspawn = getMarkerPos "gangdessfphelicos";
_numero_tableau = -1;

if (isnil {player getvariable "licence_gang_v2"}) exitwith {hint "Vous devez appartenir à un gang pour acheter cet hélicoptère !";};
	
if(revive_mon_side == civilian) then
{
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "KA-60";
		le_prix_de_larticle = 250000;
		vehname = "O_Heli_Light_Gang_SFP";

		
		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			closeDialog 0;
		
			_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
			
			if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

			_numero_de_plaque = [] call compil_plaque_immatriculation;
			[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
			[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
	   
			waituntil {sleep 1;vehicle player != player};
			hint "Le vehicule a bien ete declare a votre nom.";
			_veh setdamage 0;
		}
		else
		{
			Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "KA-60 Skin De Votre Gang";
		le_prix_de_larticle = 250000;
		vehname = "O_Heli_Light_Gang_SFP";
		
		if (!isnil {player getvariable sfp_config_famille_une_nom_pour_variable}) then {vehname = sfp_config_famille_une_classe_de_helico_perso_un;};
		if (!isnil {player getvariable sfp_config_famille_deux_nom_pour_variable}) then {vehname = sfp_config_famille_deux_classe_de_helico_perso_un;};

		
		if ((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			closeDialog 0;
		
			_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

			if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

			_numero_de_plaque = [] call compil_plaque_immatriculation;
			[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
			[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
			
			waituntil {sleep 1;vehicle player != player};
			hint "Le vehicule a bien ete declare a votre nom.";
			_veh setdamage 0;
		}
		else
		{
			Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Little Bird Non Armé";
		le_prix_de_larticle = 150000;
		vehname = "Heli_Light_Civil_SFP";

		
		if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			closeDialog 0;
		
			_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
			
			if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

			_numero_de_plaque = [] call compil_plaque_immatriculation;
			[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
			[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
	   
			waituntil {sleep 1;vehicle player != player};
			hint "Le vehicule a bien ete declare a votre nom.";
			_veh setdamage 0;
		}
		else
		{
			Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];
		};
	};
};

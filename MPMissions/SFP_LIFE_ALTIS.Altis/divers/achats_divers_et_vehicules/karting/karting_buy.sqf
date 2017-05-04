// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if ([] call nombre_de_vehicule_max_sur_la_carte <= 0) exitwith {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Vous avez trop de véhicules sur la carte ... \n\n Sauvegardez vos véhicules en trop pour éviter Desync et lag du serveur. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_numero_tableau = -1;
carspawn = getMarkerPos "spawn_karting";

if((player getVariable "license_permis_de_conduire_by_sfp_maxou") >= 1) then
{
	if(revive_mon_side == west) then {hint "Comme indiqué, vous ne pouvez pas acheter de karting en gendarme !";};
	
	
	if(revive_mon_side == civilian) then
	{
		_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 2];
		_verifierautour_deux_check_ok = _verifierautour_deux select 0;
		if (!isnil "_verifierautour_deux_check_ok") exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};

		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "Karting";
			le_prix_de_larticle = 1000;
			vehname = "C_Kart_01_F";

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
				
				waituntil {sleep 1;vehicle player != player};
				hint "Le vehicule a bien ete declare a votre nom.";
				_veh setdamage 0;
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "Casque de karting";
			le_prix_de_larticle = 180;

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
                
				player addheadgear "H_RacingHelmet_1_white_F";
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "pistolet de départ";
			le_prix_de_larticle = 180;

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
                
				player addweapon "hgun_Pistol_Signal_F";
				player addmagazine ["6Rnd_RedSignal_F",2];
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "uniforme d'arbitre";
			le_prix_de_larticle = 200;

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
                
				player forceAddUniform "U_Marshal";
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "habit de pilote";
			le_prix_de_larticle = 300;

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
                
				player forceAddUniform "U_C_Driver_1_black";
			}
			else
			{
				Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
			};
		};
	};
}else
{
	hint "Vous devez posséder un permis de conduire pour acheter un véhicule";
};
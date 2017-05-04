// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
if (player distance (getpos Neochori) < 300) then {carspawn = getMarkerPos "Boatspawn";};
if (player distance (getpos pnj_achat_bateau_kavala) < 30) then {carspawn = getMarkerPos "Boatspawn_3";};
if (player distance (getpos achatsbateauxcos) < 20) then {carspawn = getMarkerPos "Boatspawn_4";};
if (player in list hotel_un_uneetoile) then {carspawn = getMarkerPos "Boatspawn_2";};
if (isnil "carspawn") exitwith {hint "Erreur spawn recommence ...";};
if (count (nearestObjects [carspawn, ["Car","Ship","Air"], 6]) >= 1) exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone de spawn !";};
if ([] call nombre_de_vehicule_max_sur_la_carte <= 0) exitwith {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Vous avez trop de véhicules sur la carte ... \n\n Sauvegardez vos véhicules en trop pour éviter Desync et lag du serveur. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};


argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_numero_tableau = -1;

if (!isnil {player getvariable "licence_bateau_news"}) then
{
	if(revive_mon_side == west) then
	{
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "bateau d'assault";
			le_prix_de_larticle = 1000;
			vehname = "B_Boat_Transport_01_F";
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
			le_nom_de_larticle = "bateau de police";
			le_prix_de_larticle = 3000;
			vehname = "C_Boat_Civil_01_F";

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
			le_nom_de_larticle = "bateau de combat";
			le_prix_de_larticle = 15000;
			vehname = "B_Boat_Armed_01_minigun_F";

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
			le_nom_de_larticle = "sous marin";
			le_prix_de_larticle = 12500;
			vehname = "B_SDV_01_F";
						
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
			le_nom_de_larticle = "RHIB";
			le_prix_de_larticle = 5000;
			vehname = "I_C_Boat_Transport_02_F";
						
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
	};
	
	if(revive_mon_side == civilian) then
	{
		_numero_tableau = round (_numero_tableau + 1);
		if((lbCurSel 1500) == _numero_tableau) then
		{
			le_nom_de_larticle = "petit bateau";
			le_prix_de_larticle = 1000;
			vehname = "C_Rubberboat";

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
			le_nom_de_larticle = "bateau rapide";
			le_prix_de_larticle = 1500;
			vehname = "C_Boat_Civil_01_rescue_F";

			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
			le_nom_de_larticle = "chalutier";
			le_prix_de_larticle = 15000;
			vehname = "chalutier_SFP";

			if (player distance (getpos Neochori) > 400) exitwith {titletext ["Le chalutier ne peut spawn qu'à Neochori !","PLAIN"]; hint "Le chalutier ne peut spawn qu'à Neochori !";};
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir 145;

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";
				
				player moveindriver _veh;
				
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
			le_nom_de_larticle = "Bateau Véhicules";
			le_prix_de_larticle = 75000;
			vehname = "Burnes_MK10_1";

			if (player distance (getpos Neochori) > 400) exitwith {titletext ["Le bateau chargeur ne peut spawn qu'à Neochori !","PLAIN"]; hint "Le chalutier ne peut spawn qu'à Neochori !";};
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
				_veh setdir 145;

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
				[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
				[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";
				
				player moveindriver _veh;
				
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
			le_nom_de_larticle = "RHIB";
			le_prix_de_larticle = 5000;
			vehname = "C_Boat_Transport_02_F";
						
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
			le_nom_de_larticle = "JetSki";
			le_prix_de_larticle = 2000;
			vehname = "C_Scooter_Transport_01_F";
						
			
			if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
			{
				closeDialog 0;
								
				_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

				if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

				player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

				_numero_de_plaque = [] call compil_plaque_immatriculation;
				_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
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
	};
}else
{
	hint "Vous avez besoin d'un permis bateau pour acheter un bateau !"
};

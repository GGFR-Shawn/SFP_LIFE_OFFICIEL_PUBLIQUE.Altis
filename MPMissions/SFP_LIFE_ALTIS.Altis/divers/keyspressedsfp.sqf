// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {sleep 2; !isNil "fin_verification_apres_chargement" && !isnil "sfp_config_liste_moderateur"};

if (getplayeruid player in sfp_config_liste_moderateur) then {[] spawn {sleep 5; (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 41) then {true}"];};};

onKeyPress = 
{
	_key      = _this select 1; 
	_key_deux = _this select 2; 
	_key_trois = _this select 3; 
	_handled = false;
	
	if (!_key_deux && _key == 17 or _key == 200) then {condition_turbo_deux = true;};
	
	switch _key do 
	{
		// Touche K
		case 37: 
		{
			if (!isnil "autorisation_activation_gyrophare") exitwith {systemchat "Nouvelle autorisation gyrophare dans moins de 3 secondes ...";};
			
			// Gendarmerie
			if (revive_mon_side == west && !((vehicle player) iskindof "air") && vehicle player != player && ((assignedVehicleRole player) select 0) == "Driver") then 
			{
				autorisation_activation_gyrophare = 3;
				if (jallume_gyro_gendarme < 1) then
				{
					jallume_gyro_gendarme = 1;
					(vehicle player) setvariable ["gyrophare_vehicule_allume",true, true];
					[[[vehicle player,"bleu"],"divers\allumer_gyrophare_vehicule.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
				}else
				{
					jallume_gyro_gendarme = 0;
					(vehicle player) setvariable ["gyrophare_vehicule_allume",nil, true];
				};
			};
				
			// DIR
			_autorisation_type_vehicule = ["Jonzie_Tow_Truck_SFP","SFP_MASTER","Offroad_01_depanneur_sfp","C_Van_01_transport_Depannage_F","B_Truck_01_mover_F_Depanneur_SFP","SFP_Depanneur_mantgs"];
			if (je_suis_en_service_a_la_sarl_depannage >= 1 && typeof (vehicle player) in _autorisation_type_vehicule && ((assignedVehicleRole player) select 0) == "Driver") then 
			{
				if (isnil "jallume_gyro_depanneuse") then {jallume_gyro_depanneuse = 0;};
				autorisation_activation_gyrophare = 3;
				
				if (jallume_gyro_depanneuse < 1) then
				{
					jallume_gyro_depanneuse = 1;
					(vehicle player) setvariable ["gyrophare_vehicule_allume",true, true];
					[[[vehicle player,"orange"],"divers\allumer_gyrophare_vehicule.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
				}else
				{
					jallume_gyro_depanneuse = 0;
					(vehicle player) setvariable ["gyrophare_vehicule_allume",nil, true];
				};
			};
				
			// Pompier
			if (!isnil "jesuis_au_taff_a_la_sarl_pompier" && typeof (vehicle player) in sfp_config_listes_des_vehicules_pompiers && ((assignedVehicleRole player) select 0) == "Driver") then 
			{
				if (isnil "jallume_gyro_pompier") then {jallume_gyro_pompier = 0;};
				autorisation_activation_gyrophare = 3;
				
				if (jallume_gyro_pompier < 1) then
				{
					jallume_gyro_pompier = 1;
					(vehicle player) setvariable ["gyrophare_vehicule_allume",true, true];
					[[[vehicle player,"bleu"],"divers\allumer_gyrophare_vehicule.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
				}else
				{
					jallume_gyro_pompier = 0;
					(vehicle player) setvariable ["gyrophare_vehicule_allume",nil, true];
				};
			};
				
			[] spawn
			{
				if (!isnil "autorisation_activation_gyrophare") then
				{
					for "_i" from 0 to autorisation_activation_gyrophare do
					{
						autorisation_activation_gyrophare = round (autorisation_activation_gyrophare - _i);
						sleep 1;
					};
					autorisation_activation_gyrophare = nil;
				};
			};
		};
		// Touche ALT GR + CTRL DROIT
		case 184: 
		{
			if (_key_trois) then
			{
				if (revive_mon_side == west) then {if (isnil {player getvariable "jai_un_sac_sur_la_tete"}) then {[] execVM "divers\gendarmerie\appel_d_urgence.sqf";}else {titletext ["Opération impossible puisque vous avez un sac sur la tête !","PLAIN"];};};
				if (revive_mon_side == civilian) then {[] execVM "divers\taper_un_joueur\taper.sqf";};
			};	
		};	
		// Touche $
		case 27: 
		{
			if (isnil "monson") then {monson = 0;};
			if (monson > 1) then {monson = 0;};
			monson = monson + 0.1;
			2 fadeSound monson;
			hint format ["Volume du son réglé à %1 %2.", round (monson * 100), "%"];
		};	
		// Touche C
		case 46: 
		{
			if (revive_mon_side == west) then {[] execVM "divers\gendarmerie\recherche_proprio_vehicule.sqf";};
		};	
		// Touche L
		case 38: 
		{
			if (revive_mon_side == west) then {[] execVM "divers\radar.sqf";};
		};	
		// Touche TAB
		case 15: 
		{
				if (revive_mon_side == west) then {[] execVM "divers\gendarmerie\fouiller\essaitestinventaire.sqf";};
		};	
		// Touche H
		case 35: 
		{
			if ((vehicle player) iskindof "air") exitwith {};

			if (vehicle player == player && revive_mon_side == west) then {execvm "divers\gendarmerie\divers\sifflet\sifflet.sqf";};
			
			_type_vehicule_autorise = ["SFP_Mercedes_Camion_Pompier","SFP_Sprinter_Pompier","SFP_Ambulance","C_SUV_01_Pompier_SFP","I_Truck_Pompier_SFP","C_Hatchback_01_sport_F","DAR_TahoeEMS","Offroad_01_sarl_pompier_sfp","C_Van_Pompier_01_box_F"];
			if (vehicle player != player && revive_mon_side == civilian && !isnil "jesuis_au_taff_a_la_sarl_pompier" && typeOf (vehicle player) in _type_vehicule_autorise) then {[] execVM "divers\allumer_sirene_vehicule.sqf";};
			if (vehicle player != player && revive_mon_side == west) then {[] execVM "divers\allumer_sirene_vehicule.sqf";};
		};
		// Touche <
		case 86: 
		{
			if (vehicle player != player) exitwith {execVM "divers\vehiclelock\unlocklock_de_dedans.sqf";};
			if !(isnil {cursortarget getvariable "vehicule_info_parvariable"}) exitwith {execVM "divers\vehiclelock\unlocklock.sqf";};
		};
		// Touche Supprimer
		case 211:
		{
			if (isnil "jappuispourlesmainsurlatete") then {jappuispourlesmainsurlatete = 0;};
			if (jappuispourlesmainsurlatete == 0) then
			{
				if (isnil {player getvariable "jai_les_mains_sur_la_tete"}) then {player setvariable ["jai_les_mains_sur_la_tete",true,true];};
				hint "Tu viens de mettre tes mains sur la tete. \n Pour les enlever, appuis sur V.";
				while {true} do
				{
					player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
					waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"};
					jappuispourlesmainsurlatete = 1;
					case 47:
					{
						playMove- "AovrPercMstpSrasWpstDf";
						_handled = false;
					};
				};					
			};
		};
		// Touche v
		case 47: 
		{
			if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) exitwith {hint "Opération impossible, tu as un sac sur la tete !";};
			if (!isnil "jappuispourlesmainsurlatete") then
			{
				hint "Tu viens d'enlever tes mains de la tête.";
				jappuispourlesmainsurlatete = nil;
				if (!isnil {player getvariable "jai_les_mains_sur_la_tete"}) then {player setvariable ["jai_les_mains_sur_la_tete",nil,true];};
			};
		};	
		// Touche y
		case 21: 
		{
			execvm "divers\tablette_sfp\initialisation_tablette_sfp.sqf";
		};	
		// Touche shift + ctrl gauche holster
		case 29: 
		{
			if (!isnil "autorisation_barre_pour_revive") then
			{
				if (_key == (touche_du_revive_valider select 1)) then
				{
					delais_revive_soigner_patient = (delais_revive_soigner_patient + (random 0.68));
					if (delais_revive_soigner_patient > 100) then {delais_revive_soigner_patient = 100;};
				};
			};			
			
		};
		
		// ALT GAUCHE
		case 56: 
		{
			if (!isnil "autorisation_barre_pour_revive") then
			{
				if (_key == (touche_du_revive_valider select 1)) then
				{
					delais_revive_soigner_patient = (delais_revive_soigner_patient + (random 0.68));
					if (delais_revive_soigner_patient > 100) then {delais_revive_soigner_patient = 100;};
				};
			};
		};

		// Touche shift + barre espace
		case 57: 
		{
			[] spawn
			{
				sleep 0.1;				
				if (!(isnull (finddisplay 147852))) then
				{
					(finddisplay 147852) closedisplay 1;
					
					if (isnil "confirmation_fermeture_dialogue_sfp_inventaire") then
					{
						confirmation_fermeture_dialogue_sfp_inventaire = true;
						systemchat "Fermeture automatique du menu inventaire.";
						[] spawn
						{
							sleep 1;
							confirmation_fermeture_dialogue_sfp_inventaire = nil;
						};
					};
				};
			};
			
			if (isnil "autorisation_barre_pour_braquage" && isnil "autorisation_barre_pour_revive") then
			{
				execvm "divers\centre_sportif\saut\systeme_de_saut_sfp.sqf";
			};
			
			if (!isnil "autorisation_barre_pour_revive") then
			{
				if (_key == (touche_du_revive_valider select 1)) then
				{
					delais_revive_soigner_patient = (delais_revive_soigner_patient + (random 0.68));
					if (delais_revive_soigner_patient > 100) then {delais_revive_soigner_patient = 100;};
				};
			};
			
			if (revive_mon_side == civilian && !isnil "autorisation_barre_pour_braquage") then
			{
				pourcentage_barre_braquage_de_banque = (pourcentage_barre_braquage_de_banque + (random 0.9));
				if (pourcentage_barre_braquage_de_banque > 100) then {pourcentage_barre_braquage_de_banque = 100;};
			};
		};

		// Touche Shift + Capcklock
		case 58: 
		{
			if (_key_deux) then
			{
				execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_dernier_message_raccourci.sqf";
			};
		};
	
		if (!isnil "l_object_decorateur_choisit_attache") then
		{
			if (player distance l_object_decorateur_choisit_attache > 100) exitwith {l_object_decorateur_choisit_attache = nil;};
			if (player distance l_object_decorateur_choisit_attache > 20 && _key_trois && (_key == 17 or _key == 31 or _key == 32 or _key == 30)) exitwith {player globalchat "Tu es trop loin de l'objet à poser !";};
				
			if (isnil "position_l_object_decorateur_choisit_attache") then 
			{
				position_l_object_decorateur_choisit_attache = getPosATL l_object_decorateur_choisit_attache;
			};
			case 17: 
			{
				if (_key_trois) then 
				{
					if (isNull attachedTo l_object_decorateur_choisit_attache) then 
					{
						_valeur = getPosATL l_object_decorateur_choisit_attache select 2;
						if (_valeur < 2) then
						{
							_position_a_appliquer = [(position_l_object_decorateur_choisit_attache select 0),(position_l_object_decorateur_choisit_attache select 1),(getPosATL l_object_decorateur_choisit_attache select 2) + (0.01)];
							if (getPosATL l_object_decorateur_choisit_attache select 2 < 0) then {l_object_decorateur_choisit_attache setPosATL [(position_l_object_decorateur_choisit_attache select 0),(position_l_object_decorateur_choisit_attache select 1),1.3];};
							l_object_decorateur_choisit_attache setPosATL _position_a_appliquer;
						}else
						{
							player globalchat "Hauteur maximum atteinte !";
						};
					}else
					{
						player globalchat "Détache l'objet afin de pouvoir le faire monter ...";
					};
				};
			};
			case 31: 
			{
				if (_key_trois) then
				{
					if (isNull attachedTo l_object_decorateur_choisit_attache) then 
					{
						_valeur = getPosATL l_object_decorateur_choisit_attache select 2;
						if (_valeur > 0) then
						{
						_position_a_appliquer = [(position_l_object_decorateur_choisit_attache select 0),(position_l_object_decorateur_choisit_attache select 1),(getPosATL l_object_decorateur_choisit_attache select 2) - (0.01)];
							if (getPosATL l_object_decorateur_choisit_attache select 2 < 0) then {l_object_decorateur_choisit_attache setPosATL [(position_l_object_decorateur_choisit_attache select 0),(position_l_object_decorateur_choisit_attache select 1),1.3];};
							l_object_decorateur_choisit_attache setPosATL _position_a_appliquer;
						}else
						{
							player globalchat "Hauteur minimum atteinte !";
						};
					}else
					{
						player globalchat "Détache l'objet afin de pouvoir le faire descendre ...";
					};
				};
			};
			case 32: 
			{
				if (_key_trois) then
				{
					if (isNull attachedTo l_object_decorateur_choisit_attache) then 
					{
						l_object_decorateur_choisit_attache setdir ((getdir l_object_decorateur_choisit_attache) + 1);
					}else
					{
						player globalchat "Détache l'objet afin de pouvoir le faire tourner ...";
					};
				};
			};
			case 30: 
			{
				if (_key_trois) then
				{
					if (isNull attachedTo l_object_decorateur_choisit_attache) then 
					{
						l_object_decorateur_choisit_attache setdir ((getdir l_object_decorateur_choisit_attache) - 1);
					}else
					{
						player globalchat "Détache l'objet afin de pouvoir le faire tourner ...";
					};
				};
			};
		};	
	};
	_handled; 	
};

waitUntil { sleep 3; !(isNull (findDisplay 46))}; 
// Detection taskforce
if (isnil "TFAR_fnc_onSwTangentPressedHack") then
{
	(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];
}else
{
	(findDisplay 46) displayAddEventHandler ["keyDown", {_this call TFAR_fnc_onSwTangentPressedHack; _this call onKeyPress;}];	
};
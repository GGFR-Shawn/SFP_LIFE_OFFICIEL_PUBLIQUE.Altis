// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_carshop") exitwith {hint "Erreur whitelist. Contact Maxou.";};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "En tant que pompier en service, vous pouvez rentrer dans les HQ pour soigner les joueurs ...";};

_personneautoriserdoffice = whitelist_carshop;
if (getPlayerUID player in  _personneautoriserdoffice) then {if (isnil {player getvariable "sarl_car_shop"}) then {player setvariable ["sarl_car_shop",true,true];};};
if (debug_mission_pour_dev) then {if (isnil {player getvariable "sarl_car_shop"}) then {player setvariable ["sarl_car_shop",true,true];};};

if (!(isnil ("actionpourrecruter"))) then {player removeaction actionpourrecruter;};
if (!(isnil ("actionpourdemissionner"))) then {player removeaction actionpourdemissionner;};
if (!(isnil ("actionnumerodeserie"))) then {player removeaction actionnumerodeserie;};
if (!(isnil ("actionvendreunevoiture"))) then {player removeaction actionvendreunevoiture;};
if (!(isnil ("action_repeindre_une_voiture"))) then {player removeaction action_repeindre_une_voiture;};
if (!(isnil ("action_menu_carrosserie_carshop"))) then {player removeaction action_menu_carrosserie_carshop;};

actionrecrutement = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être recruter !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; if (!isnil {cursorTarget getvariable "sarl_car_shop"}) exitwith {hint "Désolé, le joueur travail déja pour SARL CAR SHOP !";};  if (!isnil {cursorTarget getvariable "sarl_neomedia"}) exitwith {hint "Désolé, le joueur travail déja pour SARL NEOMEDIA !";};if (!isnil {cursorTarget getvariable "sarl_avocat"}) exitwith {hint "Désolé, le joueur travail déja pour SARL AVOCAT !";}; if (!isnil {cursorTarget getvariable "sarl_depannage"}) exitwith {hint "Désolé, le joueur travail déja pour SARL DIR !";};if (!isnil {cursorTarget getvariable "sarl_pompier"}) exitwith {hint "Désolé, le joueur travail déja pour SARL POMPIER !";};cursortarget setvariable ["sarl_car_shop",1,true];hint format ["%1 à bien été recruter chez SARL CAR SHOP !",name cursortarget];};
actiondemissionner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être virer !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; cursortarget setvariable ["sarl_car_shop",true,true];hint format ["%1 à bien été supprimer de ta société et ne peux donc plus rentrer dans ton entreprise ;)",name cursortarget];};

employer_car_shop = 0;
{if (_x getvariable "je_suis_au_taff_a_la_sarl_car_shop") then {employer_car_shop = 1;};} foreach playableUnits;

if (player in list sarlcarshop_Neochori) then
{
	if (isnil {player getvariable "sarl_car_shop"}) then
	{
		if (employer_car_shop < 1) exitwith 
		{
			hint "! SARL CAR SHOP ! \n --------------------------------------- \n\n Bonjour, \n Vous êtes dans les bureaux de la SARL CAR SHOP. \n\n Aucun employé n'est connecté actuellement !\n\n Cordialement.";
		};
		
		if (employer_car_shop >= 1) exitwith 
		{
			hint "! SARL CAR SHOP ! \n --------------------------------------- \n\n Bonjour, \n Vous êtes dans les bureaux de la SARL CAR SHOP. \n\n Un employé est connecté actuellement, vous êtes donc autorisé à rentrer ici !\n\n Cordialement.";
		};
	};
			
	if (!isnil {player getvariable "sarl_car_shop"}) then 
	{
		hint format ["! SARL CAR SHOP ! \n --------------------------------------- \n\n Bienvenue au centre de la SARL CAR SHOP %1. \n\n Tu peux prendre ta fonction quand tu le souhaites puisque tu es autorisé ;). \n\n Cordialement.",name player];
		if (getPlayerUID player in _personneautoriserdoffice) then 
		{
			actionpourrecruter = player addAction ["<t color=""#ff0000"">" + "Recruter un commercial",actionrecrutement,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursorTarget getvariable "sarl_car_shop"}'];
			actionpourdemissionner = player addAction ["<t color=""#ff0000"">" + "Donner démission à un commercial",actiondemissionner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && !isnil {cursorTarget getvariable "sarl_car_shop"}'];
		};
		
		if (sfp_config_activer_retaper_numero_de_serie) then {actionnumerodeserie = player addAction ["<t color=""#ff0000"">" + "Changer Le Numéro De Série","divers\vendre_sa_voiture\init_menu_retaper_numero_de_serie.sqf",[],10,true,true,'','cursorTarget isKindOf "LandVehicle" && alive cursorTarget && cursorTarget distance player < 5 && !isnil {cursorTarget getvariable "vehicule_info_parvariable"}'];};
		actionvendreunevoiture = player addaction ["<t color=""#ff0000"">" + "Vendre ma voiture", "divers\vendre_sa_voiture\init_menu_vendre_sa_voiture.sqf", [], 1, false, false, '', 'cursorTarget isKindOf "LandVehicle" && alive cursorTarget && cursorTarget distance player < 5 && !isnil {cursorTarget getvariable "vehicule_info_parvariable"}']; 
		action_repeindre_une_voiture = player addaction ["<t color=""#ff0000"">" + "Repeindre Une Voiture", "divers\repeindre_voiture\tuning\menu_tuning.sqf", [], 10, false, false, '', 'cursorTarget isKindOf "LandVehicle" && alive cursorTarget && cursorTarget distance player < 5 && !isnil {cursorTarget getvariable "vehicule_info_parvariable"}'];
		action_menu_carrosserie_carshop = player addaction ["<t color=""#ff0000"">" + "Menu Carrosserie !", "divers\repeindre_voiture\carrossier\menu_repeindre_la_voiture_carrossier.sqf", [], 10, false, false, "", "(cursortarget isKindOf 'landvehicle' or cursorTarget isKindOf 'air') && player distance cursorTarget < 4"];
		
		if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};
		if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1 or player getvariable "je_possede_un_telephone_sfp" select 1 < 1 or player getvariable "je_possede_un_telephone_sfp" select 2 < 200) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};
		
		// Habit Car Shop
		execvm "divers\nos_entreprises\sarl_carshop\securite_habbit_car_shop.sqf";
		
		waituntil {!isnil {player getvariable "ma_paye_by_sfp_maxou"};};
		if (player getvariable "ma_paye_by_sfp_maxou" < sfp_config_salaire_sarl_car_shop) then {player setVariable["ma_paye_by_sfp_maxou", sfp_config_salaire_sarl_car_shop,false];};
		if (player getvariable "mes_aides_caf" > 0) then {player setVariable["mes_aides_caf", 0,false];};
		if (isnil {player getvariable "je_suis_au_taff_a_la_sarl_car_shop"}) then {player setVariable["je_suis_au_taff_a_la_sarl_car_shop", true,true];};
		if (isnil {player getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}) then {player setVariable["je_suis_une_entreprise_pour_avoir_un_virement", true,true];};
		jesuis_au_taff_a_la_sarl_car_shop_pour_respawn = 1;
	};
};	

waituntil {sleep 1;!(player in list sarlcarshop_Neochori)};
if (!isnil "actionpourrecruter") then {player removeaction actionpourrecruter;};
if (!isnil "actionpourdemissionner") then {player removeaction actionpourdemissionner;};
if (!isnil "actionnumerodeserie") then {player removeaction actionnumerodeserie;};
if (!isnil "actionvendreunevoiture") then {player removeaction actionvendreunevoiture;};
if (!isnil "action_repeindre_une_voiture") then {player removeaction action_repeindre_une_voiture;};
if (!isnil "action_menu_carrosserie_carshop") then {player removeaction action_menu_carrosserie_carshop;};
if (debug_mission_pour_dev) then {player setvariable ["sarl_car_shop",nil,true];};



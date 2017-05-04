// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_taxi_g_sept") exitwith {hint "Erreur whitelist. Contact Maxou.";};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "En tant que pompier en service, vous pouvez rentrer dans les HQ pour soigner les joueurs ...";};

_personneautoriserdoffice = whitelist_taxi_g_sept;
if ((getPlayerUID player in  _personneautoriserdoffice) or debug_mission_pour_dev) then {if (isnil {player getvariable "sarl_taxis_gsept"}) then {player setvariable ["sarl_taxis_gsept",true,true];};};

actionrecrutement = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être recruter !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; if (!isnil {cursorTarget getvariable "sarl_car_shop"}) exitwith {hint "Désolé, le joueur travail déja pour SARL CAR SHOP !";};if (!isnil {cursorTarget getvariable "sarl_avocat"}) exitwith {hint "Désolé, le joueur travail déja pour SARL AVOCAT !";}; if (!isnil {cursorTarget getvariable "sarl_depannage"}) exitwith {hint "Désolé, le joueur travail déja pour SARL DIR !";}; if (!isnil {cursorTarget getvariable "sarl_neomedia"}) exitwith {hint "Désolé, le joueur travail déja pour SARL NEOMEDIA !";};if (!isnil {cursorTarget getvariable "sarl_pompier"}) exitwith {hint "Désolé, le joueur travail déja pour SARL POMPIER !";};cursortarget setvariable ["sarl_taxis_gsept",true,true];hint format ["%1 à bien été recruter chez TAXIS G7 !",name cursortarget];};
actiondemissionner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être virer !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; cursortarget setvariable ["sarl_taxis_gsept",nil,true];hint format ["%1 à bien été supprimer de ta société et ne peux donc plus rentrer dans ton batiment ;)",name cursortarget];};

if (player in list sarltaxisgsept) then
{
	if (isnil {player getvariable "sarl_taxis_gsept"}) exitwith {jai_le_droit_de_me_tp = 1; player setpos (getmarkerpos "position_sarl_g7_respawn"); hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Bonjour, \n Vous êtes dans les bureaux de la SARL TAXI G7. \n\n Sauf erreur de ma part, vous n'avez pas le droit de rentrer ici sans notre permission.\n\n Cordialement.";};

	if (!isnil {player getvariable "sarl_taxis_gsept"}) then 
	{
		hint format ["! SARL TAXI G7 ! \n --------------------------------------- \n\n Bienvenue au centre de la SARL TAXI G7 %1. \n\n Tu peux prendre ta fonction quand tu le souhaites puisque tu es autorisé ;). \n\n Cordialement.",name player];};
		if (getPlayerUID player in _personneautoriserdoffice) then 
		{
			actionpourrecruter = player addAction ["<t color=""#ff0000"">" + "Recruter un chauffeur",actionrecrutement,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursorTarget getvariable "sarl_taxis_gsept"}'];
			actionpourdemissionner = player addAction ["<t color=""#ff0000"">" + "Donner démission à un chauffeur",actiondemissionner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && !isnil {cursorTarget getvariable "sarl_taxis_gsept"}'];
		};
		
		if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};
		if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1 or player getvariable "je_possede_un_telephone_sfp" select 1 < 1 or player getvariable "je_possede_un_telephone_sfp" select 2 < 200) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};

		waituntil {!isnil {player getvariable "ma_paye_by_sfp_maxou"};};
		if (player getvariable "ma_paye_by_sfp_maxou" < sfp_config_salaire_sarl_taxi_g7) then {player setVariable["ma_paye_by_sfp_maxou", sfp_config_salaire_sarl_taxi_g7,false];};
		if (isnil {player getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}) then {player setVariable["je_suis_une_entreprise_pour_avoir_un_virement", true,true];};
		if (player getvariable "mes_aides_caf" > 0) then {player setVariable["mes_aides_caf", 0,false];};
		if (isnil {player getvariable "sarl_taxis_gsept_en_ligne"}) then {player setVariable["sarl_taxis_gsept_en_ligne", true,true];};
		jesuis_au_taff_a_la_sarl_taxis_gsept = 1;
		
		_habbitactuel = uniform player;
		if (_habbitactuel != "U_Rangemaster") then {player forceAddUniform "U_Rangemaster";sleep 1;player setObjectTextureGlobal [0, "textures\habit_taxi_g_sept.jpg"];};
};	

waituntil {sleep 1;!(player in list sarltaxisgsept)};
if (!isnil "actionpourrecruter") then {player removeaction actionpourrecruter;};
if (!isnil "actionpourdemissionner") then {player removeaction actionpourdemissionner;};
if (debug_mission_pour_dev) then {player setvariable ["sarl_taxis_gsept",nil,true];};



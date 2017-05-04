// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_pompiers") exitwith {hint "Erreur whitelist. Contact Maxou.";};
if (je_suis_en_service_a_la_sarl_depannage >= 1) exitwith {hint "En tant que agent de la DIR en service, vous pouvez rentrer dans ce HQ pour réparer les véhicules ...";};

_personneautoriserdoffice = whitelist_pompiers;
if (getPlayerUID player in _personneautoriserdoffice) then {if (isnil {player getvariable "sarl_pompier"}) then {player setvariable ["sarl_pompier",true,true];};};
if (debug_mission_pour_dev) then {if (isnil {player getvariable "sarl_pompier"}) then {player setvariable ["sarl_pompier",true,true];};};

if (!(isnil ("actionpourdesincarcererunevictime"))) then {player removeaction actionpourdesincarcererunevictime;};
if (!(isnil ("actionpourdeployerextincteur"))) then {player removeaction actionpourdeployerextincteur;};
if (!(isnil ("actionpourrangerextincteur"))) then {player removeaction actionpourrangerextincteur;};
if (!(isnil ("menu_liste_blesse_revive"))) then {player removeaction menu_liste_blesse_revive;};

actionrecrutement = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être recruter !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; if (!isnil {cursorTarget getvariable "sarl_taxis_gsept"}) exitwith {hint "Désolé, le joueur travail déja pour SARL TAXI G7 !";};  if (!isnil {cursorTarget getvariable "sarl_neomedia"}) exitwith {hint "Désolé, le joueur travail déja pour SARL NEOMEDIA !";};if (!isnil {cursorTarget getvariable "sarl_avocat"}) exitwith {hint "Désolé, le joueur travail déja pour SARL AVOCAT !";};if (!isnil {cursorTarget getvariable "sarl_depannage"}) exitwith {hint "Désolé, le joueur travail déja pour SARL DDE !";};if (!isnil {cursorTarget getvariable "sarl_autoecole"}) exitwith {hint "Désolé, le joueur travail déja pour SARL AUTOECOLE !";}; cursortarget setvariable ["sarl_pompier",true,true];hint format ["%1 à bien été recruter et possède maintenant les fonctions des pompiers. N'oublie pas de lui préciser les règles que je t'ai expliqué ;)",name cursortarget];};
actiondemissionner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être virer !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; cursortarget setvariable ["sarl_pompier",nil,true]; hint format ["%1 à bien été supprimer de ta société et ne peux donc plus rentrer dans ton batiment ;)",name cursortarget];};


if (player in list sarl_pompier) then
{
	if (isnil {player getvariable "sarl_pompier"}) exitwith {jai_le_droit_de_me_tp = 1; player setdir 133; player setpos (getmarkerpos "position_sarl_pompier_respawn"); hint "! SARL POMPIER ! \n --------------------------------------- \n\n Bonjour, \n Vous êtes dans les bureaux de la SARL POMPIER. \n\n Sauf erreur de ma part, vous n'avez pas le droit de rentrer ici sans notre permission.\n\n Cordialement.";};

	if (!isnil {player getvariable "sarl_pompier"}) then 
	{
		hint format ["! SARL POMPIER ! \n --------------------------------------- \n\n Bienvenue au centre de la SARL POMPIER %1. \n\n Tu peux prendre ta fonction quand tu le souhaites puisque tu es autorisé ;).\n\n Cordialement.",name player];
		if (getPlayerUID player in _personneautoriserdoffice) then 
		{
			actionpourrecruter = player addAction ["<t color=""#ff0000"">" + "Recruter Un Pompier",actionrecrutement,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursorTarget getvariable "sarl_pompier"}'];
			actionpourdemissionner = player addAction ["<t color=""#ff0000"">" + "Donner Démission à un joueur",actiondemissionner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && !isnil {cursorTarget getvariable "sarl_pompier"}'];		
		};
		je_peux_deployer_l_extincteur = 0;
		menu_deployer_extincteur = 0;
		niveau_max_secouriste_revive = 10;

		actionpourdesincarcererunevictime = player addAction ["<t color=""#ff0000"">" + "Desincarcerer La Victime","divers\nos_entreprises\sarl_pompier\sarl_pompier_client\desincarcerer_victime_accident_de_la_route\action_desincarcerer_victime.sqf",[],10,true,true,'','player distance cursortarget < 15 && !isnil {cursorTarget getvariable "attente_pompier_desincarceration"} && isnil "je_desincarcere_la_victime"'];
		actionpourdeployerextincteur = player addAction ["<t color=""#ff0000"">" + "Déployer extincteur","divers\nos_entreprises\sarl_pompier\sarl_pompier_client\extincteur\deployer_eau.sqf",[],10,true,true,'','isnil "je_recharge_en_eau_pour_extincteur" && menu_deployer_extincteur < 1 && !(player in list sarl_pompier)'];
		actionpourrangerextincteur = player addaction ["<t color=""#ff0000"">" + "Ranger Extincteur", "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\extincteur\arreter_eau.sqf", [], 10, false, true, "", "menu_deployer_extincteur >= 1"];
		menu_liste_blesse_revive = player addAction [("<t color=""#ED2744"">") + ("Liste Des Bléssés") + "</t>","divers\revive_sfp\menu_blesse_revive.sqf",[], 8, true, true, "", ""];
		
		if (isnil {player getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}) then {player setVariable["je_suis_une_entreprise_pour_avoir_un_virement", true,true];};

		if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};
		if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1 or player getvariable "je_possede_un_telephone_sfp" select 1 < 1 or player getvariable "je_possede_un_telephone_sfp" select 2 < 200) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};

		waituntil {!isnil {player getvariable "ma_paye_by_sfp_maxou"};};
		if (player getvariable "ma_paye_by_sfp_maxou" < sfp_config_salaire_sarl_pompier) then {player setVariable["ma_paye_by_sfp_maxou", sfp_config_salaire_sarl_pompier,false];};
		if (isnil {player getvariable "sarl_pompier_en_ligne"}) then {player setVariable["sarl_pompier_en_ligne",true,true];};
		if (player getvariable "mes_aides_caf" > 0) then {player setVariable["mes_aides_caf", 0,false];};
		jesuis_au_taff_a_la_sarl_pompier = 1;
		
		execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\securite_habbit.sqf";
		execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\divers\marker_vehicule_de_secours.sqf";
		[vehicle player, 2, sfp_config_listes_des_vehicules_pompiers] execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\divers\bip_de_recul.sqf";
	};
};	

waituntil {sleep 0.5;!(player in list sarl_pompier)};
if (!isnil "actionpourrecruter") then {player removeaction actionpourrecruter;};
if (!isnil "actionpourdemissionner") then {player removeaction actionpourdemissionner;};
if (debug_mission_pour_dev) then {player setvariable ["sarl_pompier",nil,true];};



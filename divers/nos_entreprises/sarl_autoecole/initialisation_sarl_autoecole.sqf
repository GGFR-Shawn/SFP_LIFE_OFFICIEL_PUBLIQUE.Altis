// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_auto_ecole") exitwith {hint "Erreur whitelist. Contact Maxou.";};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "En tant que pompier en service, vous pouvez rentrer dans les HQ pour soigner les joueurs ...";};

_personneautoriserdoffice = whitelist_auto_ecole;
if (debug_mission_pour_dev) then {if (isnil {player getvariable "sarl_autoecole"}) then {player setvariable ["sarl_autoecole",true,true];};};
if (getPlayerUID player in  _personneautoriserdoffice) then {if (isnil {player getvariable "sarl_autoecole"}) then {player setvariable ["sarl_autoecole",true,true];};};

actionrecrutement = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être recruter !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; if (!isnil {cursorTarget getvariable "sarl_car_shop"}) exitwith {hint "Désolé, le joueur travail déja pour SARL CAR SHOP !";}; if (!isnil {cursorTarget getvariable "sarl_avocat"}) exitwith {hint "Désolé, le joueur travail déja pour SARL AVOCAT !";};  if (!isnil {cursorTarget getvariable "sarl_neomedia"}) exitwith {hint "Désolé, le joueur travail déja pour SARL NEOMEDIA !";};if (!isnil {cursorTarget getvariable "sarl_depannage"}) exitwith {hint "Désolé, le joueur travail déja pour SARL DDE !";};if (!isnil {cursorTarget getvariable "sarl_pompier"}) exitwith {hint "Désolé, le joueur travail déja pour SARL POMPIER !";};cursortarget setvariable ["sarl_autoecole",true,true];hint format ["%1 à bien été recruter et possède maintenant les fonctions du moniteur d'auto école. N'oublie pas de lui préciser les règles que je t'ai expliqué ;)",name cursortarget];};
actiondemissionner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être virer !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; cursortarget setvariable ["sarl_autoecole",nil,true];hint format ["%1 à bien été supprimer de ta société et ne peux donc plus rentrer dans ton auto école ;)",name cursortarget];};
actionpermislegerledonner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour donner le permis !";}; if !(cursortarget iskindof "man") exitWith {hint "Ce n'est pas un joueur, recommence !"};if !(isplayer cursortarget) exitWith {hint "Impossible, ce n'est pas un joueur !"};if (cursortarget getvariable "license_permis_de_conduire_by_sfp_maxou" >= 1) exitWith {hint "Désolé, il à déja le permis leger !"};lejoueur = cursortarget; if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {lejoueur setVariable['recherche_pour_conduite_sans_permis',nil,true];}; lejoueur setVariable ['combien_de_point_by_sfp_maxou',12,true]; lejoueur setVariable['license_permis_de_conduire_by_sfp_maxou',1,true]; hint format ["Le permis LEGER à bien été donné à %1 !",name lejoueur];};
actionpermislourdledonner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour donner le permis !";}; if !(cursortarget iskindof "man") exitWith {hint "Ce n'est pas un joueur, recommence !"};if !(isplayer cursortarget) exitWith {hint "Impossible, ce n'est pas un joueur !"};if (cursortarget getvariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou" >= 1) exitWith {hint "Désolé, il à déja le permis de poid lourd !"};lejoueur = cursortarget; if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {lejoueur setVariable['recherche_pour_conduite_sans_permis',nil,true];}; lejoueur setVariable ['combien_de_point_by_sfp_maxou',12,true]; lejoueur setVariable['license_permis_de_conduire_poids_lourd_by_sfp_maxou',1,true]; hint format ["Le permis POID LOURD à bien été donné à %1 !",name lejoueur];};
actionlicensepiloteledonner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour donner la license !";}; if !(cursortarget iskindof "man") exitWith {hint "Ce n'est pas un joueur, recommence !"};if !(isplayer cursortarget) exitWith {hint "Impossible, ce n'est pas un joueur !"};if (!isnil {cursorTarget getvariable "license_pilote_news"}) exitWith {hint "Désolé, il à déja la license pilote !"};lejoueur = cursortarget; lejoueur setVariable['license_pilote_news',true,true]; hint format ["La license pilote à bien été donné à %1 !",name lejoueur];};


if (player in list sarlautoecole) then
{
	if (isnil {player getvariable "sarl_autoecole"}) exitwith {jai_le_droit_de_me_tp = 1; player setpos [12827.9,14297.2,0]; hint "! SARL AUTO ECOLE ! \n --------------------------------------- \n\n Bonjour, \n Vous êtes dans les bureaux de la SARL AUTO ECOLE. \n\n Sauf erreur de ma part, vous n'avez pas le droit de rentrer ici sans notre permission.\n\n Cordialement.";};

	if (!isnil {player getvariable "sarl_autoecole"}) then 
	{
		hint format ["! SARL AUTO ECOLE ! \n --------------------------------------- \n\n Bienvenue au centre de la SARL AUTO ECOLE %1. \n\n Tu peux prendre ta fonction quand tu le souhaites puisque tu es autorisé ;). \n\n N'oublie pas d'utiliser le centre de formation également à ta disposition à coté du batiment (face au radar) \n\n Cordialement.",name player];};
		if (getPlayerUID player in _personneautoriserdoffice) then 
		{
			actionpourrecruter = player addAction ["<t color=""#ff0000"">" + "Recruter un moniteur",actionrecrutement,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursorTarget getvariable "sarl_autoecole"}'];
			actionpourdemissionner = player addAction ["<t color=""#ff0000"">" + "Donner démission à un moniteur",actiondemissionner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && !isnil {cursorTarget getvariable "sarl_autoecole"}'];
		};
		actionpourdonnerpermisleger = player addAction ["<t color=""#ff0000"">" + "Donner Permis Leger",actionpermislegerledonner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && cursorTarget getvariable "license_permis_de_conduire_by_sfp_maxou" <= 0'];
		actionpourdonnerpermislourd = player addAction ["<t color=""#ff0000"">" + "Donner Permis Lourd",actionpermislourdledonner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && cursorTarget getvariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou" <= 0'];
		actionpourdonnerlicensepilote = player addAction ["<t color=""#ff0000"">" + "Donner License Pilote",actionlicensepiloteledonner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursorTarget getvariable "license_pilote_news"}'];
		action_redonner_points_permis = player addAction ["<t color=""#ff0000"">" + "Redonner Points Permis","divers\nos_entreprises\sarl_autoecole\remettre_des_points\initialisation_remettre_des_points.sqf",[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && cursorTarget getvariable "combien_de_point_by_sfp_maxou" >= 0'];
	    
		if (isnil {player getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}) then {player setVariable["je_suis_une_entreprise_pour_avoir_un_virement", true,true];};

		if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};
		if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1 or player getvariable "je_possede_un_telephone_sfp" select 1 < 1 or player getvariable "je_possede_un_telephone_sfp" select 2 < 200) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};
		
		waituntil {!isnil {player getvariable "ma_paye_by_sfp_maxou"};};
		if (player getvariable "ma_paye_by_sfp_maxou" < sfp_config_salaire_sarl_auto_ecole) then {player setVariable["ma_paye_by_sfp_maxou", sfp_config_salaire_sarl_auto_ecole,false];};
		if (player getvariable "mes_aides_caf" > 0) then {player setVariable["mes_aides_caf", 0,false];};
		if (isnil {player getvariable "sarl_autoecole_en_ligne"}) then {player setVariable["sarl_autoecole_en_ligne", true, true];};
		jesuis_au_taff_a_la_sarl_autoecole = 1;
};	

waituntil {sleep 1;!(player in list sarlautoecole)};
if (!isnil "actionpourrecruter") then {player removeaction actionpourrecruter;};
if (!isnil "actionpourdemissionner") then {player removeaction actionpourdemissionner;};
if (!(isnil ("actionpourdonnerpermisleger"))) then {player removeaction actionpourdonnerpermisleger;};
if (!(isnil ("actionpourdonnerpermislourd"))) then {player removeaction actionpourdonnerpermislourd;};
if (!(isnil ("actionpourdonnerlicensepilote"))) then {player removeaction actionpourdonnerlicensepilote;};
if (!(isnil ("action_redonner_points_permis"))) then {player removeaction action_redonner_points_permis;};
if (debug_mission_pour_dev) then {player setvariable ["sarl_autoecole",nil,true];};



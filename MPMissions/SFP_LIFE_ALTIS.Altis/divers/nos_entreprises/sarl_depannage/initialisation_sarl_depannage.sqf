// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_dir") exitwith {hint "Erreur whitelist. Contact Maxou.";};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "En tant que pompier en service, vous pouvez rentrer dans les HQ pour soigner les joueurs ...";};

_personneautoriserdoffice = whitelist_dir;
if (getPlayerUID player in _personneautoriserdoffice) then {if (isnil {player getvariable "sarl_depannage"}) then {player setvariable ["sarl_depannage",true,true];};};
if (debug_mission_pour_dev) then {if (isnil {player getvariable "sarl_depannage"}) then {player setvariable ["sarl_depannage",true,true];};};

if (!(isnil ("actionpourremettredugasoil"))) then {player removeaction actionpourremettredugasoil;};
if (!(isnil ("actionpourremettredugasoilhelico"))) then {player removeaction actionpourremettredugasoilhelico;};
if (!(isnil ("actionpoursupprimerbarrederemorquage"))) then {player removeaction actionpoursupprimerbarrederemorquage;};
if (!(isnil ("recherche_info_vehicule"))) then {player removeaction recherche_info_vehicule;};
if (!(isnil ("reparer_la_fuite_deau"))) then {player removeaction reparer_la_fuite_deau;};
if (!(isnil ("maitriser_la_fuite_toxique"))) then {player removeaction maitriser_la_fuite_toxique;};
if (!(isnil ("refaire_refection_de_la_route"))) then {player removeaction refaire_refection_de_la_route;};
if (!(isnil ("supprimer_objet_de_la_route"))) then {player removeaction supprimer_objet_de_la_route;};
if (!(isnil ("menu_liste_joueur_demandant_depannage"))) then {player removeaction menu_liste_joueur_demandant_depannage;};
if (!(isnil ("devis_sarl_dde"))) then {player removeaction devis_sarl_dde;};
if (!(isnil ("montrer_dernier_devis"))) then {player removeaction montrer_dernier_devis;};

actionrecrutement = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être recruter !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"};if (!isnil {cursorTarget getvariable "sarl_car_shop"}) exitwith {hint "Désolé, le joueur travail déja pour SARL CAR SHOP !";};if (!isnil {cursorTarget getvariable "sarl_taxis_gsept"}) exitwith {hint "Désolé, le joueur travail déja pour SARL TAXI G7 !";}; if (!isnil {cursorTarget getvariable "sarl_neomedia"}) exitwith {hint "Désolé, le joueur travail déja pour SARL NEOMEDIA !";};if (!isnil {cursorTarget getvariable "sarl_avocat"}) exitwith {hint "Désolé, le joueur travail déja pour SARL AVOCAT !";};if (!isnil {cursorTarget getvariable "sarl_autoecole"}) exitwith {hint "Désolé, le joueur travail déja pour SARL AUTOECOLE !";};cursortarget setvariable ["sarl_depannage",true,true];hint format ["%1 à bien été recruter et possède maintenant les fonctions du dépanneur. N'oublie pas de lui préciser les règles que je t'ai expliqué ;)",name cursortarget];};
actiondemissionner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être virer !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; cursortarget setvariable ["sarl_depannage",nil,true];hint format ["%1 à bien été supprimer de ta société et ne peux donc plus rentrer dans ton batiment ;)",name cursortarget];};
actionremettredugasoil = {execvm "divers\nos_entreprises\sarl_depannage\remettre_du_fuel_sarl_depannage.sqf"};

if (player in list sarl_depannage) then
{
	if (isnil {player getvariable "sarl_depannage"}) exitwith {jai_le_droit_de_me_tp = 1; player setpos (getmarkerpos "position_sarl_depannage_respawn"); player setdir 215.785; hint "! SARL DIR ! \n --------------------------------------- \n\n Bonjour, \n Vous êtes dans les bureaux de la SARL DIR. \n\n Sauf erreur de ma part, vous n'avez pas le droit de rentrer ici sans notre permission.\n\n Cordialement.";};

	if (!isnil {player getvariable "sarl_depannage"}) then 
	{
		hint format ["! SARL DIR ! \n --------------------------------------- \n\n Bienvenue au centre de la SARL DIR %1. \n\n Tu peux prendre ta fonction quand tu le souhaites puisque tu es autorisé ;).\n\n Cordialement.",name player];};
		if (getPlayerUID player in _personneautoriserdoffice) then 
		{
			actionpourrecruter = player addAction ["<t color=""#ff0000"">" + "Recruter Un Dépanneur",actionrecrutement,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursorTarget getvariable "sarl_depannage"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
			actionpourdemissionner = player addAction ["<t color=""#ff0000"">" + "Donner Démission à un joueur",actiondemissionner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && !isnil {cursorTarget getvariable "sarl_depannage"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
		};
		
		actionpourremettredugasoil = player addAction ["<t color=""#ff0000"">" + "Remettre du gasoil",actionremettredugasoil,[],10,true,true,'','!isNull cursorTarget && !isnil {cursortarget getvariable "vehicule_info_parvariable"} && alive cursorTarget && cursorTarget distance player < 8 && fuel cursortarget < 0.5 && je_suis_en_service_a_la_sarl_depannage >= 1'];
		actionpourremettredugasoilhelico = player addAction ["<t color=""#ff0000"">" + "Remettre du gasoil",actionremettredugasoil,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "air" && alive cursorTarget && cursorTarget distance player < 8 && fuel cursortarget < 0.5 && je_suis_en_service_a_la_sarl_depannage >= 1'];
		actionpoursupprimerbarrederemorquage = player addAction ["<t color=""#ff0000"">" + "Supprimer barre de remorquage (quand bug)",actionsupprimerbarrederemorquage,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Target_Rail_End_F" && cursorTarget distance player < 8 && je_suis_en_service_a_la_sarl_depannage >= 1'];
		recherche_info_vehicule = player addaction ["<t color=""#ff0000"">" + "Info sur le véhicule", "divers\gendarmerie\recherche_proprio_vehicule.sqf", [], 10, false, true, "",'!isnil {cursortarget getvariable "vehicule_info_parvariable"} && cursorTarget distance player < 5 && je_suis_en_service_a_la_sarl_depannage >= 1'];
		reparer_la_fuite_deau = player addaction ["<t color=""#ff0000"">" + "Réparer La Fuite", "divers\nos_entreprises\sarl_depannage\mission_aleatoire\fuite_d_eau\reparer_la_fuite_d_eau.sqf", [], 10, false, true, "",'!isnil {cursorTarget getvariable "je_fuie_pour_sarl_depannage"} && cursorTarget distance player < 5'];
		maitriser_la_fuite_toxique = player addaction ["<t color=""#ff0000"">" + "Maitriser La Fuite Toxique", "divers\nos_entreprises\sarl_depannage\mission_aleatoire\fuite_produit_inconnu\reparer_la_fuite_produit_inconnu.sqf", [], 10, false, true, "",'!isnil {cursorTarget getvariable "la_fuite_produit_inconnu_pour_sarl_depannage"} && cursorTarget distance player < 5 && je_suis_en_service_a_la_sarl_depannage >= 1'];
		supprimer_objet_de_la_route = player addaction ["<t color=""#ff0000"">" + "Enlever Objet De La Route", "divers\nos_entreprises\sarl_depannage\mission_aleatoire\objets_sur_la_route\supprimer_objets_sur_la_route.sqf", [], 10, false, true, "",'!isnil {cursorTarget getvariable "objet_dir_sur_la_route"} && cursorTarget distance player < 5 && je_suis_en_service_a_la_sarl_depannage >= 1'];
		refaire_refection_de_la_route = player addaction ["<t color=""#ff0000"">" + "Refaire La Route", "divers\nos_entreprises\sarl_depannage\mission_aleatoire\route_dir_hs\supprimer_fissure_sur_la_route.sqf", [], 10, false, true, "",'{!isnil {_x getvariable "route_hs_dir"}} foreach (nearestObjects [getPosATL player, ["Crack_Clutter4"], 3]) && je_suis_en_service_a_la_sarl_depannage >= 1'];
		menu_liste_joueur_demandant_depannage = player addAction [("<t color=""#ED2744"">") + ("Liste Des Dépannages") + "</t>","divers\nos_entreprises\sarl_depannage\systeme_contacter_dir\employes\menu_joueurs_demandant_depannage.sqf",[], 8, true, true, "", "je_suis_en_service_a_la_sarl_depannage >= 1"];
		
		affichage_dernier_devis = {hint "Devis envoyé ..."; [[[recapitulatif_un,recapitulatif_deux,recapitulatif_trois,recapitulatif_quatre,recapitulatif_cinq,recapitulatif_six,recapitulatif_sept,recapitulatif_huit,recapitulatif_neuf,recapitulatif_dix,recapitulatif_onze,prix_total_reparation],"divers\nos_entreprises\sarl_depannage\devis_reparation\montrer_au_client_le_devis.sqf"],"BIS_fnc_execVM",cursortarget,false] spawn BIS_fnc_MP;};
		devis_sarl_dde = player addaction ["<t color=""#ff0000"">" + "Faire Devis Dégats","divers\nos_entreprises\sarl_depannage\devis_reparation\devis_reparation_vehicules.sqf",[],7,false,false,"","!isnil {cursorTarget getvariable 'plaque_immatriculation_news'} && alive cursortarget && cursortarget distance player < 7 && je_suis_en_service_a_la_sarl_depannage >= 1"];
		montrer_dernier_devis = player addaction ["<t color=""#ff0000"">" + "Montrer Mon Dernier Devis",affichage_dernier_devis,[],6,false,false,"","!isnil 'prix_total_reparation' && isplayer cursortarget && player distance cursortarget < 5 && alive cursortarget && je_suis_en_service_a_la_sarl_depannage >= 1"];
	   
		if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};
		if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1 or player getvariable "je_possede_un_telephone_sfp" select 1 < 1 or player getvariable "je_possede_un_telephone_sfp" select 2 < 200) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};

		waituntil {!isnil {player getvariable "ma_paye_by_sfp_maxou"};};
		if (player getvariable "ma_paye_by_sfp_maxou" < sfp_config_salaire_sarl_depannage) then {player setVariable["ma_paye_by_sfp_maxou", sfp_config_salaire_sarl_depannage,false];};
		if (isnil {player getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}) then {player setVariable["je_suis_une_entreprise_pour_avoir_un_virement", true,true];};
		if (player getvariable "mes_aides_caf" > 0) then {player setVariable["mes_aides_caf", 0,false];};
		if (isnil {player getvariable "sarl_depannage_en_ligne"}) then {player setVariable["sarl_depannage_en_ligne", true,true];};
		je_suis_en_service_a_la_sarl_depannage = 1;
		jallume_gyro_depanneuse = 0;
		_habbitactuel = uniform player;	if (_habbitactuel != "U_Rangemaster") then {player forceAddUniform "U_Rangemaster";}; sleep 1; player setObjectTextureGlobal [0, "textures\habbit_dde.jpg"];

		execvm "divers\nos_entreprises\sarl_depannage\divers\marker_vehicule_des_depanneurs.sqf";
};	

waituntil {sleep 1;!(player in list sarl_depannage)};
if (!isnil "actionpourrecruter") then {player removeaction actionpourrecruter;};
if (!isnil "actionpourdemissionner") then {player removeaction actionpourdemissionner;};
if (debug_mission_pour_dev) then {player setvariable ["sarl_depannage",nil,true];};



// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_neomedia") exitwith {hint "Erreur whitelist. Contact Maxou.";};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "En tant que pompier en service, vous pouvez rentrer dans les HQ pour soigner les joueurs ...";};
if (!isnil {player getvariable "autorisation_rentrer_neomedia"}) exitwith {hint "Néomédia vous à autorisé à rentrer ici.";};

_personneautoriserdoffice = whitelist_neomedia;
if (getPlayerUID player in _personneautoriserdoffice) then {if (isnil {player getvariable "sarl_neomedia"}) then {player setvariable ["sarl_neomedia",true,true];};};
if (debug_mission_pour_dev) then {if (isnil {player getvariable "sarl_neomedia"}) then {player setvariable ["sarl_neomedia",true,true];};};

if (!isnil "action_envoyer_banniere") then {player removeaction action_envoyer_banniere;};
if (!isnil "actionpourmequiper") then {player removeaction actionpourmequiper;};
if (!isnil "action_acheter_littlebird_neomedia") then {player removeaction action_acheter_littlebird_neomedia;};
if (!isnil "action_acheter_addac_neomedia") then {player removeaction action_acheter_addac_neomedia;};
if (!isnil "action_faire_rentrer_personne_neomedia") then {player removeaction action_faire_rentrer_personne_neomedia;};

actionrecrutement = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être recruter !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; if (!isnil {cursorTarget getvariable "sarl_car_shop"}) exitwith {hint "Désolé, le joueur travail déja pour SARL CAR SHOP !";};if (!isnil {cursorTarget getvariable "sarl_avocat"}) exitwith {hint "Désolé, le joueur travail déja pour SARL AVOCAT !";}; if (!isnil {cursorTarget getvariable "sarl_depannage"}) exitwith {hint "Désolé, le joueur travail déja pour SARL DIR !";};if (!isnil {cursorTarget getvariable "sarl_pompier"}) exitwith {hint "Désolé, le joueur travail déja pour SARL POMPIER !";};cursortarget setvariable ["sarl_neomedia",true,true];hint format ["%1 à bien été recruter chez SARL NEOMEDIA !",name cursortarget];};
actiondemissionner = {if (isnull cursortarget) exitwith {hint "Personne n'est pointé pour être virer !";}; if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"}; cursortarget setvariable ["sarl_neomedia",nil,true];hint format ["%1 à bien été supprimer de ta société et ne peux donc plus rentrer dans ton HQ ;)",name cursortarget];};

if (player in list sarl_neomedia) then
{
	if (isnil {player getvariable "sarl_neomedia"}) exitwith {jai_le_droit_de_me_tp = 1; player setpos (getmarkerpos "position_sarl_neomedia_respawn"); hint "! SARL NEOMEDIA ! \n --------------------------------------- \n\n Bonjour, \n Vous êtes dans les bureaux de la SARL NEOMEDIA. \n\n Sauf erreur de ma part, vous n'avez pas le droit de rentrer ici sans notre permission.\n\n Cordialement.";};

	if (!isnil {player getvariable "sarl_neomedia"}) then 
	{
		hint format ["! SARL NEOMEDIA ! \n --------------------------------------- \n\n Bienvenue chez la SARL NEOMEDIA %1. \n\n Tu peux prendre ta fonction quand tu le souhaites puisque tu es autorisé ;). \n\n Cordialement.",name player];};
		if (getPlayerUID player in _personneautoriserdoffice) then 
		{
			actionpourrecruter = player addAction ["<t color=""#ff0000"">" + "Recruter un journaliste",actionrecrutement,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && isnil {cursorTarget getvariable "sarl_neomedia"}'];
			actionpourdemissionner = player addAction ["<t color=""#ff0000"">" + "Donner démission à un journaliste",actiondemissionner,[],10,true,true,'','!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8 && !isnil {cursorTarget getvariable "sarl_neomedia"}'];
		};
		
		if (isnil {player getvariable "je_possede_un_telephone_sfp"}) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};
		if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1 or player getvariable "je_possede_un_telephone_sfp" select 1 < 1 or player getvariable "je_possede_un_telephone_sfp" select 2 < 200) then {player setvariable ["je_possede_un_telephone_sfp", [1, 1, 10], true]; systemchat "Téléphone portable d'entreprise founit gratuitement avec 200 Textos !";};

		waituntil {!isnil {player getvariable "ma_paye_by_sfp_maxou"};};
		if (player getvariable "ma_paye_by_sfp_maxou" < sfp_config_salaire_sarl_neomedia) then {player setVariable["ma_paye_by_sfp_maxou", sfp_config_salaire_sarl_neomedia,false];};
		if (isnil {player getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}) then {player setVariable["je_suis_une_entreprise_pour_avoir_un_virement", true,true];};
		if (player getvariable "mes_aides_caf" < 1) then {player setVariable["mes_aides_caf", 0,false];};
		if (isnil {player getvariable "sarl_neomedia_en_ligne"}) then {player setVariable["sarl_neomedia_en_ligne", true, true];};
		
		jesuis_au_taff_a_la_sarl_neomedia = 1;

		actionpourmequiper = player addAction ["<t color=""#ff0000"">" + "M'Equiper Pour Travailler","divers\nos_entreprises\sarl_neomedia\equiper_sarl_neomedia.sqf",[],10,true,true,'','player in list sarl_neomedia'];
		action_envoyer_banniere = player addAction ["<t color=""#ff0000"">" + "Envoyer Spot","divers\nos_entreprises\sarl_neomedia\banniere_neomedia\addaction_ouverture.sqf",[],10,true,true,'',''];
		action_acheter_littlebird_neomedia = player addAction ["<t color=""#ff0000"">" + "Acheter LittleBird Neomedia (60 000)","divers\nos_entreprises\sarl_neomedia\achat_d_un_littlebird_sarl_neomedia.sqf",[],10,true,true,'',''];
		action_acheter_addac_neomedia = player addAction ["<t color=""#ff0000"">" + "Acheter ADDAC Neomedia (110000)","divers\nos_entreprises\sarl_neomedia\achat_d_un_addac_sarl_neomedia.sqf",[],10,true,true,'',''];
		action_faire_rentrer_personne_neomedia = player addAction ["<t color=""#ff0000"">" + "Autoriser Personne A Rentrer Dans Le QG","divers\nos_entreprises\sarl_neomedia\autoriser_personne_rentrer_dans_neomedia\lancer_autorisation_personne_rentrer_neomedia - Copie.sqf",[],10,true,true,'','isnil {cursorTarget getvariable "autorisation_rentrer_neomedia"}'];
		
		action_addaction_une = player addAction ['Dodo Au HQ :)','menu\hotel.sqf',[],7,true,true,'',''];
		action_addaction_deux = player addAction ["Boire Un Cafe","menu\restaurantcafe.sqf",[], 10,false,true,","];
		action_addaction_trois = player addAction ["Boire une boisson","menu\restauranteau.sqf",[], 10,false,true,","]; 
		action_addaction_quatre = player addAction ["Prendre un repas","menu\restaurantnourriture.sqf",[], 10,false,true,","]; 
		action_addaction_cinq = player addAction ["Ressource Nourriture Disponible De L'ile","hint format [""! SYSTEME DE VIE SFP ! \n ---------------------------------- \n\n L'�le dispose actuellement de %1 jours de reserve de nourriture suivant le nombre de joueur present ! \n\n Vends des produits au marche pour augmenter celui ci ! \n ------------------------------------------------ \n www.sfp-team.fr.nf \n By SFP Maxou"",patron_des_ressources_du_serveur]",[], 10,false,true,","];
};	

waituntil {sleep 0.5; !(player in list sarl_neomedia)};
if (!isnil "actionpourrecruter") then {player removeaction actionpourrecruter;};
if (!isnil "actionpourdemissionner") then {player removeaction actionpourdemissionner;};
if (!isnil "actionpourmequiper") then {player removeaction actionpourmequiper;};
if (!isnil "action_acheter_littlebird_neomedia") then {player removeaction action_acheter_littlebird_neomedia;};
if (!isnil "action_acheter_addac_neomedia") then {player removeaction action_acheter_addac_neomedia;};
if (!isnil "action_faire_rentrer_personne_neomedia") then {player removeaction action_faire_rentrer_personne_neomedia;};
if (!isnil "action_addaction_une") then {player removeaction action_addaction_une;};
if (!isnil "action_addaction_deux") then {player removeaction action_addaction_deux;};
if (!isnil "action_addaction_trois") then {player removeaction action_addaction_trois;};
if (!isnil "action_addaction_quatre") then {player removeaction action_addaction_quatre;};
if (!isnil "action_addaction_cinq") then {player removeaction action_addaction_cinq;};
if (debug_mission_pour_dev) then {player setvariable ["sarl_neomedia",nil,true];};



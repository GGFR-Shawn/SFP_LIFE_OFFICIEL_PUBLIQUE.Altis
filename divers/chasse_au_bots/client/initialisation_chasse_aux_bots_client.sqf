//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if (!hasInterface) exitwith {};

waituntil {sleep 3; !isnil "lancement_de_la_chasse_au_bot"};
waituntil {sleep 3;lancement_de_la_chasse_au_bot >= 1;};
sleep 5;

["ChasseAuBots",[format["%1 terroristes sont sur notre ile ! Trouvez les et tués les ! !",combien_de_bot_pour_avertir]]] call bis_fnc_showNotification;

if (!isnil "quel_objet_prendre_choisit_un_confirmation") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_un.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_deux") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_deux.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_trois") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_trois.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_quatre") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_quatre.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_cinq") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_cinq.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_six") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_six.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_sept") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_sept.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_huit") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_huit.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_neuf") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_neuf.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_dix") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_dix.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_onze") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_onze.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_douze") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_douze.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_treize") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_treize.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_quatorze") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_quatorze.sqf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_quinze") then {execvm "divers\chasse_au_bots\client\attente_des_morts_des_bots\attente_mort_chasse_aux_bots_quinze.sqf";};

sleep 1;
player globalchat format ["%1 terroristes bot sont actuellement sur notre ile (voir carte). Trouvés les et exterminés les ! Une grosse récompense sera offerte pour chaque mort ou présence sur les lieux ! Attention, ils ne supportent pas qu'on les approchent !!!",combien_de_bot_pour_avertir];

while {!isnil "quel_objet_prendre_choisit_un_confirmation" or !isnil "quel_objet_prendre_choisit_un_confirmation_deux" or !isnil "quel_objet_prendre_choisit_un_confirmation_trois" or !isnil "quel_objet_prendre_choisit_un_confirmation_quatre" or !isnil "quel_objet_prendre_choisit_un_confirmation_cinq" or !isnil "quel_objet_prendre_choisit_un_confirmation_six" or !isnil "quel_objet_prendre_choisit_un_confirmation_sept" or !isnil "quel_objet_prendre_choisit_un_confirmation_huit" or !isnil "quel_objet_prendre_choisit_un_confirmation_neuf" or !isnil "quel_objet_prendre_choisit_un_confirmation_dix" or !isnil "quel_objet_prendre_choisit_un_confirmation_onze" or !isnil "quel_objet_prendre_choisit_un_confirmation_douze" or !isnil "quel_objet_prendre_choisit_un_confirmation_treize" or !isnil "quel_objet_prendre_choisit_un_confirmation_quatorze" or !isnil "quel_objet_prendre_choisit_un_confirmation_quinze";} do
{
	sleep 1;
	
	if (side cursorTarget == east && cursorTarget distance player < 500) then 
	{
		while {rating player >= 0} do
		{
			player addRating -99999999;
			player globalchat "Tu as visé un terroriste, tu ne pourras plus acheter de véhicule etc jusqu'à leurs morts ou jusqu'à ta déco !";
			sleep 1;
		};
	};
	
	{
		sleep 1;
		if (side _x == east) then 
		{
			if (isnil "temps_suppressionarmes_sol_bot") then {temps_suppressionarmes_sol_bot = 2;};
			temps_suppressionarmes_sol_bot = round (temps_suppressionarmes_sol_bot - 1);
			if (temps_suppressionarmes_sol_bot <= 0) then
			{
				temps_suppressionarmes_sol_bot = nil;
				{
					if (!(alive _x) && _x iskindof "man") then {deleteVehicle _x;};
					if (!(_x iskindof "man")) then {deleteVehicle _x;};
				} forEach (nearestObjects [player, ["MAN","GroundWeaponHolder","weaponholder","WeaponHolderSimulated"], 20]);
			};			
			
			while {rating player >= 0} do
			{
				player addRating -99999999;
				player globalchat "Tu est proche d'un terroriste, tu ne pourras plus acheter de véhicule etc jusqu'à leurs morts ou jusqu'à ta déco !";
				sleep 1;
			};
		};
	// } forEach (nearestObjects [player, ["MAN"], 60]);
	} forEach (player nearEntities ['MAN', 60]);
};

temps_suppressionarmes_sol_bot = nil;

waituntil {sleep 2;lancement_de_la_chasse_au_bot < 1;};

if (rating player > 0) then {player globalchat "Tous les terroristes ont étés neutralisés, vous pouvez de nouveau circuler librement !";};
if (rating player < 0) then {player globalchat "Tous les terroristes ont étés neutralisés, réinitialisation du jeu pour pouvoir acheter de nouveau des véhicules !";};

while {rating player < 0} do
{
	player addrating 10000000;
	sleep 1;
};

execvm "divers\chasse_au_bots\client\initialisation_chasse_aux_bots_client.sqf";
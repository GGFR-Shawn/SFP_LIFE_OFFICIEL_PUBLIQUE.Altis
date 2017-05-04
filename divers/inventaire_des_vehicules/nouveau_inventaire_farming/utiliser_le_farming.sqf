// =====================================================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

private "_condition_trouve";
_condition_trouve = false;
ligne_colone_du_farming_gauche = lbcursel 1501;
if (lbcursel 1501 == -1) exitwith {hint "Rien n'est selectionné ...";};
if (lbtext ([1501,0]) == "Rien dans l'inventaire.") exitwith {hint "Rien n'est selectionné ...";};
if (!isnil "operation_en_cours_sur_le_farming") exitwith {hint "Opération impossible, une opération est déja en cours ...";};

_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 

if (isnil {player getvariable _nom_de_la_variable_du_farming}) then {player setvariable [_nom_de_la_variable_du_farming,0,true];};
if (isnil "_nom_de_la_variable_du_farming" or isnil "_nombre_de_place_de_la_variable" or isnil "_nom_du_produit_de_farming") exitwith {hint "Erreur, recommence ...";};

switch _nom_de_la_variable_du_farming do
{
	case "barredecereale" :
	{
		_condition_trouve = true;
		
		[] spawn
		{		
			_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
			_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
			_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 

			if (isnil "jemange") then {jemange = 0;};
			if (jemange == 1) exitwith {hint "Tu es déja entrain de manger une barre de céréale !";};
			if (!sfp_config_activer_faim) exitwith {hint "Cette fonction n'est pas activée sur ce serveur !";};
			jemange = 1;

			player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - 1, true];
			player setvariable ["usedspace", (player getvariable "usedspace") - (_nombre_de_place_de_la_variable), true];
			
			hint "! BARRE CEREALE ! \n -------------------------------------- \n\n Tu viens d'utiliser une barre de céréale. \n\n Tu vas retrouver 25 pourcent de nourriture dans quelques secondes. \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou";
			player say "JeMange";

			for "_i" from 0 to 25 do
			{
				player setVariable["niveau_de_faim",(player getVariable "niveau_de_faim") + 1,false];
				sleep 1;
			};	

			hint format ["! BARRE CEREALE ! \n --------------------------------------  \n\n Tu as maintenant %1 pourcent de faim. \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou",player getVariable "niveau_de_faim"];
			jemange = 0;	
		};
	};
	
	case "bidon_d_essence" :
	{
		_condition_trouve = true;
		
		[] spawn
		{	
			_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
			_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
			_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 

			{if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then {desdepanneurssontenjeu = 1;};} foreach allunits;
			if (!isnil "desdepanneurssontenjeu") exitwith {desdepanneurssontenjeu = nil; hint "Désolé, tu ne peux pas mettre du gasoil dans ce véhicule puisque des dépanneurs sont connectés ! \n Appel les !";};

			if (isnil {cursortarget getvariable "vehicule_info_parvariable"}) exitwith {hint "Désolé ce n'est pas un véhicule ...";};
			if (isnil "autonomie_de_mon_jerrican") then {autonomie_de_mon_jerrican = 50;}; 
			if (autonomie_de_mon_jerrican <= 0) exitwith {hint "Désolé, tu n'as pas de gasoil dans ton jerrican !";}; 
			if ((fuel cursortarget) > 0.5) exitwith {hint "Désolé, le véhicule à déjà plus de la moitié de gasoil dans son réservoir !";}; 

			_veh = cursortarget;
			
			je_met_du_gasoil = 1;
			ranger_jerrican = {je_met_du_gasoil = 0;};
			closedialog 0;
			
			_jerican = createvehicle ["Land_CanisterFuel_F", getPosATL player, [], 0, "CAN_COLLIDE"];
			_jerican attachto [player,[-0.044,-0.06,-0.1],"righthand"];
			_jerican setVectorDirAndUp [[0.5,0,0],[0,0.5,0]];

			action_remettre_gasoil = player addAction ["<t color=""#ff0000"">" + "Ranger Jerrican",ranger_jerrican,[],10,true,true,'',''];

			while {autonomie_de_mon_jerrican > 0 && je_met_du_gasoil >= 1} do
			{
				autonomie_de_mon_jerrican = autonomie_de_mon_jerrican - 2;
				_fuel_dans_la_voiture = fuel _veh;
				_appliquer_fuel = (_fuel_dans_la_voiture) + 0.02;
				_fuel_dans_la_voiture_calcul = _fuel_dans_la_voiture * 100;
				
				while {player distance _veh > 4 && je_met_du_gasoil >= 1 && alive player} do
				{
					0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Rapproches toi du véhicule ! ",autonomie_de_mon_jerrican,round (_fuel_dans_la_voiture_calcul)],"PLAIN"];	
					sleep 1;
				};
				
				0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Gasoil restant jerrican : %1 litres. \n Gasoil dans le vehicule : %2 Pour Cent. \n\n N'oublie pas de laisser pointer ta souris sur le véhicule !",autonomie_de_mon_jerrican,round (_fuel_dans_la_voiture_calcul)],"PLAIN"];	
				if (fuel _veh >= 1) then {je_met_du_gasoil = 0;};
				[[[_veh,_appliquer_fuel],"divers\achat_divers_supermarche\utiliser_et_donner_les_achats\bidon_d_essence\synchro_fuel.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
				sleep 2;
			};

			
			deletevehicle _jerican;
			player removeAction action_remettre_gasoil;

			if (autonomie_de_mon_jerrican <= 0) then 
			{
				player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - 1, true];
				player setvariable ["usedspace", (player getvariable "usedspace") - (_nombre_de_place_de_la_variable), true];
				hint "Votre jerrican est vide !";
				autonomie_de_mon_jerrican = nil;
			};
			
			if (fuel _veh >= 1) exitwith {hint "Le véhicule a maintenant le reservoir plein !";};
			if (fuel _veh < 1) exitwith {hint "Le véhicule n'a pas le reservoir plein !";};
		};
	};
	
	case "boite_allumette" :
	{
		_condition_trouve = true;
		
		[] spawn
		{		
			_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
			_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
			_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 
	
			_verificationsurface = ["#GdtAsphalt"];
			if (count (nearestObjects [getPosATL (vehicle player), ["Land_Campfire_F"], 3]) >= 1) exitwith {hint "Impossible, un autre feu est déja sur place...";};
			if ((surfaceType getPosATL player) in _verificationsurface) exitwith {hint "Désolé, tu ne peux pas mettre le feu de camp à cette endroit !";};
			if (count (nearestObjects [getPosATL (vehicle player), ["CAR","AIR","SHIP"], 5]) >= 1) exitwith {hint "Impossible, un véhicule est pret de votre position ...";}; 

			private "_le_feu_de_camp";
			_temps_allumage_feu = round (6 + (random 11));
			_temps_avant_suppression = 600;
			[_temps_allumage_feu] spawn bar_de_progression_by_maxou;

			player setvariable [_nom_de_la_variable_du_farming, nil, true];
			player setvariable ["usedspace", (player getvariable "usedspace") - (_nombre_de_place_de_la_variable), true];

			closedialog 0;
			
			while {_temps_allumage_feu > 0 && alive player} do 
			{
				if (isnil "_le_feu_de_camp") then 
				{
					_le_feu_de_camp = createVehicle ["Land_Campfire_F", getPosATL player, [], 0, "NONE"];
					_le_feu_de_camp attachto [player,[0,1,1]];
					_pos = getPosATL _le_feu_de_camp;
					_pos set [2,0];
					_le_feu_de_camp setPosATL _pos;
					detach _le_feu_de_camp;
					_le_feu_de_camp setvariable ["jesuisenfeu",1,true];
				};
				
				player playActionNow "medicstartup";
				titleText [format["Encore %1 secondes ... !", _temps_allumage_feu], "PLAIN DOWN"];
				_temps_allumage_feu = _temps_allumage_feu - 1;
				
				sleep 1;
			};	

			bar_de_progression_by_maxou_reinitialisation = true;

			if (!alive player) exitwith {};

			[[[_le_feu_de_camp, _temps_avant_suppression],"divers\achat_divers_supermarche\utiliser_et_donner_les_achats\boite_allumette\synchro_feu_de_camp.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

			player playActionNow "medicstop";	
			player switchmove "";
	
		};
	};
	
	case "bouteilledeau" :
	{
		_condition_trouve = true;
		
		[] spawn
		{		
			_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
			_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
			_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 
		
			if (isnil "jebois") then {jebois = 0;};
			if (jebois == 1) exitwith {hint "Tu es déja entrain de boire une bouteille d'eau !";};
			if (!sfp_config_activer_soif) exitwith {hint "Désolé, cette fonction n'est pas activée sur ce serveur !";};
			jebois = 1;

			hint "! BOUTEILLE EAU ! \n -------------------------------------- \n\n Tu viens d'utiliser une bouteille d'eau. \n\n Tu vas retrouver 25 pourcent d'eau dans quelques secondes. \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou";
			player say "JeBois";

			player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - 1, true];
			player setvariable ["usedspace", (player getvariable "usedspace") - (_nombre_de_place_de_la_variable), true];

			for "_i" from 0 to 25 do
			{
				sleep 0.5;
				niveau_de_soif = round (niveau_de_soif + 1);
			};	

			jebois = 0;
			sleep 1;
			hint format ["! BOUTEILLE EAU ! \n --------------------------------------  \n\n Tu as maintenant %1 pourcent d'eau. \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou", niveau_de_soif];
			jebois = 0;		
		};
	};
	
	case "corde_et_sac" :
	{
		_condition_trouve = true;
		
		[] spawn
		{		
			_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
			_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
			_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 
					
			if (isNull cursortarget) exitWith {hint "Personne n'est pointé !"};
			if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"};
			if (isnil {cursortarget getvariable "jai_les_mains_sur_la_tete"}) exitWith {hint "Désolé, le joueur n'a pas les mains sur la tete !"};

			le_joueur_a_mettre_les_mains_sur_la_tete = cursortarget;

			player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - 1, true];
			player setvariable ["usedspace", (player getvariable "usedspace") - (_nombre_de_place_de_la_variable), true];

			le_joueur_a_mettre_les_mains_sur_la_tete setVariable ["jai_un_sac_sur_la_tete",true,true];

			hint format ["! SAC ET CORDE ! \n -------------------------------------------- \n \n Vous venez de mettre un sac sur la tete de %1. \n\n Il ne pourra donc plus voir (que très peu) et bouger ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name le_joueur_a_mettre_les_mains_sur_la_tete];

			[[[player],"divers\achat_divers_supermarche\utiliser_et_donner_les_achats\corde_et_sac_supermarche\utiliser_la_corde_et_le_sac\corde_et_sac_action_sur_le_joueur.sqf"],"BIS_fnc_execVM",le_joueur_a_mettre_les_mains_sur_la_tete,false] spawn BIS_fnc_MP;
		};
	};
	
	case "redbull" :
	{
		_condition_trouve = true;
		
		[] spawn
		{		
			_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
			_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
			_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 
								
			if (isnil "jutilise_une_redbull") then {jutilise_une_redbull = 0;};
			if (jutilise_une_redbull == 1) exitwith {hint "Désolé, tu es déja entrain de boire une RedBull !";};

			jutilise_une_redbull = 1;
			player say "JouvreUneCanette";
			hint format ["! REDBULL ! \n -------------------------------------- \n\n Tu viens d'utiliser une redbull. \n\n Vitesse accrue, stabilitée de l'arme et course illimitée pour %1 secondes ! \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou", 180];

			player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - 1, true];
			player setvariable ["usedspace", (player getvariable "usedspace") - (_nombre_de_place_de_la_variable), true];

			player setCustomAimCoef 0.1;
			player setAnimSpeedCoef 1.9; // vitesse deplacement du personnage
			player enableStamina false;

			for "_i" from 0 to 180 do
			{
				sleep 1;
			};	

			player enableStamina true;

			hint "! REDBULL ! \n --------------------------------------  \n\n Fin de l'effet de la redbull. \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou";
			jutilise_une_redbull = 0;		
		};
	};
	
	case "traceur_vehicule" :
	{
		_condition_trouve = true;
		
		[] spawn
		{		
			_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
			_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
			_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 
								
			private "_le_marqueur";
			_le_vehicule = cursortarget;
			_son_nom = getText ( configFile >> "CfgVehicles" >> typeOf _le_vehicule >> "displayName");

			if (isnull cursortarget) exitwith {hint "Aucun véhicule de pointé ...";};
			if (isnil {cursortarget getvariable "vehicule_info_parvariable"}) exitwith {hint "Désolé ce n'est pas un véhicule ...";};
			if (isnil "_le_vehicule") exitwith {hint "Erreur sur le véhicule ... Recommence.";};

			hint "! TRACEUR VEHICULE ! \n -------------------------------------- \n\n Tu viens d'utiliser un traceur de véhicule. \n\n Le traceur sera affiché sur ta carte jusqu'a la destruction du véhicule ! \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou";

			player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - 1, true];
			player setvariable ["usedspace", (player getvariable "usedspace") - (_nombre_de_place_de_la_variable), true];

			_nom_du_marqueur = format ["%1%2",name player, _le_vehicule];
			_le_marqueur = createMarkerlocal [_nom_du_marqueur, position _le_vehicule];
			_le_marqueur setMarkerShapelocal "ICON";
			_le_marqueur setMarkerColorlocal "ColorRed";
			_le_marqueur setMarkerSizelocal [1.2,1.2];
			_le_marqueur setMarkerTypelocal "hd_dot";
			_le_marqueur setMarkerTextlocal format['Traceur : %1.', _son_nom];

			while {alive _le_vehicule} do
			{
				_le_marqueur setMarkerPoslocal (position _le_vehicule);
				sleep (2 + (random 5));
			};

			systemchat format ["Traceur du %1 HS ...", _son_nom];
			deletemarkerlocal _le_marqueur;
		};
	};
	
	case "gelule_amphetamines" :
	{
		_condition_trouve = true;
		
		[] spawn
		{		
			_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
			_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
			_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 
								
			if (isnil {player getvariable "je_viens_de_prendre_un_amphetamines"}) then {player setvariable ["je_viens_de_prendre_un_amphetamines",true,false];};

			_temps_d_action = round (5 * 60);
			prise_d_amphetamine = true;

			hint "C'est partit ! Tu vas ressentir les effets d'ici peu !";

			player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - 1, true];
			player setvariable ["je_viens_de_prendre_un_amphetamines",true,false];

			sleep (1 + random 5);

			player enableStamina false;
			setStaminaScheme "Normal";
			player setAnimSpeedCoef 1.5;
			player setCustomAimCoef 0.01;

			while {_temps_d_action > 0} do
			{
				sleep 10;
				_temps_d_action = _temps_d_action - 10;
			};

			hint "Les amphétamines viennent de prendre fin ! \n Vous allez reprendre votre niveau normal de performance.";

			player setvariable ["je_viens_de_prendre_un_amphetamines",nil,false];
			prise_d_amphetamine = nil;

			player enableStamina true;
		};
	};
	
	if (!_condition_trouve) then {hint "Désolé, ceci ne peux pas etre utilisé de cette facon !";};
};

execvm "divers\inventaire_des_vehicules\nouveau_inventaire_farming\mise_a_jour_informations_farming.sqf";

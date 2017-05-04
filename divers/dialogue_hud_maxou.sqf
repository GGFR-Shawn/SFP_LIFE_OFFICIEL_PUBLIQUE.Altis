// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "blackout_reseau_telecom"};
waituntil {sleep 1; !isnil "fin_verification_apres_chargement"};
waituntil {sleep 1; !isnil "force_du_signal_telephone_by_maxou"};
waituntil {sleep 1; !isnil "uid_sauvegarde_ecrire_local_joueur_sfp"};


disableSerialization;
private["_menu","_menu_deux","_selection_heure_redemarrage_serveur", "_position","_affichage","_hudVehicle","_couleur_choisit","_resultat_sport"];

[] spawn
{
	waitUntil {sleep 0.5; !isnil "heure_serveur" && !isnil "sfp_config_choix_heure_redemarrage"};
	
	private "_affichage_redemarrage";
	_menu = "Temps_de_jeu";
	_menu_deux = "Dialogue_Nombre_De_Personnes_Connectees";
	_id_menu = 20000;
	_id_menu_deux = 1000;
	_temps_mise_a_jour = 5;
	
	_heure_redemarrage_serveur = sfp_config_choix_heure_redemarrage;
	_heure_actuelle = heure_serveur select 3;
	_minutes_actuelle = heure_serveur select 4;
	_selection_heure_redemarrage_serveur = 0;
	_calcul_temps_de_jeu = 0;
	
	if (_heure_actuelle >= (_heure_redemarrage_serveur select 4) or _heure_actuelle <= (_heure_redemarrage_serveur select 0)) then {_selection_heure_redemarrage_serveur = _heure_redemarrage_serveur select 0;};
	if (_heure_actuelle >= (_heure_redemarrage_serveur select 0) && _heure_actuelle <= (_heure_redemarrage_serveur select 1)) then {_selection_heure_redemarrage_serveur = _heure_redemarrage_serveur select 1;};
	if (_heure_actuelle >= (_heure_redemarrage_serveur select 1) && _heure_actuelle <= (_heure_redemarrage_serveur select 2)) then {_selection_heure_redemarrage_serveur = _heure_redemarrage_serveur select 2;};
	if (_heure_actuelle >= (_heure_redemarrage_serveur select 2) && _heure_actuelle <= (_heure_redemarrage_serveur select 3)) then {_selection_heure_redemarrage_serveur = _heure_redemarrage_serveur select 3;};
	if (_heure_actuelle >= (_heure_redemarrage_serveur select 3) && _heure_actuelle <= (_heure_redemarrage_serveur select 4)) then {_selection_heure_redemarrage_serveur = _heure_redemarrage_serveur select 4;};
	if (_heure_actuelle >= (_heure_redemarrage_serveur select 4) && _heure_actuelle <= (23)) then {_selection_heure_redemarrage_serveur = _heure_redemarrage_serveur select 0;};
	
	3001 cutRsc [_menu,"PLAIN",1,true];
	3002 cutRsc [_menu_deux,"PLAIN",1,true];
	
	while {true} do
	{
		_heure_actuelle = heure_serveur select 3;
		_minutes_actuelle = heure_serveur select 4;
		
		if ((round (_selection_heure_redemarrage_serveur - _heure_actuelle) >= 0)) then
		{
			_affichage_redemarrage = format ["%1 H %2 Mins", round ((_selection_heure_redemarrage_serveur - _heure_actuelle) - 1), round (60 - _minutes_actuelle)];
		}else
		{
			_affichage_redemarrage = format ["%1 H %2 Mins", round ((23 - (heure_serveur select 3)) + 3), round (60 - _minutes_actuelle)];
		};

		if (vehicle player == player && isnil "dialogue_tablette_sfp_maxou" && isnil "map_sfp_ouverte") then
		{
			_les_civils_sfp = 0;
			_les_gendarmes_sfp = 0;
			_les_pompiers_sfp = 0;
			_la_dir_sfp = 0;
			_le_g7_sfp = 0;
			_l_auto_ecole_sfp = 0;
			_le_carshop_sfp = 0;
			_neomedia = 0;
			
			{
				if (side _x == civilian) then {_les_civils_sfp = round (_les_civils_sfp + 1);};
				if (side _x == west) then {_les_gendarmes_sfp = round (_les_gendarmes_sfp + 1);};
				if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then {_les_pompiers_sfp = round (_les_pompiers_sfp + 1);};
				if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then {_la_dir_sfp = round (_la_dir_sfp + 1);};
				if (!isnil {_x getvariable "sarl_taxis_gsept_en_ligne"}) then {_le_g7_sfp = round (_le_g7_sfp + 1);};
				if (!isnil {_x getvariable "sarl_autoecole_en_ligne"}) then {_l_auto_ecole_sfp = round (_l_auto_ecole_sfp + 1);};
				if (!isnil {_x getvariable "je_suis_au_taff_a_la_sarl_car_shop"}) then {_le_carshop_sfp = round (_le_carshop_sfp + 1);};
				if (!isnil {_x getvariable "sarl_neomedia_en_ligne"}) then {_neomedia = round (_neomedia + 1);};
				sleep 0.02;
			} foreach playableunits;
			
			_affichage_nombre_personne_connecte = format ["CIV (%1) WEST (%2) POMP (%3) DIR (%4) G7 (%5) AUTO (%6) SHOP (%7) NEOMEDIA (%8)", _les_civils_sfp, _les_gendarmes_sfp, _les_pompiers_sfp, _la_dir_sfp, _le_g7_sfp, _l_auto_ecole_sfp, _le_carshop_sfp, _neomedia];		
			
			((uiNameSpace getVariable _menu) displayCtrl _id_menu) ctrlSetStructuredText parseText format ["<t font='PuristaLight'><t size='0.8'>FPS: %1 / Tps jeu : %2 Mins. / Reboot : %3.</t></t>", round (diag_fps), round (_calcul_temps_de_jeu / 60), _affichage_redemarrage];
			((uiNameSpace getVariable _menu_deux) displayCtrl _id_menu_deux) ctrlSetStructuredText parseText format ["<t font='PuristaLight'><t size='0.8'>%1</t></t>", _affichage_nombre_personne_connecte];
		}else
		{
			((uiNameSpace getVariable _menu) displayCtrl _id_menu) ctrlSetStructuredText parseText "";
			((uiNameSpace getVariable _menu_deux) displayCtrl _id_menu_deux) ctrlSetStructuredText parseText "";
		};
		
		sleep _temps_mise_a_jour;
		_calcul_temps_de_jeu = round (_calcul_temps_de_jeu + _temps_mise_a_jour);
	};
};

private ["_mon_reseau","_son_nom","_vitesse_de_la_carte","_nom_marqueur","_configuration_hud_mini_carte"];
90000 cutRsc ["HUD_Menu_SFP","PLAIN"];

if (isnil {['mini_carte_hud'] call uid_sauvegarde_lire_local_joueur_sfp}) then {['mini_carte_hud', true] call uid_sauvegarde_ecrire_local_joueur_sfp;};
if (['mini_carte_hud'] call uid_sauvegarde_lire_local_joueur_sfp) then {_configuration_hud_mini_carte = true;};

while {true} do
{
	if (!alive player) then 
	{
		90000 cuttext ["","PLAIN"]; 
		waitUntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};
		90000 cutRsc ["HUD_Menu_SFP","PLAIN"];
	};
	
	if (!isnil "camera_active_pip_maxou") then 
	{
		if (speed player > 0.5) then 
		{
			90000 cuttext ["","PLAIN"]; 
			waitUntil {sleep 2; speed player < 0.5};
			90000 cutRsc ["HUD_Menu_SFP","PLAIN"];
		};
	}; 
	
	if (!isnil "camera_active_pip_voiture_maxou") then 
	{
		if (speed player < -5) then 
		{
			90000 cuttext ["","PLAIN"];
			waitUntil {sleep 2; speed player > 10};
			90000 cutRsc ["HUD_Menu_SFP","PLAIN"];
		};
	}; 

	// TaskForce
	if (!isnil "TF_tangent_lr_pressed" or !isnil "TF_tangent_dd_pressed" or !isnil "TF_tangent_sw_pressed") then
	{
		if (TF_tangent_lr_pressed or TF_tangent_dd_pressed or TF_tangent_sw_pressed or !(isNull (uiNamespace getVariable "TFAR_Hint_Display"))) then 
		{
			90000 cuttext ["","PLAIN"];
			waitUntil {sleep 0.1; isNull (uiNamespace getVariable "TFAR_Hint_Display") or !alive player};
			90000 cutRsc ["HUD_Menu_SFP","PLAIN"];
		}; 
	}; 

	// Menu Habits
	if (!isnil "je_veux_choisir_un_habit") then
	{
		90000 cuttext ["","PLAIN"];
		waitUntil {sleep 2; isnil "je_veux_choisir_un_habit"};
		90000 cutRsc ["HUD_Menu_SFP","PLAIN"];
	}; 

	// Tablette sfp
	if (!isnil "dialogue_tablette_sfp_maxou") then
	{
		90000 cuttext ["","PLAIN"];
		waitUntil {sleep 2; isnil "dialogue_tablette_sfp_maxou"};
		90000 cutRsc ["HUD_Menu_SFP","PLAIN"];
	}; 

	// Carte Ouverte
	if (!isnil "map_sfp_ouverte") then
	{
		90000 cuttext ["","PLAIN"];
		waitUntil {sleep 2; isnil "map_sfp_ouverte"};
		90000 cutRsc ["HUD_Menu_SFP","PLAIN"];
	}; 

	// Message staff
	if (!isnil "cache_hud_dialogue_BIS_AAN") then
	{
		90000 cuttext ["","PLAIN"];
		waitUntil {sleep 2; isnil "cache_hud_dialogue_BIS_AAN"};
		90000 cutRsc ["HUD_Menu_SFP","PLAIN"];
	}; 

	_menu = "HUD_Menu_SFP";
	_hudVehicle = ((uiNameSpace getVariable _menu) displayCtrl 1017);
	_affichage = "";
	_argent_poche = 1001; 
	_argent_poche_bar = 1014;
	_points_permis = 1003; 
	_points_permis_bar = 1015;
	_dommage = 1000; 
	_dommage_bar = 1009;
	_fatigue = 1002; 
	_fatigue_bar = 1010;
	_faim = 1006; 
	_faim_bar = 1011;
	_soif = 1005; 
	_soif_bar = 1012;
	_sommeil = 1007; 
	_sommeil_bar = 1008;
	_toilette = 1004; 
	_toilette_bar = 1013;
	_reseau = 1019; 
	_reseau_bar = 1018;
	_position_mapgrid = 1016;
	_couleur_verte = [0,0.91,0.07,1];
	_couleur_rouge = [0.99,0.04,0.01,1];
	_couleur_blanche = [1,1,1,1]; 
	
	_mon_argent = round (player getVariable "mon_argent_poche_by_sfp_maxou");
	if (_mon_argent <= 0) then {_position = 0;};
	if (_mon_argent > 0) then {_position = 0.1;};
	if (_mon_argent > 100) then {_position = 0.2;};
	if (_mon_argent > 500) then {_position = 0.3;};
	if (_mon_argent > 1000) then {_position = 0.4;};
	if (_mon_argent > 2000) then {_position = 0.5;};
	if (_mon_argent > 5000) then {_position = 0.7;};
	if (_mon_argent > 10000) then {_position = 0.9;};
	if (_mon_argent >= 20000) then {_position = 1;};
	((uiNamespace getVariable _menu) displayCtrl _argent_poche) ctrlSetText format ["%1",_mon_argent call retour_formatage_chiffre_sfp];
	((uiNamespace getVariable _menu) displayCtrl _argent_poche_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _argent_poche_bar) progressSetPosition (_position); 

	_mes_points = round (player getVariable "combien_de_point_by_sfp_maxou");
	_position = _mes_points / 10;
	if (_mes_points == 10) then {_position = 0.9;};
	if (_mes_points == 11) then {_position = 0.95;};
	if (_mes_points == 12) then {_position = 1;};
	((uiNamespace getVariable _menu) displayCtrl _points_permis) ctrlSetText format ["%1",_mes_points];
	((uiNamespace getVariable _menu) displayCtrl _points_permis_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _points_permis_bar) progressSetPosition (_position); 
	if (_mes_points < 1) then {_couleur_choisit = _couleur_rouge;}else{_couleur_choisit = _couleur_blanche;};
	((uiNamespace getVariable _menu) displayCtrl _points_permis) ctrlSetTextColor _couleur_choisit;

	_mon_dommage = 100 - ((round ((damage player) * (10 ^ 2)) / (10 ^ 2)) * 100);
	((uiNamespace getVariable _menu) displayCtrl _dommage) ctrlSetText format ["%1",_mon_dommage];
	((uiNamespace getVariable _menu) displayCtrl _dommage_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _dommage_bar) progressSetPosition (1 - (damage player)); 
	if (!isnil {player getvariable "j_ai_un_antibiotique"}) then {_couleur_choisit = _couleur_verte;}else{_couleur_choisit = _couleur_blanche;};
	if (damage player >= 0.85) then {_couleur_choisit = _couleur_rouge;};
	((uiNamespace getVariable _menu) displayCtrl _dommage) ctrlSetTextColor _couleur_choisit;

	_ma_fatigue = round (getStamina player);
	_position = ((_ma_fatigue /100) * 2);
	if (player getvariable "temps_fatigue_niveau_1" >= 1) then {_resultat_sport = 1;};
	if (player getvariable "temps_fatigue_niveau_2" >= 1) then {_resultat_sport = 2;};
	if (player getvariable "temps_fatigue_niveau_3" >= 1) then {_resultat_sport = 3;};
	if (player getvariable "temps_fatigue_niveau_4" >= 1) then {_resultat_sport = 4;};
	if (player getvariable "temps_fatigue_niveau_5" >= 1) then {_resultat_sport = 5;};
	((uiNamespace getVariable _menu) displayCtrl _fatigue) ctrlSetText format ["%1 (Niv %2)",_ma_fatigue, _resultat_sport];
	((uiNamespace getVariable _menu) displayCtrl _fatigue_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _fatigue_bar) progressSetPosition (_position); 
	if (getStamina player < 10) then {_couleur_choisit = _couleur_rouge;}else{_couleur_choisit = _couleur_blanche;};
	((uiNamespace getVariable _menu) displayCtrl _fatigue) ctrlSetTextColor _couleur_choisit;

	_ma_faim = round (player getvariable "niveau_de_faim");
	_position = _ma_faim / 100;
	if (sfp_config_activer_faim) then {((uiNamespace getVariable _menu) displayCtrl _faim) ctrlSetText format ["%1",_ma_faim];}else{((uiNamespace getVariable _menu) displayCtrl _faim) ctrlSetText "OFF";};
	((uiNamespace getVariable _menu) displayCtrl _faim_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _faim_bar) progressSetPosition (_position); 
	if (_ma_faim < 15) then {_couleur_choisit = _couleur_rouge;}else{_couleur_choisit = _couleur_blanche;};
	((uiNamespace getVariable _menu) displayCtrl _faim) ctrlSetTextColor _couleur_choisit;

	_ma_soif = round (niveau_de_soif);
	_position = _ma_soif / 100;
	if (sfp_config_activer_soif) then {((uiNamespace getVariable _menu) displayCtrl _soif) ctrlSetText format ["%1",_ma_soif];}else{((uiNamespace getVariable _menu) displayCtrl _soif) ctrlSetText "OFF";};
	((uiNamespace getVariable _menu) displayCtrl _soif_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _soif_bar) progressSetPosition (_position); 
	if (_soif < 10) then {_couleur_choisit = _couleur_rouge;}else{_couleur_choisit = _couleur_blanche;};
	((uiNamespace getVariable _menu) displayCtrl _soif) ctrlSetTextColor _couleur_choisit;

	_mon_sommeil = round (player getvariable "fautdormir");
	_position = _mon_sommeil / 100;
	if (sfp_config_activer_dormir) then {((uiNamespace getVariable _menu) displayCtrl _sommeil) ctrlSetText format ["%1",_mon_sommeil];}else{((uiNamespace getVariable _menu) displayCtrl _sommeil) ctrlSetText format "OFF";};
	((uiNamespace getVariable _menu) displayCtrl _sommeil_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _sommeil_bar) progressSetPosition (_position); 
	if (_mon_sommeil < 10) then {_couleur_choisit = _couleur_rouge;}else{_couleur_choisit = _couleur_blanche;};
	((uiNamespace getVariable _menu) displayCtrl _sommeil) ctrlSetTextColor _couleur_choisit;

	_mon_toilette = round (player getvariable "toilette_by_sfp_maxou");
	_position = _mon_toilette / 100;
	if (sfp_config_activer_toilette) then {((uiNamespace getVariable _menu) displayCtrl _toilette) ctrlSetText format ["%1",_mon_toilette];}else{((uiNamespace getVariable _menu) displayCtrl _toilette) ctrlSetText "OFF";};
	((uiNamespace getVariable _menu) displayCtrl _toilette_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _toilette_bar) progressSetPosition (_position); 
	if (_mon_toilette < 10) then {_couleur_choisit = _couleur_rouge;}else{_couleur_choisit = _couleur_blanche;};
	((uiNamespace getVariable _menu) displayCtrl _toilette) ctrlSetTextColor _couleur_choisit;

	if (blackout_reseau_telecom < 1) then {_mon_reseau = round (force_du_signal_telephone_by_maxou);}else{_mon_reseau = 0;};
	_position = (0 + ((force_du_signal_telephone_by_maxou / 10) * 2));
	((uiNamespace getVariable _menu) displayCtrl _reseau) ctrlSetText "Pas de tél.";
	_couleur_choisit = _couleur_rouge;
	if (blackout_reseau_telecom < 1) then
	{
		if ((player getvariable "je_possede_un_telephone_sfp" select 0) >= 1 && (player getvariable "je_possede_un_telephone_sfp" select 1) >= 1) then
		{
			((uiNamespace getVariable _menu) displayCtrl _reseau) ctrlSetText format ["%1/%2",_mon_reseau, force_du_signal_telephone_by_maxou_maximum];
		}else
		{
			if ((player getvariable "je_possede_un_telephone_sfp" select 0) < 1) then
			{
				((uiNamespace getVariable _menu) displayCtrl _reseau) ctrlSetText "Pas de tél.";
			}else
			{
				((uiNamespace getVariable _menu) displayCtrl _reseau) ctrlSetText "Tél Eteint.";
			};
		};
	}else
	{
		((uiNamespace getVariable _menu) displayCtrl _reseau) ctrlSetText "Black-Out.";
	};
	((uiNamespace getVariable _menu) displayCtrl _reseau_bar) ctrlSetText "";
	((uiNamespace getVariable _menu) displayCtrl _reseau_bar) progressSetPosition (_position); 
	if (_mon_reseau < 1 or (player getvariable "je_possede_un_telephone_sfp" select 0) < 1 or (player getvariable "je_possede_un_telephone_sfp" select 1) < 1) then {_couleur_choisit = _couleur_rouge;}else{_couleur_choisit = _couleur_blanche;};
	((uiNamespace getVariable _menu) displayCtrl _reseau) ctrlSetTextColor _couleur_choisit;

	
	if (!isnil "_configuration_hud_mini_carte") then
	{
		((uiNamespace getVariable _menu) displayCtrl _position_mapgrid) ctrlSetText format ["Position : %1", mapGridPosition player];	

		_vitesse_de_la_carte = 0.006;
		if (speed (vehicle player) > 1) then {_vitesse_de_la_carte = 0.010;}; 
		if (speed (vehicle player) > 14) then {_vitesse_de_la_carte = 0.018;}; 
		if (speed (vehicle player) > 22) then {_vitesse_de_la_carte = 0.024;}; 
		if (speed (vehicle player) > 50) then {_vitesse_de_la_carte = 0.045;}; 
		if (speed (vehicle player) > 80) then {_vitesse_de_la_carte = 0.090;}; 
		if (speed (vehicle player) > 120) then {_vitesse_de_la_carte = 0.160;}; 
		((uiNamespace getVariable _menu) displayCtrl 1210) ctrlMapAnimAdd [0.1, _vitesse_de_la_carte, position player];
		ctrlMapAnimCommit ((uiNamespace getVariable _menu) displayCtrl 1210);
		_nom_marqueur = format ["position_%1_hud_maxou",name player];
		_marqueur_ma_position = createMarkerLocal [_nom_marqueur, getPosATL player];
		_marqueur_ma_position setMarkerColorLocal "ColorRed";
		_marqueur_ma_position setMarkerShapeLocal "ICON";
		_marqueur_ma_position setMarkerTypeLocal "mil_arrow2";
		_marqueur_ma_position setMarkerDirLocal (getdir player);
		_marqueur_ma_position setMarkerSizeLocal [0.8, 0.8];
		_marqueur_ma_position setMarkerPosLocal (getPosATL player);
		if (ctrlText ((uiNameSpace getVariable _menu) displayCtrl 1212) != "") then {((uiNameSpace getVariable _menu) displayCtrl 1212) ctrlSetText "";};
	}else
	{
		if (ctrlText ((uiNameSpace getVariable _menu) displayCtrl _position_mapgrid) != "") then {((uiNamespace getVariable _menu) displayCtrl _position_mapgrid) ctrlSetText "";};
		if (ctrlText ((uiNameSpace getVariable _menu) displayCtrl 1208) != "") then {((uiNamespace getVariable _menu) displayCtrl 1208) ctrlSetText "";};
		((uiNamespace getVariable _menu) displayCtrl 1210) ctrlShow false;
	};

	if (player != vehicle player) then
	{
		_vehicle = assignedVehicle player;
		{
			if (getplayeruid player in sfp_config_liste_moderateur or sfp_config_afficher_nom_joueurs_dans_vehicules) then
			{
				_son_nom = name _x;
			}else
			{
				_son_nom = "Nom Masqué";
			};
			
			if((driver _vehicle == _x) || (gunner _vehicle == _x)) then
			{
				if(driver _vehicle == _x) then
				{
					_affichage = _affichage + (format ["<img size='1.10' image='textures\icones\driver.paa'/><t size='1.10'> %1 - Vie : %2 %3.<br/></t>", _son_nom, 100 - ((round ((damage _x) * (10 ^ 2)) / (10 ^ 2)) * 100), "%"]);
				}
				else
				{
					_affichage = _affichage + (format ["<img size='1.10' image='textures\icones\gunner.paa'/><t size='1.10'> %1 - Vie : %2 %3.<br/></t>", _son_nom, 100 - ((round ((damage _x) * (10 ^ 2)) / (10 ^ 2)) * 100), "%"]);
				}; 
			}
			else
			{
				_affichage = _affichage + (format ["<img size='1.10' image='textures\icones\cargo.paa'/><t size='1.10'> %1 - Vie : %2 %3.<br/></t>", _son_nom, 100 - ((round ((damage _x) * (10 ^ 2)) / (10 ^ 2)) * 100), "%"]);
			};    
		} forEach crew _vehicle;

		_hudVehicle ctrlSetStructuredText parseText _affichage;
	}else
	{
		_hudVehicle ctrlSetText _affichage;
	};
	
	sleep 1;
	
	if (!isnil "_configuration_hud_mini_carte") then
	{
		deletemarkerlocal _nom_marqueur;
	};
};
// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_compil_fonction_telecom_maxou";

// 0 = Consulter solde
// 1 = Allumer eteindre
// 2 = Consulter mon crédit

_action_telecom_maxou_choisit = _this select 0;
if (isnil "_action_telecom_maxou_choisit") exitwith {hint "Erreur, recommence ...";};
if (isnil {player getvariable "je_possede_un_telephone_sfp"}) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Désolé, \n\n Vous n'avez pas de téléphone. Rendez vous à SFP TELECOM pour en acheter un ;) !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 0 < 1) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Désolé, \n\n Vous n'avez pas de téléphone. Rendez vous à SFP TELECOM pour en acheter un ;) !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};

_compil_fonction_telecom_maxou =
{
	_condition = false;
	
	if (je_suis_en_service_a_la_sarl_depannage >= 1) then {_condition = true;};
	if (!isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") then {_condition = true;};
	if (!isnil "jesuis_au_taff_a_la_sarl_neomedia") then {_condition = true;};
	if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then {_condition = true;};
	if (!isnil "jesuis_au_taff_a_la_sarl_taxis_gsept") then {_condition = true;};
	if (revive_mon_side == west) then {_condition = true;};
	_condition
};

switch _action_telecom_maxou_choisit do
{
	case 0 :
	{
		hint format ["! SFP TELECOM !\n ------------------------------------- \n Bonjour, \n\n Il vous reste actuellement %1 textos sur votre forfait SFP TELECOM.\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr", round (player getvariable "je_possede_un_telephone_sfp" select 2)];
	};
	case 1 :
	{
		_retour_valeur = call _compil_fonction_telecom_maxou;
		if (_retour_valeur) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Faisant partie d'une entreprise ou de la gendarmerie, votre choix est impossible !! \n Comment voulez vous être contacté ?!\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
		
		_valeur_zero = player getvariable "je_possede_un_telephone_sfp" select 0;
		_valeur_un = player getvariable "je_possede_un_telephone_sfp" select 1;
		_valeur_deux = player getvariable "je_possede_un_telephone_sfp" select 2;
		
		player setvariable ["je_possede_un_telephone_sfp", [0, _valeur_un, _valeur_deux], true];
		
		[[[player,"AwopPercMstpSgthWrflDnon_End2"],"divers\taper_un_joueur\tapersynchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		_telephone_by_maxou = createVehicle ["Land_MobilePhone_smart_F", getPosATL player, [], 0, "CAN_COLLIDE"];
		_telephone_by_maxou attachto [player,[0,-0.1,0.1],"righthand"];
		_telephone_by_maxou setVectorDirAndUp [[1,0.5,-2],[-0.5,-0.7,0]];
		detach _telephone_by_maxou;
		_telephone_by_maxou setVelocity [(sin getdir player * 5),(cos getdir player * 5),2];
		_telephone_by_maxou setvariable ["je_possede_un_telephone_sfp", [_valeur_zero, _valeur_un, _valeur_deux], true];
				
		_suivit_du_telephone_maxou = createVehicle ["Sign_Arrow_Large_Yellow_F", getPosATL _telephone_by_maxou, [], 0, "CAN_COLLIDE"];	
		_suivit_du_telephone_maxou setPosATL [(getPosATL _suivit_du_telephone_maxou select 0),(getPosATL _suivit_du_telephone_maxou select 1),(getPosATL _suivit_du_telephone_maxou select 2) + 3];
		_suivit_du_telephone_maxou attachTo [_telephone_by_maxou,[0,0,1]]; 
		
		hint "! SFP TELECOM !\n ------------------------------------- \n Votre téléphone à bien été jeté ... Vous pouvez le récupérer en pointant ta souris dessus ;) !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";
		
		closedialog 0;
		execvm 'divers\tablette_sfp\menu_telephone_tablette_sfp.sqf';

		_temps_avant_suppression_telephone = 30;
		_temps_avant_suppression_fleche = 4;
		while {alive _telephone_by_maxou && _temps_avant_suppression_telephone > 0} do
		{
			_temps_avant_suppression_telephone = round (_temps_avant_suppression_telephone - 1);
			_temps_avant_suppression_fleche = round (_temps_avant_suppression_fleche - 1);
			sleep 1;
			if (_temps_avant_suppression_fleche < 0) then {deletevehicle _suivit_du_telephone_maxou};
		};
				
		if (!isnil "_suivit_du_telephone_maxou") then {deletevehicle _suivit_du_telephone_maxou;};
		if (!isnil "_telephone_by_maxou") then {deletevehicle _telephone_by_maxou;};
	};
	case 2 :
	{
		private "_resultat";
		_valeur_zero = player getvariable "je_possede_un_telephone_sfp" select 0;
		_valeur_un = player getvariable "je_possede_un_telephone_sfp" select 1;
		_valeur_deux = player getvariable "je_possede_un_telephone_sfp" select 2;
		
		_retour_valeur = call _compil_fonction_telecom_maxou;
		if (_retour_valeur) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Faisant partie d'une entreprise ou de la gendarmerie, votre choix est impossible !! \n Comment voulez vous être contacté ?!\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};

		if (_valeur_un < 1) then 
		{
			player setvariable ["je_possede_un_telephone_sfp", [_valeur_zero, 1, _valeur_deux], true];
			_resultat = "Vous venez d'allumer votre téléphone.";
		}else
		{
			player setvariable ["je_possede_un_telephone_sfp", [_valeur_zero, 0, _valeur_deux], true];
			_resultat = "Vous venez d'eteindre votre téléphone.";
		};
		
		hint format ["! SFP TELECOM !\n ------------------------------------- \n %1 !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr", _resultat];

		closedialog 0;
		execvm 'divers\tablette_sfp\menu_telephone_tablette_sfp.sqf';
	};
};
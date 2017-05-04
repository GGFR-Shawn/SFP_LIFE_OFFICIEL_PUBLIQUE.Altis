// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (getPlayerUID player in sfp_config_liste_admin) exitwith {};

private ["_le_joueur","_type_d_inventaire"];
_le_joueur = _this select 0;
_type_d_inventaire = _this select 1;
_verif_sac_a_dos = getNumber (configFile >> "CfgVehicles" >> (typeOf _type_d_inventaire) >> "isBackpack");

// Terroristes
if (side _le_joueur == east) exitwith {titleText ["Loot terroristes autorisé ...","PLAIN"];};

// Sécurité ouvrir sac à dos d'un autre joueur
if (_verif_sac_a_dos == 1 && sfp_config_activer_protection_sac_a_dos) exitwith 
{
	if (revive_mon_side == west) exitwith {}; // Gendarmes autorisé
	if (!isnil {cursortarget getvariable "jai_les_mains_sur_la_tete"}) exitwith {titleText ["Le joueur à les mains sur la tête ... \n\n Vous pouvez donc le fouiller !","PLAIN"];};
	
	if (isplayer cursortarget) then
	{
		titleText [format ["\n\n\n\n\n\n\n\n Tu as essayé d'ouvrir l'inventaire de %1 ! \n\n Ceci est interdit car non RP ! \n\n Nous sommes l'unique serveur utilisant ce système puisque créer par Maxou !",name cursortarget], "PLAIN",0];
	}else
	{
		titleText["\n\n\n\n\n\n\n\n Tu as essayé d'ouvrir l'inventaire d'un PNJ ! \n\n Ceci est interdit car non RP ! \n\n Nous sommes l'unique serveur utilisant ce système puisque créer par Maxou !", "PLAIN",0];
	};
	
	[] spawn 
	{
		waitUntil {!isNull (findDisplay 602)};
		
		systemchat "Protection glitch inventaire SFP !";

		for "_i" from 0 to 50 do
		{
			(FindDisplay 602) closeDisplay 1;
			sleep 0.001;
		};
	};
};

// Sécurité coffre fort 1
if (revive_mon_side != west && typeof _type_d_inventaire != "Box_East_Grenades_F" && count (nearestObjects [player, ["Box_East_Grenades_F"], 4]) > 0) exitwith
{
	titleText["\n\n\n\n\n\n\n\n Désolé, tu ne peux pas ouvrir ton inventaire près des coffres forts ! \n\n Nous sommes l'unique serveur utilisant ce système puisque créer par maxou !", "PLAIN",0];

	[] spawn 
	{
		waitUntil {!isNull (findDisplay 602)};

		systemchat "Protection glitch inventaire SFP !";

		for "_i" from 0 to 50 do
		{
			(FindDisplay 602) closeDisplay 1;
			sleep 0.001;
		};
	};
};


// Sécurité coffre fort 2
if (revive_mon_side != west && typeof _type_d_inventaire == "Box_East_Grenades_F" && !isnil {_type_d_inventaire getvariable "proprietaire_du_coffre"}) exitwith
{
	while {!isnil "mot_de_passe_du_coffre_fort"} do {sleep 0.001; mot_de_passe_du_coffre_fort = nil;};
	
	WaitUntil {!isnull (findDisplay 602)};			
	
	createdialog "CoffreFortRentrerMotDePasseNonProprio";
	noesckeydeux = (findDisplay 4844) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
	noesckeytrois = (findDisplay 4844) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 36) then {true}"];
	ctrlSetText[11115, format["Propriétaire : %1",(_type_d_inventaire getVariable "proprietaire_du_coffre")]];
	titletext ["N'oublie pas ... Si tu souhaites fermer ce dialogue, rentres simplement un faux code !","BLACK IN", 15];
	
	waituntil {!isnil "mot_de_passe_du_coffre_fort"};
	
	closedialog 4844;

	if (_type_d_inventaire getvariable "mot_de_passe_du_coffre_fort" == mot_de_passe_du_coffre_fort) exitwith 
	{
		(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeydeux]; 
		(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeytrois]; 
		titleText["\n\n\n\n\n\n\n\n Mot de passe accepté !", "PLAIN",0];
		
		while {!isnil "mot_de_passe_du_coffre_fort"} do {mot_de_passe_du_coffre_fort = nil;};
		
		_type_d_inventaire spawn 
		{
			waitUntil {isNull (findDisplay 602)};
			re_scanner_le_coffre_fort = _this;
			publicvariable "re_scanner_le_coffre_fort";
		};
	}; 

	if (_type_d_inventaire getvariable "mot_de_passe_du_coffre_fort" != mot_de_passe_du_coffre_fort) exitwith 
	{
		(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeydeux];
		(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeytrois]; 
		titleText["\n\n\n\n\n\n\n\n Désolé le mot de passe n'est pas le bon !", "PLAIN",0];
		
		while {!isnil "mot_de_passe_du_coffre_fort"} do {mot_de_passe_du_coffre_fort = nil;};
		
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};

			systemchat "Protection glitch inventaire SFP !";

			for "_i" from 0 to 50 do
			{
				(FindDisplay 602) closeDisplay 1;
				sleep 0.001;
			};
		};
	};
};

// Sécurité voiture By Maxou
if (_type_d_inventaire isKindOf "LandVehicle" or _type_d_inventaire isKindOf "Ship" or _type_d_inventaire isKindOf "Air") exitwith
{
	if (revive_mon_side == west) exitwith {}; // Gendarmes autorisé
	
	// Si pas de proprio
	if (isnil {(_type_d_inventaire) getvariable "vehicule_info_parvariable"}) exitwith 
	{
		titleText["\n\n\n\n\n\n\n\n Tu ne peux pas ouvrir cet inventaire puisque le véhicule n'appartient à personne ! \n\n Nous sommes l'unique serveur utilisant ce système puisque créer par maxou !", "PLAIN",0];
				
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};

			systemchat "Protection glitch inventaire SFP !";

			for "_i" from 0 to 50 do
			{
				(FindDisplay 602) closeDisplay 1;
				sleep 0.001;
			};
		};
	};
	
	// Si proprio et verrouillé
	if (locked _type_d_inventaire == 2) exitwith 
	{
		if ((_type_d_inventaire) getvariable "vehicule_info_parvariable" select 0 == name player) then
		{
			titleText["\n\n\n\n\n\n\n\n Ton véhicule est verrouiller, tu ne peux donc pas ouvrir l'inventaire ! \n\n Nous sommes l'unique serveur utilisant ce système puisque créer par maxou !", "PLAIN",0];
		}else
		{
			titleText["\n\n\n\n\n\n\n\n Tu ne peux pas ouvrir cet inventaire puisque le véhicule est verrouiller ! \n\n Nous sommes l'unique serveur utilisant ce système puisque créer par maxou !", "PLAIN",0];
		};
				
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};
			
			systemchat "Protection glitch inventaire SFP !";

			for "_i" from 0 to 50 do
			{
				(FindDisplay 602) closeDisplay 1;
				sleep 0.001;
			};
		};
	};
};

if (_type_d_inventaire isKindOf "Man" && !alive _type_d_inventaire) exitWith 
{
	titleText["\n\n\n\n\n\n\n\n Pas de loot sur les morts ! \n\n Nous sommes l'unique serveur utilisant ce système puisque créer par maxou !", "PLAIN",0];
	[] spawn 
	{
		waitUntil {!isNull (findDisplay 602)};
		
		systemchat "Protection glitch inventaire SFP !";

		for "_i" from 0 to 50 do
		{
			(FindDisplay 602) closeDisplay 1;
			sleep 0.001;
		};
	};
};
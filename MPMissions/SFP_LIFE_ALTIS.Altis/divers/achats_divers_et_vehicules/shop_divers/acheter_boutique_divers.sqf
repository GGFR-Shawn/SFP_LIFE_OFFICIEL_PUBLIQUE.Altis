// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_numero_tableau = -1;

if(revive_mon_side == west) then
{
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "GPS";
		le_prix_de_larticle = 500;

		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addweapon "itemgps";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Lunette night vision";
		le_prix_de_larticle = 500;

		if !(player canAdd "NVGoggles_OPFOR") exitwith {hint "Impossible, vous n'avez plus de place !";};
		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addItem "NVGoggles_OPFOR";
			player assignitem "NVGoggles_OPFOR";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Sac a dos";
		le_prix_de_larticle = 250;

		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addBackpack "B_Kitbag_cbr";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		if (isnil "je_suis_whiteliste_GIGN") exitwith {player globalchat "Désolé, seul le GIGN peut acheter ces habits !";};
		
		le_nom_de_larticle = "sac à dos GIGN";
		le_prix_de_larticle = 250;

		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addbackpack "B_Sac_GIGN";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "grenade flash";
		le_prix_de_larticle = 14;

		if !(player canAdd "SUPER_flash") exitwith {hint "Impossible, vous n'avez plus de place !";};
		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addmagazines ["SUPER_flash",1];
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		_nom_du_menu = "Menu_Shop_Un_Fumigene";
		createDialog _nom_du_menu;
		hint "Choisi maintenant la couleur dans la liste.";

		disableSerialization;

		_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
		_titre_add_id = 1005;
		_numero_add = 1500;
		_numero_tableau = -1;
		_couleur_verte = [0,0.91,0.07,1];
		_couleur_rouge = [0.99,0.04,0.01,1];

		if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
		((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
		((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];

		liste_recherche_informations_armes = ["SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell"];
		prix_de_depart = [13,13,13,13,13,13,13];

		lbAdd[_numero_add," Grenade fumigène Blanche: 13 Euros."];
		lbAdd[_numero_add," Grenade fumigène Rouge: 13 Euros."];
		lbAdd[_numero_add," Grenade fumigène Verte: 13 Euros."];
		lbAdd[_numero_add," Grenade fumigène Jaune: 13 Euros."];
		lbAdd[_numero_add," Grenade fumigène Violet: 13 Euros."];
		lbAdd[_numero_add," Grenade fumigène Bleu: 13 Euros."];
		lbAdd[_numero_add," Grenade fumigène Orange: 13 Euros."];
			
		_numero_tableau = -1;
		for "_i" from 0 to (count liste_recherche_informations_armes - 1) do 
		{ 
			_numero_tableau = round (_numero_tableau + 1); 
			
			// ======================================================================================================================================== //
			prix_calcul_couleur = prix_de_depart select _i;
			if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

			lbSetColor [_numero_add, _numero_tableau, couleur_valeur];	
			
			// ======================================================================================================================================== //
			lbSetPicture [_numero_add, _numero_tableau, "\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_on_ca.paa"];

			// ======================================================================================================================================== //
			((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, format['Aucunes informations supplémentaires %1.', name player]];
		};
	
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Kit de reparation";
		if (isnil "desdepanneurssontenjeu") then {le_prix_de_larticle = 200;}else {le_prix_de_larticle = 1000;};

		if !(player canAdd "ToolKit") exitwith {hint "Impossible, vous n'avez plus de place !";};
		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addItem "ToolKit";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Grenade";
		le_prix_de_larticle = 200;

		if !(player canAdd "MiniGrenade") exitwith {hint "Impossible, vous n'avez plus de place !";};
		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou')];
			player addMagazine "MiniGrenade";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "jumelle télémétrique";
		le_prix_de_larticle = 120;

		if !(player canAdd "Rangefinder") exitwith {hint "Impossible, vous n'avez plus de place !";};
		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou')];
			player addWeapon "Rangefinder";  
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "parachute";
		le_prix_de_larticle = 55;

		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addBackpack "B_parachute";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
};

//--------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------

if(revive_mon_side == civilian) then
{
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "GPS";
		le_prix_de_larticle = 20;

		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addweapon "itemgps";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Lunette night vision";
		le_prix_de_larticle = 1500;

		if !(player canAdd "NVGoggles") exitwith {hint "Impossible, vous n'avez plus de place !";};
		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou')];
			player addItem "NVGoggles";
			player assignitem "NVGoggles";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "jumelles";
		le_prix_de_larticle = 210;

		if !(player canAdd "Binocular") exitwith {hint "Impossible, vous n'avez plus de place !";};
		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté des %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou')];
			player addWeapon "Binocular";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Sac a dos";
		le_prix_de_larticle = 100;

		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addBackpack "G_AssaultPack";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "Kit de reparation";
		if (isnil "desdepanneurssontenjeu") then {le_prix_de_larticle = 500;}else {le_prix_de_larticle = 1200;};

		if !(player canAdd "ToolKit") exitwith {hint "Impossible, vous n'avez plus de place !";};
		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addItem "ToolKit";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		le_nom_de_larticle = "parachute";
		le_prix_de_larticle = 100;

		if((player getVariable "mon_argent_banque_by_sfp_maxou") >= le_prix_de_larticle) then
		{
			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			player addBackpack "B_parachute";
		}
		else
		{
			Hint format ["Vous avez %1 Euros et il vous faut %2 Euros!",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
		};
	};
	_numero_tableau = round (_numero_tableau + 1);
	if((lbCurSel 1500) == _numero_tableau) then
	{
		_nom_du_menu = "Menu_Shop_Un_Fumigene";
		createDialog _nom_du_menu;
		hint "Choisi maintenant la couleur dans la liste.";

		disableSerialization;

		_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
		_titre_add_id = 1005;
		_numero_add = 1500;
		_numero_tableau = -1;
		_couleur_verte = [0,0.91,0.07,1];
		_couleur_rouge = [0.99,0.04,0.01,1];

		if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
		((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
		((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];

		liste_recherche_informations_armes = ["SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell"];
		prix_de_depart = [105,105,105,105,105,105,105];

		lbAdd[_numero_add," Grenade fumigène Blanche: 105 Euros."];
		lbAdd[_numero_add," Grenade fumigène Rouge: 105 Euros."];
		lbAdd[_numero_add," Grenade fumigène Verte: 105 Euros."];
		lbAdd[_numero_add," Grenade fumigène Jaune: 105 Euros."];
		lbAdd[_numero_add," Grenade fumigène Violet: 105 Euros."];
		lbAdd[_numero_add," Grenade fumigène Bleu: 105 Euros."];
		lbAdd[_numero_add," Grenade fumigène Orange: 105 Euros."];
			
		_numero_tableau = -1;
		for "_i" from 0 to (count liste_recherche_informations_armes - 1) do 
		{ 
			_numero_tableau = round (_numero_tableau + 1); 
			
			// ======================================================================================================================================== //
			prix_calcul_couleur = prix_de_depart select _i;
					if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

			lbSetColor [_numero_add, _numero_tableau, couleur_valeur];	
			
			// ======================================================================================================================================== //
			lbSetPicture [_numero_add, _numero_tableau, "\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_on_ca.paa"];

			// ======================================================================================================================================== //
			((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, format['Aucunes informations supplémentaires %1.', name player]];
		};
	};
};
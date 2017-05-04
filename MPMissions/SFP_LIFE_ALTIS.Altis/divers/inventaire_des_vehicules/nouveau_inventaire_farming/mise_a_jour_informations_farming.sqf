// =====================================================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

private "_nombres_de_variable_trouve";

_titre_add_id_un = 1004;
_espace_de_l_objet = 1001;
_titre_add_id_deux = 1009;
_espace_du_joueur = 1008;
_numero_add_gauche = 1501;
_numero_add_droite = 1500;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_nom_du_menu = "Nouveau_Menu_Inventaire_Farming";

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id_un) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id_un) ctrlSetText format ["Type : %1", getText ( configFile >> "CfgVehicles" >> typeOf(objet_du_farming_a_scanner) >> "displayName")];
if (objet_du_farming_a_scanner getvariable "usedspace" >= objet_du_farming_a_scanner getvariable "totalspace") then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _espace_de_l_objet) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _espace_de_l_objet) ctrlSetText format ["Espace restant : %1/%2", objet_du_farming_a_scanner getVariable "usedspace", objet_du_farming_a_scanner getvariable "totalspace"];


((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id_deux) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id_deux) ctrlSetText format ["Nom : %1", name player];
if (player getvariable "usedspace" >= player getvariable "totalspace") then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _espace_du_joueur) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _espace_du_joueur) ctrlSetText format ["Espace restant : %1/%2", player getVariable "usedspace", player getvariable "totalspace"];

lbClear _numero_add_gauche;
lbClear _numero_add_droite;

// Partie Gauche
_nombres_de_variable_trouve = -1;
liste_du_farming_colonne_de_gauche = [];
{
	if (typeName (player getvariable (_x select 1)) == "BOOL") then
	{		
		if (player getvariable (_x select 1)) then
		{
			_nombres_de_variable_trouve = round (_nombres_de_variable_trouve + 1);
			liste_du_farming_colonne_de_gauche pushback [_x select 1, _x select 2, _x select 0, _x select 5];
			lbAdd [_numero_add_gauche, format ["%1 %2 (Utilise %3 place(s)).", (1) call retour_formatage_chiffre_sfp, _x select 0, round ((_x select 2) * (1))]];
			((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add_gauche) lbSetTooltip [_nombres_de_variable_trouve, format['Double clique pour déposer %1. %2 secondes pour jeter 1 %1.', _x select 0, _x select 5]];
		};
	}else
	{		
		if (player getvariable (_x select 1) > 0) then
		{
			_nombres_de_variable_trouve = round (_nombres_de_variable_trouve + 1);
			liste_du_farming_colonne_de_gauche pushback [_x select 1, _x select 2, _x select 0, _x select 5];
			lbAdd [_numero_add_gauche, format ["%1 %2 (Utilise %3 place(s)).", (player getvariable (_x select 1)) call retour_formatage_chiffre_sfp, _x select 0, round ((_x select 2) * (player getvariable (_x select 1)))]];
			((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add_gauche) lbSetTooltip [_nombres_de_variable_trouve, format['Double clique pour déposer %1. %2 secondes pour jeter 1 %1.', _x select 0, _x select 5]];
		};
	};
} foreach listes_des_farming_avec_parametre;
if (_nombres_de_variable_trouve < 0) then {lbAdd [_numero_add_gauche, "Rien dans l'inventaire."]; lbSetColor [_numero_add_gauche, 0, _couleur_rouge];};

// Partie Droite
_nombres_de_variable_trouve = -1;
liste_du_farming_colonne_de_droite = [];
{
	if (autorisation_objet_du_farming_a_scanner) then
	{	
		if (typeName (objet_du_farming_a_scanner getvariable (_x select 1)) == "BOOL") then
		{		
			if (objet_du_farming_a_scanner getvariable (_x select 1) && !(objet_du_farming_a_scanner iskindof "man")) then
			{
				_nombres_de_variable_trouve = round (_nombres_de_variable_trouve + 1);
				liste_du_farming_colonne_de_droite pushback [_x select 1, _x select 2, _x select 0];
				lbAdd [_numero_add_droite, format ["%1 %2 (Utilise %3 place(s)).", (1) call retour_formatage_chiffre_sfp, _x select 0, round ((_x select 2) * (1))]];
				((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add_droite) lbSetTooltip [_nombres_de_variable_trouve, format['Double clique pour déposer %1.', _x select 0]];
			};
		}else
		{		
			if (objet_du_farming_a_scanner getvariable (_x select 1) > 0 && !(objet_du_farming_a_scanner iskindof "man")) then
			{
				_nombres_de_variable_trouve = round (_nombres_de_variable_trouve + 1);
				liste_du_farming_colonne_de_droite pushback [_x select 1, _x select 2, _x select 0];
				lbAdd [_numero_add_droite, format ["%1 %2 (Utilise %3 place(s)).", (objet_du_farming_a_scanner getvariable (_x select 1)) call retour_formatage_chiffre_sfp, _x select 0, round ((_x select 2) * (objet_du_farming_a_scanner getvariable (_x select 1)))]];
				((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add_droite) lbSetTooltip [_nombres_de_variable_trouve, format['Double clique pour déposer %1.', _x select 0]];
			};
		};
	};
} foreach listes_des_farming_avec_parametre;
if (_nombres_de_variable_trouve < 0 or (objet_du_farming_a_scanner iskindof "man")) then {lbAdd [_numero_add_droite, "Rien dans l'inventaire."]; lbSetColor [_numero_add_droite, 0, _couleur_rouge];};

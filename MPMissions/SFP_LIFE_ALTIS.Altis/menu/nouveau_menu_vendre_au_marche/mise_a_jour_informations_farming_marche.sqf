// =====================================================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

private "_nombres_de_variable_trouve";

_titre_add_id = 1009;
_espace_du_joueur = 1008;
_numero_add_gauche = 1501;
_numero_add_droite = 1500;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_nom_du_menu = "Nouveau_Menu_Vendre_Farming";

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["Nom : %1", name player];
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
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
			liste_du_farming_colonne_de_gauche pushback [_x select 1, _x select 2, _x select 0, _x select 3, _x select 4];
			lbAdd [_numero_add_gauche, format ["%1 %2 - Utilise %3 place(s), %4 secondes pour tout vendre.", (1) call retour_formatage_chiffre_sfp, _x select 0, round ((_x select 2) * (1)), round ((_x select 4) * (1))]];
			((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add_gauche) lbSetTooltip [_nombres_de_variable_trouve, format['Double clique pour déposer %1.', _x select 0]];
		};
	}else
	{		
		if (player getvariable (_x select 1) > 0) then
		{
			_nombres_de_variable_trouve = round (_nombres_de_variable_trouve + 1);
			liste_du_farming_colonne_de_gauche pushback [_x select 1, _x select 2, _x select 0, _x select 3, _x select 4];
			lbAdd [_numero_add_gauche, format ["%1 %2 - Utilise %3 place(s), %4 secondes pour tout vendre.", (player getvariable (_x select 1)) call retour_formatage_chiffre_sfp, _x select 0, round ((_x select 2) * (player getvariable (_x select 1))), round ((_x select 4) * (player getvariable (_x select 1)))]];
			((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add_gauche) lbSetTooltip [_nombres_de_variable_trouve, format['Double clique pour vendre %1.', _x select 0]];
		};
	};
} foreach listes_des_farming_du_marche;
if (_nombres_de_variable_trouve < 0) then {lbAdd [_numero_add_gauche, "Rien dans l'inventaire."]; lbSetColor [_numero_add_gauche, 0, _couleur_rouge];};

// Partie Droite
{
	_son_nom = _x select 0;
	_son_prix = _x select 3;
	
	lbAdd [_numero_add_droite, format ["%1 (%2%3 par unité).", _son_nom, (_son_prix) call retour_formatage_chiffre_sfp,  "€"]];
} foreach listes_des_farming_du_marche;
lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add_droite), "ASC"];

// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// cutText["","BLACK FADED"];
// 0 cutFadeOut 9999999;

_nom_du_menu = "Menu_tablette_sfp_Vehicule_Reprendre_Cle";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id_un = 1004;
_titre_add_id_deux = 1001;
_numero_add_un = 1500;
_numero_add_deux = 1501;
_couleur_rouge = [0.99,0.04,0.01,1];
_couleur_verte = [0,0.91,0.07,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id_un) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id_deux) ctrlSetTextColor _couleur_verte;


les_joueurs_trouves = [];
{
	if (isPlayer _x && _x != player) then 
	{
		_Playeridx = lbAdd [_numero_add_un, name _x];
		les_joueurs_trouves = les_joueurs_trouves + [_x];
	};
} foreach playableUnits;

les_voitures_trouves = [];
{
	if (!isnil {_x getvariable "vehicule_info_parvariable"}) then 
	{
		_les_proprios_de_la_voiture = _x getvariable "vehicule_info_parvariable"; 
		if ((_les_proprios_de_la_voiture select 0) == name player) then 
		{
			les_voitures_trouves = les_voitures_trouves + [_x];
			// _typevehicules = lbAdd [_numero_add_deux,getText ( configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName")];
			lbAdd [_numero_add_deux, format ["%1 (%2 à %3 Mètres.)", getText ( configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName"), _x getvariable "plaque_immatriculation_news" select 0, round (player distance _x)]];
		};
	};
} forEach vehicles;

if (count les_joueurs_trouves < 1) then 
{
	_nom_du_joueurs = lbAdd [_numero_add_un, "Aucun joueurs trouvés !"];
	lbSetColor [_numero_add_un, 0, _couleur_rouge];
};

if (count les_voitures_trouves < 1) then 
{
	_typevehicules = lbAdd [_numero_add_deux, "Aucun véhicules trouvés !"];
	lbSetColor [_numero_add_deux, 0, _couleur_rouge];
};

lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add_un), "ASC"];

// waituntil {!dialog;};
// cutText["","BLACK IN"];



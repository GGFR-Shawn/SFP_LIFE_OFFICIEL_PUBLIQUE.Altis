// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_helicoptere_gang";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_poche_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp];


if (revive_mon_side == civilian) then
{
	liste_recherche_informations_vehicules = ["O_Heli_Light_Gang_SFP","O_Heli_Light_Gang_SFP","Heli_Light_Civil_SFP"];

	lbAdd[_numero_add," KA60 : 250 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_02\Data\UI\heli_light_02_ca.paa"];
	lbAdd[_numero_add," KA60 Skin Gang: 250 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_02\Data\UI\heli_light_02_ca.paa"];
	lbAdd[_numero_add," Little Bird Non Armé : 150 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_01\Data\UI\heli_light_01_ca.paa"];

	_numero_tableau = -1;
	_prix_de_depart = 250000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 250000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 150000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];

	_numero_tableau = -1;
	for "_i" from 0 to (count liste_recherche_informations_vehicules - 1) do 
	{ 
		_numero_tableau = round (_numero_tableau + 1);
		
		_vitesse = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "maxSpeed");
		_place = (1 + getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "transportSoldier"));
		_resistance_feu = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "armor");
			
		((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, format['Vitesse : %1 Km/h; Place : %2; Resistence Feu : %3 %4.', _vitesse, _place, _resistance_feu, "%"]];
	};
};

waituntil {!dialog;};
cutText["","BLACK IN"];
// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
																  // Message si CarShop connecté //
// =======================================================================================================================================================================================
private "_employe_car_shop_connecte"; _employe_car_shop_connecte = false; {if (_x getvariable "je_suis_au_taff_a_la_sarl_car_shop") then {_employe_car_shop_connecte = true;};} foreach playableUnits; if (_employe_car_shop_connecte) then {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n\n Bienvenu dans la boutique véhicule ... \n\n Il y à actuellement des vendeurs au CarShop si tu souhaites avoir tes véhicules moins cher ! \n\n N'hésite pas. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

// =======================================================================================================================================================================================
																  // Lancement du script //
// =======================================================================================================================================================================================
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_avions";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
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
	liste_recherche_informations_vehicules = ["R_HotairBalloon","sab_paratrike_rainbow","sab_FAAllegro","sab_RobinDR400_2","Sab_Amphi_An2","Sab_Amphi_An2","IVORY_T6A_1","ivory_yak42d_1","C_Plane_Civil_01_F"];

	lbAdd[_numero_add," Montgolfière : 65 000€"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\HotAirBalloon\icon.paa"];
	lbAdd[_numero_add," ParaMoteur : 70 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\sab_paraglider\data\icon.paa"];
	lbAdd[_numero_add," Sab Faallegro : 145 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\sab_FAAllegro\data\icomap_FAAllegro_ca.paa"];
	lbAdd[_numero_add," Robin DR-400 : 190 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\sab_RobinDR400\data\icomap_RobinDR400_ca.paa"];
	lbAdd[_numero_add," Avion Non Amphibi 2 : 235 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\sab_An2\data\icon_an2_ca.paa"];
	lbAdd[_numero_add," Avion Pseudo Amphibi : 285 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\sab_An2\data\icon_an2_ca.paa"];
	lbAdd[_numero_add," Avion Touristique : 580 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\ivory_t6a\data\icon.paa"];
	lbAdd[_numero_add," Avion De Ligne : 700 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\ivory_yak42d\data\icon.paa"];
	lbAdd[_numero_add," (DLC) Caesar BTT : 350 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\ivory_yak42d\data\icon.paa"];

	_numero_tableau = -1;
	_prix_de_depart = 65000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 70000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 145000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 190000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 235000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 285000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 580000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 700000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 350000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
};

if(revive_mon_side == west) then
{
	liste_recherche_informations_vehicules = [""];
	
	lbAdd[_numero_add," Aucun disponible €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_F\Boat_Transport_01\data\UI\boat_transport_01_ca.paa"];

	_numero_tableau = -1;
	_prix_de_depart = 0; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
};


_numero_tableau = -1;
for "_i" from 0 to (count liste_recherche_informations_vehicules - 1) do 
{ 
	_numero_tableau = round (_numero_tableau + 1);
	
	_vitesse = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "maxSpeed");
	_place = (1 + getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "transportSoldier"));
	_resistance_feu = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "armor");
		
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, format['Vitesse : %1 Km/h; Place : %2; Resistence Feu : %3 %4.', _vitesse, _place, _resistance_feu, "%"]];
};

waituntil {!dialog;};
cutText["","BLACK IN"];
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

_nom_du_menu = "Menu_bateaux";

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
	liste_recherche_informations_vehicules = ["C_Rubberboat","C_Boat_Civil_01_rescue_F","chalutier_SFP","Burnes_MK10_1","I_C_Boat_Transport_02_F","C_Scooter_Transport_01_F"];

	lbAdd[_numero_add," Petit Bateau : 1 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_F\Boat_Transport_01\data\UI\boat_transport_01_ca.paa"];
	lbAdd[_numero_add," Bateau Rapide : 3 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_F\Boat_Transport_01\data\UI\boat_transport_01_ca.paa"];
	lbAdd[_numero_add," Chalutier De Peche : 15 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_F\Boat_Transport_01\data\UI\boat_transport_01_ca.paa"];
	lbAdd[_numero_add," Bateau Chargeur Véhicule : 70 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_F\Boat_Transport_01\data\UI\boat_transport_01_ca.paa"];
	lbAdd[_numero_add," (DLC) RHIB : 5 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_f\Boat_Armed_01\data\ui\boat_armed_01_minigun.paa"];
	lbAdd[_numero_add," (DLC) JetSki : 2 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_f\Boat_Armed_01\data\ui\boat_armed_01_minigun.paa"];

	_numero_tableau = -1;
	_prix_de_depart = 1000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 3000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 15000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 70000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 5000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 2000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
};

if(revive_mon_side == west) then
{
	liste_recherche_informations_vehicules = ["C_Rubberboat","C_Boat_Civil_01_F","B_Boat_Armed_01_minigun_F","B_SDV_01_F","I_C_Boat_Transport_02_F"];
	
	lbAdd[_numero_add," Petit Bateau : 1 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_F\Boat_Transport_01\data\UI\boat_transport_01_ca.paa"];
	lbAdd[_numero_add," Bateau Police : 3 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_F\Boat_Transport_01\data\UI\boat_transport_01_ca.paa"];
	lbAdd[_numero_add," Bateau De Combat : 15 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_f\Boat_Armed_01\data\ui\boat_armed_01_minigun.paa"];
	lbAdd[_numero_add," Sous Marin : 12 500 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_f\Boat_Armed_01\data\ui\boat_armed_01_minigun.paa"];
	lbAdd[_numero_add," (DLC) RHIB : 5 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\boat_f\Boat_Armed_01\data\ui\boat_armed_01_minigun.paa"];

	_numero_tableau = -1;
	_prix_de_depart = 1000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 3000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 15000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 12500; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 5000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
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
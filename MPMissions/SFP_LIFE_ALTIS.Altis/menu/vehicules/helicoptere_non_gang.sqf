// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
																  // Message si CarShop connecté //
// =======================================================================================================================================================================================
private "_employe_car_shop_connecte"; 
_employe_car_shop_connecte = false; 
{if (_x getvariable "je_suis_au_taff_a_la_sarl_car_shop") then {_employe_car_shop_connecte = true;};} foreach playableUnits; 
if (_employe_car_shop_connecte) then 
{
	hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n\n Bienvenu dans la boutique véhicule ... \n\n Il y à actuellement des vendeurs au CarShop si tu souhaites avoir tes véhicules moins cher ! \n\n N'hésite pas. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
};

// =======================================================================================================================================================================================
																  // Lancement du script //
// =======================================================================================================================================================================================
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_helicoptere";

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
	liste_recherche_informations_vehicules = ["Heli_Light_Civil_SFP","Heli_Light_NeoMedia_SFP","SFP_EC635_ADAC_Neomedia","O_Heli_Light_Civil_SFP"];

	lbAdd[_numero_add," Little Bird : 150 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_01\Data\UI\heli_light_01_ca.paa"];
	lbAdd[_numero_add," Little Bird NeoMedia : 80 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_01\Data\UI\heli_light_01_ca.paa"];
	lbAdd[_numero_add," ADAC NeoMedia : 220 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_01\Data\UI\heli_light_01_ca.paa"];
	lbAdd[_numero_add," KA60 : 250 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_02\Data\UI\heli_light_02_ca.paa"];

	_numero_tableau = -1;
	_prix_de_depart = 150000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 80000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 220000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 25000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
};

if(revive_mon_side == west) then
{
	liste_recherche_informations_vehicules = ["Heli_Light_Gendarme_SFP","O_Heli_Light_GIGN_SFP","O_Heli_Light_Gendarmerie_SFP","I_Heli_light_GIGN_SFP","SFP_EC635_ADAC_Gendarmerie","B_Heli_Transport_GIGN_SFP"];
	
	lbAdd[_numero_add," Little Bird : 15 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_01\Data\UI\heli_light_01_ca.paa"];
	lbAdd[_numero_add," KA60 GIGN : 16 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_02\Data\UI\heli_light_02_ca.paa"];
	lbAdd[_numero_add," KA60 Gendarmerie : 16 800 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F\Heli_Light_02\Data\UI\heli_light_02_ca.paa"];
	lbAdd[_numero_add," Hélico GIGN : 20 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F_EPB\Heli_Light_03\data\UI\heli_light_03_ca.paa"];
	lbAdd[_numero_add," EC 635 : 17 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\Air_F_EPB\Heli_Light_03\data\UI\heli_light_03_ca.paa"];
	lbAdd[_numero_add," Hélico Armé GIGN : 18 000 €"]; _numero_tableau = round (_numero_tableau + 1); lbSetPicture [_numero_add, _numero_tableau, "\A3\air_f_beta\Heli_Transport_01\Data\UI\heli_transport_01_armed_ca.paa"];

	_numero_tableau = -1;
	_prix_de_depart = 15000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 16000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 16800; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 20000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 17000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
	_prix_de_depart = 18000; _numero_tableau = round (_numero_tableau + 1); if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  lbSetColor [_numero_add, _numero_tableau, couleur_valeur];
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
// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "whitelist_sarl_et_furious") exitwith {hint "! SARL ALTIS && FURIOUS ! \n --------------------------------------- \n\n Erreur whitelist. Contact Maxou.";};
if !(getPlayerUID player in whitelist_sarl_et_furious) exitwith {hint "! SARL ALTIS && FURIOUS ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de véhicule ici puisque vous ne faite pas partie de notre entreprise.\n\n Cordialement.";};

if (isnil {player getvariable 'je_suis_une_entreprise_pour_avoir_un_virement'}) then {player setVariable["je_suis_une_entreprise_pour_avoir_un_virement", true,true];};

private ["_argent_du_menu","_prix_de_depart"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_voitures_Altis_And_Furious";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
liste_recherche_informations_vehicules = [];
prix_de_depart = [];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable _argent_du_menu) call retour_formatage_chiffre_sfp];

lbAdd[_numero_add," SUV Sport."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "C_SUV_01_Sport_Maxou";
lbAdd[_numero_add," Suv."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "C_SUV_01_F";
lbAdd[_numero_add," HatchBack."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "C_Hatchback_01_sport_F";
lbAdd[_numero_add," Quad."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "C_Quadbike_01_F";
lbAdd[_numero_add," Viper."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "Jonzie_Viper_SFP";
lbAdd[_numero_add," Mitsubishi Evolution."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "SFP_EvoX_Mitsubishi";
lbAdd[_numero_add," McLaren P1."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "SFP_McLarenP1";
lbAdd[_numero_add," Porche GT 3."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "SFP_Porsche_RS";
lbAdd[_numero_add," CH-49 Mohawk."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "I_Heli_Transport_02_F";
lbAdd[_numero_add," AFV-4 Gorgon."]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "I_APC_Wheeled_03_cannon_F";
lbAdd[_numero_add," UH-80 Ghost Hawk"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "B_Heli_Transport_01_F";
lbAdd[_numero_add," Ifrit"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "O_MRAP_02_F";
lbAdd[_numero_add," Tempest"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "O_Truck_03_covered_F";
lbAdd[_numero_add," Avion de chasse"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "O_Plane_CAS_02_F";
lbAdd[_numero_add," NSVT-M HMG 12,7 mm"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "O_MBT_02_cannon_F";
lbAdd[_numero_add," M2A1 Slammer"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "B_MBT_01_cannon_F";
lbAdd[_numero_add," MV 22"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "MV22";
lbAdd[_numero_add," (DLC) B_T_VTOL_01_infantry_F"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "B_T_VTOL_01_infantry_F";
lbAdd[_numero_add," (DLC) O_T_VTOL_02_infantry_F"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "O_T_VTOL_02_infantry_F";
lbAdd[_numero_add," (DLC) O_T_LSV_02_unarmed_F"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "O_T_LSV_02_unarmed_F";
lbAdd[_numero_add," (DLC) I_C_Plane_Civil_01_F"]; prix_de_depart pushBack 0; liste_recherche_informations_vehicules pushBack "I_C_Plane_Civil_01_F";


for "_i" from 0 to (count liste_recherche_informations_vehicules - 1) do 
{ 
	_prix_de_depart = prix_de_depart select _i;
	
	_vitesse = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "maxSpeed"); if (_vitesse < 1) then {_vitesse = "??";};
	_place = (1 + getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "transportSoldier")); if (_place < 2) then {_place = "??";};
	_latence_boite = (getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "latency") * 10) / 2; if (_latence_boite < 1) then {_latence_boite = "??";};
	_resistance_feu = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "armor"); if (_resistance_feu < 1) then {_resistance_feu = "??";};
	_niveau_frein = round (getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i >> "Wheels" >> "LF" >> "maxBrakeTorque") / 100); if (_niveau_frein < 1) then {_niveau_frein = "??";};
		
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i, format['Vitesse : %1 Km/h; Place : %2; Latence Boite : %3; Resistence Feu : %4 %6; Frein : %5 %6.', _vitesse, _place, _latence_boite, _resistance_feu, _niveau_frein, "%"]];
	
	if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  
	lbSetColor [_numero_add, _i, couleur_valeur];

	lbSetPicture [_numero_add, _i, "\A3\Soft_F\OffRoad_01\Data\UI\offroad_01_base_ca.paa"];	
};

waituntil {!dialog;};
cutText["","BLACK IN"];
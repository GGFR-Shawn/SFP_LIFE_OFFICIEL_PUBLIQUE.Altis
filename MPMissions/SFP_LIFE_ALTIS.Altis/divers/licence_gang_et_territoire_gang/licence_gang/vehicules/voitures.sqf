// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side != civilian) exitwith {hint "Désolé, seul les civils peuvent acheter ici !";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_voitures_gang";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_poche_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
liste_recherche_informations_vehicules = [];
prix_de_depart = [];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable _argent_du_menu)];

if (revive_mon_side == civilian) then
{
	lbAdd[_numero_add," Quad : 600 €"]; prix_de_depart pushback 600; liste_recherche_informations_vehicules pushback ["B_Quadbike_01_F"]; 
	lbAdd[_numero_add," OffRoad : 3 100 €"]; prix_de_depart pushback 3100; liste_recherche_informations_vehicules pushback ["B_G_Offroad_01_F"];
	lbAdd[_numero_add," Ifrit Non Armé : 110 000 €"]; prix_de_depart pushback 110000; liste_recherche_informations_vehicules pushback ["O_MRAP_02_F"];
	lbAdd[_numero_add," JEEP Armé : 56 000 €"]; prix_de_depart pushback 56000; liste_recherche_informations_vehicules pushback ["UAZ_MG"]; 
	lbAdd[_numero_add," Véhicule Armé Pickup : 59 000 €"]; prix_de_depart pushback 59000; liste_recherche_informations_vehicules pushback ["B_G_Offroad_01_armed_F"];
	lbAdd[_numero_add," JEEP Blindé : 160 000 €"]; prix_de_depart pushback 160000; liste_recherche_informations_vehicules pushback ["SFP_jeep_blinde"];
	lbAdd[_numero_add," (DLC) Qilin (Désarmé) : 26 000 €"]; prix_de_depart pushback 26000; liste_recherche_informations_vehicules pushback ["O_T_LSV_02_unarmed_F"];
	lbAdd[_numero_add," (DLC) Qilin (Armé) : 65 000 €"]; prix_de_depart pushback 65000; liste_recherche_informations_vehicules pushback ["O_T_LSV_02_armed_F"];
	lbAdd[_numero_add," (DLC) JEEP : 6 000 €"]; prix_de_depart pushback 6000; liste_recherche_informations_vehicules pushback ["I_C_Offroad_02_unarmed_F"];

	
	for "_i" from 0 to (count liste_recherche_informations_vehicules - 1) do 
	{ 
		_prix_de_depart = prix_de_depart select _i;
		
		_vitesse = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "maxSpeed"); if (_vitesse < 1) then {_vitesse = "??";};
		_place = (1 + getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "transportSoldier")); if (_place < 2) then {_place = "??";};
		_latence_boite = (getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "latency") * 10) / 2; if (_latence_boite < 1) then {_latence_boite = "??";};
		_resistance_feu = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "armor"); if (_resistance_feu < 1) then {_resistance_feu = "??";};
		_niveau_frein = round (getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "Wheels" >> "LF" >> "maxBrakeTorque") / 100); if (_niveau_frein < 1) then {_niveau_frein = "??";};
			
		((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i, format['Vitesse : %1 Km/h; Place : %2; Latence Boite : %3; Resistence Feu : %4 %6; Frein : %5 %6.', _vitesse, _place, _latence_boite, _resistance_feu, _niveau_frein, "%"]];
		
		if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  
		lbSetColor [_numero_add, _i, couleur_valeur];

		lbSetPicture [_numero_add, _i, "\A3\Soft_F\OffRoad_01\Data\UI\offroad_01_base_ca.paa"];	
	};
};

waituntil {!dialog;};
cutText["","BLACK IN"];
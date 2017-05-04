// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

/*
	0 = Vetements
	1 = Lunettes
	2 = Casques
	3 = Vestes
	4 = Sacs A Dos
*/

private ["_couleur_verte","_couleur_rouge","_numero_add","_nom_du_menu","_message","_prix_calcul_couleur","_position_camera"];
_condition = _this select 0;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_numero_add = 1500;
_titre_add_id = 1005;
_nom_du_menu = "Menu_Habits";
_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
liste_boutique_habit_a_afficher = nil;
choix_selection_boutique_habit = "";
if (isnil "_condition") exitwith {hint "Erreur selection ...";};

switch _condition do
{
	case "0" :
	{
		if (revive_mon_side == west) then {liste_boutique_habit_a_afficher = compil_habits_gendarme;};
		if (revive_mon_side == civilian) then {liste_boutique_habit_a_afficher = compil_habits_civil;};
		
		choix_selection_boutique_habit = "habits";
		
		player globalchat format ["Actuellement %1 habits disponibles ...", count liste_boutique_habit_a_afficher];
	};
	case "1" :
	{
		if (revive_mon_side == west) then {liste_boutique_habit_a_afficher = compil_lunette_gendarme;};
		if (revive_mon_side == civilian) then {liste_boutique_habit_a_afficher = compil_lunette_civil;};
		
		choix_selection_boutique_habit = "lunettes";

		player globalchat format ["Actuellement %1 lunettes disponibles ...", count liste_boutique_habit_a_afficher];
	};
	case "2" :
	{
		if (revive_mon_side == west) then {liste_boutique_habit_a_afficher = compil_headgear_gendarmes;};
		if (revive_mon_side == civilian) then {liste_boutique_habit_a_afficher = compil_headgear_civil;};
		
		choix_selection_boutique_habit = "casques";

		player globalchat format ["Actuellement %1 casques disponibles ...", count liste_boutique_habit_a_afficher];
	};
	case "3" :
	{
		if (revive_mon_side == west) then {liste_boutique_habit_a_afficher = compil_vestes_gendarmes;};
		if (revive_mon_side == civilian) then {liste_boutique_habit_a_afficher = compil_vestes_civil;};
		
		choix_selection_boutique_habit = "vestes";

		player globalchat format ["Actuellement %1 vestes disponibles ...", count liste_boutique_habit_a_afficher];
	};
	case "4" :
	{
		if (revive_mon_side == west) then {liste_boutique_habit_a_afficher = compil_sacs_a_dos_gendarme;};
		if (revive_mon_side == civilian) then {liste_boutique_habit_a_afficher = compil_sacs_a_dos_civil;};
		
		choix_selection_boutique_habit = "sacs à dos";

		player globalchat format ["Actuellement %1 sacs à dos disponibles ...", count liste_boutique_habit_a_afficher];
	};
};
if (isnil "liste_boutique_habit_a_afficher" or isnil "choix_selection_boutique_habit") exitwith {titletext ["Désolé, aucunes classes n'a été trouvées ...","PLAIN"];};

if (choix_selection_boutique_habit == "habits") then {tourner_joueur_boutique_habit = true; _position_camera = [[(position player select 0) - 4, (position player select 1) + 5, (position player select 2) + 1], 0.8];};
if (choix_selection_boutique_habit == "lunettes") then {tourner_joueur_boutique_habit = nil; _position_camera = [[(position player select 0) - 1, (position player select 1) + 0.6, (position player select 2) + 1.8], 1.6];};
if (choix_selection_boutique_habit == "casques") then {tourner_joueur_boutique_habit = true; _position_camera = [[(position player select 0) - 2.5, (position player select 1) + 0, (position player select 2) + 2], 1.7];};
if (choix_selection_boutique_habit == "vestes") then {tourner_joueur_boutique_habit = true; _position_camera = [[(position player select 0) - 2, (position player select 1) + 2, (position player select 2) + 1.6], 1.3];};
if (choix_selection_boutique_habit == "sacs à dos") then {tourner_joueur_boutique_habit = nil; _position_camera = [[(position player select 0) + 4, (position player select 1) - 4, (position player select 2) + 0], 1.2];};

camera_boutique_habit_sfp camPrepareTarget [(getPosATL player select 0), (getPosATL player select 1),(getPosATL player select 2) + (_position_camera select 1)];
camera_boutique_habit_sfp camPreparePos (_position_camera select 0);
camera_boutique_habit_sfp camPrepareFOV 0.2;
camera_boutique_habit_sfp camCommitPrepared 1;

lbClear _numero_add;

for "_i" from 0 to (count liste_boutique_habit_a_afficher - 1) do 
{ 	
	_sa_classe = liste_boutique_habit_a_afficher select _i select 0;
	_son_prix = liste_boutique_habit_a_afficher select _i select 1;
	_son_nom = liste_boutique_habit_a_afficher select _i select 2;
		
	_prix_calcul_couleur = (_son_prix);
	if (isnil "_prix_calcul_couleur") then {_prix_calcul_couleur = _son_prix;};
	if (player getvariable "mon_argent_banque_by_sfp_maxou" < _prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

	lbAdd [_numero_add, format ["%1 (%2€)", _son_nom, _son_prix]];

	lbSetColor [_numero_add, _i, couleur_valeur];	
	
	lbSetPicture [_numero_add, _i, "\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_look_3_ca.paa"];

	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i, 'Double clique pour visualiser/acheter.'];
};

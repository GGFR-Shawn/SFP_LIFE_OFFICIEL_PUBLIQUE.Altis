// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_selection = lbCurSel ((uiNamespace getVariable "Menu_liste_choix_destination_ferry_sfp") displayCtrl 1500);
if (_selection == -1) exitwith {hint "Désolé, aucune position n'a été selectionnée !";};
if (isnil {sfp_config_position_du_ferry_sfp select _selection select 1}) exitwith {hint "Erreur sur la position du ferry ...";};
if (vehicle player == player) exitwith {hint "! FERRY SFP UNIQUE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Le ferry ne se prend qu'en véhicule. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (player getvariable "mon_argent_banque_by_sfp_maxou" < (sfp_config_position_du_ferry_sfp select _selection select 2)) exitwith {hint "! FERRY SFP UNIQUE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Vous n'avez pas assez d'argent en banque. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (player distance (sfp_config_position_du_ferry_sfp select _selection select 1) < 50) exitwith {hint "! FERRY SFP UNIQUE ! \n -------------------------------------------- \n \n Pense à y aller à pied tu iras plus vite ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (!isnil "ferry_sfp_trajet_en_cours") exitwith {hint "! FERRY SFP UNIQUE ! \n -------------------------------------------- \n \n Patientez le temps du trajet ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (count (nearestObjects [(sfp_config_position_du_ferry_sfp select _selection select 1), ["Car","Ship","Air"], 7]) > 0) exitwith {hint "! FERRY SFP UNIQUE ! \n -------------------------------------------- \n \n Désolé, le quai du ferry est plein ... Refait le test plus tard ou choisit une autre destination ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
ferry_sfp_trajet_en_cours = true;
disableUserInput true;

_nom_de_la_position = sfp_config_position_du_ferry_sfp select _selection select 0;
_position_endroit_de_spawn = sfp_config_position_du_ferry_sfp select _selection select 1;
_temps_de_traverse = sfp_config_position_du_ferry_sfp select _selection select 3;
_temps_debarcation = 9;
_temps_embarquation = 11;

4 fadeSound 0;
4 fadeMusic 0;

openMap [false, false];
closedialog 0;

while {_temps_embarquation > 0 && alive player} do
{
	0 cuttext [format ["! FERRY SFP UNIQUE ! \n --------------------------------------------------------------- \n\n Embarcation sur le ferry pour %1 \n\n Patiente %2 secondes ...", _nom_de_la_position, _temps_embarquation],"BLACK FADED",1];
	_temps_embarquation = _temps_embarquation - 1;
	sleep 1;
};
if (_temps_embarquation > 0) exitwith {ferry_sfp_trajet_en_cours = nil; 4 fadeSound 1; 4 fadeMusic 1; disableUserInput false;};


while {_temps_de_traverse > 0 && alive player} do
{
	0 cuttext [format ["! FERRY SFP UNIQUE ! \n --------------------------------------------------------------- \n\n Le ferry sera sur %1 dans %2 secondes ... \n\n Bonne naviguation ...", _nom_de_la_position, _temps_de_traverse],"BLACK FADED",1];
	_temps_de_traverse = _temps_de_traverse - 1;
	sleep 1;
};
if (_temps_de_traverse > 0) exitwith {ferry_sfp_trajet_en_cours = nil; 4 fadeSound 1; 4 fadeMusic 1; disableUserInput false;};


while {_temps_debarcation > 0 && alive player} do
{
	0 cuttext [format ["! FERRY SFP UNIQUE ! \n --------------------------------------------------------------- \n\n Approche pour débarcation du ferry pour %1 \n\n Patiente %2 secondes ...", _nom_de_la_position, _temps_debarcation],"BLACK FADED",1];
	_temps_debarcation = _temps_debarcation - 1;
	sleep 1;
};
if (_temps_debarcation > 0) exitwith {ferry_sfp_trajet_en_cours = nil; 4 fadeSound 1; 4 fadeMusic 1; disableUserInput false;};


_position_du_joueur = position (vehicle player);
disableUserInput false;
while {speed (vehicle player) < 0.3 && alive (vehicle player) && count (nearestObjects [_position_endroit_de_spawn, ["Car","Ship","Air"], 7]) > 0} do
{
	0 cuttext [format ["! FERRY SFP UNIQUE ! \n --------------------------------------------------------------- \n\n Le quai de débarquation du ferry pour %1 est plein ... \n\n Patiente qu'il soit libéré ou avance avec ton véhicule pour annuler le ferry ...", _nom_de_la_position],"BLACK FADED",1];
	sleep 1;
};
if (_position_du_joueur distance (position (vehicle player)) > 3) exitwith {ferry_sfp_trajet_en_cours = nil; 4 fadeSound 1; 4 fadeMusic 1; disableUserInput false; 0 cuttext ["! FERRY SFP UNIQUE ! \n --------------------------------------------------------------- \n\n Vous avez annulé le transport du ferry","BLACK FADED",1];};


0 cuttext ["","BLACK IN",1];

_personne_ferry = [];
{
	_personne_ferry pushback _x;
} foreach (crew (vehicle player));

[[[],"divers\ferry_sfp\ferry_sfp_anti_hack_crew.sqf"],"BIS_fnc_execVM",_personne_ferry,false] spawn BIS_fnc_MP;

jai_le_droit_de_me_tp = 1; 
ferry_sfp_trajet_en_cours = nil;
(vehicle player) setpos _position_endroit_de_spawn;
if ((sfp_config_position_du_ferry_sfp select _selection select 0) == "Base Du Ferry") then {vehicle player setdir 300;};

titleText [format["Bienvenu à %1 !", (sfp_config_position_du_ferry_sfp select _selection select 0)], "PLAIN"];

player setVariable ["mon_argent_banque_by_sfp_maxou", (player getvariable "mon_argent_banque_by_sfp_maxou") - (sfp_config_position_du_ferry_sfp select _selection select 2),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

4 fadeSound 1;
4 fadeMusic 1;

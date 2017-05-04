//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {alive player};

private "_addaction_tresor_sfp";
if (!hasInterface) exitwith {};
if (isnil "tresor_en_cours_de_recherche") exitwith {};
if (!isnil "tresor_en_cours_de_recherche_validation") exitwith {};
tresor_en_cours_de_recherche_validation = true;

if (desactiver_message_infos_ecran < 1) then
{
	["Tresor",["Consulter votre carte pour aller le chercher !", ""]] call bis_fnc_showNotification;
};

_addaction_tresor_sfp =
{
	action_prendre_le_tresor = player addaction ["<t color=""#ff0000"">" + "Prendre Le Tresor", "divers\recherche_du_tresor\tresor_trouver.sqf", [], 1, false, false, "", "!isnil 'jai_trouve_le_tresor'"];
};

while {!isnil "tresor_en_cours_de_recherche"} do
{
	sleep 4;
	
	jai_trouve_le_tresor = nil;

	// Creer indication
	_recherche_du_coffre_fort = nearestObjects [position player, [sfp_config_tresor_type], 4];
	if (count _recherche_du_coffre_fort >= 1) then
	{
		{
			if (!isnil {_x getvariable "je_suis_le_tresor"}) then
			{
				jai_trouve_le_tresor = _x;
				
				_recherche_signalisation = nearestObjects [position jai_trouve_le_tresor, ["Sign_Arrow_Large_Yellow_F"], 4];
				if (count _recherche_signalisation < 1) then
				{
					[] call _addaction_tresor_sfp;
					
					_objet_du_tresor_deux = createVehicle ["Sign_Arrow_Large_Yellow_F", position jai_trouve_le_tresor, [], 0, "CAN_COLLIDE"];	
					_objet_du_tresor_trois = createVehicle ["Sign_Arrow_Large_Yellow_F", position jai_trouve_le_tresor, [], 0, "CAN_COLLIDE"];	
					_objet_du_tresor_quatre = createVehicle ["Sign_Arrow_Large_Yellow_F", position jai_trouve_le_tresor, [], 0, "CAN_COLLIDE"];	
					
					sleep 1;
					
					_objet_du_tresor_deux setPosATL [(getPosATL jai_trouve_le_tresor select 0),(getPosATL jai_trouve_le_tresor select 1),(getPosATL jai_trouve_le_tresor select 2) + 2];
					_objet_du_tresor_trois setPosATL [(getPosATL jai_trouve_le_tresor select 0),(getPosATL jai_trouve_le_tresor select 1),(getPosATL jai_trouve_le_tresor select 2) + 4];
					_objet_du_tresor_quatre setPosATL [(getPosATL jai_trouve_le_tresor select 0),(getPosATL jai_trouve_le_tresor select 1),(getPosATL jai_trouve_le_tresor select 2) + 6];
					
					waituntil {player distance jai_trouve_le_tresor > 4 or !alive player or !alive jai_trouve_le_tresor or isnil "tresor_en_cours_de_recherche"};
				
					deletevehicle _objet_du_tresor_deux;
					deletevehicle _objet_du_tresor_trois;
					deletevehicle _objet_du_tresor_quatre;
					
					if (!isnil "action_prendre_le_tresor") then {player removeaction action_prendre_le_tresor; action_prendre_le_tresor = nil;};
				};
			};
		} foreach _recherche_du_coffre_fort;
	};
};

if (!isnil "action_prendre_le_tresor") then {player removeaction action_prendre_le_tresor; action_prendre_le_tresor = nil;};
tresor_en_cours_de_recherche_validation = nil;
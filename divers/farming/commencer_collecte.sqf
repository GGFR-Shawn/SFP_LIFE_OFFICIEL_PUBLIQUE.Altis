// =======================================================================================================================================================================================
						// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
							// Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_temps_farming = _this select 3 select 0 select 0;
_place_dans_l_inventaire = _this select 3 select 0 select 1;
_combien_on_en_recolte = _this select 3 select 0 select 2;
_message_lors_de_la_collecte = _this select 3 select 0 select 3;
_message_lors_de_la_fin_de_collecte = _this select 3 select 0 select 4;
_nom_variable = _this select 3 select 0 select 5;
_calcul_place_necessaire = round (_combien_on_en_recolte * _place_dans_l_inventaire);

if (isnil "_temps_farming" or isnil "_place_dans_l_inventaire" or isnil "_combien_on_en_recolte" or isnil "_message_lors_de_la_collecte" or isnil "_message_lors_de_la_fin_de_collecte" or isnil "_nom_variable" or isnil "_calcul_place_necessaire") exitwith {hint "Erreur, contact maxou ...";};
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
if (((vehicle player) getVariable "usedspace") + _calcul_place_necessaire > (vehicle player) getVariable "totalspace") exitwith {hint format["Pas assez de place ! %1 place requise, il vous en reste %2 !", _calcul_place_necessaire, ((vehicle player) getVariable "totalspace") - ((vehicle player) getVariable"usedspace")];};
if ((vehicle player) getVariable "usedspace" >= (vehicle player) getVariable "totalspace") exitwith {hint "Inventaire plein !";};
if (!isnil {player getvariable "je_collecte"}) exitwith {hint "Désolé, tu es déja entrain de collecter !";};
if (!isnil "jai_prit_la_valise") then {if (jai_prit_la_valise >= 1) exitwith {hint "Désolé, tu ne peux pas collecter avec une valise !";};};
if (vehicle player != player && typeof (vehicle player) != "chalutier_SFP") exitwith {hint "Descend de ton véhicule pour farmer !";};
if (_nom_variable == "item_bois_sfp" && player getvariable "hache_pour_coupe_de_bois" < 1) exitwith {hint "Désolé, pour couper du bois il te faut une hache ! \n\n Tu peux en acheter une au super marché !";};
if (_nom_variable == "item_poissons_sfp" && player getvariable "canne_a_peche" < 1 && typeof (vehicle player) != "chalutier_SFP") exitwith {hint "Désolé, pour pecher il te faut une canne à peche ! \n\n Tu peux en acheter une au super marché !";};
if ((_nom_variable == "item_requin_sfp" or _nom_variable == "item_baleine_sfp") && player getvariable "harpon_pour_la_peche" < 1) exitwith {hint "Désolé, pour pecher il te faut un harpon ! \n\n Tu peux en acheter un au super marché !";};
if (_nom_variable == "item_petrole_non_traite_sfp" && player getvariable "gants_pour_petrole" < 1) exitwith {hint "Désolé, pour prendre du Petrole il te faut des gants ! \n\n Tu peux en acheter au super marché !";};
if (isnil {player getvariable "je_collecte"}) then {player setVariable["je_collecte",true,true];};

hint format["%1", _message_lors_de_la_collecte];
// Effet drogue heroine si le joueur en a, il réduit son temps de farm
if (!isnil "temps_activation_effet_drogue_cocaine") then
{
	_itemWait_modification = round (_temps_farming - (1 + (random 15)));
	hint format ["Grace à la prise de votre cocaine, le temps de récolte passe de %1 secondes à %2 secondes ... \n\n Patientez ;)",_temps_farming,_itemWait_modification];
	_temps_farming = _itemWait_modification;
};

_temps_farming spawn {[_this] call bar_de_progression_by_maxou;};

if !(surfaceIsWater getPosATL player) then
{
	player playActionNow "medicstartup";
	while {_temps_farming > 0 && alive player} do
	{
		_pos1 = (getPosATL (vehicle player));
		sleep 0.5;
		_pos2 = (getPosATL (vehicle player));
		_tpcheck = _pos1 distance _pos2;
		if  (_tpcheck > 1) then {player playActionNow "medicstartup";};
		_temps_farming = _temps_farming - 0.5;
	};
	player switchmove "";
}else
{
	sleep _temps_farming;
};

if (alive player) then
{
	if (typeof (vehicle player) != "chalutier_SFP") then
	{
		player setVariable [_nom_variable,(player getVariable _nom_variable) + _combien_on_en_recolte,true];
		player setVariable ["usedspace",(player getVariable "usedspace") + _calcul_place_necessaire,true];

		hint format["%1. \n\n Vous en avez maintenant %2.", _message_lors_de_la_fin_de_collecte, player getvariable _nom_variable];
	}else
	{
		if (isnil {(vehicle player) getvariable _nom_variable}) then {(vehicle player) setVariable [_nom_variable, 0,true];};
		
		(vehicle player) setVariable [_nom_variable,((vehicle player) getVariable _nom_variable) + _combien_on_en_recolte,true];
		(vehicle player) setVariable ["usedspace",((vehicle player) getVariable "usedspace") + _calcul_place_necessaire,true];
		
		hint format["%1. \n\n Votre chalutier en à maintenant %2.", _message_lors_de_la_fin_de_collecte, vehicle player getvariable _nom_variable];
	};
};

if (!isnil {player getvariable "je_collecte"}) then {player setVariable["je_collecte",nil,true];};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_log = format ["%1 : %2",name player, _message_lors_de_la_collecte];
["Historique Farm Des Joueurs", "Historique Farm Des Joueurs", _heure_du_log, _detail_du_log] call fn_SaveToServer;

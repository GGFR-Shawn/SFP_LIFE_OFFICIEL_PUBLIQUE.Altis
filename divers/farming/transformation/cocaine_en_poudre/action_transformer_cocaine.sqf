// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_tempsattente_explosion","_chance_explosion","_activer_explosion","_choix_explosion_initialisation"];
if (player getvariable "item_cocaine_feuille_coca_sfp" < 1) exitwith {hint "Désolé, la transformation n'est pas possible car tu n'as pas de feuille de coca !";};
if (isnil "je_transforme_ma_cocaine") then {je_transforme_ma_cocaine = 0;}; if (je_transforme_ma_cocaine >= 1) exitwith {hint "Opération impossible, tu es déja entrain de faire ton chimiste ;)";}; je_transforme_ma_cocaine = 1;

switch (player getvariable "experience_transformation_cocaine") do
{
	_choix_explosion_initialisation = [1,2,3,4,5,6,7,8,9,10] call BIS_fnc_selectRandom;
	case 0 :
	{
		_chance_explosion = 10; 
		_choix_explosion_initialisation_choisit = [1,2,3,4,5,6,7]; 
		if (_choix_explosion_initialisation in _choix_explosion_initialisation_choisit) then {_activer_explosion = 1}else{_activer_explosion = 0};
	};
	case 1 :
	{
		_chance_explosion = 30;
		_choix_explosion_initialisation_choisit = [1,2,3,4,5,6];
		if (_choix_explosion_initialisation in _choix_explosion_initialisation_choisit) then {_activer_explosion = 1}else{_activer_explosion = 0};
	};
	case 2 :
	{
		_chance_explosion = 40;
		_choix_explosion_initialisation_choisit = [1,2,3,4,5];
		if (_choix_explosion_initialisation in _choix_explosion_initialisation_choisit) then {_activer_explosion = 1}else{_activer_explosion = 0};
	};
	case 3 :
	{
		_chance_explosion = 50;
		_choix_explosion_initialisation_choisit = [1,2,3,4];
		if (_choix_explosion_initialisation in _choix_explosion_initialisation_choisit) then {_activer_explosion = 1}else{_activer_explosion = 0};
	};
	case 4 :
	{
		_chance_explosion = 70;
		_choix_explosion_initialisation_choisit = [1,2,3];
		if (_choix_explosion_initialisation in _choix_explosion_initialisation_choisit) then {_activer_explosion = 1}else{_activer_explosion = 0};
	};
	case 5 :
	{
		_chance_explosion = 85;
		_choix_explosion_initialisation_choisit = [1];
		if (_choix_explosion_initialisation in _choix_explosion_initialisation_choisit) then {_activer_explosion = 1}else{_activer_explosion = 0};
	};
};

hint format ["! TRANSFORMATION COCAINE ! \n -------------------------------------------- \n\n Salut %1 et bienvenu dans la transformation de cocaine ! \n\n Grace à ton expérience dans le traitement de la cocaine de niveau %2,\n tu as %3 pourcent de chance de réussir ta transformation sans tout faire peter !!! \n\n Bonne chance %1 ! \n\n PS : La transformation va commencer des que tu t'approcheras de la table ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name player,player getvariable "experience_transformation_cocaine",_chance_explosion];

waitUntil {sleep 0.2; count (nearestObjects [getPosATL player, ["Land_CampingTable_F"], 2]) >= 1 or ! alive player};
if (!alive player) exitwith {je_transforme_ma_cocaine = nil;};

hint "! TRANSFORMATION COCAINE ! \n -------------------------------------------- \n\n La transformation va commencer ... \n\n Bonne chance ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
0 cuttext ["","BLACK OUT",6]; sleep 5.3;

_tempsattente = round (40 + (random 60)); // En secondes
if (_activer_explosion >= 1) then { _tempsattente_explosion = round (1 + (random 30))};

while {_tempsattente > 0 && alive player} do
{
	if (!isnil "_tempsattente_explosion") then 
	{
		if (_tempsattente == _tempsattente_explosion) then 
		{
			_explosion_de_la_bombe = "Bo_Mk82" createVehicle (getPosATL player);
			_explosion_de_la_bombe setVelocity [100,0,0]; player setdamage 1;
		};
	};
	0 cuttext [format ["! TRANSFORMATION COCAINE ! \n --------------------------------------------------------------- \n\n Encore %1 secondes d'attente afin d'obtenir de la poudre de cocaine ! \n\n Espérons que tu sais ce que tu fais pour éviter une explosion ... ! \n Votre chance d'y arriver %2 %3.", _tempsattente, _chance_explosion, "%"],"BLACK FADED",1];
	_tempsattente = _tempsattente - 1;
	
	sleep 1;
};

if (!alive player) then 
{
	0 cutText ["! TRANSFORMATION COCAINE ! \n --------------------------------------------------------------- \n\n Transformation échoué ! \n\n Tu as sans doute fait de mauvais mélanges !", "BLACK IN",3];
}else
{
	_mon_stock_de_cocaine = round ((player getvariable "item_cocaine_feuille_coca_sfp") / 2);
	_mon_stock_usedspace = round ((player getvariable "usedspace") / 4);
	player setvariable ["item_cocaine_feuille_coca_sfp",0,true];
	player setvariable ["item_cocaine_poudre_sfp",_mon_stock_de_cocaine,true];
	player setvariable ["usedspace",_mon_stock_usedspace,true];
	0 cutText [format ["! TRANSFORMATION COCAINE ! \n --------------------------------------------------------------- \n\n Bien joué ! Tu as réussi ta transformation qui devient donc %1 gramme de cocaine :) \n\n Tu peux maintenant les vendre au marché noir !",player getVariable "item_cocaine_poudre_sfp"],"BLACK IN",20];	
};

sleep 4;
je_transforme_ma_cocaine = nil;
_activer_explosion = nil;

// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};

l_objet_en_fuite_produit = _this select 0;
sa_position_de_lobjet_en_fuite = getPosATL l_objet_en_fuite_produit;
if (isnil "l_objet_en_fuite_produit") exitwith {};
if (!alive l_objet_en_fuite_produit) exitwith {};


["Fuite_produit_inconnu",["Fuite produit inconnu, faites attention !", ""]] call bis_fnc_showNotification;
player globalchat "Attention, une fuite d'un produit non connu vient d'être detecté, la DIR va intervenir d'ici peu ! N'approchez pas de l'objet ou vous risquerez la mort ...";

effet_douleur_toxique_by_maxou = 
{
	effet_de_douleur_toxique = 1;
	douleur_toxique_by_maxou = ppEffectCreate ["ColorCorrections", 200];
	douleur_toxique_by_maxou ppEffectEnable true;
	_valeur_random_de_l_effet = ((random 10) / 10);
	douleur_toxique_by_maxou ppEffectAdjust [_valeur_random_de_l_effet, _valeur_random_de_l_effet, _valeur_random_de_l_effet, [0,0,0,0.99], [0,0,0,0.9], [0,0,0,0.9]];
	douleur_toxique_by_maxou ppEffectCommit 2;
	sleep (random 2);
	ppEffectDestroy douleur_toxique_by_maxou;
	effet_de_douleur_toxique = nil;
};

_message_avertissement = 3;
while {alive l_objet_en_fuite_produit} do
{
	if (player distance sa_position_de_lobjet_en_fuite < 600) then
	{
		if (je_suis_en_service_a_la_sarl_depannage < 1 && player distance sa_position_de_lobjet_en_fuite < 10) then 
		{
			if (_message_avertissement > 0) then {_message_avertissement = _message_avertissement - 1; player globalchat "Attention, tu es proche du produit toxique et tu as du mal à respirer ! Ecarte toi";};
			player setdamage ((damage player) + 0.01);
			player say "joueur_douleur_flash_ball";
			if (isnil "effet_de_douleur_toxique") then {[] call effet_douleur_toxique_by_maxou;};
		}; 	
		_fuite_produit_inconnu = "#particlesource" createVehicleLocal [(sa_position_de_lobjet_en_fuite select 0),(sa_position_de_lobjet_en_fuite select 1),sa_position_de_lobjet_en_fuite select 2];
		_fuite_produit_inconnu setParticleCircle [0, [0, 0, 0]];
		_fuite_produit_inconnu setParticleRandom [1, [0, 0, 0.5], [random 7, random 7, 0.2], 0.1, 0.1, [1, 0, 0, 0], 0, 0];
		_fuite_produit_inconnu setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 1,1], "", "Billboard", 10, 12, [0, 0, 1], [0.5, 0.5, 0.5], 10, 1, 1, 0.25, [2, 2, 2], [[random 1,random 1,random 1,random 1], [0,0,0,0.1], [0,0,0,0.1],[0,0,0,0.9]], [1], 11, 0, "", "", sa_position_de_lobjet_en_fuite];
		_fuite_produit_inconnu setDropInterval 0.008;
		sleep 0.6;
		deletevehicle _fuite_produit_inconnu;
	}else
	{
		sleep 1;
	};
};

["Fuite_produit_inconnu",["Fuite produit inconnu terminé !", ""]] call bis_fnc_showNotification;
l_objet_en_fuite_produit = nil;
sa_position_de_lobjet_en_fuite = nil;
sleep 4;
effet_douleur_toxique_by_maxou = nil;
effet_de_douleur_toxique = nil;
douleur_toxique_by_maxou = nil;

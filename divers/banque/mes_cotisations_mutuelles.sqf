// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};

private "_cotisation_mutuelle";
_cotisation_mutuelle = 0;

while {isnil "jesuis_au_taff_a_la_sarl_pompier"} do
{
	for "_i" from 0 to 800 do
	{
		if (isnil "jesuis_au_taff_a_la_sarl_pompier") then
		{
			sleep 1;
		}else
		{
			sleep 0.0001;
		};
	};
	
	if (isnil "jesuis_au_taff_a_la_sarl_pompier") then
	{
		if ((player getVariable "ma_mutuelle_niveau_10_pour_cent") >= 0) then {_cotisation_mutuelle = 0;};
		if ((player getVariable "ma_mutuelle_niveau_10_pour_cent") >= 1) then {_cotisation_mutuelle = 100;};
		if ((player getVariable "ma_mutuelle_niveau_vingt_cinq_pour_cent") >= 1) then {_cotisation_mutuelle = 200;};
		if ((player getVariable "ma_mutuelle_niveau_cinquante_pour_cent") >= 1) then {_cotisation_mutuelle = 300;};
		if ((player getVariable "ma_mutuelle_niveau_soixante_quinze_pour_cent") >= 1) then {_cotisation_mutuelle = 400;};
		if ((player getVariable "ma_mutuelle_niveau_cent_pour_cent") >= 1) then {_cotisation_mutuelle = 500;};

		if (_cotisation_mutuelle == 0) then {["Clock",["MUTUELLE", "Vous n'avez pas de mutuelle. Pensez-y."]] call bis_fnc_showNotification;};
		if (_cotisation_mutuelle != 0) then {["Clock",["MUTUELLE", "Vous allez recevoir votre cotisation mutuelle dans 5 minutes."]] call bis_fnc_showNotification;};
		sleep 300;
		if (_cotisation_mutuelle != 0) then {["PayCheck", [ format["Vous avez payé votre mutuelle d'un montant de %1 Euros !",_cotisation_mutuelle] ] ] call bis_fnc_showNotification;};
		if (_cotisation_mutuelle != 0) then {player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - _cotisation_mutuelle,true];}; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	};
};

sleep 5;

titletext ["Le SDIS prend maintenant en charge les frais de votre mutuelle !","BLACK IN",6];


// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side != west) exitwith {};

_joueur_qui_c_est_prit_l_amende = _this select 0;
_montant_de_l_amende = _this select 1;
_pourcentage = 5;

if (!alive player) then {waituntil {sleep 5; alive player;};};

_compter_nombre_de_gendarme = 0;
{
	if (side _x == west) then
	{
		_compter_nombre_de_gendarme = round (_compter_nombre_de_gendarme + 1);
	};
} foreach playableunits;

_calcul_prime = round (_montant_de_l_amende / _compter_nombre_de_gendarme);
_calcul_prime = round (_calcul_prime / _pourcentage);

titleText [format ["\n\n\n\n\n\n\n\n\n\n\n\n Pourcentage amende recu : %1 %2 de %3 = %4 %5 ! (%6 gendarmes de connectés). \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr",_pourcentage, "%", _montant_de_l_amende, _calcul_prime, "€", _compter_nombre_de_gendarme],"PLAIN",1];
systemchat format ["L'amende de %1 vous a fait gagner %2 %3 !", name _joueur_qui_c_est_prit_l_amende, _calcul_prime, "€"];

player setvariable ["mon_argent_banque_by_sfp_maxou", (player getvariable "mon_argent_banque_by_sfp_maxou") + (_calcul_prime), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

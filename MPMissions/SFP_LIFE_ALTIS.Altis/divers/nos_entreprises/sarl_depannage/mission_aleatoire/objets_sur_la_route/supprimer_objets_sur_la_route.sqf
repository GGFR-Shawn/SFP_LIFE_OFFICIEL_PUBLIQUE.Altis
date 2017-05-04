// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_l_objet_sur_la_route_dir";
_l_objet_sur_la_route_dir = cursortarget;
if (isnil "_l_objet_sur_la_route_dir") exitwith {hint "Désolé, rien n'a été détecté ...";};

if (isnil "je_suis_entrain_d_enlever_l_objet_sur_la_route") then {je_suis_entrain_d_enlever_l_objet_sur_la_route = 0;};
if (je_suis_entrain_d_enlever_l_objet_sur_la_route >= 1) exitwith {hint "Désolé, tu es déja entrain d'enlever l'objet sur la route !";};
je_suis_entrain_d_enlever_l_objet_sur_la_route = 1;

if (isnil {_l_objet_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage"}) then {temps_objet_sur_la_route_sarl_depannage = floor (50 + (random 150)); _l_objet_sur_la_route_dir setvariable ["temps_objet_sur_la_route_sarl_depannage",temps_objet_sur_la_route_sarl_depannage,true];};

while {alive _l_objet_sur_la_route_dir && alive player && cursortarget getvariable "temps_objet_sur_la_route_sarl_depannage" > 0} do
{
	if (isnil {_l_objet_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage"}) then {temps_objet_sur_la_route_sarl_depannage = floor (50 + (random 150)); _l_objet_sur_la_route_dir setvariable ["temps_objet_sur_la_route_sarl_depannage",temps_objet_sur_la_route_sarl_depannage,true];};
	
	if (_l_objet_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage" <= 0) then 
	{
		duree_restante_avant_reparation_fuite = "Objet enlevé, félicitation !";
	}else
	{
		duree_restante_avant_reparation_fuite = format["%1 Secondes / %2 Minutes.", _l_objet_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage", round ((_l_objet_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage") / 60)];
	};
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Durée restante avant l'enlèvement de l'objet : %1", duree_restante_avant_reparation_fuite],"PLAIN"];	
	sleep 1;
	
	temps_objet_sur_la_route_sarl_depannage = (_l_objet_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage") - 1;
	_l_objet_sur_la_route_dir setvariable ["temps_objet_sur_la_route_sarl_depannage",temps_objet_sur_la_route_sarl_depannage,true];
	if (_l_objet_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage" <= 0) then 
	{
		_l_objet_sur_la_route_dir setvariable ["temps_objet_sur_la_route_sarl_depannage",0,true];
	};	
};

if (_l_objet_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage" <= 0) then 
{
	deletevehicle _l_objet_sur_la_route_dir;
	_prime_fin_reparation = round (random 500 + random 1000);
	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + _prime_fin_reparation,false]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Félicitation, l'objet à bien été enlevé ! \n Une prime de %1 Euros ta été donné, partage la si besoin !", _prime_fin_reparation],"PLAIN"];	
};

je_suis_entrain_d_enlever_l_objet_sur_la_route = nil;

// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_les_fissures_sur_la_route_dir","_duree_restante_refaire_route_dir"];
_les_fissures_sur_la_route_dir = (nearestObjects [getPosATL player, ["Crack_Clutter4"], 3]) select 0;
if (count (nearestObjects [getPosATL player, ["Crack_Clutter4"], 3]) < 1) exitwith {hint "Désolé, aucunes fissures détectées ...";};

if (isnil "je_suis_entrain_de_refaire_les_routes_fissurees") then {je_suis_entrain_de_refaire_les_routes_fissurees = 0;};
if (je_suis_entrain_de_refaire_les_routes_fissurees >= 1) exitwith {hint "Désolé, tu es déja entrain de refaire la route !";};
je_suis_entrain_de_refaire_les_routes_fissurees = 1;

if (isnil {_les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage"}) then {temps_objet_sur_la_route_sarl_depannage = floor (40 + (random 100)); _les_fissures_sur_la_route_dir setvariable ["temps_objet_sur_la_route_sarl_depannage",temps_objet_sur_la_route_sarl_depannage,true];};

while {player distance _les_fissures_sur_la_route_dir < 3 && alive _les_fissures_sur_la_route_dir && alive player && _les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage" > 0} do
{
	if (isnil {_les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage"}) then {temps_objet_sur_la_route_sarl_depannage = floor (30 + (random 100)); _les_fissures_sur_la_route_dir setvariable ["temps_objet_sur_la_route_sarl_depannage",temps_objet_sur_la_route_sarl_depannage,true];};
	
	if (_les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage" <= 0) then 
	{
		_duree_restante_refaire_route_dir = "Route refaite, félicitation !";
	}else
	{
		_duree_restante_refaire_route_dir = format["%1 Secondes / %2 Minutes.", _les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage", round ((_les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage") / 60)];
	};
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Durée restante avant la refection de la route : %1", _duree_restante_refaire_route_dir],"PLAIN"];	
	sleep 1;
	
	temps_objet_sur_la_route_sarl_depannage = (_les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage") - 1;
	_les_fissures_sur_la_route_dir setvariable ["temps_objet_sur_la_route_sarl_depannage",temps_objet_sur_la_route_sarl_depannage,true];
	if (_les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage" <= 0) then 
	{
		_les_fissures_sur_la_route_dir setvariable ["temps_objet_sur_la_route_sarl_depannage",0,true];
	};	
};

if (_les_fissures_sur_la_route_dir getvariable "temps_objet_sur_la_route_sarl_depannage" <= 0) then 
{
	deletevehicle _les_fissures_sur_la_route_dir;
	_prime_fin_reparation = round (random 500 + random 1000);
	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + _prime_fin_reparation,false]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Félicitation, la refection de la route à bien étée effectuée ! \n Une prime de %1 Euros ta été donné, partage la si besoin !", _prime_fin_reparation],"PLAIN"];	
}else
{
	0 cuttext ["Action terminée ...","PLAIN DOWN"];	
};

je_suis_entrain_de_refaire_les_routes_fissurees = nil;

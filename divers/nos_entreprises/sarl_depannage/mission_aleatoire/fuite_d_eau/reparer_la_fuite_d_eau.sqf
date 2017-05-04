//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

la_fuite_deau = cursortarget;

if (isnil "je_suis_entrain_de_reparer_la_fuite") then {je_suis_entrain_de_reparer_la_fuite = 0;};
if (je_suis_entrain_de_reparer_la_fuite >= 1) exitwith {hint "Désolé, tu es déja entrain de réparer la fuite !";};
je_suis_entrain_de_reparer_la_fuite = 1;

if (isnil {la_fuite_deau getvariable "je_fuie_pour_sarl_depannage_temps"}) then {je_fuie_pour_sarl_depannage_temps = floor (300 + (random 300)); la_fuite_deau setvariable ["je_fuie_pour_sarl_depannage_temps",je_fuie_pour_sarl_depannage_temps,true];};

while {alive la_fuite_deau && alive player && cursortarget getvariable "je_fuie_pour_sarl_depannage_temps" > 0} do
{
	if (isnil {la_fuite_deau getvariable "je_fuie_pour_sarl_depannage_temps"}) then {je_fuie_pour_sarl_depannage_temps = floor (300 + (random 300)); la_fuite_deau setvariable ["je_fuie_pour_sarl_depannage_temps",je_fuie_pour_sarl_depannage_temps,true];};
	
	if (la_fuite_deau getvariable "je_fuie_pour_sarl_depannage_temps" <= 0) then 
	{
		duree_restante_avant_reparation_fuite = "Fuite maitrisée, félicitation !";
	}else
	{
		duree_restante_avant_reparation_fuite = format["%1 Secondes / %2 Minutes.", la_fuite_deau getvariable "je_fuie_pour_sarl_depannage_temps", round ((la_fuite_deau getvariable "je_fuie_pour_sarl_depannage_temps") / 60)];
	};
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Durée restante avant la réparation de la fuite : %1", duree_restante_avant_reparation_fuite],"PLAIN"];	
	sleep 1;
	
	je_fuie_pour_sarl_depannage_temps = (la_fuite_deau getvariable "je_fuie_pour_sarl_depannage_temps") - 1;
	la_fuite_deau setvariable ["je_fuie_pour_sarl_depannage_temps",je_fuie_pour_sarl_depannage_temps,true];
	if (la_fuite_deau getvariable "je_fuie_pour_sarl_depannage_temps" <= 0) then 
	{
		la_fuite_deau setvariable ["je_fuie_pour_sarl_depannage_temps",0,true];
	};	
};

if (la_fuite_deau getvariable "je_fuie_pour_sarl_depannage_temps" <= 0) then 
{
	deletevehicle la_fuite_deau;
	_prime_fin_reparation = round (random 500 + random 1000);
	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + _prime_fin_reparation,false]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Félicitation, la fuite à bien été réparée ! \n Une prime de %1 Euros ta été donné, partage la si besoin !", _prime_fin_reparation],"PLAIN"];	
};

je_suis_entrain_de_reparer_la_fuite = nil;
la_fuite_deau = nil;
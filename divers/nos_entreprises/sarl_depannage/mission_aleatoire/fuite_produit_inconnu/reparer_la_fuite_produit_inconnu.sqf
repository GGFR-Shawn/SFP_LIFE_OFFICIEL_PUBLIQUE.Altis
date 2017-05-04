// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_la_fuite_du_produit_toxique";
{
	if (!isnil {_x getvariable "la_fuite_produit_inconnu_pour_sarl_depannage"}) then
	{
		_la_fuite_du_produit_toxique = _x;
	};
} foreach (nearestObjects [player, [], 7]);


if (isnil "je_suis_entrain_de_reparer_la_fuite_produit_inconnu") then {je_suis_entrain_de_reparer_la_fuite_produit_inconnu = 0;};
if (je_suis_entrain_de_reparer_la_fuite_produit_inconnu >= 1) exitwith {hint "Désolé, tu es déja entrain de maitrisée la fuite de produit toxique !";};
je_suis_entrain_de_reparer_la_fuite_produit_inconnu = 1;

if (isnil {_la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage"}) then {la_fuite_produit_inconnu_pour_sarl_depannage = floor (300 + (random 300)); _la_fuite_du_produit_toxique setvariable ["la_fuite_produit_inconnu_pour_sarl_depannage",la_fuite_produit_inconnu_pour_sarl_depannage,true];};

while {alive _la_fuite_du_produit_toxique && alive player && _la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage" > 0 && player distance _la_fuite_du_produit_toxique < 3} do
{
	player playActionNow "medicstartup";

	if (isnil {_la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage"}) then {la_fuite_produit_inconnu_pour_sarl_depannage = floor (300 + (random 300)); _la_fuite_du_produit_toxique setvariable ["la_fuite_produit_inconnu_pour_sarl_depannage",la_fuite_produit_inconnu_pour_sarl_depannage,true];};
	
	if (_la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage" <= 0) then 
	{
		duree_restante_avant_reparation_fuite = "Pollution maitrisée, félicitation !";
	}else
	{
		duree_restante_avant_reparation_fuite = format["%1 Secondes / %2 Minutes.", _la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage", round ((_la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage") / 60)];
	};
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Durée restante avant de maitriser la pollution : %1", duree_restante_avant_reparation_fuite],"PLAIN"];	
	sleep 1;
	
	la_fuite_produit_inconnu_pour_sarl_depannage = (_la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage") - 1;
	_la_fuite_du_produit_toxique setvariable ["la_fuite_produit_inconnu_pour_sarl_depannage",la_fuite_produit_inconnu_pour_sarl_depannage,true];
	if (_la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage" <= 0) then 
	{
		_la_fuite_du_produit_toxique setvariable ["la_fuite_produit_inconnu_pour_sarl_depannage",0,true];
	};	
};

if (_la_fuite_du_produit_toxique getvariable "la_fuite_produit_inconnu_pour_sarl_depannage" <= 0) then 
{
	deletevehicle _la_fuite_du_produit_toxique;
	_prime_fin_reparation = round (random 500 + random 1000);
	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") + _prime_fin_reparation,false]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Félicitation, la pollution à bien été maitrisée ! \n Une prime de %1 Euros ta été donné, partage la si besoin !", _prime_fin_reparation],"PLAIN"];	
};

player playActionNow "medicstop";	

je_suis_entrain_de_reparer_la_fuite_produit_inconnu = nil;
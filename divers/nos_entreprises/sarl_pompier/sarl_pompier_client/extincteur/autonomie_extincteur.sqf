//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

private "_condition_feu_eteint";
_condition_feu_eteint = false;

player setvariable ["synchro_bruit_extincteur_sfp",true,true];
[[[player],"divers\nos_entreprises\sarl_pompier\sarl_pompier_client\extincteur\bruit_extincteur.sqf"],"BIS_fnc_execVM",true, false] spawn BIS_fnc_MP;

if (isnil {lincendie getvariable "temps_pour_eteindre_le_feu"}) then 
{
	if (typeof lincendie == "Land_Campfire_F") then 
	{
		lincendie setvariable ["temps_pour_eteindre_le_feu",(floor (4 + (random 10))),true];
	}else
	{
		lincendie setvariable ["temps_pour_eteindre_le_feu",(floor (60 + (random 60))),true];
	};
};

while {je_peux_deployer_l_extincteur >= 1 && !isnil {lincendie getvariable "jesuisenfeu"} && duree_de_mon_reservoir >= 0 && alive lincendie && alive player} do
{
	duree_de_mon_reservoir = duree_de_mon_reservoir - 8;
	duree_de_mon_reservoir_en_pourcentage = floor duree_de_mon_reservoir / 10;
	if (duree_de_mon_reservoir_en_pourcentage < 0) then {duree_de_mon_reservoir_en_pourcentage = 0;};
	
	// Message extinction
	if (lincendie getvariable "temps_pour_eteindre_le_feu" <= 0) then {duree_restante_avant_extinction_message = "Feu Eteint, tu peux ranger ton extincteur !";}else{duree_restante_avant_extinction_message = format["%1 pour cent.", lincendie getvariable "temps_pour_eteindre_le_feu"];};
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Durée restant extincteur : %1 pour cent. \n Durée restante avant extinction du feu : %2 \n\n N'oublie pas qu'il faut également arroser les objets à proximité.",duree_de_mon_reservoir_en_pourcentage, duree_restante_avant_extinction_message],"PLAIN"];	

	lincendie setvariable ["temps_pour_eteindre_le_feu",((lincendie getvariable "temps_pour_eteindre_le_feu") - (1 + random 7)),true]; 
	if (lincendie getvariable "temps_pour_eteindre_le_feu" <= 0 && lincendie getvariable "jesuisenfeu" <= 1) then {_condition_feu_eteint = true; deletevehicle lincendie;};
	if (lincendie getvariable "temps_pour_eteindre_le_feu" <= 0 && lincendie getvariable "jesuisenfeu" >= 2) then {_condition_feu_eteint = true; lincendie setvariable ["jesuisenfeu",nil,true];};
	
	sleep 2;
};

player setvariable ["synchro_bruit_extincteur_sfp",nil,true];

if (duree_de_mon_reservoir <= 0) then 
{
	hint "Tu as terminé ton extincteur ! \n Il va être supprimé.";
	execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\extincteur\arreter_eau.sqf";
};

if (_condition_feu_eteint) then
{
	_prime = round (200 + (random 500));
	player setvariable ["mon_argent_banque_by_sfp_maxou", ((player getvariable "mon_argent_banque_by_sfp_maxou") + (_prime)), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 
	hint format ["Une prime de %1 Euros ta été accordée pour avoir éteint l'incendie !", _prime];
};
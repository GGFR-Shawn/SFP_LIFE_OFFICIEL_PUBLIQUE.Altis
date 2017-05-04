// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_espacerestant = (player getVariable "usedspace");
_numero_tableau = -1;
if((lbCurSel 1500) == -1) exitwith {Hint "Désolé, tu n'as rien selectionné !";};
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};

_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	execvm "vendre\divers\chemlight.sqf";
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "boite d'allumette + bois";
	le_prix_de_larticle = 75;
	_totaldeuxdeux = (_espacerestant + 1);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if (!isnil {player getVariable "boite_allumette"}) exitwith {hint "Désolé, tu ne peux acheter que 1 boite d'allumette !";};
		
		player setVariable ["boite_allumette", true,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 1,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "sac à dos sans capacité en plus de farming";
	le_prix_de_larticle = 100;
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player addBackpack "G_AssaultPack";
		
		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	// Barre céréale
	execvm "divers\station_service\achat_divers_station_service\acheter_cereales_station_service.sqf";
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	// Bouteille eau
	execvm "divers\station_service\achat_divers_station_service\acheter_bouteille_eau_station_service.sqf";
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	// Red Bull
	execvm "divers\station_service\achat_divers_station_service\acheter_redbull_station_sercice.sqf";
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "hache";
	le_prix_de_larticle = 25;
	_totaldeuxdeux = (_espacerestant + 3);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		_sacados = unitBackpack player;
		if (isnull _sacados) exitwith {hint format ["Désolé, il te faut un sac à dos pour acheter une %1 !",le_nom_de_larticle];};
		if ((player getVariable "hache_pour_coupe_de_bois") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'une seule hache !",le_nom_de_larticle];};
		
		player setVariable ['hache_pour_coupe_de_bois', (player getVariable "hache_pour_coupe_de_bois") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 3,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "canne a peche";
	le_prix_de_larticle = 35;
	_totaldeuxdeux = (_espacerestant + 5);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		_sacados = unitBackpack player;
		if (isnull _sacados) exitwith {hint format ["Désolé, il te faut un sac à dos pour acheter une %1 !",le_nom_de_larticle];};
		if ((player getVariable "canne_a_peche") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'une seule %1 !",le_nom_de_larticle];};
		
		player setVariable ['canne_a_peche', (player getVariable "canne_a_peche") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 5,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "harpon";
	le_prix_de_larticle = 100;
	_totaldeuxdeux = (_espacerestant + 5);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		_sacados = unitBackpack player;
		if (isnull _sacados) exitwith {hint format ["Désolé, il te faut un sac à dos pour acheter un %1 !",le_nom_de_larticle];};
		if ((player getVariable "harpon_pour_la_peche") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'un seul %1 !",le_nom_de_larticle];};
		
		player setVariable ['harpon_pour_la_peche', (player getVariable "harpon_pour_la_peche") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 5,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "gants";
	le_prix_de_larticle = 15;
	_totaldeuxdeux = (_espacerestant + 1);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "gants_pour_petrole") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'une seule paire de %1 !",le_nom_de_larticle];};
		
		player setVariable ['gants_pour_petrole', (player getVariable "gants_pour_petrole") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 1,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "marteau";
	le_prix_de_larticle = 18;
	_totaldeuxdeux = (_espacerestant + 1);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if (!isnil {player getVariable "marteau_sfp"}) exitwith {hint "Désolé, tu ne peux acheter qu'un seul marteau !";};
		
		player setVariable ["marteau_sfp", true,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 1,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "pied de biche";
	le_prix_de_larticle = 17;
	_totaldeuxdeux = (_espacerestant + 5);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "pied_de_biche") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'un seul %1 !",le_nom_de_larticle];};
		
		player setVariable ['pied_de_biche', (player getVariable "pied_de_biche") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 5,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "bidon d'essence";
	le_prix_de_larticle = 50;
	_totaldeuxdeux = (_espacerestant + 6);
	if (revive_mon_side != civilian) exitwith {};
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "bidon_d_essence") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'un seul %1 !",le_nom_de_larticle];};
		
		player setVariable ['bidon_d_essence', (player getVariable "bidon_d_essence") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 6,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n Sachez que : \n\n - Le bidon ne se donne pas pour eviter les bugs du fuel. \n - Le jerrican est limité à une seule utilisation. \n - Il ne fonctionne seulement si pas de DDE connecté. \n - Il ne fonctionne que sur les véhicules à moins de 50 % de fuel. \n\n Merci.',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
		sleep 3;
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n Sachez que : \n\n - Le bidon ne se donne pas pour eviter les bugs du fuel. \n - Le jerrican est limité à une seule utilisation. \n - Il ne fonctionne seulement si pas de DDE connecté. \n - Il ne fonctionne que sur les véhicules à moins de 50 % de fuel. \n\n Merci.',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "traceur véhicule";
	le_prix_de_larticle = 600;
	if (player getvariable "ma_date_de_naissance" < 600) exitwith {hint "Désolé, tu n'as pas assez d'heure sur le serveur pour te servir de cette fonction ! \n\n Il te faut au minimum 10 heures !";};
	_totaldeuxdeux = (_espacerestant + 2);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "traceur_vehicule") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'un seul %1 !",le_nom_de_larticle];};
		
		player setVariable ['traceur_vehicule', (player getVariable "traceur_vehicule") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 2,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "cocktail molotov";
	le_prix_de_larticle = 210;
	if (player getvariable "ma_date_de_naissance" < 600) exitwith {hint "Désolé, tu n'as pas assez d'heure sur le serveur pour te servir de cette fonction ! \n\n Il te faut au minimum 10 heures !";};
	_totaldeuxdeux = (_espacerestant + 2);
	if (revive_mon_side != civilian) exitwith {};
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "cocktail_molotov") >= 5) exitwith {hint format ["Désolé, tu ne peux acheter que 5 %1 !",le_nom_de_larticle];};
		
		player setVariable ['cocktail_molotov', (player getVariable "cocktail_molotov") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 2,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Brouilleur C4";
	le_prix_de_larticle = 800;
	_totaldeuxdeux = (_espacerestant + 5);
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "brouilleur_sacoche_c4") >= 5) exitwith {hint format ["Désolé, tu ne peux acheter que 5 %1 !",le_nom_de_larticle];};
		
		player setVariable ['brouilleur_sacoche_c4', (player getVariable "brouilleur_sacoche_c4") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 5,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "Corde Descente Rappel";
	le_prix_de_larticle = 6000;
	_totaldeuxdeux = (_espacerestant + (listes_des_farming_avec_parametre select 51 select 2));
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if (!isClass (configFile >> "CfgPatches" >> "AUR_AdvancedUrbanRappelling")) exitwith {hint "Désolé, tu n'as pas notre launcher pour acheter ceci !";};
		if (player getVariable "corde_descente_rappel_sfp") exitwith {hint "Désolé, tu ne peux acheter qu'une seule corde de descente en rappel !";};
		
		player setVariable ['corde_descente_rappel_sfp', true,true];
		player setVariable["usedspace",(player getVariable "usedspace") + (listes_des_farming_avec_parametre select 51 select 2),true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "coffre fort";
	le_prix_de_larticle = 200000 ;
	_totaldeuxdeux = (_espacerestant + 70);
	if !(sfp_config_activer_achat_coffre_fort) exitwith {hint "Désolé, l'achat n'est pas autorisé !";};
	if (isnil "le_serveur_vient_de_demarrer") exitwith {hint "Patiente, le serveur vient de démarrer !";};
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "Tu ne peux pas car le serveur va redémarrer dans moins de 20 minutes !";};
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as pas assez de place dans ton inventaire ! Il t'en faut 70 !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "coffre_fort") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'un seul %1 !",le_nom_de_larticle];};
		
		player setVariable ["coffre_fort",1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 70,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";		
		
		hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n Sachez que : \n\n - Vous ne pouvez déposer votre coffre fort que dans votre maison. \n - Vous ne pouvez pas acheter plus d'un coffre fort. \n\n Merci.",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou')];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "tente pour dormir";
	le_prix_de_larticle = 78;
	_totaldeuxdeux = (_espacerestant + 10);
	if (revive_mon_side != civilian) exitwith {};
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "tente_pour_dormir") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'une seule %1 !",le_nom_de_larticle];};
		
		player setVariable ['tente_pour_dormir', (player getVariable "tente_pour_dormir") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 10,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n Sachez que la tente ne se donne pas pour privilégier les hotels également.',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "seau pour les plantes illégales";
	le_prix_de_larticle = 13;
	_totaldeuxdeux = (_espacerestant + 5);
	if (revive_mon_side != civilian) exitwith {};
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "seau_plante_illegal") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'un seul %1 !",le_nom_de_larticle];};
		
		player setVariable ['seau_plante_illegal', (player getVariable "seau_plante_illegal") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 5,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "valise pour le farming";
	le_prix_de_larticle = 75;
	_totaldeuxdeux = (_espacerestant + 5);
	if (revive_mon_side != civilian) exitwith {};
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "valise_pour_le_farming") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'une seule %1 !",le_nom_de_larticle];};
		
		player setVariable ['valise_pour_le_farming', 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + (listes_des_farming_avec_parametre select 49 select 2),true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "corde et un sac pour attacher des joueurs";
	le_prix_de_larticle = 24;
	_totaldeuxdeux = (_espacerestant + 10);
	if (revive_mon_side != civilian) exitwith {};
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if ((player getVariable "corde_et_sac") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'une seul %1 !",le_nom_de_larticle];};
		
		player setVariable ['corde_et_sac', 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 10,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
_numero_tableau = round (_numero_tableau + 1);
if((lbCurSel 1500) == _numero_tableau) then
{
	le_nom_de_larticle = "bombe pour la porte de prison";
	le_prix_de_larticle = 150000;
	_totaldeuxdeux = (_espacerestant + 10);
	if (revive_mon_side != civilian) exitwith {};
	if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		if (!isnil {player getvariable "bombe_porte_prison"}) exitwith {hint format ["Désolé, tu ne peux acheter qu'une seul %1 !",le_nom_de_larticle];};
		
		player setVariable ['bombe_porte_prison', true,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 10,true];
		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};


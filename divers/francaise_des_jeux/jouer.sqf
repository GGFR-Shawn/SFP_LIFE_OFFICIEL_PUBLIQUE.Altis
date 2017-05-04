// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_prix_de_larticle = (floor parseNumber (ctrlText 11175));
if (player getVariable "mon_argent_poche_by_sfp_maxou" < _le_prix_de_larticle) exitwith {Hint format ["Désolé, \n\n\n Vous avez : %1 Euros \n\n Il vous faut : %2 Euros",(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp, _le_prix_de_larticle];};

if((lbCurSel 11173) == 0) then
{
	if (_le_prix_de_larticle < 40) exitwith {Hint format ["Désolé, tu as voulu misé %1 Euros, mais le montant minimum est de 40 Euros !", _le_prix_de_larticle];};
	
	if (jaijouerauloto < 1) then
	{
		jaijouerauloto = 1;
		
		player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") - _le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['! FRANCAISE DES JEUX !\n -------------- \n\n Bonjour, \n\n Nous vous remercions de votre mise de %1 Euros. \n\n Vous serez avertit dans environ 1 heure par un message lorsque les boules seront jetées. \n\n Vous pouvez gagner jusqu''à 20 000 Euros !!!',_le_prix_de_larticle];
		
		tempsavantdepouvoirrejouerloto = round (30 + (random 30)); // en minutes
		while {tempsavantdepouvoirrejouerloto > 0} do {tempsavantdepouvoirrejouerloto = tempsavantdepouvoirrejouerloto - 1; sleep 60;};
		
		jaijouerauloto = 0;
		
		private "_argentgagne";
		_argentgagne = round (1 + (random 100000));
		while {_argentgagne > sfp_config_montant_recompense_max_loto} do
		{
			_argentgagne = round (1 + (random 100000));
			sleep 0.001;
		};
		
		hint format['! RESULTAT LOTO ! \n\n Voici le résultat du précédent loto que tu as joués pour %1 Euros. \n\n La combinaison de touche que tu as donné te rapportes %2 Euros ! \n\n N''Oublie pas de mettre tes %2 Euros en banque !',_le_prix_de_larticle,_argentgagne];
		titleText [format["! RESULTAT LOTO ! \n\n Voici le résultat du précédent loto que tu as joués pour %1 Euros. \n\n La combinaison de touche que tu as donné te rapportes %2 Euros ! \n\n N''Oublie pas de mettre tes %2 Euros en banque !", _le_prix_de_larticle, _argentgagne], "PLAIN DOWN"];
		
		player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") + _argentgagne,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	}else
	{
		hint format['Désolé, tu as déja joué au loto, reviens dans %1 minutes !', tempsavantdepouvoirrejouerloto];
	};
};

if ((lbCurSel 11173) == 1) then
{
	if(_le_prix_de_larticle < 40) exitwith {Hint format ["Désolé, tu as voulu misé %1 Euros, mais le montant minimum est de 40 Euros !", _le_prix_de_larticle];};
	
	if (jaijoueraleurommillion < 1) then
	{
		jaijoueraleurommillion = 1;
		
		player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") - _le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

		hint format['! FRANCAISE DES JEUX !\n -------------- \n\n Bonjour, \n\n Nous vous remercions de votre mise de %1 Euros. \n\n Vous serez avertit dans 1 heure environ par un message lorsque le tirage sera terminée. \n\n Vous pouvez gagner jusqu''à 60 000 Euros !!!',_le_prix_de_larticle];
		
		tempsavantdepouvoirrejoueraleurommillion = round (30 + (random 30)); // en minutes
		while {tempsavantdepouvoirrejoueraleurommillion > 0} do {tempsavantdepouvoirrejoueraleurommillion = tempsavantdepouvoirrejoueraleurommillion - 1;sleep 60;};
		
		jaijoueraleurommillion = 0;

		private "_argentgagne";
		_argentgagne = round (1 + (random 100000));
		while {_argentgagne > sfp_config_montant_recompense_max_euromillion} do
		{
			_argentgagne = round (1 + (random 100000));
			sleep 0.001;
		};
		
		hint format['! RESULTAT EUROMILLION ! \n\n Voici le résultat du précédent euromillion que tu as joués pour %1 Euros. \n\n Le tirage que tu as fait te rapportes %2 Euros ! \n\n N''Oublie pas de mettre tes %2 Euros en banque !',_le_prix_de_larticle,_argentgagne];
		titleText [format["! RESULTAT EUROMILLION ! \n\n Voici le résultat du précédent euromillion que tu as joués pour %1 Euros. \n\n Le tirage que tu as fait te rapportes %2 Euros ! \n\n N''Oublie pas de mettre tes %2 Euros en banque !", _le_prix_de_larticle, _argentgagne], "PLAIN DOWN"];

		player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") + _argentgagne,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	}else
	{
		hint format ['Désolé, tu as déja joué a l''euromillion, reviens dans %1 minutes !', tempsavantdepouvoirrejoueraleurommillion];
	};
};
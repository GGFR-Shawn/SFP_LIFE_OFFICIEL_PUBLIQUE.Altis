// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
if((lbCurSel 11121) == -1) exitwith {Hint "Désolé, tu n'as rien selectionné !";};

if((lbCurSel 11121) == 0) then
{
	le_nom_de_larticle = "le BEP MECANIQUE AUTO";
	le_prix_de_larticle = 400;
	_nomdelavariabledudiplomeaobtenir = "license_BEP_Mecanique";
	_tempsattente = 125; // En secondes
	
	if (player getvariable _nomdelavariabledudiplomeaobtenir >= 1) exitwith {hint format ["Désolé, tu as déja %1 !",le_nom_de_larticle];};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		closedialog 0;
		10 fadeSound 0;
		10 fadeMusic 0;
		while {_tempsattente > 0} do
		{
			0 cuttext [format ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Dans quelques secondes, tu vas obtenir ton BEP de mécanique auto en accelerer ... \n\n Il te permettra de réparer les véhicules ! \n\n Encore %1 secondes avant l'obtention !",_tempsattente],"BLACK FADED",1];
			_tempsattente = _tempsattente - 1;
			sleep 1;
		};
		10 fadeSound 1;
		10 fadeMusic 1;
		0 cutText ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Tu viens d'être diplomé du BEP Mécanique Auto ! Félicitation :)", "BLACK IN",20];	

		hint format['Vous venez d''obtenir %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable [_nomdelavariabledudiplomeaobtenir, 1,true];
	}else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
if((lbCurSel 11121) == 1) then
{
	le_nom_de_larticle = "le BEPC";
	le_prix_de_larticle = 460;
	_nomdelavariabledudiplomeaobtenir = "license_BEPC";
	_tempsattente = 60; // En secondes
	
	if (player getvariable _nomdelavariabledudiplomeaobtenir >= 1) exitwith {hint format ["Désolé, tu as déja %1 !",le_nom_de_larticle];};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		closedialog 0;
		10 fadeSound 0;
		10 fadeMusic 0;
		while {_tempsattente > 0} do
		{
			0 cuttext [format ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Dans quelques secondes, tu vas obtenir ton BEPC en accelerer ... \n\n Il te permettra de gagner plus d'argent en travaillant ! \n\n Encore %1 secondes avant l'obtention !",_tempsattente],"BLACK FADED",1];
			_tempsattente = _tempsattente - 1;
			sleep 1;
		};
		10 fadeSound 1;
		10 fadeMusic 1;
		0 cutText ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Tu viens d'être diplomé du BEPC ! Félicitation :)", "BLACK IN",20];	

		hint format['Vous venez d''obtenir %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable [_nomdelavariabledudiplomeaobtenir, 1,true];
	}else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
if((lbCurSel 11121) == 2) then
{
	le_nom_de_larticle = "le BAC GENERAL";
	le_prix_de_larticle = 540;
	_nomdelavariabledudiplomeaobtenir = "license_BAC_GENERAL";
	_nomdelavariabledudiplomeprecedent = "license_BEPC";
	_tempsattente = 70; // En secondes
	
	if (player getvariable _nomdelavariabledudiplomeaobtenir >= 1) exitwith {hint format ["Désolé, tu as déja %1 !",le_nom_de_larticle];};
	if (player getvariable "license_BEPC" <= 0) exitwith {hint "Désolé, il te faut d'abord le BEPC";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		closedialog 0;
		
		10 fadeSound 0;
		10 fadeMusic 0;
		while {_tempsattente > 0} do
		{
			0 cuttext [format ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Dans quelques secondes, tu vas obtenir ton BAC GENERAL en accelerer ... \n\n Il te permettra de gagner plus d'argent en travaillant ! \n\n Encore %1 secondes avant l'obtention !",_tempsattente],"BLACK FADED",1];
			_tempsattente = _tempsattente - 1;
			sleep 1;
		};
		10 fadeSound 1;
		10 fadeMusic 1;
		0 cutText ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Tu viens d'être diplomé du BAC GENERAL ! Félicitation :)", "BLACK IN",20];	

		hint format['Vous venez d''obtenir %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable [_nomdelavariabledudiplomeaobtenir, 1,true];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
if((lbCurSel 11121) == 3) then
{
	le_nom_de_larticle = "le BAC PRO";
	le_prix_de_larticle = 670;
	_nomdelavariabledudiplomeaobtenir = "license_BAC_PRO";
	_nomdelavariabledudiplomeprecedent = "license_BAC_GENERAL";
	_tempsattente = 80; // En secondes
	
	if (player getvariable _nomdelavariabledudiplomeaobtenir >= 1) exitwith {hint format ["Désolé, tu as déja %1 !",le_nom_de_larticle];};
	if (player getvariable _nomdelavariabledudiplomeprecedent <= 0) exitwith {hint "Désolé, il te faut d'abord le BAC GENERAL";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		closedialog 0;
		
		10 fadeSound 0;
		10 fadeMusic 0;
		while {_tempsattente > 0} do
		{
			0 cuttext [format ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Dans quelques secondes, tu vas obtenir ton BAC PRO en accelerer ... \n\n Il te permettra de gagner plus d'argent en travaillant ! \n\n Encore %1 secondes avant l'obtention !",_tempsattente],"BLACK FADED",1];
			_tempsattente = _tempsattente - 1;
			sleep 1;
		};
		10 fadeSound 1;
		10 fadeMusic 1;
		0 cutText ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Tu viens d'être diplomé du BAC PRO ! Félicitation :)", "BLACK IN",20];	

		hint format['Vous venez d''obtenir %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable [_nomdelavariabledudiplomeaobtenir, 1,true];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
if((lbCurSel 11121) == 4) then
{
	le_nom_de_larticle = "le BTS";
	le_prix_de_larticle = 810;
	_nomdelavariabledudiplomeaobtenir = "license_BTS";
	_nomdelavariabledudiplomeprecedent = "license_BAC_PRO";
	_tempsattente = 90; // En secondes
	
	if (player getvariable _nomdelavariabledudiplomeaobtenir >= 1) exitwith {hint format ["Désolé, tu as déja %1 !",le_nom_de_larticle];};
	if (player getvariable _nomdelavariabledudiplomeprecedent <= 0) exitwith {hint "Désolé, il te faut d'abord le BAC PRO";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		closedialog 0;
		
		10 fadeSound 0;
		10 fadeMusic 0;
		while {_tempsattente > 0} do
		{
			0 cuttext [format ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Dans quelques secondes, tu vas obtenir ton BTS en accelerer ... \n\n Il te permettra de gagner plus d'argent en travaillant ! \n\n Encore %1 secondes avant l'obtention !",_tempsattente],"BLACK FADED",1];
			_tempsattente = _tempsattente - 1;
			sleep 1;
		};
		10 fadeSound 1;
		10 fadeMusic 1;
		0 cutText ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Tu viens d'être diplomé du BTS ! Félicitation :)", "BLACK IN",20];	

		hint format['Vous venez d''obtenir %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable [_nomdelavariabledudiplomeaobtenir, 1,true];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
if((lbCurSel 11121) == 5) then
{
	le_nom_de_larticle = "le DEUG";
	le_prix_de_larticle = 1200;
	_nomdelavariabledudiplomeaobtenir = "license_DEUG";
	_nomdelavariabledudiplomeprecedent = "license_BTS";
	_tempsattente = 115; // En secondes
	
	if (player getvariable _nomdelavariabledudiplomeaobtenir >= 1) exitwith {hint format ["Désolé, tu as déja %1 !",le_nom_de_larticle];};
	if (player getvariable _nomdelavariabledudiplomeprecedent <= 0) exitwith {hint "Désolé, il te faut d'abord le BTS";};
	if(argent_actuellement >= le_prix_de_larticle) then
	{
		closedialog 0;
		
		10 fadeSound 0;
		10 fadeMusic 0;
		while {_tempsattente > 0} do
		{
			0 cuttext [format ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Dans quelques secondes, tu vas obtenir ton DEUG en accelerer ... \n\n Il te permettra de gagner plus d'argent en travaillant ! \n\n Encore %1 secondes avant l'obtention !",_tempsattente],"BLACK FADED",1];
			_tempsattente = _tempsattente - 1;
			sleep 1;
		};
		10 fadeSound 1;
		10 fadeMusic 1;
		0 cutText ["! ALTIS ECOLE ! \n --------------------------------------------------------------- \n\n Tu viens d'être diplomé du DEUG ! Félicitation :)", "BLACK IN",20];	

		hint format['Vous venez d''obtenir %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

		player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable [_nomdelavariabledudiplomeaobtenir, 1,true];
	}
	else
	{
		Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];
	};
};
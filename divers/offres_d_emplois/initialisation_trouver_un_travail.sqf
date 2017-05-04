// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side == west) exitwith {hint "Désolé, il faut être un civil pour trouver du travail ";};

if (isnil "jepeuxencoreconsultercombiendoffredemploi") then {execvm "divers\offres_d_emplois\limiter_nombres_de_choix.sqf";};
waituntil {!isnil "jepeuxencoreconsultercombiendoffredemploi"};
jepeuxencoreconsultercombiendoffredemploi = round (jepeuxencoreconsultercombiendoffredemploi - 1);
if (jepeuxencoreconsultercombiendoffredemploi < 0) then {jepeuxencoreconsultercombiendoffredemploi = 0;};

if (isnil "direcombiendetravaildisponible") then {direcombiendetravaildisponible = 1;};
if (direcombiendetravaildisponible == 1) then {direcombiendetravaildisponible = 0; hint parseText format ["! ALTIS LIFE EMPLOI ! <br/>------------------------------------------------------<br/> Bonjour ! <br/><br/> Il y a actuellement <t color='#00E20F'>%1 </t>offres disponibles ! <br/><br/> N'oublie pas, les offres se ressemblent mais les conditions <t color='#ff0000'>sont complètement différentes</t> : <br/><br/> - Déplacement prit en compte <br/> - Salaire suivant diplome <br/> - La ville du travail <br/> - Etc <br/><br/> Bon choix à toi :)  <br/> ----------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr ",jepeuxencoreconsultercombiendoffredemploi];sleep 4;};

if (jepeuxencoreconsultercombiendoffredemploi > 0) then
{
	randomoffre = (random 999999);
	descriptiondeloffre_une = ["Electricien, vous vous occuperez de l'installation de lampadaire sur Altis.","Vous vous occuperez de tondre la pelouse sur Altis.","La société SARL DIR recherche des dépanneurs, consultez les :","La SARL AUTOECOLE recrute des moniteurs, consultez les :","Sarl Avocat recrute des avocats, consulte la :","Livreur de journaux :","Livreur de carburant :"];
	descriptiondeloffre_une_choisit = descriptiondeloffre_une call BIS_fnc_selectRandom;
	_descriptiondeloffre_deux = ["Votre patron n'est pas toujours présent.","Vous aurez votre patron sur le dos.","Vous travaillez sous le beau soleil de Altis.","Vos horaires sont aléatoires.","Vous ferez beaucoup d'heures.","Société en faillite, nous essayons de la redresser.","Vous travaillez dans la meilleure entreprise de Altis.","Chaussure de sécurité fournit.","Chaussure de sécurité non fournit.","Panier repas fournit.","Panier repas non fournit.","Téléphone portable non fournit.","Téléphone portable fournit.","Vous gagnerez des primes.","Pas de véhicule de fonction.","Vous travaillerez seul.","Vous travaillerez de nuit également.","Vous devez être soigné et organiser.","Vous devez être soigné et ponctuel.","Vous devez être minutieux.","Vous devez être soigné et minutieux.","Vous devez avoir une tenue soigné.","Vous devez être ponctuel."];
	_descriptiondeloffre_deux_choisit = _descriptiondeloffre_deux call BIS_fnc_selectRandom;
	_nomdusecteur = ["Neochori","Alikampos","Edessa","Dorida","Agios Konstantinos","kalithea","Zaros","Chalkeia","poliakko","Kavala","Lakka","Therisa","Neochori","Pyrgos","Agios_dionysios","Charkia","Stravos","Panochori"];
	nomdusecteur_valide = _nomdusecteur call BIS_fnc_selectRandom;
	_typeoffre = ["CDD 1 Mois","CDD 2 Mois","CDD 3 Mois","CDD 6 Mois","CDD 1 An","CDI","INTERIM"];
	typeoffre_valide = _typeoffre call BIS_fnc_selectRandom;
	_experience = ["Confirmé","Débutant Accepté","Non Indiqué"];
	_experience_valide = _experience call BIS_fnc_selectRandom;
	_formation = ["Aucune","BAC PRO","BTS","BEPC","BAC GENERAL","DEUG"];
	formation_valide = _formation call BIS_fnc_selectRandom;
	_deplacement = ["Oui","Non"];
	deplacement_valide = _deplacement call BIS_fnc_selectRandom;
	
	if (descriptiondeloffre_une_choisit == "Electricien, vous vous occuperez de l'installation de lampadaire sur Altis.") then {salaire = random 300 + random 300;};
	if (descriptiondeloffre_une_choisit == "Vous vous occuperez de tondre la pelouse sur Altis.") then {salaire = random 200 + random 300; _formation = ["Aucune","BEPC"]; formation_valide = _formation call BIS_fnc_selectRandom; deplacement_valide = "Oui";};
	if (descriptiondeloffre_une_choisit == "La société SARL DIR recherche des dépanneurs, consultez les :") then {salaire = 0;_descriptiondeloffre_deux_choisit = "Sur notre site www.sfpteam.fr ou sur TeamSpeak ts.sfpteam.fr"; _experience_valide = "A voir avec eux"; formation_valide = "A voir avec eux"; typeoffre_valide = "A voir avec eux";nomdusecteur_valide = "A voir avec eux"; deplacement_valide = "Oui";};
	if (descriptiondeloffre_une_choisit == "La SARL AUTOECOLE recrute des moniteurs, consultez les :") then {salaire = 0;_descriptiondeloffre_deux_choisit = "Sur notre site www.sfpteam.fr ou sur TeamSpeak ts.sfpteam.fr"; _experience_valide = "A voir avec eux"; formation_valide = "A voir avec eux"; typeoffre_valide = "A voir avec eux";nomdusecteur_valide = "A voir avec eux"; deplacement_valide = "Oui";};
	if (descriptiondeloffre_une_choisit == "Sarl Avocat recrute des avocats, consulte la :") then {salaire = 0;_descriptiondeloffre_deux_choisit = "Sur notre site www.sfpteam.fr ou sur TeamSpeak ts.sfpteam.fr"; _experience_valide = "BEPC OBLIGATOIRE"; formation_valide = "A voir avec eux"; typeoffre_valide = "A voir avec eux";nomdusecteur_valide = "A voir avec eux"; deplacement_valide = "Oui";};
	if (descriptiondeloffre_une_choisit == "Livreur de journaux :") then {salaire = 0;_descriptiondeloffre_deux_choisit = "Directement sur les PNJ : Livrer journaux"; _experience_valide = "Débutant Accepté"; formation_valide = "Aucune"; typeoffre_valide = "Interim";nomdusecteur_valide = "Partout"; deplacement_valide = "Oui";};
	if (descriptiondeloffre_une_choisit == "Livreur de carburant :") then {salaire = 0;_descriptiondeloffre_deux_choisit = "Directement sur les PNJ : Livrer gasoil"; _experience_valide = "Débutant Accepté"; formation_valide = "Aucune"; typeoffre_valide = "Interim";nomdusecteur_valide = "Partout"; deplacement_valide = "Oui";};

	
	if (formation_valide == "Aucune") then {_calculsalaire = salaire;_calculsalaire = _calculsalaire / 100;_calculsalaire = _calculsalaire * 60;salaire = salaire - _calculsalaire;};
	if (formation_valide == "BEPC") then {_calculsalaire = salaire;_calculsalaire = _calculsalaire / 100;_calculsalaire = _calculsalaire * 50;salaire = salaire - _calculsalaire;};
	if (formation_valide == "BAC GENERAL") then {_calculsalaire = salaire;_calculsalaire = _calculsalaire / 100;_calculsalaire = _calculsalaire * 40;salaire = salaire - _calculsalaire;};
	if (formation_valide == "BAC PRO") then {_calculsalaire = salaire;_calculsalaire = _calculsalaire / 100;_calculsalaire = _calculsalaire * 40;salaire = salaire - _calculsalaire;};
	if (formation_valide == "BTS") then {_calculsalaire = salaire;_calculsalaire = _calculsalaire / 100;_calculsalaire = _calculsalaire * 25;salaire = salaire - _calculsalaire;};
	if (formation_valide == "DEUG") then {_calculsalaire = salaire;_calculsalaire = _calculsalaire / 100;_calculsalaire = _calculsalaire * 0;salaire = salaire - _calculsalaire;};


	createdialog "TrouverUnTravail";
	ctrlSetText[11172,format["   %1",randomoffre]];
	ctrlSetText[11173,format["   %1",descriptiondeloffre_une_choisit]];
	ctrlSetText[11174,format["   %1",_descriptiondeloffre_deux_choisit]];
	ctrlSetText[11175,format[" %1",nomdusecteur_valide]];
	ctrlSetText[11176,format[" %1",typeoffre_valide]];
	ctrlSetText[11177,format[" %1",_experience_valide]];
	ctrlSetText[11178,format[" %1",formation_valide]];
	ctrlSetText[11179,format[" %1",deplacement_valide]];
	ctrlSetText[11180,format[" %1 Euros",salaire]];
}else
{
	hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Désolé, il n'y a plus d'offre pour aujourd'hui ! \n\n Reviens plus tard ... \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";
};
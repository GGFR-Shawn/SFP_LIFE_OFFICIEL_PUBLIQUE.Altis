// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_choix_montant_transformation = floor parseNumber (ctrlText 1400);
_nombre_de_serpent_pour_transformation = listes_des_farming_avec_parametre select 47 select 2;
_temps_de_transformation = (listes_des_farming_avec_parametre select 47 select 4) * _choix_montant_transformation;
if (_choix_montant_transformation < 1) exitwith {hint format ["! TRANSFORMATION SERPENT ! \n ---------------------------------- \n Désolé, il faut entrer plus de zéro ... \n -------------------------------- \n www.sfpteam.fr\n By Maxou", 0];}; 
if (player getvariable "serpent_non_transforme" < (_choix_montant_transformation * _nombre_de_serpent_pour_transformation)) exitwith {hint format ["! TRANSFORMATION SERPENT ! \n ---------------------------------- \n Désolé, vous n'avez que %1 serpent dans votre inventaire ! \n\n Il vous en faut %2 soit %3 par transformation !  \n -------------------------------- \n www.sfpteam.fr\n By Maxou", player getvariable "serpent_non_transforme", round (_nombre_de_serpent_pour_transformation * _choix_montant_transformation), _nombre_de_serpent_pour_transformation];}; 
if (player getvariable "mon_argent_poche_by_sfp_maxou" < (_choix_montant_transformation * 50)) exitwith {hint format ["! TRANSFORMATION SERPENT ! \n ---------------------------------- \n Désolé, vous n'avez que %1 %3 en poche et il vous faut %2 %3 !  \n -------------------------------- \n www.sfpteam.fr\n By Maxou", (player getvariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp, (_choix_montant_transformation * 50) call retour_formatage_chiffre_sfp,"€"];};
if (!isnil "transformation_serpent_en_cours") exitwith {hint "! TRANSFORMATION SERPENT ! \n ---------------------------------- \n Désolé, vous êtes déja entrain de transformer les serpents ... \n -------------------------------- \n www.sfpteam.fr\n By Maxou";}; 
transformation_serpent_en_cours = true;

closeDialog 0;
waituntil {!dialog;};

for "_i" from 0 to _temps_de_transformation do
{
	0 cuttext [format ["! TRANSFORMATION SERPENT ! \n --------------------------------------------------------------- \n\n Encore %1 secondes avant la fin de la transformation en venin ... ", _temps_de_transformation - _i],"BLACK FADED",1];
	
	if (alive player) then {sleep 1;};
};
if (!alive player) exitwith {transformation_serpent_en_cours = nil;};

0 cutText ["! TRANSFORMATION SERPENT ! \n --------------------------------------------------------------- \n\n Fin de la transformation ...", "BLACK IN",20];	

player setvariable ["mon_argent_poche_by_sfp_maxou", (player getvariable "mon_argent_poche_by_sfp_maxou") - ((_choix_montant_transformation * _nombre_de_serpent_pour_transformation) * 50),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

player setvariable ["serpent_non_transforme", (player getvariable "serpent_non_transforme") - (_choix_montant_transformation * _nombre_de_serpent_pour_transformation),true];
player setvariable ["usedspace", (player getvariable "usedspace") - ((_choix_montant_transformation * _nombre_de_serpent_pour_transformation) * (listes_des_farming_avec_parametre select 46 select 2)),true];

player setvariable ["serpent_transforme", (player getvariable "serpent_transforme") + (_choix_montant_transformation * (listes_des_farming_avec_parametre select 47 select 3)),true];
player setvariable ["usedspace", (player getvariable "usedspace") + (_choix_montant_transformation * (listes_des_farming_avec_parametre select 47 select 2)),true];

transformation_serpent_en_cours = nil;

hint format ["! TRANSFORMATION SERPENT ! \n ---------------------------------- \n Vous venez de transformer %1 serpent en %2 venin de serpent !  \n -------------------------------- \n www.sfpteam.fr\n By Maxou", (_choix_montant_transformation * _nombre_de_serpent_pour_transformation), (_choix_montant_transformation * (listes_des_farming_avec_parametre select 46 select 3))];

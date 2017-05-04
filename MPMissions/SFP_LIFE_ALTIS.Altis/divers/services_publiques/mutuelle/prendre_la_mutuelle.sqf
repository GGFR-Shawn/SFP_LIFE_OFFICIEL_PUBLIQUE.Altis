//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if((lbCurSel 11121) == -1) exitwith {Hint "Désolé, tu n'as rien selectionné !";};

if((lbCurSel 11121) == 0) then
{
	le_nom_de_larticle = "remboursement des frais de soins à hauteur de 10 pour cent sur la totalité de votre facture";
	le_prix_de_larticle = 100;
	if((player getVariable "ma_mutuelle_niveau_10_pour_cent") >= 1) exitwith {hint "! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous possèdez déjà ce pourcentage de remboursement ! \n\n Choisissez une autre offre. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if((player getVariable "mon_argent_banque_by_sfp_maxou") < le_prix_de_larticle) exitwith {Hint format ["Désolé, vous avez %1 Euros et besoin de %2 Euros.",(player getVariable 'mon_argent_banque_by_sfp_maxou'),(le_prix_de_larticle)];};
	player setVariable["ma_mutuelle_niveau_10_pour_cent",1,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_vingt_cinq_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cinquante_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_soixante_quinze_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cent_pour_cent",0,false];sleep 0.000045;
	closeDialog 0;
	player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable 'mon_argent_banque_by_sfp_maxou') - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez de souscrire à la mutuelle ALTIS avec une offre de %1. \n\n Cette mutuelle vous remboursera vos frais de santé quand vous vous en servirez. \n\n Une fois un soin fait, patientez que la mutuelle traite celle-ci. \n\n Ce choix est valide en permanence puisque sauvegardé. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",le_nom_de_larticle];
};
if((lbCurSel 11121) == 1) then
{
	le_nom_de_larticle = "remboursement des frais de soins à hauteur de 25 pour cent sur la totalité de votre facture";
	le_prix_de_larticle = 200;
	if((player getVariable "ma_mutuelle_niveau_vingt_cinq_pour_cent") >= 1) exitwith {hint "! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous possèdez déjà ce pourcentage de remboursement ! \n\n Choisissez une autre offre. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if((player getVariable "mon_argent_banque_by_sfp_maxou") < le_prix_de_larticle) exitwith {Hint format ["Désolé, vous avez %1 Euros et besoin de %2 Euros.",(player getVariable 'mon_argent_banque_by_sfp_maxou'),(le_prix_de_larticle)];};
	player setVariable["ma_mutuelle_niveau_10_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_vingt_cinq_pour_cent",1,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cinquante_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_soixante_quinze_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cent_pour_cent",0,false];sleep 0.000045;
	closeDialog 0;
	player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable 'mon_argent_banque_by_sfp_maxou') - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez de souscrire à la mutuelle ALTIS avec une offre de %1. \n\n Cette mutuelle vous remboursera vos frais de santé quand vous vous en servirez. \n\n Une fois un soin fait, patientez que la mutuelle traite celle-ci. \n\n Ce choix est valide en permanence puisque sauvegardé. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",le_nom_de_larticle];
};
if((lbCurSel 11121) == 2) then
{
	le_nom_de_larticle = "remboursement des frais de soins à hauteur de 50 pour cent sur la totalité de votre facture";
	le_prix_de_larticle = 300;
	if((player getVariable "ma_mutuelle_niveau_cinquante_pour_cent") >= 1) exitwith {hint "! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous possèdez déjà ce pourcentage de remboursement ! \n\n Choisissez une autre offre. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if((player getVariable "mon_argent_banque_by_sfp_maxou") < le_prix_de_larticle) exitwith {Hint format ["Désolé, vous avez %1 Euros et besoin de %2 Euros.",(player getVariable 'mon_argent_banque_by_sfp_maxou'),(le_prix_de_larticle)];};
	player setVariable["ma_mutuelle_niveau_10_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_vingt_cinq_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cinquante_pour_cent",1,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_soixante_quinze_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cent_pour_cent",0,false];sleep 0.000045;
	closeDialog 0;
	player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable 'mon_argent_banque_by_sfp_maxou') - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez de souscrire à la mutuelle ALTIS avec une offre de %1. \n\n Cette mutuelle vous remboursera vos frais de santé quand vous vous en servirez. \n\n Une fois un soin fait, patientez que la mutuelle traite celle-ci. \n\n Ce choix est valide en permanence puisque sauvegardé. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",le_nom_de_larticle];
};
if((lbCurSel 11121) == 3) then
{
	le_nom_de_larticle = "remboursement des frais de soins à hauteur de 50 pour cent sur la totalité de votre facture";
	le_prix_de_larticle = 400;
	if((player getVariable "ma_mutuelle_niveau_soixante_quinze_pour_cent") >= 1) exitwith {hint "! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous possèdez déjà ce pourcentage de remboursement ! \n\n Choisissez une autre offre. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if((player getVariable "mon_argent_banque_by_sfp_maxou") < le_prix_de_larticle) exitwith {Hint format ["Désolé, vous avez %1 Euros et besoin de %2 Euros.",(player getVariable 'mon_argent_banque_by_sfp_maxou'),(le_prix_de_larticle)];};
	player setVariable["ma_mutuelle_niveau_10_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_vingt_cinq_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cinquante_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_soixante_quinze_pour_cent",1,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cent_pour_cent",0,false];sleep 0.000045;
	closeDialog 0;
	player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable 'mon_argent_banque_by_sfp_maxou') - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez de souscrire à la mutuelle ALTIS avec une offre de %1. \n\n Cette mutuelle vous remboursera vos frais de santé quand vous vous en servirez. \n\n Une fois un soin fait, patientez que la mutuelle traite celle-ci. \n\n Ce choix est valide en permanence puisque sauvegardé. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",le_nom_de_larticle];
};
if((lbCurSel 11121) == 4) then
{
	le_nom_de_larticle = "remboursement des frais de soins à hauteur de 100 pour cent sur la totalité de votre facture";
	le_prix_de_larticle = 500;
	if((player getVariable "ma_mutuelle_niveau_cent_pour_cent") >= 1) exitwith {hint "! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous possèdez déjà ce pourcentage de remboursement ! \n\n Choisissez une autre offre. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if((player getVariable "mon_argent_banque_by_sfp_maxou") < le_prix_de_larticle) exitwith {Hint format ["Désolé, vous avez %1 Euros et besoin de %2 Euros.",(player getVariable 'mon_argent_banque_by_sfp_maxou'),(le_prix_de_larticle)];};
	player setVariable["ma_mutuelle_niveau_10_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_vingt_cinq_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cinquante_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_soixante_quinze_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cent_pour_cent",1,false];sleep 0.000045;
	closeDialog 0;
	player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable 'mon_argent_banque_by_sfp_maxou') - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez de souscrire à la mutuelle ALTIS avec une offre de %1. \n\n Cette mutuelle vous remboursera vos frais de santé quand vous vous en servirez. \n\n Une fois un soin fait, patientez que la mutuelle traite celle-ci. \n\n Ce choix est valide en permanence puisque sauvegardé. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",le_nom_de_larticle];
};
if((lbCurSel 11121) == 5) then
{
	player setVariable["ma_mutuelle_niveau_10_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_vingt_cinq_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cinquante_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_soixante_quinze_pour_cent",0,false];sleep 0.000045;
	player setVariable["ma_mutuelle_niveau_cent_pour_cent",0,false];sleep 0.000045;
	closeDialog 0;
	hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Nous vous confirmons la suppression de votre contrat. \n\n Vous n'aurez plus rien à nous régler. \n\n Ce choix est valide en permanence puisque sauvegardé. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",le_nom_de_larticle];
};

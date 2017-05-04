// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "jesuismalade") then {jesuismalade = 0;};
if (jesuismalade >= 1) then
{
	le_prix_de_larticle = 420;
	player setVariable["mon_argent_banque_by_sfp_maxou",(player getVariable "mon_argent_banque_by_sfp_maxou") - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";	
	if (!isnil {player getvariable "je_suis_malade_a_la_sauvegarde"}) then {player setVariable["je_suis_malade_a_la_sauvegarde",nil,true];};
	hint "Aie Aie Aie, sortons les gants !! C'est deguelasse :) \n\n Ne bouge plus, je vais te soigner ...";
	sleep 7;
	hint format ["Bon bon bon, j'ai trouvé d'ou vient ce petit soucis occulaire ! \n\n Cette opération va te couter %1 Euros !",le_prix_de_larticle];
	sleep 7;
	if (!isnil "ppColor") then {ppEffectDestroy ppColor;};
	if (!isnil "ppBlur") then {ppEffectDestroy ppBlur;};
	if (!isnil "ppInversion") then {ppEffectDestroy ppInversion;};
	if (!isnil "ppGrain") then {ppEffectDestroy ppGrain;};
	if (!isnil "nonapsi_ef") then {ppEffectDestroy nonapsi_ef;};
	if (!isnil "nonapsi_ef2") then {ppEffectDestroy nonapsi_ef2;};
	if (!isnil "hndl") then {ppEffectDestroy hndl;};
	if (!isnil "snow") then {deletevehicle snow;};
	if (!isnil "ps") then {deletevehicle ps;};
	if (!isnil "ppe") then {ppEffectDestroy ppe;};
	if (!isnil "ppe2") then {ppEffectDestroy ppe2;};
	if (!isnil "ppe3") then {ppEffectDestroy ppe3;};
	if (!isnil "wetdist1") then {ppEffectDestroy wetdist1;};
	setaperture 0;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 16;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit 0;
	"wetDistortion" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
	"wetDistortion" ppEffectCommit 0;
	jesuismalade = 0;
	tempsavantmort = 0;
	sleep 2;
	hint "Te voila de nouveau sur pied ! :) \n\n Ca fait plaisir ;)";
	
	// Mutuelle
	sleep (100 + (random 100));
	le_nom_de_larticle = "la maladie de vos yeux";
	le_prix_de_larticle = 420;
	
	if ((player getVariable "ma_mutuelle_niveau_10_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 10;};
	if ((player getVariable "ma_mutuelle_niveau_vingt_cinq_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 25;}; 
	if ((player getVariable "ma_mutuelle_niveau_cinquante_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 50;};
	if ((player getVariable "ma_mutuelle_niveau_soixante_quinze_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 75;}; 
	if ((player getVariable "ma_mutuelle_niveau_cent_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle;}; 
	if (!(isnil "taux_de_remboursement_mutuelle")) then {player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') + taux_de_remboursement_mutuelle,true];}; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	if (!(isnil "taux_de_remboursement_mutuelle")) then {hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez d'être remboursé de %1 Euros concernant %2 trouvé dernièrement. \n\n La mutuelle vous à versée directement cet argent sur votre compte bancaire. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",taux_de_remboursement_mutuelle,le_nom_de_larticle];taux_de_remboursement_mutuelle = nil;};	
}else
{
	Hint "Tu n'es pas malade, estime toi heureux :)";
};
// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {alive player};
waitUntil {!isnil "fin_verification_apres_chargement"};

if (!isnil {player getvariable "je_suis_malade_a_la_sauvegarde"}) then
{
	player setVariable["je_suis_malade_a_la_sauvegarde",nil,true];
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
};
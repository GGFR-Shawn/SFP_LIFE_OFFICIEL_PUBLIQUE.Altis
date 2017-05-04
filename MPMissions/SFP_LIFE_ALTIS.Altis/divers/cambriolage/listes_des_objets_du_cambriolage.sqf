// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};

_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
player addweapon "hgun_Pistol_heavy_01_F";
player addMagazine "11Rnd_45ACP_Mag";
jairecupererunearme = format ["<t color='#0FC702' size='1'>Un 4-five.<br/>"];
}else {jairecupererunearme = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
player addweapon "SMG_02_F";
player addMagazine "30Rnd_9x21_Mag";
jairecupererunemitraillette = format ["<t color='#0FC702' size='1'>Une Sting.<br/>"];
}else {jairecupererunemitraillette = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
player addBackpack "G_AssaultPack";
jairecupererunsacados = format ["<t color='#0FC702' size='1'>Un sac à dos.<br/>"];
}else {jairecupererunsacados = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
_combiendebarre = (1 + (ceil (random 4)));
_espacerestant = (player getVariable "usedspace");
_totaldeuxdeux = ((_espacerestant) + (1 * _combiendebarre));
if (_totaldeuxdeux < (player getVariable "totalspace")) then
{
	while {_combiendebarre > 0} do
	{
		player setVariable ["barredecereale", (player getVariable "barredecereale") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 1,true];
		_combiendebarre = _combiendebarre - 1;
		sleep 0.045;
	};
	jairecupererunebarredecereale = format ["<t color='#0FC702' size='1'>Des barres de céréales.<br/>"];
};
}else {jairecupererunebarredecereale = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
_combiendebouteilledeau = (1 + (ceil (random 4)));
_espacerestant = (player getVariable "usedspace");
_totaldeuxdeux = ((_espacerestant) + (2 * _combiendebouteilledeau));
if (_totaldeuxdeux < (player getVariable "totalspace")) then
{
	while {_combiendebouteilledeau > 0} do
	{
		player setVariable ["bouteilledeau", (player getVariable "bouteilledeau") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 2,true];
		_combiendebouteilledeau = _combiendebouteilledeau - 1;
		sleep 0.045;
	};
jairecupererdesbouteillesdeau = format ["<t color='#0FC702' size='1'>Des bouteilles d'eau.<br/>"];
};
}else {jairecupererdesbouteillesdeau = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
_combienderedbull = (1 + (ceil (random 3)));
_espacerestant = (player getVariable "usedspace");
_totaldeuxdeux = ((_espacerestant) + (1 * _combienderedbull));
if (_totaldeuxdeux < (player getVariable "totalspace")) then
{
	while {_combienderedbull > 0} do
	{
		player setVariable ["redbull", (player getVariable "redbull") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 1,true];
		_combienderedbull = _combienderedbull - 1;
		sleep 0.045;
	};
jairecupererdesredbull = format ["<t color='#0FC702' size='1'>Des redbull.<br/>"];
};
}else {jairecupererdesredbull = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
_combiendehache = 1;
_espacerestant = (player getVariable "usedspace");
_totaldeuxdeux = ((_espacerestant) + (3 * _combiendehache));
if (_totaldeuxdeux < (player getVariable "totalspace")) then
{
	while {_combiendehache > 0} do
	{
		player setVariable ["hache_pour_coupe_de_bois", (player getVariable "hache_pour_coupe_de_bois") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 3,true];
		_combiendehache = _combiendehache - 1;
		sleep 0.045;
	};
jairecupererunehache = format ["<t color='#0FC702' size='1'>Une hache.<br/>"];
};
}else {jairecupererunehache = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
//
jairecupererunetv = format ["<t color='#0FC702' size='1'>Une TV.<br/>"];
}else {jairecupererunetv = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
//
jairecupererunechainehifi = format ["<t color='#0FC702' size='1'>Une chaine HIFI.<br/>"];
}else {jairecupererunechainehifi = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
//
jairecupereruncanapeencuir = format ["<t color='#0FC702' size='1'>Un canapé en cuir.<br/>"];
}else {jairecupereruncanapeencuir = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
//
jairecupererunetablebasse = format ["<t color='#0FC702' size='1'>Une table basse.<br/>"];
}else {jairecupererunetablebasse = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
//
jairecupereruntelephoneportable = format ["<t color='#0FC702' size='1'>Un téléphone portable.<br/>"];
}else {jairecupereruntelephoneportable = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
//
jairecupererunordinateurportable = format ["<t color='#0FC702' size='1'>Un ordinateur portable.<br/>"];
}else {jairecupererunordinateurportable = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
somme_trouver = round (10 + (random 80000));
player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") + somme_trouver,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
jairecupererdelargent = format ["<t color='#0FC702' size='1'>%1 Euros.<br/>",somme_trouver];
}else {jairecupererdelargent = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
_combiendepoignard = 1;
_espacerestant = (player getVariable "usedspace");
_totaldeuxdeux = ((_espacerestant) + (2 * _combiendepoignard));
if (_totaldeuxdeux < (player getVariable "totalspace")) then
{
	while {_combiendepoignard > 0} do
	{
		player setVariable ["poignard_item", (player getVariable "poignard_item") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 2,true];
		_combiendepoignard = _combiendepoignard - 1;
		sleep 0.045;
	};
jairecupererunpoignard = format ["<t color='#0FC702' size='1'>Un poignard.<br/>"];
};
}else {jairecupererunpoignard = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
_combiendecocktail_molotov = 1;
_espacerestant = (player getVariable "usedspace");
_totaldeuxdeux = ((_espacerestant) + (2 * _combiendecocktail_molotov));
if (_totaldeuxdeux < (player getVariable "totalspace")) then
{
	while {_combiendecocktail_molotov > 0} do
	{
		player setVariable ["cocktail_molotov", (player getVariable "cocktail_molotov") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 2,true];
		_combiendecocktail_molotov = _combiendecocktail_molotov - 1;
		sleep 0.045;
	};
jairecupereruncocktail_molotov = format ["<t color='#0FC702' size='1'>Un Cocktail Molotov.<br/>"];
};
}else {jairecupereruncocktail_molotov = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------
_objetpourcambriolage = [0,1,0,1,0,0,0,1];
_objetpourcambriolage = _objetpourcambriolage call BIS_fnc_selectRandom;
if (_objetpourcambriolage == 1) then {
_combiendebrouilleur = 1;
_espacerestant = (player getVariable "usedspace");
_totaldeuxdeux = ((_espacerestant) + (5 * _combiendebrouilleur));
if (_totaldeuxdeux < (player getVariable "totalspace")) then
{
	while {_combiendebrouilleur > 0} do
	{
		player setVariable ["brouilleur_sacoche_c4", (player getVariable "brouilleur_sacoche_c4") + 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") + 5,true];
		_combiendebrouilleur = _combiendebrouilleur - 1;
		sleep 0.045;
	};
jairecuperer_brouilleur_sacoche_c4 = format ["<t color='#0FC702' size='1'>Un Brouilleur De Sacoche C4.<br/>"];
};
}else {jairecuperer_brouilleur_sacoche_c4 = format [""];};
//----------------------------------------------------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------
_str = parseText format ["
! CAMBRIOLAGE ! <br/> ------------------------------------ <br/>
Lors de votre cambriolage, vous avez récupéré :<br/><br/>
%1
%2
%3
%4
%5
%6
%7
%8
%9
%10
%11
%12
%13
%14
%15
%16
%17
<br/>
<t color='#EEEEEE' size='1'>-----------</t>
<br/>
<t color='#EEEEEE' size='1'>By [SFP] Maxou</t>
<br/>
<t color='#EEEEEE' size='1'>L'unique vrai mod by SFP!</t>
",
jairecupererunearme, //1
jairecupererunemitraillette, //2
jairecupererunsacados, //3
jairecupererunebarredecereale, //4
jairecupererdesbouteillesdeau, //5
jairecupererdesredbull, //6
jairecupererunehache, //7
jairecupererunetv, //8
jairecupererunechainehifi, //9
jairecupereruncanapeencuir, //10
jairecupererunetablebasse, //11
jairecupereruntelephoneportable, //12
jairecupererunordinateurportable, //13
jairecupererdelargent, //14
jairecupererunpoignard, //15
jairecupereruncocktail_molotov, //16
jairecuperer_brouilleur_sacoche_c4 //17
];
hintsilent _str;

//----------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------

if (jairecupererunpoignard == "" && jairecupererdelargent == "" && jairecupererunordinateurportable == "" && jairecupereruntelephoneportable == "" && jairecupererunetablebasse == "" && jairecupereruncanapeencuir == "" && jairecupererunechainehifi == "" && jairecupererunetv == "" && jairecupererunehache == "" && jairecupererdesredbull == "" && jairecupererdesbouteillesdeau == "" && jairecupererunebarredecereale == "" && jairecupererunsacados == "" && jairecupererunearme == "" && jairecupererunemitraillette == "" && jairecupereruncocktail_molotov == "" && jairecuperer_brouilleur_sacoche_c4 == "") then
{
	_str = parseText format ["
	! CAMBRIOLAGE ! <br/> ------------------------------------ <br/>
	Lors de votre cambriolage, aucun objets n'a été dérobés !
	<br/>
	<t color='#EEEEEE' size='1'>-----------</t>
	<br/>
	<t color='#EEEEEE' size='1'>By [SFP] Maxou</t>
	<br/>
	<t color='#EEEEEE' size='1'>L'unique vrai mod by SFP!</t>
	",
		jairecupererunemitraillette
	];
	hintsilent _str;
};
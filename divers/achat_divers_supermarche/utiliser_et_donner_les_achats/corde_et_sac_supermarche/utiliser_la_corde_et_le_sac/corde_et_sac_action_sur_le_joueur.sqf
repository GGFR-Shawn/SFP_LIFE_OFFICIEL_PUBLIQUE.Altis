// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_j_ai_un_gps";
_qui_ma_mit_le_sac_sur_la_tete = _this select 0;

noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 47) then {true}"];

execvm "divers\achat_divers_supermarche\utiliser_et_donner_les_achats\corde_et_sac_supermarche\utiliser_la_corde_et_le_sac\enlever_sac_auto_si_toujours.sqf";

player setVariable ["jai_un_sac_sur_la_tete",true,true];
[player] join grpNull;

if ("ItemGPS" in assignedItems player) then 
{
	player unassignItem "ItemMap";
	player removeitem "ItemMap";
	player unassignItem "ItemGPS";
	player removeitem "ItemGPS";
	_j_ai_un_gps = true;
};



effet_quand_sac_sur_la_tete_maxou = ppEffectCreate ["ColorCorrections", 200];
effet_quand_sac_sur_la_tete_maxou ppEffectEnable true;
_valeur_random_de_l_effet = ((random 10) / 10);
effet_quand_sac_sur_la_tete_maxou ppEffectAdjust [_valeur_random_de_l_effet, _valeur_random_de_l_effet, _valeur_random_de_l_effet, [0,0,0,0.99], [0,0,0,0.9], [0,0,0,0.9]];
effet_quand_sac_sur_la_tete_maxou ppEffectCommit 2;

sleep 2;
hint format ["! SAC ET CORDE ! \n -------------------------------------------- \n \n %1 vous à mit un sac sur la tête. \n\n Tu ne peux donc plus voir (que très peu) et bouger ! \n\n Par ailleur, si vous êtiez groupé, vous avez été automatiquement kické ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name _qui_ma_mit_le_sac_sur_la_tete];

while {alive player && !isnil {player getvariable "jai_un_sac_sur_la_tete"}} do
{
	if (visibleMap) then {openMap [false, false];};
	sleep 0.02;
	player playMove "AmovPercMstpSnonWnonDnon_Ease";
	if (driver vehicle player == player) then {player action ["Eject", vehicle player];};
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || (isnil {player getvariable "jai_un_sac_sur_la_tete"})};
};


if (!isnil "effet_quand_sac_sur_la_tete_maxou") then {ppEffectDestroy effet_quand_sac_sur_la_tete_maxou;};
if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) then {player setVariable ["jai_un_sac_sur_la_tete",nil,true];};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];

if (alive player) then 
{
	hint "Vos sac vient d'être enlevé de votre tête ! Appuyer sur V pour re bouger.";
	
	if (!isnil "_j_ai_un_gps") then
	{
		player addItem "itemgps";
		player assignitem "itemgps";
		player addItem "ItemMap";
		player assignitem "ItemMap";
	};
};


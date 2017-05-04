// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_position_de_la_gendarmerie";
_le_delinquant = _this select 0;
_le_gendarme = _this select 1;
_position_de_la_gendarmerie = _this select 2;

player globalChat format["%1 à été mit en garde à vue par le gendarme %2 %3.",(name _le_delinquant),(name _le_gendarme), _position_de_la_gendarmerie];
if (player != _le_delinquant) exitwith {};

sleep 0.5;
player playMove "";

["Jail",["ARRESTED!", "Tu es placé en garde à vue !"]] call bis_fnc_showNotification;

removeAllWeapons player;
removeheadgear player;

if (!isnil "joueur_en_prison") then {joueur_en_prison = nil;};
if (!isnil {player getvariable "joueur_menotte"}) then {player setVariable["joueur_menotte",nil,true];};
if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) then {player setVariable["jai_un_sac_sur_la_tete",nil,true];};
if (!isnil {player getvariable "bombe_porte_prison"}) then {player setVariable["bombe_porte_prison",nil,true];};
if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then {player setVariable["jai_fait_un_cambriolage_news",nil,true];};
if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {player setVariable["recherche_pour_armes_illegales",nil,true];};
if (!isnil {player getvariable "recherche_pour_braquage"}) then {player setVariable["recherche_pour_braquage",nil,true];};
if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {player setVariable["recherche_pour_conduite_sans_permis",nil,true];};
if (isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",true,true];};
if (player getvariable "evade_de_prison" > 0) then {player setVariable["evade_de_prison",0,false];};

jai_le_droit_de_me_tp = 1; 

if (_position_de_la_gendarmerie == "à Neochori") then {player setPos [18137.9,15201.4,0];};

if (!isnil "noesckey") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};

player execVM "divers\gendarmerie\garde_a_vue\remettre_en_garde_a_vue_si_sort.sqf";

_temps_max_sortie_automatique = 320; // Secondes
while {!isnil {player getvariable "joueur_arreter"} && _temps_max_sortie_automatique > 0} do
{
	titleText [format["Encore %1 secondes avant de sortie de garde a vue automatiquement !", _temps_max_sortie_automatique], "PLAIN DOWN"];
	_temps_max_sortie_automatique = round (_temps_max_sortie_automatique - 2);
	sleep 2;
};

if (_temps_max_sortie_automatique <= 0) then
{
	["Jail",["Free to go!", "Tu es sortie de garde à vue automatiquement ! "]] call bis_fnc_showNotification;
	jai_le_droit_de_me_tp = 1; 
	if (_position_de_la_gendarmerie == "à Neochori") then {player setPos [18156,15203.6,0];};
	if (!isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",nil,true];};
};
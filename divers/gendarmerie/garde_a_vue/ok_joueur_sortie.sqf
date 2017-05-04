// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nomdujoueur = _this select 0;
_position_sortie_de_garde_a_vue = _this select 1;
if (isnil "_nomdujoueur" or isnil "_position_sortie_de_garde_a_vue") exitwith {};
if (name player != _nomdujoueur) exitwith {};


jai_le_droit_de_me_tp = 1; 
player setPosATL _position_sortie_de_garde_a_vue;

if (!isnil "joueur_en_prison") then {joueur_en_prison = nil;};
if (!isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",nil,true];};
if (player getvariable "evade_de_prison" > 0) then {player setVariable["evade_de_prison",0,false];};
if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) then {player setVariable["jai_un_sac_sur_la_tete",nil,true];};
if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then {player setVariable["jai_fait_un_cambriolage_news",nil,true];};
if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {player setVariable["recherche_pour_armes_illegales",nil,true];};
if (!isnil {player getvariable "recherche_pour_braquage"}) then {player setVariable["recherche_pour_braquage",nil,true];};
if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {player setVariable["recherche_pour_conduite_sans_permis",nil,true];};

removeAllWeapons player;

if (!isnil "noesckey") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};

hint "Un gendarme ta sortit de ta garde à vue !";

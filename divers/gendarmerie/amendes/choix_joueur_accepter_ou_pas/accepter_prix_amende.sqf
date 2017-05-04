// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeydeux];
closedialog 0;

if (isnil "accepter_amende_obligatoire") then {accepter_amende_obligatoire = 0};

if (accepter_amende_obligatoire < 3) then {j_accepte_de_payer_l_amende = 1;publicvariable "j_accepte_de_payer_l_amende";};
if (accepter_amende_obligatoire >= 3) then {j_accepte_de_payer_l_amende = 3;publicvariable "j_accepte_de_payer_l_amende";};

[[[],"divers\gendarmerie\amendes\choix_joueur_accepter_ou_pas\avertir_tout_le_monde_amende.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then {player setVariable["jai_fait_un_cambriolage_news",nil,true];};
if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {player setVariable["recherche_pour_armes_illegales",nil,true];};
if (!isnil {player getvariable "recherche_pour_braquage"}) then {player setVariable["recherche_pour_braquage",nil,true];};
if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {player setVariable["recherche_pour_conduite_sans_permis",nil,true];};

accepter_amende_obligatoire = 0;

player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - montantdelamende,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

[[[player, montantdelamende],"divers\gendarmerie\amendes\pourcentage_envoye_au_gendarmes.sqf"],"BIS_fnc_execVM",west,false] spawn BIS_fnc_MP;

// =======================================================================================================================================================================================
										// Mettre a jour le compte de la gendarmerie !! //
// =======================================================================================================================================================================================
if (isnil "argent_de_la_gendarmerie") exitwith {};

_pourcentage = sfp_config_pourcentage_amende_coffre_gendarmerie;
_calcul = round ((montantdelamende / 100) * _pourcentage);

argent_de_la_gendarmerie = [argent_de_la_gendarmerie select 0, round ((argent_de_la_gendarmerie select 1) + _calcul)];
publicvariable "argent_de_la_gendarmerie";



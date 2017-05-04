// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = _this select 3 select 0;
if (isnil "_condition") exitwith {hint "Aucune valeur trouvée ...";};
if (_condition != "1" && _condition != "2") exitwith {hint "Aucune valeur trouvée ...";};
if (isnil "je_vends_au_marche_noir_protection") then {je_vends_au_marche_noir_protection = 0;};
if (je_vends_au_marche_noir_protection >= 1) exitwith {hint "! Opération Impossible ! \n\n Une vente est déjà en cours !";};


cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Nouveau_Menu_Vendre_Farming";

_execution_mise_a_jour = execvm "menu\nouveau_menu_vendre_au_marche\configuration_du_farming_pour_vendre.sqf";
waitUntil {scriptDone _execution_mise_a_jour;};

listes_des_farming_du_marche = nil;
if (_condition == "1") then {listes_des_farming_du_marche = listes_des_farming_du_marche_legal;};
if (_condition == "2") then {listes_des_farming_du_marche = listes_des_farming_du_marche_illegal;};
if (isnil "listes_des_farming_du_marche") exitwith {hint "Aucune valeur trouvée ...";};
	
createDialog _nom_du_menu;
disableSerialization;

execvm "menu\nouveau_menu_vendre_au_marche\mise_a_jour_informations_farming_marche.sqf";

waituntil {!dialog;};
cutText["","BLACK IN"];
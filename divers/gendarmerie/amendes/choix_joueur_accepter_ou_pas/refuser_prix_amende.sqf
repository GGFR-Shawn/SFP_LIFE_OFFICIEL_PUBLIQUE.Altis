// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "accepter_amende_obligatoire") then {accepter_amende_obligatoire = 0};

accepter_amende_obligatoire = accepter_amende_obligatoire + 1;
if (accepter_amende_obligatoire >= 3) exitwith {j_accepte_de_payer_l_amende = 3; sleep 0.01; publicvariable "j_accepte_de_payer_l_amende"; hint "Désolé, tu as refusé trop d'amende et tu dois donc la payer obligatoirement !"; execvm "divers\gendarmerie\amendes\choix_joueur_accepter_ou_pas\accepter_prix_amende.sqf";};

j_accepte_de_payer_l_amende = 2;
publicvariable "j_accepte_de_payer_l_amende";

(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeydeux];
closedialog 0;

[[[],"divers\gendarmerie\amendes\choix_joueur_accepter_ou_pas\avertir_tout_le_monde_amende.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "argent_de_la_gendarmerie") exitwith {hint "! ARGENT GENDARMERIE ! \n --------------------------------------  \n\n Impossible, la variable est inconnu ... \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou";};
if !(name player in (argent_de_la_gendarmerie select 0)) exitwith {hint "! ARGENT GENDARMERIE ! \n --------------------------------------  \n\n Impossible, vous n'etes pas autorisé à toucher à cette argent ! \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Argent_De_La_Gendarmerie";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (argent_de_la_gendarmerie select 1 <= 0) then {couleur_banque = _couleur_rouge;}else{couleur_banque = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor couleur_banque;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetText format ["%1 €", (argent_de_la_gendarmerie select 1) call retour_formatage_chiffre_sfp];

_description = format ["
						Bonjour %1,
						<br/>
						<br/>
						Cet espace sert <t color='#FF0000'>exclusivement</t> à payer :
						<br/>
						<br/>
						- Rançon, event, otages, etc ...
						<br/>
						<br/>
						Fait s'en bon usage ! ;)
					   ",
					   name player
					  ];				
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetStructuredText parseText _description;

waituntil {!dialog;};
cutText["","BLACK IN"];
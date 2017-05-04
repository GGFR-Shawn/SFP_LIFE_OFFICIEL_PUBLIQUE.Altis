// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Effets_Des_Drogues";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1004;
_message_explication = 1122;
_image_cocaine = 1600;
_image_heroine = 1602;
_image_cannabis = 1601;
_image_medicaments = 1603;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

_description = "
					Voici les différents effets des drogues :
					<br/>
					<br/>
					- La cocaine agit sur le temps du farming.
					<br/>
					- L'Heroine coupe la faim et la soif.
					<br/>
					- Le cannabis vous coupe le sommeil.
					<br/>
					- Les médicaments agissent sur le temps de regénération de votre vie.
					<br/>
					<br/>
					N'abusez pas trop ! ;)
				";				

				
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_rouge;
((uiNamespace getVariable _nom_du_menu) displayCtrl _message_explication) ctrlSetStructuredText parseText _description;

// Cocaine
((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_cocaine) ctrlSetStructuredText parseText "<img size='9' image='textures\icones\drogues\drogue_cocaine.paa'/>";
if (player getvariable "item_cocaine_poudre_sfp" >= 10) then
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_cocaine) ctrlAddEventHandler ["ButtonClick", {execvm "divers\effet_des_drogues_soif_etc\activer_l_effet_de_drogue\effet_de_la_cocaine_sur_le_travail\utiliser_effet_cocaine.sqf"}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_cocaine) ctrlAddEventHandler ["ButtonClick", {hint "Vous n'avez pas de cocaine ..."; systemchat "Vous n'avez pas de cocaine ...";}];
};

// Heroine
((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_heroine) ctrlSetStructuredText parseText "<img size='9' image='textures\icones\drogues\drogue_heroine.paa'/>";
if (player getvariable "item_heroine_traite_sfp" >= 10) then
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_heroine) ctrlAddEventHandler ["ButtonClick", {execvm "divers\effet_des_drogues_soif_etc\activer_l_effet_de_drogue\effet_de_la_cocaine_sur_le_travail\utiliser_effet_heroine.sqf"}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_heroine) ctrlAddEventHandler ["ButtonClick", {hint "Vous n'avez pas d'heroine ..."; systemchat "Vous n'avez pas d'heroine ...";}];
};

// Cannabis
((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_cannabis) ctrlSetStructuredText parseText "<img size='9' image='textures\icones\drogues\drogue_cannabis.paa'/>";
if (player getvariable "item_cannabis_traite_sfp" >= 1) then
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_cannabis) ctrlAddEventHandler ["ButtonClick", {execvm "divers\effet_des_drogues_soif_etc\activer_l_effet_de_drogue\effet_de_la_cocaine_sur_le_travail\utiliser_effet_cannabis.sqf"}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_cannabis) ctrlAddEventHandler ["ButtonClick", {hint "Vous n'avez pas de cannabis ..."; systemchat "Vous n'avez pas de cannabis ...";}];
};


// Medicaments
((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_medicaments) ctrlSetStructuredText parseText "<img size='9' image='textures\icones\drogues\drogue_medicaments.paa'/>";
if (player getvariable "item_medicaments_sfp" >= 35) then
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_medicaments) ctrlAddEventHandler ["ButtonClick", {execvm "divers\effet_des_drogues_soif_etc\activer_l_effet_de_drogue\effet_de_la_cocaine_sur_le_travail\utiliser_effet_medicaments.sqf"}];
}else
{
	((uiNameSpace getVariable _nom_du_menu) displayCtrl _image_medicaments) ctrlAddEventHandler ["ButtonClick", {hint "Vous n'avez pas de medicaments ..."; systemchat "Vous n'avez pas de medicaments ...";}];
};


waituntil {!dialog;};
cutText["","BLACK IN"];

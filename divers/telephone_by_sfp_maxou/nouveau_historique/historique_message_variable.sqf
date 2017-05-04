// =======================================================================================================================================================================================
												// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
												  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


// ============================================================================================================================================================
																// PROTECTION ERREUR
// ============================================================================================================================================================
_valeur_du_message = _this select 0;
_valeur_envoyeur_du_message = _this select 1;
_valeur_destinataire_du_message = _this select 2;

if (isnil "_valeur_du_message") exitwith {};
if (isnil "_valeur_envoyeur_du_message") exitwith {};
if (isnil "_valeur_destinataire_du_message") exitwith {};

// ============================================================================================================================================================
																// INITIALISATION
// ============================================================================================================================================================
if (isnil "historique_messages_nom_joueur_by_maxou") then {historique_messages_nom_joueur_by_maxou = [];};

if (isnil "nombre_message_dans_mon_historique") then {nombre_message_dans_mon_historique = -1;};
if (nombre_message_dans_mon_historique >= 60) exitwith {player globalchat "Votre historique du chat est plein, Supprimer des messages !";};


if (_valeur_destinataire_du_message == "lemessage") then {le_message_recu_un = format ["%1H%2 : %3.", heure_serveur select 3, heure_serveur select 4, _valeur_du_message];};

if (_valeur_destinataire_du_message == "lemessageatoutcivil") then {nom_dans_le_tableau = "Aux Civils"; le_message_recu_un = format ["%1H%2 de %3: %4.", heure_serveur select 3, heure_serveur select 4, _valeur_envoyeur_du_message, _valeur_du_message];};
if (_valeur_destinataire_du_message == "lemessageatoutgendarmes") then {nom_dans_le_tableau = "Aux Gendarmes"; le_message_recu_un = format ["%1H%2 de %3: %4.", heure_serveur  select 3, heure_serveur select 4, _valeur_envoyeur_du_message, _valeur_du_message];};
if (_valeur_destinataire_du_message == "lemessageauxpompiers") then {nom_dans_le_tableau = "Aux Pompiers"; le_message_recu_un = format ["%1H%2 de %3: %4.", heure_serveur  select 3, heure_serveur select 4, _valeur_envoyeur_du_message, _valeur_du_message];};
if (_valeur_destinataire_du_message == "lemessageaudepanneur") then {nom_dans_le_tableau = "Aux Depanneurs"; le_message_recu_un = format ["%1H%2 de %3: %4.", heure_serveur  select 3, heure_serveur select 4, _valeur_envoyeur_du_message, _valeur_du_message];};
if (_valeur_destinataire_du_message == "lemessageaneomedia") then {nom_dans_le_tableau = "A NéoMédia"; le_message_recu_un = format ["%1H%2 de %3: %4.", heure_serveur  select 3, heure_serveur select 4, _valeur_envoyeur_du_message, _valeur_du_message];};
if (_valeur_destinataire_du_message == "lemessageautaxi") then {nom_dans_le_tableau = "Aux Taxis"; le_message_recu_un = format ["%1H%2 de %3: %4.", heure_serveur  select 3, heure_serveur select 4, _valeur_envoyeur_du_message, _valeur_du_message];};

// ============================================================================================================================================================
											// RECHERCHE NOM DEJA PRESENT ET ACTION SUR MESSAGE PERSONNEL
// ============================================================================================================================================================
// Message Personnel
if (_valeur_destinataire_du_message == "lemessage") then
{
	valeur_du_tableau = nil;

	// Si existant
	for "_i" from 0 to (count historique_messages_nom_joueur_by_maxou - 1) do
	{
		if (historique_messages_nom_joueur_by_maxou select _i select 0 == _valeur_envoyeur_du_message) then
		{
			valeur_du_tableau = _i;
			[historique_messages_nom_joueur_by_maxou select _i, le_message_recu_un] call BIS_fnc_arrayPush;
			
			nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique + 1);
		};
	};
	// Si Inexistant
	if (isnil "valeur_du_tableau") then
	{
		if (historique_messages_nom_joueur_by_maxou select 0 select 0 == "Aucun message reçu") then
		{
			[historique_messages_nom_joueur_by_maxou, "Aucun message reçu"] call BIS_fnc_removeNestedElement;
		
			[historique_messages_nom_joueur_by_maxou select 0, _valeur_envoyeur_du_message] call BIS_fnc_arrayPush;
			[historique_messages_nom_joueur_by_maxou select 0, le_message_recu_un] call BIS_fnc_arrayPush;
			
			nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique - 2);
			nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique + 1);
		}else
		{
			[historique_messages_nom_joueur_by_maxou, [_valeur_envoyeur_du_message]] call BIS_fnc_arrayPush;
			[historique_messages_nom_joueur_by_maxou select (count historique_messages_nom_joueur_by_maxou - 1), le_message_recu_un] call BIS_fnc_arrayPush;
		
			nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique + 1);		
		};
	};
};

// ============================================================================================================================================================
											// RECHERCHE NOM DEJA PRESENT ET ACTION SUR ENTREPRISE ETC
// ============================================================================================================================================================
// Message Entreprise
if (_valeur_destinataire_du_message != "lemessage") then
{
	valeur_du_tableau = nil;

	// Si existant
	for "_i" from 0 to (count historique_messages_nom_joueur_by_maxou - 1) do
	{
		if (historique_messages_nom_joueur_by_maxou select _i select 0 == nom_dans_le_tableau) then
		{
			valeur_du_tableau = _i;
			[historique_messages_nom_joueur_by_maxou select _i, le_message_recu_un] call BIS_fnc_arrayPush;
		
			nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique + 1);		
		};
	};
	// Si Inexistant
	if (isnil "valeur_du_tableau") then
	{
		if (historique_messages_nom_joueur_by_maxou select 0 select 0 == "Aucun message reçu") then
		{
			[historique_messages_nom_joueur_by_maxou, "Aucun message reçu"] call BIS_fnc_removeNestedElement;
			[historique_messages_nom_joueur_by_maxou select 0, nom_dans_le_tableau] call BIS_fnc_arrayPush;
		
			nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique + 1);		
		}else
		{
			[historique_messages_nom_joueur_by_maxou, [nom_dans_le_tableau]] call BIS_fnc_arrayPush;
			[historique_messages_nom_joueur_by_maxou select (count historique_messages_nom_joueur_by_maxou - 1), le_message_recu_un] call BIS_fnc_arrayPush;
		
			nombre_message_dans_mon_historique = round (nombre_message_dans_mon_historique + 1);		
		};
	};
};

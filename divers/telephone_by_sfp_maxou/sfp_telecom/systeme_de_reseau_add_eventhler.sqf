// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {sleep 1; !isNil "force_du_signal_telephone_by_maxou"};

nombre_de_sms_recu_personnel_hors_ligne_sfp = 0;
nombre_de_sms_recu_civil_hors_ligne_sfp = 0;

"lemessage" addPublicVariableEventHandler 
{
	if(name player == nomdujoueur && !isnil {player getvariable "je_possede_un_telephone_sfp"}) then 
	{
		if (player getvariable "je_possede_un_telephone_sfp" select 0 >= 1) then
		{
			destinataire_du_message = "lemessage"; 
			
			if (player getvariable "je_possede_un_telephone_sfp" select 1 >= 1 && force_du_signal_telephone_by_maxou >= 1) then
			{
				[lemessage,envoyeurdumessage,destinataire_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf"; 
				_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------------------ <br/><t size='1' color='#8789F1'>MESSAGE PERSONNEL DE :</t><br/><t size='1.07' color='#02E632'>%1.</t><br/><br/><t size='1' color='#8789F1'>POSITION DU MESSAGE :</t><br/><t size='1' color='#02E632'>%2.</t><br/><br/><t size='1' color='#8789F1'>LE MESSAGE :</t><br/><t size='1' color='#02E632'>%3.</t> <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",envoyeurdumessage, ma_position_pour_le_chat, lemessage]; hint _encouleur;
				playSound "son_sms_sfp";
			};
			if (player getvariable "je_possede_un_telephone_sfp" select 1 < 1) then
			{
				[lemessage,envoyeurdumessage,destinataire_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf"; 
				['SMS_Recu_Hors_Ligne',['Nouveau SMS reçu (dispo dans votre historique).']] call bis_fnc_showNotification;
				systemchat "SMS reçu directement dans votre historique SMS puisque votre téléphone est eteint.";
			};
			if (player getvariable "je_possede_un_telephone_sfp" select 1 >= 1 && force_du_signal_telephone_by_maxou < 1) then
			{
				nombre_de_sms_recu_personnel_hors_ligne_sfp = round (nombre_de_sms_recu_personnel_hors_ligne_sfp + 1);
				[] spawn
				{
					if (nombre_de_sms_recu_personnel_hors_ligne_sfp < 2) then
					{					
						waitUntil {sleep 1; force_du_signal_telephone_by_maxou >= 1};
						['SMS_Recu_Hors_Ligne',['Nouveau SMS reçu (dispo dans votre historique).']] call bis_fnc_showNotification;
						systemchat format ["Vous avez reçu %1 SMS PERSONNEL lorsque votre téléphone ne capter pas.", nombre_de_sms_recu_personnel_hors_ligne_sfp];
					};
				};
								
				[] spawn
				{
					_le_message = lemessage;
					_envoyeur_du_message = envoyeurdumessage;
					_destinateur_du_message = destinataire_du_message;
					_ma_position_pour_le_chat = ma_position_pour_le_chat;
					if (isnil "_le_message" or isnil "_envoyeur_du_message" or isnil "_destinateur_du_message" or isnil "_ma_position_pour_le_chat") exitwith {};
					
					waitUntil {sleep 1; force_du_signal_telephone_by_maxou >= 1};
					
					[_le_message, _envoyeur_du_message, _destinateur_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf"; 
					[] spawn {sleep 5; nombre_de_sms_recu_personnel_hors_ligne_sfp = 0;};
				};
			};
		};
	};
};

if (revive_mon_side == civilian)then
{
	"lemessageatoutcivil" addPublicVariableEventHandler 
	{
		if (!isnil {player getvariable "je_possede_un_telephone_sfp"}) then 
		{
			if (player getvariable "je_possede_un_telephone_sfp" select 1 >= 1 && force_du_signal_telephone_by_maxou >= 1) then 
			{
					destinataire_du_message = "lemessageatoutcivil"; 
					[lemessageatoutcivil,envoyeurdumessage,destinataire_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf"; 
					_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------------------ <br/><t size='1' color='#8789F1'>MESSAGE A TOUS LES CIVILS DE :</t><br/><t size='1.07' color='#02E632'>%1.</t><br/><br/><t size='1' color='#8789F1'>POSITION DU MESSAGE :</t><br/><t size='1' color='#02E632'>%2.</t><br/><br/><t size='1' color='#8789F1'>LE MESSAGE :</t><br/><t size='1' color='#02E632'>%3.</t> <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",envoyeurdumessage, ma_position_pour_le_chat, lemessageatoutcivil]; hint _encouleur;
					playSound "son_sms_sfp";
			};
			if (player getvariable "je_possede_un_telephone_sfp" select 1 >= 1 && force_du_signal_telephone_by_maxou < 1) then 
			{
				nombre_de_sms_recu_civil_hors_ligne_sfp = round (nombre_de_sms_recu_civil_hors_ligne_sfp + 1);
				[] spawn
				{
					if (nombre_de_sms_recu_civil_hors_ligne_sfp < 2) then
					{					
						waitUntil {sleep 1; force_du_signal_telephone_by_maxou >= 1};
						['SMS_Recu_Hors_Ligne',['Nouveau SMS CIVILS (dispo dans votre historique).']] call bis_fnc_showNotification;
						systemchat format ["Vous avez reçu %1 SMS A TOUT LES CIVILS lorsque votre téléphone ne capter pas.", nombre_de_sms_recu_civil_hors_ligne_sfp];
					};
				};
								
				[] spawn
				{
					_le_message = lemessageatoutcivil;
					_envoyeur_du_message = envoyeurdumessage;
					_destinateur_du_message = "lemessageatoutcivil";
					_ma_position_pour_le_chat = ma_position_pour_le_chat;
					if (isnil "_le_message" or isnil "_envoyeur_du_message" or isnil "_destinateur_du_message" or isnil "_ma_position_pour_le_chat") exitwith {};
					
					waitUntil {sleep 1; force_du_signal_telephone_by_maxou >= 1};
					
					[_le_message, _envoyeur_du_message, _destinateur_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf"; 
					[] spawn {sleep 5; nombre_de_sms_recu_civil_hors_ligne_sfp = 0;};
				};
			};
		};
	};
};

if (revive_mon_side == west)then
{
	"lemessageatoutgendarmes" addPublicVariableEventHandler 
	{
		if (!isnil {player getvariable "je_possede_un_telephone_sfp"}) then 
		{
			if (force_du_signal_telephone_by_maxou >= 1) then
			{
				destinataire_du_message = "lemessageatoutgendarmes"; 
				[lemessageatoutgendarmes,envoyeurdumessage,destinataire_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf";
				_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------------------ <br/><t size='1' color='#8789F1'>MESSAGE A TOUS LES GENDARMES DE :</t><br/><t size='1.07' color='#02E632'>%1.</t><br/><br/><t size='1' color='#8789F1'>POSITION DU MESSAGE :</t><br/><t size='1' color='#02E632'>%2.</t><br/><br/><t size='1' color='#8789F1'>LE MESSAGE :</t><br/><t size='1' color='#02E632'>%3.</t> <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",envoyeurdumessage, ma_position_pour_le_chat, lemessageatoutgendarmes]; hint _encouleur;
				playSound "son_sms_sfp";
			}else
			{
				systemchat "Un sms destiné à tous les gendarmes n'a pas été reçu car vous ne captez pas à cette endroit !";
			};
		};
	};
};

"lemessageauxpompiers" addPublicVariableEventHandler 
{
	if (!isnil "jesuis_au_taff_a_la_sarl_pompier")then
	{
		if (!isnil {player getvariable "je_possede_un_telephone_sfp"}) then 
		{
			if (force_du_signal_telephone_by_maxou >= 1) then
			{
				destinataire_du_message = "lemessageauxpompiers"; 
				[lemessageauxpompiers,envoyeurdumessage,destinataire_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf";
				_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------------------ <br/><t size='1' color='#8789F1'>MESSAGE AUX POMPIERS DE :</t><br/><t size='1.07' color='#02E632'>%1.</t><br/><br/><t size='1' color='#8789F1'>POSITION DU MESSAGE :</t><br/><t size='1' color='#02E632'>%2.</t><br/><br/><t size='1' color='#8789F1'>LE MESSAGE :</t><br/><t size='1' color='#02E632'>%3.</t> <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",envoyeurdumessage, ma_position_pour_le_chat, lemessageauxpompiers]; hint _encouleur;
				playSound "son_sms_sfp";
			}else
			{
				systemchat "Un sms destiné à tous les pompiers n'a pas été reçu car vous ne captez pas à cette endroit !";
			};
		};
	};
};

"lemessageaudepanneur" addPublicVariableEventHandler 
{
	if(je_suis_en_service_a_la_sarl_depannage >= 1)then
	{
		if (!isnil {player getvariable "je_possede_un_telephone_sfp"}) then 
		{
			if (force_du_signal_telephone_by_maxou >= 1) then
			{
				destinataire_du_message = "lemessageaudepanneur";
				[lemessageaudepanneur,envoyeurdumessage,destinataire_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf";
				_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------------------ <br/><t size='1' color='#8789F1'>MESSAGE AUX DEPANNEURS DE :</t><br/><t size='1.07' color='#02E632'>%1.</t><br/><br/><t size='1' color='#8789F1'>POSITION DU MESSAGE :</t><br/><t size='1' color='#02E632'>%2.</t><br/><br/><t size='1' color='#8789F1'>LE MESSAGE :</t><br/><t size='1' color='#02E632'>%3.</t> <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",envoyeurdumessage, ma_position_pour_le_chat, lemessageaudepanneur]; hint _encouleur;
				playSound "son_sms_sfp";
			}else
			{
				systemchat "Un sms destiné à tous les dépanneurs n'a pas été reçu car vous ne captez pas à cette endroit !";
			};
		};
	};
};

"lemessageaneomedia" addPublicVariableEventHandler 
{
	if (!isnil "jesuis_au_taff_a_la_sarl_neomedia")then
	{
		if (!isnil {player getvariable "je_possede_un_telephone_sfp"}) then 
		{
			if (force_du_signal_telephone_by_maxou >= 1) then
			{
				destinataire_du_message = "lemessageaneomedia";
				[lemessageaneomedia,envoyeurdumessage,destinataire_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf";
				_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------------------ <br/><t size='1' color='#8789F1'>MESSAGE A NEOMEDIA DE :</t><br/><t size='1.07' color='#02E632'>%1.</t><br/><br/><t size='1' color='#8789F1'>POSITION DU MESSAGE :</t><br/><t size='1' color='#02E632'>%2.</t><br/><br/><t size='1' color='#8789F1'>LE MESSAGE :</t><br/><t size='1' color='#02E632'>%3.</t> <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",envoyeurdumessage, ma_position_pour_le_chat, lemessageaneomedia]; hint _encouleur;
				playSound "son_sms_sfp";
			}else
			{
				systemchat "Un sms destiné à tous les journalistes n'a pas été reçu car vous ne captez pas à cette endroit !";
			};
		};
	};
};

"lemessageautaxi" addPublicVariableEventHandler 
{
	if(!isnil "jesuis_au_taff_a_la_sarl_taxis_gsept")then
	{
		if (!isnil {player getvariable "je_possede_un_telephone_sfp"}) then 
		{
			if (force_du_signal_telephone_by_maxou >= 1) then
			{
				destinataire_du_message = "lemessageautaxi";
				[lemessageautaxi,envoyeurdumessage,destinataire_du_message] execvm "divers\telephone_by_sfp_maxou\nouveau_historique\historique_message_variable.sqf";
				_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------------------ <br/><t size='1' color='#8789F1'>MESSAGE AUX TAXI G7 :</t><br/><t size='1.07' color='#02E632'>%1.</t><br/><br/><t size='1' color='#8789F1'>POSITION DU MESSAGE :</t><br/><t size='1' color='#02E632'>%2.</t><br/><br/><t size='1' color='#8789F1'>LE MESSAGE :</t><br/><t size='1' color='#02E632'>%3.</t> <br/><br/> --------------------------------------------- <br/> By Maxou <br/> www.sfpteam.fr",envoyeurdumessage, ma_position_pour_le_chat, lemessageautaxi]; hint _encouleur;
				playSound "son_sms_sfp";
			}else
			{
				systemchat "Un sms destiné à tous les taxis n'a pas été reçu car vous ne captez pas à cette endroit !";
			};
		};
	};
};

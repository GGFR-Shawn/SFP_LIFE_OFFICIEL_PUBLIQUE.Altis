// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


createDialog "BankAmende";

ctrlSetText[99999,format["Refus d'obtemperer : 10000 Euros (MAXI)"]];
ctrlSetText[99998,format["Alcoolémie > 0.5 : 200 Euros"]];
ctrlSetText[99997,format["Alcoolémie > 1 : 320 Euros"]];
ctrlSetText[99996,format["Alcoolémie > 2 : 450 Euros"]];
ctrlSetText[99995,format["Alcoolémie > 3 : 600 Euros"]];
ctrlSetText[99994,format["Pas De Casque Quad : 2 Pts et 500 Euros (MAXI)"]];
ctrlSetText[99993,format["Tir Sans Raison : 15000 Euros (MAXI)"]];
ctrlSetText[99992,format["Tue Sans Raison : 30000 Euros (MAXI)"]];
ctrlSetText[99991,format["Autres : 30000 Euros (MAXI)"]];


ctrlSetText[11115,format["Argent en banque : %1 Euros",(cursortarget getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp]];
ctrlSetText[11116,format["Argent en poche : %1 Euros",(cursortarget getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp]];

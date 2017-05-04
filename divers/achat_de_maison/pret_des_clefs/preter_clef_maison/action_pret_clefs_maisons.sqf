// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "la_maison_pour_pret_des_clefs") exitwith {closedialog 0; hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Erreur sur la maison, recommence ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 
if((lbCurSel 1500) == -1) exitwith {Hint "! PRET DE CLEFS ! \n\n Désolé, tu n'as pas selectionné de joueurs ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

_nom_ajout_proprietaire = lbtext [1500, lbCurSel 1500];
if (isnil "_nom_ajout_proprietaire") exitwith {Hint "! PRET DE CLEFS ! \n\n Erreur, recommence ... \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

_nouveau_proprietaire = la_maison_pour_pret_des_clefs getvariable 'proprietaire_de_la_maison';
if (_nom_ajout_proprietaire in _nouveau_proprietaire) exitwith {hint format ["Désolé, %1 à déja les clefs de votre maison !",_nom_ajout_proprietaire];};
_nouveau_proprietaire = _nouveau_proprietaire + [_nom_ajout_proprietaire];

la_maison_pour_pret_des_clefs setvariable ["proprietaire_de_la_maison",_nouveau_proprietaire,true];

[[[la_maison_pour_pret_des_clefs,_nouveau_proprietaire],"divers\achat_de_maison\pret_des_clefs\syncro_JIP_pret_clefs_maisons.sqf"],"BIS_fnc_execVM",true, false] spawn BIS_fnc_MP;

[] spawn {if (isnil "envoi_clefs_maison") then {envoi_clefs_maison = 1; re_scanner_la_maison = la_maison_pour_pret_des_clefs; waituntil {!dialog}; publicvariable "re_scanner_la_maison"; sleep 1; envoi_clefs_maison = nil;};};

_listes_personnes_qui_ont_les_clefs = "";
for "_i" from 1 to (count (cursorTarget getvariable "proprietaire_de_la_maison") - 1) do
{
	_listes_personnes_qui_ont_les_clefs = _listes_personnes_qui_ont_les_clefs + (format ["<br/> %1",cursorTarget getvariable "proprietaire_de_la_maison" select _i]);
};
if (count (cursorTarget getvariable "proprietaire_de_la_maison") < 2) then {_listes_personnes_qui_ont_les_clefs = "<br/> Aucun pret de clef";};

_str = parseText format ["! PRET DE CLEFS ! <br/> ------------------------------------ <br/>Les clefs de ta maison ont bien été prétées à <t color='#07FE62' size='1'>%1 !</t><br/><br/>Liste Prêt Clefs : <br/>%2<br/><t color='#EEEEEE' size='1'><br/>-----------<br/>By [SFP] Maxou<br/>L'unique vrai mod by SFP!</t>",_nom_ajout_proprietaire, _listes_personnes_qui_ont_les_clefs];hintsilent _str;

lbDelete [1500, lbCurSel 1500];

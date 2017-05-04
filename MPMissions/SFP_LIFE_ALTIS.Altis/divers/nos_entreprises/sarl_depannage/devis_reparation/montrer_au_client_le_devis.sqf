// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


_recapitulatif_un = _this select 0;
_recapitulatif_deux = _this select 1;
_recapitulatif_trois = _this select 2;
_recapitulatif_quatre = _this select 3;
_recapitulatif_cinq = _this select 4;
_recapitulatif_six = _this select 5;
_recapitulatif_sept = _this select 6;
_recapitulatif_huit = _this select 7;
_recapitulatif_neuf = _this select 8;
_recapitulatif_dix = _this select 9; 
_recapitulatif_onze = _this select 10; 
_prix_total_reparation = _this select 11;


_str = parseText format ["
! DEVIS SARL DIR ! <br/> ------------------------------------ <br/>
Voici le devis fait par votre dépanneur :<br/><br/>
%1<br/>
%2<br/>
%3<br/>
%4<br/>
%5<br/>
%6<br/>
%7<br/>
%8<br/>
%9<br/>
%10<br/>
%11<br/>
<br/>-----------------------------------------------------<br/>
Calcul du prix total : <t color='#FD0B04'>%12</t> Euros.
<br/>-----------------------------------------------------<br/>
<br/>
<t color='#EEEEEE' size='1'>By [SFP] Maxou</t>
<br/>
<t color='#EEEEEE' size='1'>L'unique vrai mod by SFP!</t>
",
_recapitulatif_un, //1
_recapitulatif_deux, //2
_recapitulatif_trois, //3
_recapitulatif_quatre, //4
_recapitulatif_cinq, //5
_recapitulatif_six, //6
_recapitulatif_sept, //7
_recapitulatif_huit, //8
_recapitulatif_neuf, //9
_recapitulatif_dix, //10
_recapitulatif_onze, //11
_prix_total_reparation //12
];
hintsilent _str;
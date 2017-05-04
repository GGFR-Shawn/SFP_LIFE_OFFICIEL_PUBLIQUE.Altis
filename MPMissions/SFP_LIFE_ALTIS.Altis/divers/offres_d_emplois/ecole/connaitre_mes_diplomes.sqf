// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


_green = "#4CCF00";
_red = "#FF0000";
_black = "#000000";
_moneygreen =  "#B3FFB8";
_moneyred = "#FFB3B3";
_bankgreen =  "#4CCF00";
_bankred = "#FF0000";
_couleurnormal = "#b9b9b9";



if ((player getVariable "license_BEPC") <= 0) then {
licencebepcinv = format ["<t color='#FFB3B3' size='1'>Je n'ai pas le BEPC.  <br/>"];
} else {
licencebepcinv = format ["<t color='#4CCF00' size='1'>J'ai mon BEPC.  <br/>"];
};

if ((player getVariable "license_BAC_PRO") <= 0) then {
licenceBACPROinv = format ["<t color='#FFB3B3' size='1'>Je n'ai pas le BAC PRO.  <br/>"];
} else {
licenceBACPROinv = format ["<t color='#4CCF00' size='1'>J'ai mon BAC PRO.  <br/>"];
};

if ((player getVariable "license_BTS") <= 0) then {
licenceBTSinv = format ["<t color='#FFB3B3' size='1'>Je n'ai pas le BTS.  <br/>"];
} else {
licenceBTSinv = format ["<t color='#4CCF00' size='1'>J'ai mon BTS.  <br/>"];
};

if ((player getVariable "license_BAC_GENERAL") <= 0) then {
licenceBACGENERALinv = format ["<t color='#FFB3B3' size='1'>Je n'ai pas le BAC GENERAL.  <br/>"];
} else {
licenceBACGENERALinv = format ["<t color='#4CCF00' size='1'>J'ai mon BAC GENERAL.  <br/>"];
};

if ((player getVariable "license_DEUG") <= 0) then {
licenceDEUGinv = format ["<t color='#FFB3B3' size='1'>Je n'ai pas le DEUG.  <br/>"];
} else {
licenceDEUGinv = format ["<t color='#4CCF00' size='1'>J'ai mon DEUG.  <br/>"];
};

if ((player getVariable "license_BEP_Mecanique") <= 0) then {
BEPMecaniqueAutoinv = format ["<t color='#FFB3B3' size='1'>Je n'ai pas le BEP Mécanique Auto.  <br/>"];
} else {
BEPMecaniqueAutoinv = format ["<t color='#4CCF00' size='1'>J'ai mon BEP Mécanique Auto.  <br/>"];
};



_str = parseText format ["
<t color='#D9B398' size='1.5'>Mes Diplomes</t>
<br/>
--------------------------------------------------
<br/>
<br/>
%1
%2
%4
%3
%5
%6
<br/>
<t color='#ffffff' >--------------------------------------------------
<br/>
<t color='#EEEEEE' size='1'>www.sfpteam.fr</t>
<br/>
<t color='#EEEEEE' size='1'>-----------</t>
<br/>
<t color='#EEEEEE' size='1'>By [SFP] Maxou</t>
<br/>
<t color='#EEEEEE' size='1'>L'unique vrai mod by SFP!</t>
",
licencebepcinv, //1
licenceBACPROinv, //2
licenceBTSinv, //3
licenceBACGENERALinv, //4
licenceDEUGinv, //5
BEPMecaniqueAutoinv //6
];
hintsilent _str;
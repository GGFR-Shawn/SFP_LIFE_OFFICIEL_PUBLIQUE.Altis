
if (messageexplicationautomaire == 0) then
{
cutText["\n\n Tu es le gouverneur de la ville, n'oublie pas de demander de l'escort au policier lors de tes déplacements dans cette ville non sécurisée !","BLACK FADED",10]; 
sleep 10;
cutText["","BLACK IN",6];
messageexplicationautomaire = 1;
player setVariable["ma_paye_by_sfp_maxou", 3720,false];
player setVariable["mes_aides_caf", 0,false];
};

removeAllHandgunItems mairedelaville; 
removeVest mairedelaville;
removeUniform mairedelaville;
mairedelaville forceAddUniform "U_C_Poloshirt_blue";
removeBackpack mairedelaville;
removeAllItems mairedelaville;
removeAllWeapons mairedelaville;
removeheadgear mairedelaville;
mairedelaville unassignitem "NVGoggles";
sleep 1;
mairedelaville removeItem "NVGoggles"; 



actiondemanderescort = mairedelaville addaction ["<t color=""#0099CC"">" + "Demander Escort Policière", "divers\metiers\maire\mairedemanderescort.sqf", [], 1, false, true, "", ""];

waituntil {sleep 2; (!alive mairedelaville);};

sleep 12;

jai_le_droit_de_me_tp = 1; 
mairedelaville setPos (getmarkerpos "mairie");
mairedelaville removeaction actiondemanderescort;

_handle = player execVM "divers\metiers\maire\maire.sqf";



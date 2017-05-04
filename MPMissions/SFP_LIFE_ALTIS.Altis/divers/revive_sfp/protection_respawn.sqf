//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !

waitUntil {!isNull player};
waitUntil {player == player};
waituntil {!isnil "fin_verification_apres_chargement_pour_revive"};

sleep 1;
hint "Lors de ta deconnection, tu étais mort ! \n\n Tu vas donc de nouveau perdre la vie !";
sleep 4;
player setdamage 1;



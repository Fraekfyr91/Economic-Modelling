*** Opgave 1 ***
* 1.1 Lav et set med de tre lande
Set         lande / USA, EU, Kina /;

*1.2 Lav en parameter, som angiver de tre landes BNP
Parameter   BNP(lande) "BNP i lande" /
            USA 50
            EU 40
            Kina 35/;

*1.3 Beregn verdens samlede BNP            
parameter   total  "Verdens totale BNP";

total = sum(lande, BNP(lande));

Display total;

*Læg BNP for USA og EU sammen
set vesten / USA, EU/;

Parameter   BNP_vest(vesten) "BNP i Vesten" /
            USA 50
            EU 40/;
            
parameter total_vest 'Vestens totale BNP';
total_vest = sum( vesten , BNP_vest(vesten));
Display total_vest;

*1.5 Find det højeste og laveste BNP
parameter max_bnp "højeste BNP i verden";
max_bnp = smax(lande,BNP(lande));

Display max_bnp;
parameter min_bnp 'mindste BNP i verden';
min_bnp = smin(lande,BNP(lande));
Display min_bnp;


*** Opgave 2***
*2.1 Lav et set med de tre lande
*2.2 Lav et set med 10 år
set t "Tids perioder" /1*10/;
*2.3 Lav en parameter, som angiver de tre landes BNP
parameter BNP_t(lande,t);
        BNP_t(lande('USA'),t) = BNP('USA')- (ord(t)-1);
        BNP_t(lande('EU'),t) = BNP('EU')+(0.5*(ord(t)-1));
        BNP_t(lande('Kina'),t) = BNP('Kina')*(1.07**(ord(t)-1));

display BNP_t;

* Beregn verdens samlede BNP for de enkelte år
parameter BNPtotal(t);
BNPtotal(t) = SUM(lande, BNP_t(lande,t));
display BNPtotal;

*Nu fordobles BNP i alle årene efter år 5 for alle lande
*2.5 Beregn det nye BNP for alle lande i alle år
BNP_t(lande,t) $ (ord(t)>5) = BNP_t(lande,t)* 2;
display BNP_t;


***Opgave 3

$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_1\DogBdata.gms

* 3.1 Dan en ny parameter og udregn antal tansaktioner per år
parameter trans(aar);

trans(aar) = sum(maa, Data(Aar,Maa,'tra'))*1000;

display trans;

*3.2 Vis omsætningen i december og i de tre sommermåneder for alle år.
parameter oms_dec(aar);
oms_dec(aar) =  Data(Aar,'M12','Oms')  ;

display oms_dec;

parameter oms_sommer(aar,maa);
oms_sommer(aar,maa) $ ((ord(maa) ge 6) and (ord(maa) le 8)) =  Data(Aar,Maa,'Oms')  ;

display oms_sommer;
*3.3 Udregn omsætningen per dankort for alle måneder og år
parameter Oms_DK(aar,maa);
Oms_DK(aar,maa)= (data(Aar,Maa,'oms')*1000000)/(data(Aar,Maa,'DK')*1000)
display oms_DK
*3.4 Hvad er omsætningen per Dankort, når den er højest
parameter omsDK_max;
omsDK_max = smax((Aar,Maa), Oms_DK(Aar,Maa));
display omsDK_max;

parameter max_aar_mdr;
max_aar_mdr(Aar,Maa)=yes$ (Oms_DK(Aar,Maa)= omsDK_max);
display max_aar_mdr;





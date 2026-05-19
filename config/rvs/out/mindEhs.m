mindEhs
;set $zroutine="/home/vehu/lib/gtm/plugin/etc/mind/uApi*(/home/vehu/lib/gtm/plugin/etc/mind/uApi) "_$zroutine

 ;NAME                     ACCESS    VERIFY    E SIG
 ;    ----                     ------    ------    -----
 ;    PROGRAMMER,ONE           PRO1234   PRO1234!! 123456
 ;    PROVIDER,VERO            CAS123    CAS123..  123456
 ;    PROVIDER,FORTY           PROV40    PROV40!!  123456
 ;    VEHU,TEN                 10VEHU    QXYG~011  123456
 ;    PHARMACIST,EIGHT         PHA1234   PHA1234!! 123456
 ;    LABTECH,ELEVEN           LABT11    LABT11!!  123456
 ;    LABTECH,FIFTEEN          LABT15    LABT15!!  123456
 ;    LABTECH,EIGHT            LAB1234   LAB1234!! 123456
 ;    TDNURSE,ONE              1TDNURSE  BDNURSE1! 123456
 ;    LABTECH,FIFTY            LABT50    LABT50!!  123456
 ;    LABTECH,FIFTYEIGHT       LABT58    LABT58!!  123456
 ;    PROVIDER,FIVE HUNDRED    PRO500    PRO500!!  123456
 ;    PCMM,FOUR                PR12345   PR12345!! 123456
 ;    PROVIDER,EHMP            EHMP123   PREH123!! 123456
 ;    USER,PANORAMA            PU1234    PU1234!!  123456
 ;    XIU,MARGARET             MX1234    MX1234!!  123456
 ;    KHAN,VIHAAN              VK1234    VK1234!!  123456
 ;    KEELEY,TRACY             TK1234    TK1234!!  123456
 ;    DAY,MICHAEL              MD1234    MD1234!!  123456
 ;    ZZZ,ZZZ                  ZZZ001    001XXX!!  123456


login(accessCode,verifyCode)
    new timeBefore,timeAfter
    ;
    set timeBefore=$zut
    set accessCode="PRO1234"
    set verifyCode="PRO1234!!"
    ;
    ; -----------------------------------------
    ; SIGN ON
    ; -----------------------------------------
    set ^TMP($job,"name")="XUS SIGNON SETUP"
    ;
    set ret=$$RPCEXECUTE^VistaRpc("^TMP($job)")
    ;write !,ret
    ;
    ; -----------------------------------------
    ; AV
    ; -----------------------------------------
    kill ^TMP($job)
    set ^TMP($job,"name")="XUS AV CODE"
    set ^TMP($job,"input",1,"type")="LITERAL"
    set ^TMP($job,"input",1,"value")=accessCode_";"_verifyCode
    ;
    set ret=$$RPCEXECUTE^VistaRpc("^TMP($job)")
    ;write !,ret
    ;zwr ^TMP($job,*)
    ;
    ; -----------------------------------------
    ; Get context
    ; -----------------------------------------
    kill ^TMP($job)
    set ^TMP($job,"name")="XWB CREATE CONTEXT"
    set ^TMP($job,"input",1,"type")="LITERAL"
    set ^TMP($job,"input",1,"value")="HMP UI CONTEXT"
    ;
    set ret=$$RPCEXECUTE^VistaRpc("^TMP($job)")
    ;write !,ret
    ;zwr ^TMP($job,*)
    ;
        set timeAfter=$zut

    ;
    ;
    set DIR=1
    kill ^TMP(9999999)
    set ^TMP(9999999,"name")="DDR FINDER"
    set ^TMP(9999999,"input",1,"type")="LIST"
    set ^TMP(9999999,"input",1,"value","FILE")="200"
    set ^TMP(9999999,"input",1,"value","FIELDS")=".01"
    set ^TMP(9999999,"input",1,"value","FLAGS")=""
    set ^TMP(9999999,"input",1,"value","VALUE")="37611"
    set ret=$$RPCEXECUTE^VistaRpc("^TMP(9999999)")
    ;write !,ret
    ;zwr ^TMP(9999999,*)
    merge obj=^TMP(9999999)


    ;
    ;write !,timeAfter-timeBefore


    ;
    quit *obj
    ;
    ;
login2()
    quit 123
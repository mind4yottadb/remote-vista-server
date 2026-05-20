;#################################################################
;#                                                               #
;# Copyright (c) 2026 DnaSoft B.V. and/or its subsidiaries.      #
;# All rights reserved.                                          #
;#                                                               #
;#   This source code contains the intellectual property         #
;#   of its copyright holder(s), and is made available           #
;#   under a license.  If you do not know the terms of           #
;#   the license, please stop and do not read further.           #
;#                                                               #
;#################################################################
;
; ************************************************************
; login(accessCode,verifyCode)
; ************************************************************
; parameters:
; 1 name
; 2 argsByRef
;
; Returns:
; *glvn
;
login(accessCode,verifyCode,context)
    new buffer,res1,res2,res3
    ;
    set *res1=$$callRpc^%mindRvsVistaCaller("XUS SIGNON SETUP",.buffer)
    ;
    kill buffer
    set buffer(1,"type")="LITERAL"
    set buffer(1,"value")=accessCode_";"_verifyCode
    set *res2=$$callRpc^%mindRvsVistaCaller("XUS AV CODE",.buffer)
    ;
    kill buffer
    set buffer(1,"type")="LITERAL"
    set buffer(1,"value")=context
    set *res3=$$callRpc^%mindRvsVistaCaller("XWB CREATE CONTEXT",.buffer)
    ;
    do createEntry^%mindRvsContextManager(%mindGUID)
    ;
    merge buffer(1)=res1
    merge buffer(2)=res2
    merge buffer(3)=res3
    merge buffer(4,"guid")=%mindGUID
    ;
    quit *buffer
    ;
    ;
test(guid)
    new $etrap
    set $etrap="do log^%mindLogger($zstatus)"
    new %mindRvsName set %mindRvsName="^%mindRvs(""sessions"",guid,""vars"")",%mindRvsCnt="" for  set %mindRvsCnt=$order(^%mindRvs("sessions",guid,"vars",%mindRvsCnt)) quit:%mindRvsCnt=""  merge @%mindRvsCnt=@%mindRvsName@(%mindRvsCnt)
    ;
    new io
    set io=$zio
    use %mindParams("logDevice")
    zwr
    use io
    ;
    quit


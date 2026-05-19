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
    set buffer("type")="LITERAL"
    set buffer("value")=accessCode_":"_verifyCode
    set *res2=$$callRpc^%mindRvsVistaCaller("XUS SIGNON SETUP",.buffer)
    ;
    kill buffer
    set buffer("name")="XWB CREATE CONTEXT"
    set buffer("type")="LITERAL"
    set buffer("value")=context
    set *res3=$$callRpc^%mindRvsVistaCaller("XWB CREATE CONTEXT",.buffer)
    ;
    do createEntry^%mindRvsContextManager("","")
    ;
    merge buffer(1)=res1
    merge buffer(2)=res2
    merge buffer(3)=res3
    ;
    quit *buffer
    ;
    ;

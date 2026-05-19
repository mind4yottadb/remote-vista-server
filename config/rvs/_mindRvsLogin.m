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
login(accessCode,verifyCode)
    new buffer,res
    ;
    set *res=$$callRpc^%mindRvsVistaCaller("XUS SIGNON SETUP",.buffer)
    zwr res


    quit
    ;
    ;
; ************************************************************
; loginWithContext(accessCode,verifyCode,context)
; ************************************************************
; parameters:
; 1 name
; 2 argsByRef
;
; Returns:
; *glvn
;
loginWithContext(accessCode,verifyCode,context)



    quit
    ;
    ;

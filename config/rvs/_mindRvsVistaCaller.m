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
; callRpc(name,argsByRef)
; ************************************************************
; parameters:
; 1 name
; 2 argsByRef
;
; Returns:
; *glvn
;
callRpc(name,argsByRef)
    new rpcBuffer,ret
    ;
    set rpcBuffer("name")=name
    merge rpcBuffer("input",1)=argsByRef
    ;
    set rpcBuffer("ret")=$$RPCEXECUTE^VistaRpc("rpcBuffer")
    ;
    quit *rpcBuffer
    ;
    ;



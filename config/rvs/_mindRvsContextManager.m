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
; init
; ************************************************************
; parameters:
;
; Returns:
;
init



    quit
    ;
    ;
; ************************************************************
; createEntry(GUID,contextByRef)
; ************************************************************
; parameters:
; 1 GUID
; 2 contextByRef
;
; Returns:
;
createEntry(GUID,contextByRef)
    set x="%"
    for  set x=$order(@x) quit:x=""  do
    .
    . merge ^context(x)=@x



    quit
    ;
    ;
; ************************************************************
; restoreEntry(GUID)
; ************************************************************
; parameters:
; 1 GUID
;
; Returns:
; contextByRef
;
restoreEntry(GUID)
    new contextByRef

    quit *contextByRef
    ;
    ;
; ************************************************************
; removeEntry(GUID)
; ************************************************************
; parameters:
; 1 GUID
;
; Returns:
; status
;
removeEntry(GUID)
    new status

    quit status
    ;
    ;



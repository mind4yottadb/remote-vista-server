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
    kill ^%mindRvs
    ;
    quit
    ;
    ;
; ************************************************************
; createEntry(guid,contextByRef)
; ************************************************************
; parameters:
; 1 guid
; 2 contextByRef
;
; Returns:
;
createEntry(guid)
    set x="%"
    for  set x=$order(@x) quit:x=""  do
    . quit:$find(x,"%mind")
    . quit:$zextract(x,1,1)="%"
    . quit:$ascii($zextract(x,1,1))>96
    . merge ^%mindRvs("sessions",guid,"vars",x)=@x
    ;
    set ^%mindRvs("sessions",guid,"timestamp")=$zut
    ;
    quit
    ;
    ;
; ************************************************************
; restoreEntry(guid)
; ************************************************************
; parameters:
; 1 guid
;
; Returns:
; contextByRef
;
restoreEntry(guid)
    new %mindRvsCnt
    ;

    set %mindRvsCnt="" for  set %mindRvsCnt=$order(^%mindRvs("sessions",guid,"vars",%mindRvsCnt)) quit:%mindRvsCnt=""  merge %mindRvsCnt=@^%mindRvs("sessions",guid,"vars"@(%mindRvsCnt)
    ;
    ;
; ************************************************************
; removeEntry(guid)
; ************************************************************
; parameters:
; 1 GUID
;
; Returns:
; status
;
removeEntry(guid)
    new status

    quit status
    ;
    ;



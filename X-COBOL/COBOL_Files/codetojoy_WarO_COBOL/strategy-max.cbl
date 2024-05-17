       IDENTIFICATION DIVISION.
       PROGRAM-ID. strategy-max.
 
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
          01 I PIC 9(2).
          01 MAX-CARD PIC 9(2) VALUE 0.
          01 IDX-MAX-CARD PIC 9(1).

       LINKAGE SECTION.
       78 NUM-CARDS               VALUE 4.
       01 PRIZE-CARD PIC 9(2).
       01 PLAYER-REC.
         02 PLAYER-NAME PIC X(6).      
         02 PLAYER-BID PIC 9(2).
         02 PLAYER-POINTS PIC 9(2).
         02 PLAYER-STRATEGY PIC 9(1).
         02 PLAYER-HAND PIC 9(2) OCCURS NUM-CARDS TIMES.

       PROCEDURE DIVISION USING PRIZE-CARD, PLAYER-REC.
          MOVE 0 TO PLAYER-BID.
          MOVE 0 TO MAX-CARD.
          PERFORM FIND-MAX VARYING I FROM 1 BY 1 UNTIL I > NUM-CARDS.
          PERFORM SELECT-MAX.
          GOBACK
          .

       FIND-MAX.
         IF PLAYER-HAND (I) > MAX-CARD
           MOVE PLAYER-HAND (I) TO MAX-CARD
           MOVE I TO IDX-MAX-CARD 
         END-IF.
 
       SELECT-MAX.
         MOVE PLAYER-HAND (IDX-MAX-CARD) TO PLAYER-BID.
         MOVE 0 TO PLAYER-HAND (IDX-MAX-CARD). 

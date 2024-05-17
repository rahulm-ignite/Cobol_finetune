       IDENTIFICATION DIVISION.
       PROGRAM-ID. AOC-2020-05-1.
       AUTHOR. ANNA KOSIERADZKA.
      
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUTFILE ASSIGN TO "d5.input"
           ORGANIZATION IS LINE SEQUENTIAL.
           
       DATA DIVISION.
       FILE SECTION.
         FD INPUTFILE.
         01 INPUTRECORD PIC X(10).
       WORKING-STORAGE SECTION.
         01 FILE-STATUS PIC 9 VALUE 0.

       LOCAL-STORAGE SECTION.
         01 I UNSIGNED-INT VALUE 1.
         01 SEAT-ID UNSIGNED-INT VALUE 0.
         01 ID-MAX UNSIGNED-INT VALUE 0.

       PROCEDURE DIVISION.
       001-MAIN.
           OPEN INPUT INPUTFILE.
           PERFORM 002-READ UNTIL FILE-STATUS = 1.
           CLOSE INPUTFILE.
           DISPLAY ID-MAX.
           STOP RUN.

       002-READ.
            READ INPUTFILE
                AT END MOVE 1 TO FILE-STATUS
                NOT AT END PERFORM 003-PROCESS-RECORD
            END-READ.
       
       003-PROCESS-RECORD.
           MOVE 0 TO SEAT-ID. 
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
              COMPUTE SEAT-ID = SEAT-ID * 2
              IF INPUTRECORD(I:1) = 'B' OR INPUTRECORD(I:1) = 'R' THEN 
                 ADD 1 TO SEAT-ID
              END-IF
           END-PERFORM.
            
           IF SEAT-ID > ID-MAX THEN
             MOVE SEAT-ID TO ID-MAX
           END-IF.

000010*>
000020 IDENTIFICATION DIVISION.
000030 PROGRAM-ID.   TS000002.
000040 ENVIRONMENT    DIVISION.
000050 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000080  COPY CBUC0002.
000081  COPY SAMPC002.
000082  01 A PIC 99.
000083  01 B PIC 99.
000084  01 C PIC 99.
000085  01 RES PIC 99.
000086  01 EXPECTED PIC 99.
000087  01 assert-name PIC X(20).
000088  LINKAGE SECTION.
000089    COPY CBUC0001.
000090 PROCEDURE DIVISION USING CBU-ctx.
000091  MOVE 5 TO EXPECTED.
000092  MOVE 5 TO A.
000093  MOVE 2 TO B.
000094  MOVE 5 TO C.
000095  INITIALIZE assert-name.
000096  CALL SAMPLE02 USING A B C RES.
000097  MOVE "(5,2,5)=5" TO assert-name.
000098  CALL CBU-assert-nb3-equals
000099          USING CBU-ctx assert-name EXPECTED RES.
000100 END PROGRAM TS000002.

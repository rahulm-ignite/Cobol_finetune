      * Exec Node.js code
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXEC_NODEJS.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 COMMAND_TO_RUN PIC X(200) value SPACES.

       LINKAGE SECTION.
       01 NODEJS_CODE PIC A(100) value SPACES.

       PROCEDURE DIVISION USING NODEJS_CODE.
           STRING 'node -e "' DELIMITED BY SIZE
                  NODEJS_CODE DELIMITED BY SIZE
                  '"'   DELIMITED BY SIZE
           INTO COMMAND_TO_RUN

           CALL 'SYSTEM' USING COMMAND_TO_RUN
           END-CALL
       EXIT PROGRAM.
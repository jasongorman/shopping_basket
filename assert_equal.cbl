      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ASSERT_EQUAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01  test-name   PIC X(30) VALUE SPACES.
       01  expected    PIC 9(04)V9(2) VALUE ZEROES.
       01  actual      PIC 9(04)V9(2) VALUE ZEROES.
       COPY 'test_context.cpy'.
       PROCEDURE DIVISION USING test-name, expected,
                                       actual, test-context.
       MAIN-PROCEDURE.

            ADD 1 TO totalRun.

            IF actual = expected THEN
                ADD 1 TO passes
            ELSE
                ADD 1 TO fails
                DISPLAY 'FAILED: ' test-name'. Expected '
                expected ' but was ' actual.

            GOBACK.

       END PROGRAM ASSERT_EQUAL.

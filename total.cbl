       IDENTIFICATION DIVISION.
       PROGRAM-ID. TOTAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  i           PIC 9(02).
       01  subtotal    PIC 9(04)V9(2).
       LINKAGE SECTION.
       COPY 'total_params.cpy'.
       PROCEDURE DIVISION USING basket, total.
       MAIN-PROCEDURE.
           SET total TO ZEROES.

           MOVE 1 TO i

           PERFORM UNTIL i = 10
               MULTIPLY unitprice(i) BY quantity(i) GIVING subtotal
               ADD subtotal TO total
               ADD 1 TO i
           END-PERFORM.

           GOBACK.
       END PROGRAM TOTAL.

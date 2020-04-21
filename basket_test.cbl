       IDENTIFICATION DIVISION.
       PROGRAM-ID. BASKET-TEST.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       COPY 'total_params.cpy'.
       COPY 'test_context.cpy'.
       01  expected    PIC 9(04)V9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            PERFORM EMPTY-BASKET.
            PERFORM SINGLE_ITEM.
            PERFORM TWO_ITEMS.
            PERFORM QUANTITY_TWO.

            DISPLAY 'Tests passed: ' passes.
            DISPLAY 'Tests failed: ' fails.
            DISPLAY 'Tests run:    ' totalRun.
            STOP RUN.

       EMPTY-BASKET.
            INITIALIZE basket REPLACING NUMERIC DATA BY ZEROES.

            CALL 'TOTAL' USING basket, total.

            MOVE 0 TO expected.
            CALL 'ASSERT_EQUAL' USING 'EMPTY BASKET',
                   expected, total, test-context.

       SINGLE_ITEM.
            INITIALIZE basket REPLACING NUMERIC DATA BY ZEROES.
            MOVE 100 TO unitprice(1).
            Move 1 TO quantity(1).

            CALL 'TOTAL' USING basket, total.
            MOVE 100 TO expected.

            CALL 'ASSERT_EQUAL' USING 'SINGLE_ITEM',
                   expected, total, test-context.

       TWO_ITEMS.
            INITIALIZE basket REPLACING NUMERIC DATA BY ZEROES.

            MOVE 100 TO unitprice(1).
            MOVE 1 TO quantity(1).

            MOVE 200 TO unitprice(2).
            MOVE 1 TO quantity(2).

            CALL 'TOTAL' USING basket, total.

            MOVE 300 TO expected.
            CALL 'ASSERT_EQUAL' USING 'TWO_ITEMS',
                   expected, total, test-context.

       QUANTITY_TWO.
            INITIALIZE basket REPLACING NUMERIC DATA BY ZEROES.

            MOVE 100 TO unitprice(1).
            MOVE 2 TO quantity(1).

            CALL 'TOTAL' USING basket, total.

            MOVE 200 TO expected.
            CALL 'ASSERT_EQUAL' USING 'TWO_ITEMS',
                   expected, total, test-context.


       END PROGRAM BASKET-TEST.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. GUESS-THE-NUMBER.
       AUTHOR. Thomas Mauran.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 USER-DATA.
           02 USER-NUMBER PIC 9(2).
  
       01 MYSTERY-NUMBER PIC 9(2).
       01 SEED PIC 9(8) VALUE 0.
       01 GAME-END PIC 9(1) value 0.
       01 NUMBER-OF-ROUNDS PIC 9(3) value 1.

       PROCEDURE DIVISION.
          *> Attributing a random value to MYSTERY-NUMBER
           MOVE function current-date(9:8) TO SEED.
           MOVE FUNCTION NUMVAL (SEED)  to MYSTERY-NUMBER.
           DISPLAY " ".
           DISPLAY " ".
           DISPLAY " ".
           DISPLAY "Hello, the goal of this game is pretty easy there is a mystery number between 1 and 100 ! You must find it fast.".
           DISPLAY "Your number : "

           ACCEPT USER-NUMBER.

           MAIN-PROCEDURE.
               perform GAME-LOOP until GAME-END = 1
               STOP RUN.

           *> Main function to execute in a loop
           GAME-LOOP.
               IF MYSTERY-NUMBER = USER-NUMBER
                   DISPLAY "Congratulations, you won in ", NUMBER-OF-ROUNDS, " rounds!"
                   MOVE 1 to GAME-END
               ELSE 
                   IF MYSTERY-NUMBER > USER-NUMBER
                      DISPLAY "The mystery number is bigger."
                   else
                       DISPLAY "The mystery number is smaller."               
                   END-IF
                   DISPLAY "Your number : "
                   ACCEPT USER-NUMBER
               END-IF.
               ADD 1 TO NUMBER-OF-ROUNDS.       
       END PROGRAM GUESS-THE-NUMBER.


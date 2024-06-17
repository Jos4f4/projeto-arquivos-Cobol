
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ005002.
      *=================================================================
      *==  AUTOR: ***
      *==  CONSULTORIA: XPTO
      *==  DATA CRIACAO: XX/XX/2024
      *==  OBJETIVO: PROCURA DE DE Q REGITRRO DO ARQUIVO CLIENTES.TXT
      *=================================================================

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO
               "\CLIENTES.txt"
               FILE STATUS IS FS-CLIENTES.

       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01 REG-CLIENTES.
           05 REG-ID     PIC 09(03).
           05 REG-NOME     PIC X(20).
           05 REG-TELEFONE     PIC X(11).

       WORKING-STORAGE SECTION.
       77 WRK-ID PIC 9(04) VALUE ZEROS.

      *================ACUMULADORES===================================
       77 WRK-ACUM-LIDOS PIC 9(04) VALUE ZEROS.
       77 WRK-ACUM-ACHADOS PIC 9(04) VALUE ZEROS.

       77 FS-CLIENTES PIC 9(09).
       77 WRK-MSG-ERRO PIC X(30) VALUE SPACES.

       PROCEDURE DIVISION.
       000-MAIN      SECTION.
           PERFORM 0100-INICIALIZE.
           PERFORM 0200-PROCESS.
           PERFORM 0300-FINISH.
           STOP RUN.

       0100-INICIALIZE SECTION.
           OPEN INPUT CLIENTES.
           IF FS-CLIENTES EQUAL 35
               MOVE "ARQUIVO NAO FOI ABERTO" TO WRK-MSG-ERRO
               PERFORM 9000-TRATA-ERRO
           END-IF.
               DISPLAY "DIGITE O ID".
               ACCEPT WRK-ID.

       0200-PROCESS SECTION.
           READ CLIENTES.
           IF FS-CLIENTES EQUAL 0
               PERFORM UNTIL FS-CLIENTES NOT EQUAL 00
                   ADD 1 TO WRK-ACUM-LIDOS
                IF REG-ID EQUAL WRK-ID
     *             DISPLAY "ID...   " REG-ID
                   DISPLAY "NOME...   " REG-NOME
                   DISPLAY "TELEFONE...   "REG-TELEFONE
                   DISPLAY "==============================="
                   ADD 1 TO WRK-ACUM-ACHADOS
                END-IF
                   READ CLIENTES
                END-PERFORM
           ELSE
               DISPLAY "ARQUIVO VAZIO"
           END-IF.

       0300-FINISH SECTION.
           CLOSE CLIENTES.
           PERFORM 0310-STATISTIC
           DISPLAY "FIM DE PROGRAMA".

       0310-STATISTIC   SECTION.
           DISPLAY "================================"
           DISPLAY "REGISTROS LIDOS..." WRK-ACUM-LIDOS.
           DISPLAY "REGISTROS LIDOS..." WRK-ACUM-ACHADOS.

       9000-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.

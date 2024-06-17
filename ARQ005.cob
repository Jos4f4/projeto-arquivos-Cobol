
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ005.
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
                IF REG-ID EQUAL WRK-ID
     *             DISPLAY "ID...   " REG-ID
                   DISPLAY "NOME...   " REG-NOME
                   DISPLAY "TELEFONE...   "REG-TELEFONE
                   DISPLAY "==============================="
                       CLOSE CLIENTES
                       GOBACK
                END-IF
                   READ CLIENTES
                END-PERFORM
           ELSE
               DISPLAY "ARQUIVO VAZIO"
           END-IF.

       0300-FINISH SECTION.
           DISPLAY "FIM DE PROGRAMA".
           CLOSE CLIENTES.

       9000-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.

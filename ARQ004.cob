       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ004.
      *=================================================================
      *==  AUTOR: ***
      *==  CONSULTORIA: XPTO
      *==  DATA CRIACAO: XX/XX/2024
      *==  OBJETIVO: GRAVACAO DE REGITRRO DO ARQUIVO CLIENTES.TXT
      *=================================================================

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO
               "\CLIENTES2.txt"
               FILE STATUS IS FS-CLIENTES.

       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01 REG-CLIENTES.
           05 REG-ID     PIC 09(03).
           05 REG-NOME     PIC X(20).
           05 REG-TELEFONE     PIC X(11).

       WORKING-STORAGE SECTION.
       77 FS-CLIENTES PIC 9(09).
       77 WRK-MSG-ERRO PIC X(30) VALUE SPACES.

       PROCEDURE DIVISION.
       000-MAIN      SECTION.
           PERFORM 0100-INICIALIZE.
           PERFORM 0200-PROCESS.
           PERFORM 0300-FINISH.
           STOP RUN.

       0100-INICIALIZE SECTION.
           OPEN OUTPUT CLIENTES.
           IF FS-CLIENTES EQUAL 35
               MOVE "ARQUIVO NAO FOI ABERTO" TO WRK-MSG-ERRO
               PERFORM 9000-TRATA-ERRO
           ELSE
               DISPLAY "ARQUIVO OK".

       0200-PROCESS SECTION.
           MOVE '0001' TO REG-ID.
           MOVE 'PAULA              ' TO REG-NOME.
           MOVE '92999999999'         TO REG-TELEFONE.
           WRITE REG-CLIENTES.
           MOVE '0001' TO REG-ID.
           MOVE 'PAULA              ' TO REG-NOME.
           MOVE '92999999999'         TO REG-TELEFONE.
           WRITE REG-CLIENTES.
           MOVE '0001' TO REG-ID.
           MOVE 'PAULA              ' TO REG-NOME.
           MOVE '92999999999'         TO REG-TELEFONE.
           WRITE REG-CLIENTES.


       0300-FINISH SECTION.
           DISPLAY "FIM DE PROGRAMA".
           CLOSE CLIENTES.

       9000-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.

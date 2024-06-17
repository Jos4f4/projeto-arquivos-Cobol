       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ001.
      *=================================================================
      *==  AUTOR: ***
      *==  CONSULTORIA: XPTO
      *==  DATA CRIACAO: XX/XX/2024
      *==  OBJETIVO: ABERTURA DO ARQUIVO CLIENTES.TXT
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
           05 REG-ID     PIC 09(04).
           05 REG-NOME     PIC X(20).
           05 REG-TELEFONE     PIC X(11).

       WORKING-STORAGE SECTION.
       77 FS-CLIENTES PIC 9(09).

       PROCEDURE DIVISION.
       000-MAIN      SECTION.
           PERFORM 0100-INICIALIZE.
           PERFORM 0300-FINISH.
           STOP RUN.

       0100-INICIALIZE SECTION.
           OPEN INPUT CLIENTES.
           IF FS-CLIENTES EQUAL 35
               DISPLAY "ARQUIVO NAO FOI ABERTO"
           ELSE
               DISPLAY "ARQUIVO OK"
           END-IF.

       0200-PROCESS SECTION.
           COTINUE.

       0300-FINISH SECTION.
           DISPLAY "FIM DE PROGRAMA".
           CLOSE CLIENTES.

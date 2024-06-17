       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ002.
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
           05 REG-ID     PIC 09(04).
           05 REG-NOME     PIC X(20).
           05 REG-TELEFONE     PIC X(11).

       WORKING-STORAGE SECTION.
       77 FS-CLIENTES PIC 9(02) VALUE ZEROS.
       77 WRK-MSG-ERRO PIC X(30) VALUE SPACES.

      *===========VARIAVEIS DE ENTRADA DE DADOS============
       77 WRK-ID  PIC 9(04) VALUE ZEROS.
       77 WRK-NOME  PIC X(20) VALUE SPACES.
       77 WRK-TELEFONE PIC X(11) VALUE SPACES.

       PROCEDURE DIVISION.
       000-MAIN      SECTION.
           PERFORM 0100-INICIALIZE.
           PERFORM 0200-PROCESS.
           PERFORM 0300-FINISH.
           STOP RUN.

       0100-INICIALIZE SECTION.
           OPEN EXTEND CLIENTES.
           IF FS-CLIENTES EQUAL 35
               MOVE "ARQUIVO NAO FOI ABERTO" TO WRK-MSG-ERRO
               PERFORM 9000-TRATA-ERRO
           END-IF.
           PERFORM 0110-INPUT-DATA.

       0110-INPUT-DATA SECTION.
           DISPLAY "DIGITE O ID...".
               ACCEPT WRK-ID.
           DISPLAY "DIGITE O NOME...".
               ACCEPT WRK-NOME.
           DISPLAY "DIGITE O TELEFONE...".
               ACCEPT WRK-TELEFONE.

       0200-PROCESS SECTION.
           MOVE WRK-ID TO REG-ID.
           MOVE WRK-NOME TO REG-NOME.
           MOVE WRK-TELEFONE TO REG-TELEFONE.
           WRITE REG-CLIENTES.

       0300-FINISH SECTION.
           DISPLAY "FIM DE PROGRAMA".
           CLOSE CLIENTES.

       9000-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.

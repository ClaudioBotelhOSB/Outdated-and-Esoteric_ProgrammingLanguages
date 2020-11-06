; ===========================================================
; Programa   : PICJUMP             | Versão: 01.0 
; Programador: Claudio Botelho     | Data  : 13/05/2016
;************************************************************
;
;-> Definir processador alvo como sendo o PIC 16F84A
;
;	Pino	Função
;	RA1	Botão de entrada
;	RB4	Led de saída
;

      LIST	P=16F84A
      #include <P16F84A.inc>
;
;-> Definir os bits da palavra de configuração do PIC 16F84A

      __CONFIG 0x3FF9

      ORG 0x00		; Ponto inicial

      BSFSTATUS, RP0	; MUDAR PARA BANCO #1

      MOVLW b'00000010' ; DEFINIR TRISA	
      MOVWF TRISA

      MOVLW b'00000000' ; DEFINIR TRISB	
      MOVWF TRISB

      BCF STATUS,RPO	; VOLTAR AO BANCO #0

;
;	LOOP PRINCIPAL
;

LOOP:
      BTFSC PORTA,1	; Testar bit de entrada

	GOTO LIGA	; Não pulou, estava em '1'=> vai a LIGA

      BCF PORTB,4 ; Pulou: Desligar bit 4 da porta B

	GOTO LOOP	; Voltar a testar bit de entrada

LIGA:
      BSF PORTB,4 ; Ligar bit 4 da porta B

	GOTO LOOP	; Voltar a testar bit de entrada

      END		; Fim das instruções em Assembler

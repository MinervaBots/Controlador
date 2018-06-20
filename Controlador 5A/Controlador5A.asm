
_setup_pwms:

	CLRF       T2CON+0
	MOVLW      255
	MOVWF      PR2+0
	BCF        CCPTMRS+0, 1
	BCF        CCPTMRS+0, 0
	BSF        PSTR1CON+0, 0
	BSF        PSTR1CON+0, 1
	BCF        PSTR1CON+0, 2
	BCF        PSTR1CON+0, 3
	BSF        PSTR1CON+0, 4
	MOVLW      255
	MOVWF      CCPR1L+0
	MOVLW      60
	MOVWF      CCP1CON+0
	BCF        CCPTMRS+0, 3
	BCF        CCPTMRS+0, 2
	BSF        PSTR2CON+0, 0
	BSF        PSTR2CON+0, 1
	BCF        PSTR2CON+0, 2
	BCF        PSTR2CON+0, 3
	BSF        PSTR2CON+0, 4
	MOVLW      255
	MOVWF      CCPR2L+0
	MOVLW      60
	MOVWF      CCP2CON+0
	MOVLW      4
	MOVWF      T2CON+0
L_end_setup_pwms:
	RETURN
; end of _setup_pwms

_set_duty_cycle:

	MOVLW      0
	XORWF      FARG_set_duty_cycle_channel+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_duty_cycle77
	MOVLW      1
	XORWF      FARG_set_duty_cycle_channel+0, 0
L__set_duty_cycle77:
	BTFSS      STATUS+0, 2
	GOTO       L_set_duty_cycle0
	MOVF       FARG_set_duty_cycle_duty+0, 0
	MOVWF      CCPR1L+0
L_set_duty_cycle0:
	MOVLW      0
	XORWF      FARG_set_duty_cycle_channel+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_duty_cycle78
	MOVLW      2
	XORWF      FARG_set_duty_cycle_channel+0, 0
L__set_duty_cycle78:
	BTFSS      STATUS+0, 2
	GOTO       L_set_duty_cycle1
	MOVF       FARG_set_duty_cycle_duty+0, 0
	MOVWF      CCPR2L+0
L_set_duty_cycle1:
L_end_set_duty_cycle:
	RETURN
; end of _set_duty_cycle

_pwm_steering:

	MOVLW      0
	XORWF      FARG_pwm_steering_channel+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering80
	MOVLW      1
	XORWF      FARG_pwm_steering_channel+0, 0
L__pwm_steering80:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering2
	BCF        PSTR1CON+0, 0
	BCF        PSTR1CON+0, 1
	MOVLW      0
	XORWF      FARG_pwm_steering_port+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering81
	MOVLW      1
	XORWF      FARG_pwm_steering_port+0, 0
L__pwm_steering81:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering3
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	BSF        PSTR1CON+0, 0
L_pwm_steering3:
	MOVLW      0
	XORWF      FARG_pwm_steering_port+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering82
	MOVLW      2
	XORWF      FARG_pwm_steering_port+0, 0
L__pwm_steering82:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering4
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BSF        PSTR1CON+0, 1
L_pwm_steering4:
L_pwm_steering2:
	MOVLW      0
	XORWF      FARG_pwm_steering_channel+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering83
	MOVLW      2
	XORWF      FARG_pwm_steering_channel+0, 0
L__pwm_steering83:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering5
	BCF        PSTR2CON+0, 0
	BCF        PSTR2CON+0, 1
	MOVLW      0
	XORWF      FARG_pwm_steering_port+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering84
	MOVLW      1
	XORWF      FARG_pwm_steering_port+0, 0
L__pwm_steering84:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering6
	BCF        RA4_bit+0, BitPos(RA4_bit+0)
	BSF        PSTR2CON+0, 0
L_pwm_steering6:
	MOVLW      0
	XORWF      FARG_pwm_steering_port+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering85
	MOVLW      2
	XORWF      FARG_pwm_steering_port+0, 0
L__pwm_steering85:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering7
	BCF        RA5_bit+0, BitPos(RA5_bit+0)
	BSF        PSTR2CON+0, 1
L_pwm_steering7:
L_pwm_steering5:
L_end_pwm_steering:
	RETURN
; end of _pwm_steering

_setup_Timer_1:

	BCF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
	BSF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
	BCF        TMR1CS1_bit+0, BitPos(TMR1CS1_bit+0)
	BCF        TMR1CS0_bit+0, BitPos(TMR1CS0_bit+0)
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
	CLRF       TMR1L+0
	CLRF       TMR1H+0
L_end_setup_Timer_1:
	RETURN
; end of _setup_Timer_1

_micros:

	MOVF       TMR1H+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       TMR1L+0, 0
	IORWF       R0, 0
	MOVWF      R5
	MOVF       R1, 0
	MOVWF      R6
	MOVLW      0
	IORWF       R6, 1
	MOVF       _n_interrupts_timer1+1, 0
	MOVWF      R3
	MOVF       _n_interrupts_timer1+0, 0
	MOVWF      R2
	CLRF       R0
	CLRF       R1
	MOVF       R5, 0
	ADDWF      R0, 1
	MOVF       R6, 0
	ADDWFC     R1, 1
	MOVLW      0
	ADDWFC     R2, 1
	ADDWFC     R3, 1
L_end_micros:
	RETURN
; end of _micros

_setup_uart:

	BSF        RXDTSEL_bit+0, BitPos(RXDTSEL_bit+0)
	BSF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_setup_uart8:
	DECFSZ     R13, 1
	GOTO       L_setup_uart8
	DECFSZ     R12, 1
	GOTO       L_setup_uart8
	DECFSZ     R11, 1
	GOTO       L_setup_uart8
	NOP
L_end_setup_uart:
	RETURN
; end of _setup_uart

_setup_port:

	CLRF       CM1CON0+0
	CLRF       CM2CON0+0
	BSF        P2BSEL_bit+0, BitPos(P2BSEL_bit+0)
	BSF        CCP2SEL_bit+0, BitPos(CCP2SEL_bit+0)
	CLRF       ANSELA+0
	MOVLW      1
	MOVWF      ANSELC+0
	CALL       _ADC_Init+0
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
	BCF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
	BSF        TRISA3_bit+0, BitPos(TRISA3_bit+0)
	BCF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
	BCF        TRISA5_bit+0, BitPos(TRISA5_bit+0)
	BSF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
	BSF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
	BSF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
	BCF        TRISC5_bit+0, BitPos(TRISC5_bit+0)
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
	BSF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BSF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	MOVLW      5
	MOVWF      CCP3CON+0
	MOVLW      5
	MOVWF      CCP4CON+0
L_end_setup_port:
	RETURN
; end of _setup_port

_failSafeCheck:

	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       _last_measure1+0, 0
	SUBWF      R4, 1
	MOVF       _last_measure1+1, 0
	SUBWFB     R5, 1
	MOVF       _last_measure1+2, 0
	SUBWFB     R6, 1
	MOVF       _last_measure1+3, 0
	SUBWFB     R7, 1
	MOVF       R7, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck91
	MOVF       R6, 0
	SUBLW      30
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck91
	MOVF       R5, 0
	SUBLW      132
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck91
	MOVF       R4, 0
	SUBLW      128
L__failSafeCheck91:
	BTFSS      STATUS+0, 0
	GOTO       L_failSafeCheck10
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       _last_measure2+0, 0
	SUBWF      R4, 1
	MOVF       _last_measure2+1, 0
	SUBWFB     R5, 1
	MOVF       _last_measure2+2, 0
	SUBWFB     R6, 1
	MOVF       _last_measure2+3, 0
	SUBWFB     R7, 1
	MOVF       R7, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck92
	MOVF       R6, 0
	SUBLW      30
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck92
	MOVF       R5, 0
	SUBLW      132
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck92
	MOVF       R4, 0
	SUBLW      128
L__failSafeCheck92:
	BTFSS      STATUS+0, 0
	GOTO       L_failSafeCheck10
	CLRF       R0
	GOTO       L_failSafeCheck9
L_failSafeCheck10:
	MOVLW      1
	MOVWF      R0
L_failSafeCheck9:
	MOVLW      0
	MOVWF      R1
L_end_failSafeCheck:
	RETURN
; end of _failSafeCheck

_map:

	MOVF       FARG_map_x+0, 0
	MOVWF      R4
	MOVF       FARG_map_x+1, 0
	MOVWF      R5
	MOVF       FARG_map_x+2, 0
	MOVWF      R6
	MOVF       FARG_map_x+3, 0
	MOVWF      R7
	MOVF       FARG_map_in_min+0, 0
	SUBWF      R4, 1
	MOVF       FARG_map_in_min+1, 0
	SUBWFB     R5, 1
	MOVF       FARG_map_in_min+2, 0
	SUBWFB     R6, 1
	MOVF       FARG_map_in_min+3, 0
	SUBWFB     R7, 1
	MOVF       FARG_map_out_max+0, 0
	MOVWF      R0
	MOVF       FARG_map_out_max+1, 0
	MOVWF      R1
	MOVF       FARG_map_out_max+2, 0
	MOVWF      R2
	MOVF       FARG_map_out_max+3, 0
	MOVWF      R3
	MOVF       FARG_map_out_min+0, 0
	SUBWF      R0, 1
	MOVF       FARG_map_out_min+1, 0
	SUBWFB     R1, 1
	MOVF       FARG_map_out_min+2, 0
	SUBWFB     R2, 1
	MOVF       FARG_map_out_min+3, 0
	SUBWFB     R3, 1
	CALL       _Mul_32x32_U+0
	MOVF       FARG_map_in_max+0, 0
	MOVWF      R4
	MOVF       FARG_map_in_max+1, 0
	MOVWF      R5
	MOVF       FARG_map_in_max+2, 0
	MOVWF      R6
	MOVF       FARG_map_in_max+3, 0
	MOVWF      R7
	MOVF       FARG_map_in_min+0, 0
	SUBWF      R4, 1
	MOVF       FARG_map_in_min+1, 0
	SUBWFB     R5, 1
	MOVF       FARG_map_in_min+2, 0
	SUBWFB     R6, 1
	MOVF       FARG_map_in_min+3, 0
	SUBWFB     R7, 1
	CALL       _Div_32x32_S+0
	MOVF       FARG_map_out_min+0, 0
	ADDWF      R0, 1
	MOVF       FARG_map_out_min+1, 0
	ADDWFC     R1, 1
	MOVF       FARG_map_out_min+2, 0
	ADDWFC     R2, 1
	MOVF       FARG_map_out_min+3, 0
	ADDWFC     R3, 1
L_end_map:
	RETURN
; end of _map

_rotateMotor:

	MOVF       _t2_sig2+0, 0
	MOVWF      rotateMotor_pulseWidth2_L0+0
	MOVF       _t2_sig2+1, 0
	MOVWF      rotateMotor_pulseWidth2_L0+1
	MOVF       _t2_sig2+2, 0
	MOVWF      rotateMotor_pulseWidth2_L0+2
	MOVF       _t2_sig2+3, 0
	MOVWF      rotateMotor_pulseWidth2_L0+3
	MOVF       _t2_sig1+0, 0
	MOVWF      FARG_map_x+0
	MOVF       _t2_sig1+1, 0
	MOVWF      FARG_map_x+1
	MOVF       _t2_sig1+2, 0
	MOVWF      FARG_map_x+2
	MOVF       _t2_sig1+3, 0
	MOVWF      FARG_map_x+3
	MOVF       _MIN_CH1_DURATION+0, 0
	MOVWF      FARG_map_in_min+0
	MOVF       _MIN_CH1_DURATION+1, 0
	MOVWF      FARG_map_in_min+1
	CLRF       FARG_map_in_min+2
	CLRF       FARG_map_in_min+3
	MOVF       _MAX_CH1_DURATION+0, 0
	MOVWF      FARG_map_in_max+0
	MOVF       _MAX_CH1_DURATION+1, 0
	MOVWF      FARG_map_in_max+1
	CLRF       FARG_map_in_max+2
	CLRF       FARG_map_in_max+3
	MOVLW      1
	MOVWF      FARG_map_out_min+0
	MOVLW      255
	MOVWF      FARG_map_out_min+1
	MOVLW      255
	MOVWF      FARG_map_out_min+2
	MOVWF      FARG_map_out_min+3
	MOVLW      255
	MOVWF      FARG_map_out_max+0
	CLRF       FARG_map_out_max+1
	CLRF       FARG_map_out_max+2
	CLRF       FARG_map_out_max+3
	CALL       _map+0
	MOVF       R0, 0
	MOVWF      rotateMotor_duty_cycle1_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_duty_cycle1_L0+1
	MOVF       rotateMotor_pulseWidth2_L0+0, 0
	MOVWF      FARG_map_x+0
	MOVF       rotateMotor_pulseWidth2_L0+1, 0
	MOVWF      FARG_map_x+1
	MOVF       rotateMotor_pulseWidth2_L0+2, 0
	MOVWF      FARG_map_x+2
	MOVF       rotateMotor_pulseWidth2_L0+3, 0
	MOVWF      FARG_map_x+3
	MOVF       _MIN_CH2_DURATION+0, 0
	MOVWF      FARG_map_in_min+0
	MOVF       _MIN_CH2_DURATION+1, 0
	MOVWF      FARG_map_in_min+1
	CLRF       FARG_map_in_min+2
	CLRF       FARG_map_in_min+3
	MOVF       _MAX_CH2_DURATION+0, 0
	MOVWF      FARG_map_in_max+0
	MOVF       _MAX_CH2_DURATION+1, 0
	MOVWF      FARG_map_in_max+1
	CLRF       FARG_map_in_max+2
	CLRF       FARG_map_in_max+3
	MOVLW      1
	MOVWF      FARG_map_out_min+0
	MOVLW      255
	MOVWF      FARG_map_out_min+1
	MOVLW      255
	MOVWF      FARG_map_out_min+2
	MOVWF      FARG_map_out_min+3
	MOVLW      255
	MOVWF      FARG_map_out_max+0
	CLRF       FARG_map_out_max+1
	CLRF       FARG_map_out_max+2
	CLRF       FARG_map_out_max+3
	CALL       _map+0
	MOVF       R0, 0
	MOVWF      rotateMotor_duty_cycle2_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_duty_cycle2_L0+1
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      255
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor95
	MOVLW      1
	SUBWF      rotateMotor_duty_cycle1_L0+0, 0
L__rotateMotor95:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor11
	MOVLW      1
	MOVWF      rotateMotor_duty_cycle1_L0+0
	MOVLW      255
	MOVWF      rotateMotor_duty_cycle1_L0+1
L_rotateMotor11:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor96
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	SUBLW      255
L__rotateMotor96:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor12
	MOVLW      255
	MOVWF      rotateMotor_duty_cycle1_L0+0
	CLRF       rotateMotor_duty_cycle1_L0+1
L_rotateMotor12:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      255
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor97
	MOVLW      1
	SUBWF      rotateMotor_duty_cycle2_L0+0, 0
L__rotateMotor97:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor13
	MOVLW      1
	MOVWF      rotateMotor_duty_cycle2_L0+0
	MOVLW      255
	MOVWF      rotateMotor_duty_cycle2_L0+1
L_rotateMotor13:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor98
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBLW      255
L__rotateMotor98:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor14
	MOVLW      255
	MOVWF      rotateMotor_duty_cycle2_L0+0
	CLRF       rotateMotor_duty_cycle2_L0+1
L_rotateMotor14:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor99
	MOVLW      50
	SUBWF      rotateMotor_duty_cycle1_L0+0, 0
L__rotateMotor99:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor17
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor100
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	SUBLW      206
L__rotateMotor100:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor17
L__rotateMotor72:
	CLRF       rotateMotor_duty_cycle1_L0+0
	CLRF       rotateMotor_duty_cycle1_L0+1
L_rotateMotor17:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor101
	MOVLW      50
	SUBWF      rotateMotor_duty_cycle2_L0+0, 0
L__rotateMotor101:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor20
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor102
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBLW      206
L__rotateMotor102:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor20
L__rotateMotor71:
	CLRF       rotateMotor_duty_cycle2_L0+0
	CLRF       rotateMotor_duty_cycle2_L0+1
L_rotateMotor20:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor103
	MOVLW      0
	SUBWF      rotateMotor_duty_cycle1_L0+0, 0
L__rotateMotor103:
	BTFSS      STATUS+0, 0
	GOTO       L_rotateMotor21
	MOVLW      1
	MOVWF      FARG_pwm_steering_channel+0
	MOVLW      0
	MOVWF      FARG_pwm_steering_channel+1
	MOVLW      2
	MOVWF      FARG_pwm_steering_port+0
	MOVLW      0
	MOVWF      FARG_pwm_steering_port+1
	CALL       _pwm_steering+0
	MOVLW      1
	MOVWF      FARG_set_duty_cycle_channel+0
	MOVLW      0
	MOVWF      FARG_set_duty_cycle_channel+1
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	MOVWF      FARG_set_duty_cycle_duty+0
	MOVF       rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      FARG_set_duty_cycle_duty+1
	CALL       _set_duty_cycle+0
	GOTO       L_rotateMotor22
L_rotateMotor21:
	MOVLW      1
	MOVWF      FARG_pwm_steering_channel+0
	MOVLW      0
	MOVWF      FARG_pwm_steering_channel+1
	MOVLW      1
	MOVWF      FARG_pwm_steering_port+0
	MOVLW      0
	MOVWF      FARG_pwm_steering_port+1
	CALL       _pwm_steering+0
	MOVLW      1
	MOVWF      FARG_set_duty_cycle_channel+0
	MOVLW      0
	MOVWF      FARG_set_duty_cycle_channel+1
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	SUBLW      0
	MOVWF      FARG_set_duty_cycle_duty+0
	MOVF       rotateMotor_duty_cycle1_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_duty_cycle_duty+1
	SUBWF      FARG_set_duty_cycle_duty+1, 1
	CALL       _set_duty_cycle+0
L_rotateMotor22:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor104
	MOVLW      0
	SUBWF      rotateMotor_duty_cycle2_L0+0, 0
L__rotateMotor104:
	BTFSS      STATUS+0, 0
	GOTO       L_rotateMotor23
	MOVLW      2
	MOVWF      FARG_pwm_steering_channel+0
	MOVLW      0
	MOVWF      FARG_pwm_steering_channel+1
	MOVLW      2
	MOVWF      FARG_pwm_steering_port+0
	MOVLW      0
	MOVWF      FARG_pwm_steering_port+1
	CALL       _pwm_steering+0
	MOVLW      2
	MOVWF      FARG_set_duty_cycle_channel+0
	MOVLW      0
	MOVWF      FARG_set_duty_cycle_channel+1
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	MOVWF      FARG_set_duty_cycle_duty+0
	MOVF       rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      FARG_set_duty_cycle_duty+1
	CALL       _set_duty_cycle+0
	GOTO       L_rotateMotor24
L_rotateMotor23:
	MOVLW      2
	MOVWF      FARG_pwm_steering_channel+0
	MOVLW      0
	MOVWF      FARG_pwm_steering_channel+1
	MOVLW      1
	MOVWF      FARG_pwm_steering_port+0
	MOVLW      0
	MOVWF      FARG_pwm_steering_port+1
	CALL       _pwm_steering+0
	MOVLW      2
	MOVWF      FARG_set_duty_cycle_channel+0
	MOVLW      0
	MOVWF      FARG_set_duty_cycle_channel+1
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBLW      0
	MOVWF      FARG_set_duty_cycle_duty+0
	MOVF       rotateMotor_duty_cycle2_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_duty_cycle_duty+1
	SUBWF      FARG_set_duty_cycle_duty+1, 1
	CALL       _set_duty_cycle+0
L_rotateMotor24:
L_end_rotateMotor:
	RETURN
; end of _rotateMotor

_interrupt:

	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_interrupt25
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	INCF       _n_interrupts_timer1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _n_interrupts_timer1+1, 1
L_interrupt25:
	BTFSS      CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	GOTO       L_interrupt28
	BTFSS      CCP3M0_bit+0, BitPos(CCP3M0_bit+0)
	GOTO       L_interrupt28
L__interrupt74:
	BCF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BCF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	MOVLW      4
	MOVWF      CCP3CON+0
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _t1_sig1+0
	MOVF       R1, 0
	MOVWF      _t1_sig1+1
	MOVF       R2, 0
	MOVWF      _t1_sig1+2
	MOVF       R3, 0
	MOVWF      _t1_sig1+3
	BCF        CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	BSF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BSF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	GOTO       L_interrupt29
L_interrupt28:
	BTFSS      CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	GOTO       L_interrupt30
	BCF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BCF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	MOVLW      5
	MOVWF      CCP3CON+0
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _t2_sig1+0
	MOVF       R1, 0
	MOVWF      _t2_sig1+1
	MOVF       R2, 0
	MOVWF      _t2_sig1+2
	MOVF       R3, 0
	MOVWF      _t2_sig1+3
	MOVF       _t1_sig1+0, 0
	SUBWF      _t2_sig1+0, 1
	MOVF       _t1_sig1+1, 0
	SUBWFB     _t2_sig1+1, 1
	MOVF       _t1_sig1+2, 0
	SUBWFB     _t2_sig1+2, 1
	MOVF       _t1_sig1+3, 0
	SUBWFB     _t2_sig1+3, 1
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _last_measure1+0
	MOVF       R1, 0
	MOVWF      _last_measure1+1
	MOVF       R2, 0
	MOVWF      _last_measure1+2
	MOVF       R3, 0
	MOVWF      _last_measure1+3
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	BCF        CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	BSF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BSF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
L_interrupt30:
L_interrupt29:
	BTFSS      CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	GOTO       L_interrupt33
	BTFSS      CCP4M0_bit+0, BitPos(CCP4M0_bit+0)
	GOTO       L_interrupt33
L__interrupt73:
	BCF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BCF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	MOVLW      4
	MOVWF      CCP4CON+0
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _t1_sig2+0
	MOVF       R1, 0
	MOVWF      _t1_sig2+1
	MOVF       R2, 0
	MOVWF      _t1_sig2+2
	MOVF       R3, 0
	MOVWF      _t1_sig2+3
	BCF        CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	BSF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BSF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	GOTO       L_interrupt34
L_interrupt33:
	BTFSS      CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	GOTO       L_interrupt35
	BCF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BCF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	MOVLW      5
	MOVWF      CCP4CON+0
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _t2_sig2+0
	MOVF       R1, 0
	MOVWF      _t2_sig2+1
	MOVF       R2, 0
	MOVWF      _t2_sig2+2
	MOVF       R3, 0
	MOVWF      _t2_sig2+3
	MOVF       _t1_sig2+0, 0
	SUBWF      _t2_sig2+0, 1
	MOVF       _t1_sig2+1, 0
	SUBWFB     _t2_sig2+1, 1
	MOVF       _t1_sig2+2, 0
	SUBWFB     _t2_sig2+2, 1
	MOVF       _t1_sig2+3, 0
	SUBWFB     _t2_sig2+3, 1
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _last_measure2+0
	MOVF       R1, 0
	MOVWF      _last_measure2+1
	MOVF       R2, 0
	MOVWF      _last_measure2+2
	MOVF       R3, 0
	MOVWF      _last_measure2+3
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	BCF        CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	BSF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	BSF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
L_interrupt35:
L_interrupt34:
L_end_interrupt:
L__interrupt106:
	RETFIE     %s
; end of _interrupt

_error_led_blink:

	MOVLW      250
	MOVWF      R4
	CLRF       R5
	MOVF       FARG_error_led_blink_time_ms+0, 0
	MOVWF      R0
	MOVF       FARG_error_led_blink_time_ms+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R0, 0
	MOVWF      FARG_error_led_blink_time_ms+0
	MOVF       R1, 0
	MOVWF      FARG_error_led_blink_time_ms+1
	CLRF       error_led_blink_i_L0+0
	CLRF       error_led_blink_i_L0+1
L_error_led_blink36:
	MOVF       FARG_error_led_blink_time_ms+1, 0
	SUBWF      error_led_blink_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__error_led_blink108
	MOVF       FARG_error_led_blink_time_ms+0, 0
	SUBWF      error_led_blink_i_L0+0, 0
L__error_led_blink108:
	BTFSC      STATUS+0, 0
	GOTO       L_error_led_blink37
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_error_led_blink39:
	DECFSZ     R13, 1
	GOTO       L_error_led_blink39
	DECFSZ     R12, 1
	GOTO       L_error_led_blink39
	DECFSZ     R11, 1
	GOTO       L_error_led_blink39
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_error_led_blink40:
	DECFSZ     R13, 1
	GOTO       L_error_led_blink40
	DECFSZ     R12, 1
	GOTO       L_error_led_blink40
	DECFSZ     R11, 1
	GOTO       L_error_led_blink40
	INCF       error_led_blink_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       error_led_blink_i_L0+1, 1
	GOTO       L_error_led_blink36
L_error_led_blink37:
L_end_error_led_blink:
	RETURN
; end of _error_led_blink

_calib_led_blink:

	MOVLW      250
	MOVWF      R4
	CLRF       R5
	MOVF       FARG_calib_led_blink_time_ms+0, 0
	MOVWF      R0
	MOVF       FARG_calib_led_blink_time_ms+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R0, 0
	MOVWF      FARG_calib_led_blink_time_ms+0
	MOVF       R1, 0
	MOVWF      FARG_calib_led_blink_time_ms+1
	CLRF       calib_led_blink_i_L0+0
	CLRF       calib_led_blink_i_L0+1
L_calib_led_blink41:
	MOVF       FARG_calib_led_blink_time_ms+1, 0
	SUBWF      calib_led_blink_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calib_led_blink110
	MOVF       FARG_calib_led_blink_time_ms+0, 0
	SUBWF      calib_led_blink_i_L0+0, 0
L__calib_led_blink110:
	BTFSC      STATUS+0, 0
	GOTO       L_calib_led_blink42
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_calib_led_blink44:
	DECFSZ     R13, 1
	GOTO       L_calib_led_blink44
	DECFSZ     R12, 1
	GOTO       L_calib_led_blink44
	DECFSZ     R11, 1
	GOTO       L_calib_led_blink44
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_calib_led_blink45:
	DECFSZ     R13, 1
	GOTO       L_calib_led_blink45
	DECFSZ     R12, 1
	GOTO       L_calib_led_blink45
	DECFSZ     R11, 1
	GOTO       L_calib_led_blink45
	INCF       calib_led_blink_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       calib_led_blink_i_L0+1, 1
	GOTO       L_calib_led_blink41
L_calib_led_blink42:
L_end_calib_led_blink:
	RETURN
; end of _calib_led_blink

_read_eeprom_signals_data:

	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _lower_8bits+0
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _upper_8bits+0
	MOVF       R0, 0
	MOVWF      _MIN_CH1_DURATION+1
	CLRF       _MIN_CH1_DURATION+0
	MOVF       _lower_8bits+0, 0
	IORWF       _MIN_CH1_DURATION+0, 1
	MOVLW      0
	IORWF       _MIN_CH1_DURATION+1, 1
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _lower_8bits+0
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _upper_8bits+0
	MOVF       R0, 0
	MOVWF      _MIN_CH2_DURATION+1
	CLRF       _MIN_CH2_DURATION+0
	MOVF       _lower_8bits+0, 0
	IORWF       _MIN_CH2_DURATION+0, 1
	MOVLW      0
	IORWF       _MIN_CH2_DURATION+1, 1
	MOVLW      4
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _lower_8bits+0
	MOVLW      5
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _upper_8bits+0
	MOVF       R0, 0
	MOVWF      _MAX_CH1_DURATION+1
	CLRF       _MAX_CH1_DURATION+0
	MOVF       _lower_8bits+0, 0
	IORWF       _MAX_CH1_DURATION+0, 1
	MOVLW      0
	IORWF       _MAX_CH1_DURATION+1, 1
	MOVLW      6
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _lower_8bits+0
	MOVLW      7
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0, 0
	MOVWF      _upper_8bits+0
	MOVF       R0, 0
	MOVWF      _MAX_CH2_DURATION+1
	CLRF       _MAX_CH2_DURATION+0
	MOVF       _lower_8bits+0, 0
	IORWF       _MAX_CH2_DURATION+0, 1
	MOVLW      0
	IORWF       _MAX_CH2_DURATION+1, 1
L_end_read_eeprom_signals_data:
	RETURN
; end of _read_eeprom_signals_data

_calibration:

	MOVLW      32
	MOVWF      calibration_signal1_L_value_L0+0
	MOVLW      78
	MOVWF      calibration_signal1_L_value_L0+1
	MOVLW      32
	MOVWF      calibration_signal2_L_value_L0+0
	MOVLW      78
	MOVWF      calibration_signal2_L_value_L0+1
	CLRF       calibration_signal1_H_value_L0+0
	CLRF       calibration_signal1_H_value_L0+1
	CLRF       calibration_signal2_H_value_L0+0
	CLRF       calibration_signal2_H_value_L0+1
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      calibration_time_control_L0+0
	MOVF       R1, 0
	MOVWF      calibration_time_control_L0+1
	MOVF       R2, 0
	MOVWF      calibration_time_control_L0+2
	MOVF       R3, 0
	MOVWF      calibration_time_control_L0+3
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
L_calibration46:
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       calibration_time_control_L0+0, 0
	SUBWF      R4, 1
	MOVF       calibration_time_control_L0+1, 0
	SUBWFB     R5, 1
	MOVF       calibration_time_control_L0+2, 0
	SUBWFB     R6, 1
	MOVF       calibration_time_control_L0+3, 0
	SUBWFB     R7, 1
	MOVLW      0
	SUBWF      R7, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration113
	MOVLW      30
	SUBWF      R6, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration113
	MOVLW      132
	SUBWF      R5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration113
	MOVLW      128
	SUBWF      R4, 0
L__calibration113:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration47
	MOVF       _t2_sig1+0, 0
	MOVWF      calibration_signal_T_value_L0+0
	MOVF       _t2_sig1+1, 0
	MOVWF      calibration_signal_T_value_L0+1
	MOVF       calibration_signal1_L_value_L0+1, 0
	SUBWF      _t2_sig1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration114
	MOVF       calibration_signal1_L_value_L0+0, 0
	SUBWF      _t2_sig1+0, 0
L__calibration114:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration48
	MOVF       calibration_signal_T_value_L0+0, 0
	MOVWF      calibration_signal1_L_value_L0+0
	MOVF       calibration_signal_T_value_L0+1, 0
	MOVWF      calibration_signal1_L_value_L0+1
L_calibration48:
	MOVF       _t2_sig2+0, 0
	MOVWF      calibration_signal_T_value_L0+0
	MOVF       _t2_sig2+1, 0
	MOVWF      calibration_signal_T_value_L0+1
	MOVF       calibration_signal2_L_value_L0+1, 0
	SUBWF      _t2_sig2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration115
	MOVF       calibration_signal2_L_value_L0+0, 0
	SUBWF      _t2_sig2+0, 0
L__calibration115:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration49
	MOVF       calibration_signal_T_value_L0+0, 0
	MOVWF      calibration_signal2_L_value_L0+0
	MOVF       calibration_signal_T_value_L0+1, 0
	MOVWF      calibration_signal2_L_value_L0+1
L_calibration49:
	GOTO       L_calibration46
L_calibration47:
	MOVLW      255
	ANDWF      calibration_signal1_L_value_L0+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      _lower_8bits+0
	MOVF       calibration_signal1_L_value_L0+1, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      255
	ANDWF      R0, 0
	MOVWF      _upper_8bits+0
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       R3, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_calibration50:
	DECFSZ     R13, 1
	GOTO       L_calibration50
	DECFSZ     R12, 1
	GOTO       L_calibration50
	NOP
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _upper_8bits+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_calibration51:
	DECFSZ     R13, 1
	GOTO       L_calibration51
	DECFSZ     R12, 1
	GOTO       L_calibration51
	NOP
	MOVLW      255
	ANDWF      calibration_signal2_L_value_L0+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      _lower_8bits+0
	MOVF       calibration_signal2_L_value_L0+1, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      255
	ANDWF      R0, 0
	MOVWF      _upper_8bits+0
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R3, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_calibration52:
	DECFSZ     R13, 1
	GOTO       L_calibration52
	DECFSZ     R12, 1
	GOTO       L_calibration52
	NOP
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _upper_8bits+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_calibration53:
	DECFSZ     R13, 1
	GOTO       L_calibration53
	DECFSZ     R12, 1
	GOTO       L_calibration53
	NOP
	MOVLW      64
	MOVWF      FARG_calib_led_blink_time_ms+0
	MOVLW      6
	MOVWF      FARG_calib_led_blink_time_ms+1
	CALL       _calib_led_blink+0
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      calibration_time_control_L0+0
	MOVF       R1, 0
	MOVWF      calibration_time_control_L0+1
	MOVF       R2, 0
	MOVWF      calibration_time_control_L0+2
	MOVF       R3, 0
	MOVWF      calibration_time_control_L0+3
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
L_calibration54:
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       calibration_time_control_L0+0, 0
	SUBWF      R4, 1
	MOVF       calibration_time_control_L0+1, 0
	SUBWFB     R5, 1
	MOVF       calibration_time_control_L0+2, 0
	SUBWFB     R6, 1
	MOVF       calibration_time_control_L0+3, 0
	SUBWFB     R7, 1
	MOVLW      0
	SUBWF      R7, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration116
	MOVLW      30
	SUBWF      R6, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration116
	MOVLW      132
	SUBWF      R5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration116
	MOVLW      128
	SUBWF      R4, 0
L__calibration116:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration55
	MOVF       _t2_sig1+0, 0
	MOVWF      calibration_signal_T_value_L0+0
	MOVF       _t2_sig1+1, 0
	MOVWF      calibration_signal_T_value_L0+1
	MOVF       _t2_sig1+1, 0
	SUBWF      calibration_signal1_H_value_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration117
	MOVF       _t2_sig1+0, 0
	SUBWF      calibration_signal1_H_value_L0+0, 0
L__calibration117:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration56
	MOVF       calibration_signal_T_value_L0+0, 0
	MOVWF      calibration_signal1_H_value_L0+0
	MOVF       calibration_signal_T_value_L0+1, 0
	MOVWF      calibration_signal1_H_value_L0+1
L_calibration56:
	MOVF       _t2_sig2+0, 0
	MOVWF      calibration_signal_T_value_L0+0
	MOVF       _t2_sig2+1, 0
	MOVWF      calibration_signal_T_value_L0+1
	MOVF       _t2_sig2+1, 0
	SUBWF      calibration_signal2_H_value_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration118
	MOVF       _t2_sig2+0, 0
	SUBWF      calibration_signal2_H_value_L0+0, 0
L__calibration118:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration57
	MOVF       calibration_signal_T_value_L0+0, 0
	MOVWF      calibration_signal2_H_value_L0+0
	MOVF       calibration_signal_T_value_L0+1, 0
	MOVWF      calibration_signal2_H_value_L0+1
L_calibration57:
	GOTO       L_calibration54
L_calibration55:
	MOVLW      255
	ANDWF      calibration_signal1_H_value_L0+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      _lower_8bits+0
	MOVF       calibration_signal1_H_value_L0+1, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      255
	ANDWF      R0, 0
	MOVWF      _upper_8bits+0
	MOVLW      4
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R3, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_calibration58:
	DECFSZ     R13, 1
	GOTO       L_calibration58
	DECFSZ     R12, 1
	GOTO       L_calibration58
	NOP
	MOVLW      5
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _upper_8bits+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_calibration59:
	DECFSZ     R13, 1
	GOTO       L_calibration59
	DECFSZ     R12, 1
	GOTO       L_calibration59
	NOP
	MOVLW      255
	ANDWF      calibration_signal2_H_value_L0+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      _lower_8bits+0
	MOVF       calibration_signal2_H_value_L0+1, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      255
	ANDWF      R0, 0
	MOVWF      _upper_8bits+0
	MOVLW      6
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R3, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_calibration60:
	DECFSZ     R13, 1
	GOTO       L_calibration60
	DECFSZ     R12, 1
	GOTO       L_calibration60
	NOP
	MOVLW      7
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _upper_8bits+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_calibration61:
	DECFSZ     R13, 1
	GOTO       L_calibration61
	DECFSZ     R12, 1
	GOTO       L_calibration61
	NOP
	MOVLW      64
	MOVWF      FARG_calib_led_blink_time_ms+0
	MOVLW      6
	MOVWF      FARG_calib_led_blink_time_ms+1
	CALL       _calib_led_blink+0
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
	CALL       _read_eeprom_signals_data+0
L_end_calibration:
	RETURN
; end of _calibration

_print_signal_received:

	MOVLW      ?lstr1_Controlador5A+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_Controlador5A+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
	MOVF       _t2_sig1+0, 0
	MOVWF      FARG_LongWordToStr_input+0
	MOVF       _t2_sig1+1, 0
	MOVWF      FARG_LongWordToStr_input+1
	MOVF       _t2_sig1+2, 0
	MOVWF      FARG_LongWordToStr_input+2
	MOVF       _t2_sig1+3, 0
	MOVWF      FARG_LongWordToStr_input+3
	MOVLW      print_signal_received_buffer_L0+0
	MOVWF      FARG_LongWordToStr_output+0
	MOVLW      hi_addr(print_signal_received_buffer_L0+0)
	MOVWF      FARG_LongWordToStr_output+1
	CALL       _LongWordToStr+0
	MOVLW      print_signal_received_buffer_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(print_signal_received_buffer_L0+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
	MOVLW      ?lstr2_Controlador5A+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_Controlador5A+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
	MOVLW      ?lstr3_Controlador5A+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_Controlador5A+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
	MOVF       _t2_sig2+0, 0
	MOVWF      FARG_LongWordToStr_input+0
	MOVF       _t2_sig2+1, 0
	MOVWF      FARG_LongWordToStr_input+1
	MOVF       _t2_sig2+2, 0
	MOVWF      FARG_LongWordToStr_input+2
	MOVF       _t2_sig2+3, 0
	MOVWF      FARG_LongWordToStr_input+3
	MOVLW      print_signal_received_buffer_L0+0
	MOVWF      FARG_LongWordToStr_output+0
	MOVLW      hi_addr(print_signal_received_buffer_L0+0)
	MOVWF      FARG_LongWordToStr_output+1
	CALL       _LongWordToStr+0
	MOVLW      print_signal_received_buffer_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(print_signal_received_buffer_L0+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
	MOVLW      ?lstr4_Controlador5A+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr4_Controlador5A+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_print_signal_received62:
	DECFSZ     R13, 1
	GOTO       L_print_signal_received62
	DECFSZ     R12, 1
	GOTO       L_print_signal_received62
	DECFSZ     R11, 1
	GOTO       L_print_signal_received62
	NOP
L_end_print_signal_received:
	RETURN
; end of _print_signal_received

_errorFlags:

	CLRF       R1
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	INCF       R1, 1
	MOVF       R1, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_errorFlags64
	CLRF       R1
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	INCF       R1, 1
	MOVF       R1, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_errorFlags64
	CLRF       R0
	GOTO       L_errorFlags63
L_errorFlags64:
	MOVLW      1
	MOVWF      R0
L_errorFlags63:
	MOVLW      0
	MOVWF      R1
L_end_errorFlags:
	RETURN
; end of _errorFlags

_main:

	MOVLW      114
	MOVWF      OSCCON+0
	CALL       _setup_port+0
	CALL       _setup_pwms+0
	CALL       _setup_Timer_1+0
	MOVLW      4
	MOVWF      R11
	MOVLW      12
	MOVWF      R12
	MOVLW      51
	MOVWF      R13
L_main65:
	DECFSZ     R13, 1
	GOTO       L_main65
	DECFSZ     R12, 1
	GOTO       L_main65
	DECFSZ     R11, 1
	GOTO       L_main65
	NOP
	NOP
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main66
	CALL       _calibration+0
L_main66:
L_main67:
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
L_main69:
	CALL       _failSafeCheck+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main70
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
	MOVLW      1
	MOVWF      FARG_set_duty_cycle_channel+0
	MOVLW      0
	MOVWF      FARG_set_duty_cycle_channel+1
	CLRF       FARG_set_duty_cycle_duty+0
	CLRF       FARG_set_duty_cycle_duty+1
	CALL       _set_duty_cycle+0
	MOVLW      2
	MOVWF      FARG_set_duty_cycle_channel+0
	MOVLW      0
	MOVWF      FARG_set_duty_cycle_channel+1
	CLRF       FARG_set_duty_cycle_duty+0
	CLRF       FARG_set_duty_cycle_duty+1
	CALL       _set_duty_cycle+0
	GOTO       L_main69
L_main70:
	CALL       _rotateMotor+0
	GOTO       L_main67
L_end_main:
	GOTO       $+0
; end of _main


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
	GOTO       L__set_duty_cycle96
	MOVLW      1
	XORWF      FARG_set_duty_cycle_channel+0, 0
L__set_duty_cycle96:
	BTFSS      STATUS+0, 2
	GOTO       L_set_duty_cycle0
	MOVF       FARG_set_duty_cycle_duty+0, 0
	MOVWF      CCPR1L+0
L_set_duty_cycle0:
	MOVLW      0
	XORWF      FARG_set_duty_cycle_channel+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_duty_cycle97
	MOVLW      2
	XORWF      FARG_set_duty_cycle_channel+0, 0
L__set_duty_cycle97:
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
	GOTO       L__pwm_steering99
	MOVLW      1
	XORWF      FARG_pwm_steering_channel+0, 0
L__pwm_steering99:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering2
	BCF        PSTR1CON+0, 0
	BCF        PSTR1CON+0, 1
	MOVLW      0
	XORWF      FARG_pwm_steering_port+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering100
	MOVLW      1
	XORWF      FARG_pwm_steering_port+0, 0
L__pwm_steering100:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering3
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	BSF        PSTR1CON+0, 0
L_pwm_steering3:
	MOVLW      0
	XORWF      FARG_pwm_steering_port+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering101
	MOVLW      2
	XORWF      FARG_pwm_steering_port+0, 0
L__pwm_steering101:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering4
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BSF        PSTR1CON+0, 1
L_pwm_steering4:
L_pwm_steering2:
	MOVLW      0
	XORWF      FARG_pwm_steering_channel+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering102
	MOVLW      2
	XORWF      FARG_pwm_steering_channel+0, 0
L__pwm_steering102:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering5
	BCF        PSTR2CON+0, 0
	BCF        PSTR2CON+0, 1
	MOVLW      0
	XORWF      FARG_pwm_steering_port+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering103
	MOVLW      1
	XORWF      FARG_pwm_steering_port+0, 0
L__pwm_steering103:
	BTFSS      STATUS+0, 2
	GOTO       L_pwm_steering6
	BCF        RA4_bit+0, BitPos(RA4_bit+0)
	BSF        PSTR2CON+0, 0
L_pwm_steering6:
	MOVLW      0
	XORWF      FARG_pwm_steering_port+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pwm_steering104
	MOVLW      2
	XORWF      FARG_pwm_steering_port+0, 0
L__pwm_steering104:
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
	GOTO       L__failSafeCheck110
	MOVF       R6, 0
	SUBLW      76
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck110
	MOVF       R5, 0
	SUBLW      75
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck110
	MOVF       R4, 0
	SUBLW      64
L__failSafeCheck110:
	BTFSS      STATUS+0, 0
	GOTO       L__failSafeCheck86
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
	GOTO       L__failSafeCheck111
	MOVF       R6, 0
	SUBLW      76
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck111
	MOVF       R5, 0
	SUBLW      75
	BTFSS      STATUS+0, 2
	GOTO       L__failSafeCheck111
	MOVF       R4, 0
	SUBLW      64
L__failSafeCheck111:
	BTFSS      STATUS+0, 0
	GOTO       L__failSafeCheck86
	GOTO       L_failSafeCheck11
L__failSafeCheck86:
	MOVLW      1
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	GOTO       L_end_failSafeCheck
L_failSafeCheck11:
	CLRF       R0
	CLRF       R1
L_end_failSafeCheck:
	RETURN
; end of _failSafeCheck

_PulseIn1:

	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      PulseIn1_flag_L0+0
	MOVF       R1, 0
	MOVWF      PulseIn1_flag_L0+1
	MOVF       R2, 0
	MOVWF      PulseIn1_flag_L0+2
	MOVF       R3, 0
	MOVWF      PulseIn1_flag_L0+3
L_PulseIn112:
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_PulseIn113
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       PulseIn1_flag_L0+0, 0
	SUBWF      R4, 1
	MOVF       PulseIn1_flag_L0+1, 0
	SUBWFB     R5, 1
	MOVF       PulseIn1_flag_L0+2, 0
	SUBWFB     R6, 1
	MOVF       PulseIn1_flag_L0+3, 0
	SUBWFB     R7, 1
	MOVF       R7, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1113
	MOVF       R6, 0
	SUBLW      76
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1113
	MOVF       R5, 0
	SUBLW      75
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1113
	MOVF       R4, 0
	SUBLW      64
L__PulseIn1113:
	BTFSC      STATUS+0, 0
	GOTO       L_PulseIn114
	CLRF       R0
	CLRF       R1
	CLRF       R2
	CLRF       R3
	GOTO       L_end_PulseIn1
L_PulseIn114:
	GOTO       L_PulseIn112
L_PulseIn113:
L_PulseIn115:
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_PulseIn116
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       PulseIn1_flag_L0+0, 0
	SUBWF      R4, 1
	MOVF       PulseIn1_flag_L0+1, 0
	SUBWFB     R5, 1
	MOVF       PulseIn1_flag_L0+2, 0
	SUBWFB     R6, 1
	MOVF       PulseIn1_flag_L0+3, 0
	SUBWFB     R7, 1
	MOVF       R7, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1114
	MOVF       R6, 0
	SUBLW      76
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1114
	MOVF       R5, 0
	SUBLW      75
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1114
	MOVF       R4, 0
	SUBLW      64
L__PulseIn1114:
	BTFSC      STATUS+0, 0
	GOTO       L_PulseIn117
	CLRF       R0
	CLRF       R1
	CLRF       R2
	CLRF       R3
	GOTO       L_end_PulseIn1
L_PulseIn117:
	GOTO       L_PulseIn115
L_PulseIn116:
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _t1_sig1+0
	MOVF       R1, 0
	MOVWF      _t1_sig1+1
	MOVF       R2, 0
	MOVWF      _t1_sig1+2
	MOVF       R3, 0
	MOVWF      _t1_sig1+3
L_PulseIn118:
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_PulseIn119
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       PulseIn1_flag_L0+0, 0
	SUBWF      R4, 1
	MOVF       PulseIn1_flag_L0+1, 0
	SUBWFB     R5, 1
	MOVF       PulseIn1_flag_L0+2, 0
	SUBWFB     R6, 1
	MOVF       PulseIn1_flag_L0+3, 0
	SUBWFB     R7, 1
	MOVF       R7, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1115
	MOVF       R6, 0
	SUBLW      76
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1115
	MOVF       R5, 0
	SUBLW      75
	BTFSS      STATUS+0, 2
	GOTO       L__PulseIn1115
	MOVF       R4, 0
	SUBLW      64
L__PulseIn1115:
	BTFSC      STATUS+0, 0
	GOTO       L_PulseIn120
	CLRF       R0
	CLRF       R1
	CLRF       R2
	CLRF       R3
	GOTO       L_end_PulseIn1
L_PulseIn120:
	GOTO       L_PulseIn118
L_PulseIn119:
	CALL       _micros+0
	MOVF       _t1_sig1+0, 0
	SUBWF      R0, 1
	MOVF       _t1_sig1+1, 0
	SUBWFB     R1, 1
	MOVF       _t1_sig1+2, 0
	SUBWFB     R2, 1
	MOVF       _t1_sig1+3, 0
	SUBWFB     R3, 1
	MOVF       R0, 0
	MOVWF      _t1_sig1+0
	MOVF       R1, 0
	MOVWF      _t1_sig1+1
	MOVF       R2, 0
	MOVWF      _t1_sig1+2
	MOVF       R3, 0
	MOVWF      _t1_sig1+3
L_end_PulseIn1:
	RETURN
; end of _PulseIn1

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

	MOVLW      1
	MOVWF      rotateMotor_k_L0+0
	MOVLW      0
	MOVWF      rotateMotor_k_L0+1
	MOVF       _t2_sig1+0, 0
	MOVWF      rotateMotor_pulseWidth1_L0+0
	MOVF       _t2_sig1+1, 0
	MOVWF      rotateMotor_pulseWidth1_L0+1
	MOVF       _t2_sig2+0, 0
	MOVWF      rotateMotor_pulseWidth2_L0+0
	MOVF       _t2_sig2+1, 0
	MOVWF      rotateMotor_pulseWidth2_L0+1
	MOVF       _t2_sig1+0, 0
	MOVWF      FARG_map_x+0
	MOVF       _t2_sig1+1, 0
	MOVWF      FARG_map_x+1
	CLRF       FARG_map_x+2
	CLRF       FARG_map_x+3
	MOVLW      76
	MOVWF      FARG_map_in_min+0
	MOVLW      4
	MOVWF      FARG_map_in_min+1
	CLRF       FARG_map_in_min+2
	CLRF       FARG_map_in_min+3
	MOVLW      108
	MOVWF      FARG_map_in_max+0
	MOVLW      7
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
	MOVWF      rotateMotor_pulseWidth1_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_pulseWidth1_L0+1
	MOVF       rotateMotor_pulseWidth2_L0+0, 0
	MOVWF      FARG_map_x+0
	MOVF       rotateMotor_pulseWidth2_L0+1, 0
	MOVWF      FARG_map_x+1
	CLRF       FARG_map_x+2
	CLRF       FARG_map_x+3
	MOVLW      76
	MOVWF      FARG_map_in_min+0
	MOVLW      4
	MOVWF      FARG_map_in_min+1
	CLRF       FARG_map_in_min+2
	CLRF       FARG_map_in_min+3
	MOVLW      108
	MOVWF      FARG_map_in_max+0
	MOVLW      7
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
	MOVWF      FLOC__rotateMotor+2
	MOVF       R1, 0
	MOVWF      FLOC__rotateMotor+3
	MOVF       R2, 0
	MOVWF      FLOC__rotateMotor+4
	MOVF       R3, 0
	MOVWF      FLOC__rotateMotor+5
	MOVF       FLOC__rotateMotor+2, 0
	MOVWF      rotateMotor_pulseWidth2_L0+0
	MOVF       FLOC__rotateMotor+3, 0
	MOVWF      rotateMotor_pulseWidth2_L0+1
	MOVF       rotateMotor_pulseWidth1_L0+0, 0
	ADDWF      FLOC__rotateMotor+2, 0
	MOVWF      R0
	MOVF       rotateMotor_pulseWidth1_L0+1, 0
	ADDWFC     FLOC__rotateMotor+3, 0
	MOVWF      R1
	MOVF       rotateMotor_k_L0+0, 0
	MOVWF      R4
	MOVF       rotateMotor_k_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVF       R0, 0
	MOVWF      FLOC__rotateMotor+0
	MOVF       R1, 0
	MOVWF      FLOC__rotateMotor+1
	MOVF       FLOC__rotateMotor+0, 0
	MOVWF      rotateMotor_duty_cycle1_L0+0
	MOVF       FLOC__rotateMotor+1, 0
	MOVWF      rotateMotor_duty_cycle1_L0+1
	MOVF       rotateMotor_pulseWidth1_L0+0, 0
	SUBWF      FLOC__rotateMotor+2, 0
	MOVWF      R0
	MOVF       rotateMotor_pulseWidth1_L0+1, 0
	SUBWFB     FLOC__rotateMotor+3, 0
	MOVWF      R1
	MOVF       rotateMotor_k_L0+0, 0
	MOVWF      R4
	MOVF       rotateMotor_k_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVF       R0, 0
	MOVWF      rotateMotor_duty_cycle2_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_duty_cycle2_L0+1
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      FLOC__rotateMotor+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor118
	MOVF       FLOC__rotateMotor+0, 0
	SUBLW      255
L__rotateMotor118:
	BTFSS      STATUS+0, 0
	GOTO       L__rotateMotor90
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor119
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBLW      255
L__rotateMotor119:
	BTFSS      STATUS+0, 0
	GOTO       L__rotateMotor90
	GOTO       L_rotateMotor23
L__rotateMotor90:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor120
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	SUBWF      rotateMotor_duty_cycle2_L0+0, 0
L__rotateMotor120:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor24
	MOVLW      255
	MOVWF      R4
	CLRF       R5
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	MOVWF      R0
	MOVF       rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      rotateMotor_k_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_k_L0+1
	GOTO       L_rotateMotor25
L_rotateMotor24:
	MOVLW      255
	MOVWF      R4
	CLRF       R5
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	MOVWF      R0
	MOVF       rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      rotateMotor_k_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_k_L0+1
L_rotateMotor25:
	MOVF       rotateMotor_pulseWidth1_L0+0, 0
	ADDWF      rotateMotor_pulseWidth2_L0+0, 0
	MOVWF      R0
	MOVF       rotateMotor_pulseWidth1_L0+1, 0
	ADDWFC     rotateMotor_pulseWidth2_L0+1, 0
	MOVWF      R1
	MOVF       rotateMotor_k_L0+0, 0
	MOVWF      R4
	MOVF       rotateMotor_k_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVF       R0, 0
	MOVWF      rotateMotor_duty_cycle1_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_duty_cycle1_L0+1
	MOVF       rotateMotor_pulseWidth1_L0+0, 0
	SUBWF      rotateMotor_pulseWidth2_L0+0, 0
	MOVWF      R0
	MOVF       rotateMotor_pulseWidth1_L0+1, 0
	SUBWFB     rotateMotor_pulseWidth2_L0+1, 0
	MOVWF      R1
	MOVF       rotateMotor_k_L0+0, 0
	MOVWF      R4
	MOVF       rotateMotor_k_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVF       R0, 0
	MOVWF      rotateMotor_duty_cycle2_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_duty_cycle2_L0+1
L_rotateMotor23:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      255
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor121
	MOVLW      1
	SUBWF      rotateMotor_duty_cycle1_L0+0, 0
L__rotateMotor121:
	BTFSS      STATUS+0, 0
	GOTO       L__rotateMotor89
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      255
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor122
	MOVLW      1
	SUBWF      rotateMotor_duty_cycle2_L0+0, 0
L__rotateMotor122:
	BTFSS      STATUS+0, 0
	GOTO       L__rotateMotor89
	GOTO       L_rotateMotor28
L__rotateMotor89:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor123
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBWF      rotateMotor_duty_cycle1_L0+0, 0
L__rotateMotor123:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor29
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       rotateMotor_duty_cycle1_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVLW      255
	MOVWF      R4
	CLRF       R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      rotateMotor_k_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_k_L0+1
	GOTO       L_rotateMotor30
L_rotateMotor29:
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       rotateMotor_duty_cycle2_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVLW      255
	MOVWF      R4
	CLRF       R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      rotateMotor_k_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_k_L0+1
L_rotateMotor30:
	MOVF       rotateMotor_pulseWidth1_L0+0, 0
	ADDWF      rotateMotor_pulseWidth2_L0+0, 0
	MOVWF      R0
	MOVF       rotateMotor_pulseWidth1_L0+1, 0
	ADDWFC     rotateMotor_pulseWidth2_L0+1, 0
	MOVWF      R1
	MOVF       rotateMotor_k_L0+0, 0
	MOVWF      R4
	MOVF       rotateMotor_k_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVF       R0, 0
	MOVWF      rotateMotor_duty_cycle1_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_duty_cycle1_L0+1
	MOVF       rotateMotor_pulseWidth1_L0+0, 0
	SUBWF      rotateMotor_pulseWidth2_L0+0, 0
	MOVWF      R0
	MOVF       rotateMotor_pulseWidth1_L0+1, 0
	SUBWFB     rotateMotor_pulseWidth2_L0+1, 0
	MOVWF      R1
	MOVF       rotateMotor_k_L0+0, 0
	MOVWF      R4
	MOVF       rotateMotor_k_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVF       R0, 0
	MOVWF      rotateMotor_duty_cycle2_L0+0
	MOVF       R1, 0
	MOVWF      rotateMotor_duty_cycle2_L0+1
L_rotateMotor28:
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	MOVWF      FARG_map_x+0
	MOVF       rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      FARG_map_x+1
	MOVLW      0
	BTFSC      FARG_map_x+1, 7
	MOVLW      255
	MOVWF      FARG_map_x+2
	MOVWF      FARG_map_x+3
	MOVLW      1
	MOVWF      FARG_map_in_min+0
	MOVLW      255
	MOVWF      FARG_map_in_min+1
	MOVLW      255
	MOVWF      FARG_map_in_min+2
	MOVWF      FARG_map_in_min+3
	MOVLW      255
	MOVWF      FARG_map_in_max+0
	CLRF       FARG_map_in_max+1
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
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	MOVWF      FARG_map_x+0
	MOVF       rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      FARG_map_x+1
	MOVLW      0
	BTFSC      FARG_map_x+1, 7
	MOVLW      255
	MOVWF      FARG_map_x+2
	MOVWF      FARG_map_x+3
	MOVLW      1
	MOVWF      FARG_map_in_min+0
	MOVLW      255
	MOVWF      FARG_map_in_min+1
	MOVLW      255
	MOVWF      FARG_map_in_min+2
	MOVWF      FARG_map_in_min+3
	MOVLW      255
	MOVWF      FARG_map_in_max+0
	CLRF       FARG_map_in_max+1
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
	GOTO       L__rotateMotor124
	MOVLW      1
	SUBWF      rotateMotor_duty_cycle1_L0+0, 0
L__rotateMotor124:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor31
	MOVLW      1
	MOVWF      rotateMotor_duty_cycle1_L0+0
	MOVLW      255
	MOVWF      rotateMotor_duty_cycle1_L0+1
L_rotateMotor31:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor125
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	SUBLW      255
L__rotateMotor125:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor32
	MOVLW      255
	MOVWF      rotateMotor_duty_cycle1_L0+0
	CLRF       rotateMotor_duty_cycle1_L0+1
L_rotateMotor32:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      255
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor126
	MOVLW      1
	SUBWF      rotateMotor_duty_cycle2_L0+0, 0
L__rotateMotor126:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor33
	MOVLW      1
	MOVWF      rotateMotor_duty_cycle2_L0+0
	MOVLW      255
	MOVWF      rotateMotor_duty_cycle2_L0+1
L_rotateMotor33:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor127
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBLW      255
L__rotateMotor127:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor34
	MOVLW      255
	MOVWF      rotateMotor_duty_cycle2_L0+0
	CLRF       rotateMotor_duty_cycle2_L0+1
L_rotateMotor34:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor128
	MOVLW      10
	SUBWF      rotateMotor_duty_cycle1_L0+0, 0
L__rotateMotor128:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor37
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor129
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	SUBLW      246
L__rotateMotor129:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor37
L__rotateMotor88:
	CLRF       rotateMotor_duty_cycle1_L0+0
	CLRF       rotateMotor_duty_cycle1_L0+1
L_rotateMotor37:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor130
	MOVLW      10
	SUBWF      rotateMotor_duty_cycle2_L0+0, 0
L__rotateMotor130:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor40
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor131
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBLW      246
L__rotateMotor131:
	BTFSC      STATUS+0, 0
	GOTO       L_rotateMotor40
L__rotateMotor87:
	CLRF       rotateMotor_duty_cycle2_L0+0
	CLRF       rotateMotor_duty_cycle2_L0+1
L_rotateMotor40:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor132
	MOVLW      0
	SUBWF      rotateMotor_duty_cycle1_L0+0, 0
L__rotateMotor132:
	BTFSS      STATUS+0, 0
	GOTO       L_rotateMotor41
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
	GOTO       L_rotateMotor42
L_rotateMotor41:
	MOVF       rotateMotor_duty_cycle1_L0+0, 0
	SUBLW      0
	MOVWF      rotateMotor_duty_cycle1_L0+0
	MOVF       rotateMotor_duty_cycle1_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       rotateMotor_duty_cycle1_L0+1
	SUBWF      rotateMotor_duty_cycle1_L0+1, 1
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
	MOVWF      FARG_set_duty_cycle_duty+0
	MOVF       rotateMotor_duty_cycle1_L0+1, 0
	MOVWF      FARG_set_duty_cycle_duty+1
	CALL       _set_duty_cycle+0
L_rotateMotor42:
	MOVLW      128
	XORWF      rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotateMotor133
	MOVLW      0
	SUBWF      rotateMotor_duty_cycle2_L0+0, 0
L__rotateMotor133:
	BTFSS      STATUS+0, 0
	GOTO       L_rotateMotor43
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
	GOTO       L_rotateMotor44
L_rotateMotor43:
	MOVF       rotateMotor_duty_cycle2_L0+0, 0
	SUBLW      0
	MOVWF      rotateMotor_duty_cycle2_L0+0
	MOVF       rotateMotor_duty_cycle2_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       rotateMotor_duty_cycle2_L0+1
	SUBWF      rotateMotor_duty_cycle2_L0+1, 1
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
	MOVWF      FARG_set_duty_cycle_duty+0
	MOVF       rotateMotor_duty_cycle2_L0+1, 0
	MOVWF      FARG_set_duty_cycle_duty+1
	CALL       _set_duty_cycle+0
L_rotateMotor44:
L_end_rotateMotor:
	RETURN
; end of _rotateMotor

_interrupt:

	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_interrupt45
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	INCF       _n_interrupts_timer1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _n_interrupts_timer1+1, 1
L_interrupt45:
	BTFSS      CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	GOTO       L_interrupt48
	BTFSS      CCP3CON+0, 0
	GOTO       L_interrupt48
L__interrupt92:
	BCF        CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	BCF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
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
	BSF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	GOTO       L_interrupt49
L_interrupt48:
	BTFSS      CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	GOTO       L_interrupt50
	BCF        CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	BCF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
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
	BSF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _last_measure1+0
	MOVF       R1, 0
	MOVWF      _last_measure1+1
	MOVF       R2, 0
	MOVWF      _last_measure1+2
	MOVF       R3, 0
	MOVWF      _last_measure1+3
L_interrupt50:
L_interrupt49:
	BTFSS      CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	GOTO       L_interrupt53
	BTFSS      CCP4CON+0, 0
	GOTO       L_interrupt53
L__interrupt91:
	BCF        CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	BCF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
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
	BSF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	GOTO       L_interrupt54
L_interrupt53:
	BTFSS      CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	GOTO       L_interrupt55
	BCF        CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	BCF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
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
	BSF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      _last_measure2+0
	MOVF       R1, 0
	MOVWF      _last_measure2+1
	MOVF       R2, 0
	MOVWF      _last_measure2+2
	MOVF       R3, 0
	MOVWF      _last_measure2+3
L_interrupt55:
L_interrupt54:
L_end_interrupt:
L__interrupt135:
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
L_error_led_blink56:
	MOVF       FARG_error_led_blink_time_ms+1, 0
	SUBWF      error_led_blink_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__error_led_blink137
	MOVF       FARG_error_led_blink_time_ms+0, 0
	SUBWF      error_led_blink_i_L0+0, 0
L__error_led_blink137:
	BTFSC      STATUS+0, 0
	GOTO       L_error_led_blink57
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_error_led_blink59:
	DECFSZ     R13, 1
	GOTO       L_error_led_blink59
	DECFSZ     R12, 1
	GOTO       L_error_led_blink59
	DECFSZ     R11, 1
	GOTO       L_error_led_blink59
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_error_led_blink60:
	DECFSZ     R13, 1
	GOTO       L_error_led_blink60
	DECFSZ     R12, 1
	GOTO       L_error_led_blink60
	DECFSZ     R11, 1
	GOTO       L_error_led_blink60
	INCF       error_led_blink_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       error_led_blink_i_L0+1, 1
	GOTO       L_error_led_blink56
L_error_led_blink57:
L_end_error_led_blink:
	RETURN
; end of _error_led_blink

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
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
L_calibration61:
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
	GOTO       L__calibration139
	MOVLW      30
	SUBWF      R6, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration139
	MOVLW      132
	SUBWF      R5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration139
	MOVLW      128
	SUBWF      R4, 0
L__calibration139:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration62
	MOVF       _t2_sig1+0, 0
	MOVWF      calibration_signal_T_value_L0+0
	MOVF       _t2_sig1+1, 0
	MOVWF      calibration_signal_T_value_L0+1
	MOVF       calibration_signal1_L_value_L0+1, 0
	SUBWF      _t2_sig1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration140
	MOVF       calibration_signal1_L_value_L0+0, 0
	SUBWF      _t2_sig1+0, 0
L__calibration140:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration63
	MOVF       calibration_signal_T_value_L0+0, 0
	MOVWF      calibration_signal1_L_value_L0+0
	MOVF       calibration_signal_T_value_L0+1, 0
	MOVWF      calibration_signal1_L_value_L0+1
L_calibration63:
	MOVF       _t2_sig2+0, 0
	MOVWF      calibration_signal_T_value_L0+0
	MOVF       _t2_sig2+1, 0
	MOVWF      calibration_signal_T_value_L0+1
	MOVF       calibration_signal2_L_value_L0+1, 0
	SUBWF      _t2_sig2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration141
	MOVF       calibration_signal2_L_value_L0+0, 0
	SUBWF      _t2_sig2+0, 0
L__calibration141:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration64
	MOVF       calibration_signal_T_value_L0+0, 0
	MOVWF      calibration_signal2_L_value_L0+0
	MOVF       calibration_signal_T_value_L0+1, 0
	MOVWF      calibration_signal2_L_value_L0+1
L_calibration64:
	GOTO       L_calibration61
L_calibration62:
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
L_calibration65:
	DECFSZ     R13, 1
	GOTO       L_calibration65
	DECFSZ     R12, 1
	GOTO       L_calibration65
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
L_calibration66:
	DECFSZ     R13, 1
	GOTO       L_calibration66
	DECFSZ     R12, 1
	GOTO       L_calibration66
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
L_calibration67:
	DECFSZ     R13, 1
	GOTO       L_calibration67
	DECFSZ     R12, 1
	GOTO       L_calibration67
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
L_calibration68:
	DECFSZ     R13, 1
	GOTO       L_calibration68
	DECFSZ     R12, 1
	GOTO       L_calibration68
	NOP
	MOVLW      64
	MOVWF      FARG_error_led_blink_time_ms+0
	MOVLW      6
	MOVWF      FARG_error_led_blink_time_ms+1
	CALL       _error_led_blink+0
	CALL       _micros+0
	MOVF       R0, 0
	MOVWF      calibration_time_control_L0+0
	MOVF       R1, 0
	MOVWF      calibration_time_control_L0+1
	MOVF       R2, 0
	MOVWF      calibration_time_control_L0+2
	MOVF       R3, 0
	MOVWF      calibration_time_control_L0+3
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
L_calibration69:
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
	GOTO       L__calibration142
	MOVLW      30
	SUBWF      R6, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration142
	MOVLW      132
	SUBWF      R5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration142
	MOVLW      128
	SUBWF      R4, 0
L__calibration142:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration70
	MOVF       _t2_sig1+0, 0
	MOVWF      calibration_signal_T_value_L0+0
	MOVF       _t2_sig1+1, 0
	MOVWF      calibration_signal_T_value_L0+1
	MOVF       _t2_sig1+1, 0
	SUBWF      calibration_signal1_H_value_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration143
	MOVF       _t2_sig1+0, 0
	SUBWF      calibration_signal1_H_value_L0+0, 0
L__calibration143:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration71
	MOVF       calibration_signal_T_value_L0+0, 0
	MOVWF      calibration_signal1_H_value_L0+0
	MOVF       calibration_signal_T_value_L0+1, 0
	MOVWF      calibration_signal1_H_value_L0+1
L_calibration71:
	MOVF       _t2_sig2+0, 0
	MOVWF      calibration_signal_T_value_L0+0
	MOVF       _t2_sig2+1, 0
	MOVWF      calibration_signal_T_value_L0+1
	MOVF       _t2_sig2+1, 0
	SUBWF      calibration_signal2_H_value_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__calibration144
	MOVF       _t2_sig2+0, 0
	SUBWF      calibration_signal2_H_value_L0+0, 0
L__calibration144:
	BTFSC      STATUS+0, 0
	GOTO       L_calibration72
	MOVF       calibration_signal_T_value_L0+0, 0
	MOVWF      calibration_signal2_H_value_L0+0
	MOVF       calibration_signal_T_value_L0+1, 0
	MOVWF      calibration_signal2_H_value_L0+1
L_calibration72:
	GOTO       L_calibration69
L_calibration70:
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
L_calibration73:
	DECFSZ     R13, 1
	GOTO       L_calibration73
	DECFSZ     R12, 1
	GOTO       L_calibration73
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
L_calibration74:
	DECFSZ     R13, 1
	GOTO       L_calibration74
	DECFSZ     R12, 1
	GOTO       L_calibration74
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
L_calibration75:
	DECFSZ     R13, 1
	GOTO       L_calibration75
	DECFSZ     R12, 1
	GOTO       L_calibration75
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
L_calibration76:
	DECFSZ     R13, 1
	GOTO       L_calibration76
	DECFSZ     R12, 1
	GOTO       L_calibration76
	NOP
	MOVLW      64
	MOVWF      FARG_error_led_blink_time_ms+0
	MOVLW      6
	MOVWF      FARG_error_led_blink_time_ms+1
	CALL       _error_led_blink+0
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
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
L_print_signal_received77:
	DECFSZ     R13, 1
	GOTO       L_print_signal_received77
	DECFSZ     R12, 1
	GOTO       L_print_signal_received77
	DECFSZ     R11, 1
	GOTO       L_print_signal_received77
	NOP
L_end_print_signal_received:
	RETURN
; end of _print_signal_received

_errorFlags:

	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__errorFlags93
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__errorFlags93
	GOTO       L_errorFlags80
L__errorFlags93:
	MOVLW      1
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	GOTO       L_end_errorFlags
L_errorFlags80:
	CLRF       R0
	CLRF       R1
L_end_errorFlags:
	RETURN
; end of _errorFlags

_main:

	MOVLW      114
	MOVWF      OSCCON+0
	CALL       _setup_port+0
	CALL       _setup_pwms+0
	CALL       _setup_Timer_1+0
L_main81:
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
L_main83:
	CALL       _failSafeCheck+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main84
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
	GOTO       L_main83
L_main84:
	CALL       _rotateMotor+0
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main85:
	DECFSZ     R13, 1
	GOTO       L_main85
	DECFSZ     R12, 1
	GOTO       L_main85
	DECFSZ     R11, 1
	GOTO       L_main85
	GOTO       L_main81
L_end_main:
	GOTO       $+0
; end of _main

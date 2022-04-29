;==========================================================================
;--------------------------|CPU Activation Commands|-----------------------
;==========================================================================
[Command]
name = "cpu1"
command = ~D,UB, F, x, s, a, x, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu2"
command = ~D,UB, F, y, s, a, x, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu3"
command = ~D,UB, F, z, s, a, x, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu4"
command = ~D,DB, F, x, s,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu5"
command = ~D,DB, F, y, s,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu6"
command = ~D,DB, F, z, s,x+y+z+a+b+c+s
time = 1

[Command]
name = "cpu7"
command = ~D,DB, s, U, B, x ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu8"
command = ~D,DB, s, U, B, y ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu9"
command = ~D,DB, s, U, B, z ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu10"
command = ~D,DF, F, x, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu11"
command = ~D,DF, F, y, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu12"
command = ~D,DF, F, z, s, U ,x+y+z+a+b+c+s
time = 1

[Command]
name = "cpu13"
command = ~D,DF, F, a, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu14"
command = ~D,DF, F, b, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu15"
command = ~D,DF, F, c, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu16"
command = ~D,DB, B, a, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu17"
command = ~D,DB, B, b, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu18"
command = ~D,DB, B, c, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu19"
command = ~D,DB, F, a, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu20"
command = ~D,DB, F, b, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu21"
command = ~D,DB, F, c, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu22"
command = ~D,UB, F, a, s, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu23"
command = ~D,UB, F, b, s, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu24"
command = ~D,UB, F, c, s, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu25"
command = ~D,DF, F, s, s, U,x+y+z+a+b+c+s
time = 1
; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 20

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
;command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "SUPER"
command = ~D, DF, F, D, DF, F, x
time = 40
buffer.time = 8


[Command]
name = "SUPER"
command = ~D, F, D, F, x
time = 40
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 40
buffer.time = 8

[Command]
name = "SUPER"
command = ~D, F, D, F, y
time = 40
buffer.time = 8

[Command]
name = "Super3"   ;Same name as above
command = c+z
time = 1

[Command]
name = "SUPER"
command = ~D, DF, F, x+z
buffer.time = 8

[Command]
name = "SUPER"
command = ~D, DF, F, y+z
buffer.time = 8


;2nd Super
[Command]
name = "Super2"
command = ~D, DB, B, D, DB, B, x
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DB, B, D, DB, B, y
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DB, B, D, DB, B, z
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DB, B, x+y+z
buffer.time = 8


[Command]
name = "Super2"
command = ~D, DB, B, x+z
buffer.time = 8


[Command]
name = "Super2"
command = ~D, DB, B, y+z
buffer.time = 8


[Command]
name = "Super2"
command = ~D, B, x+y+z
buffer.time = 8


[Command]
name = "Super2"
command = ~D, B, y+z
buffer.time = 8


[Command]
name = "Super2"
command = ~D, B, x+z
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DB,B,D,DB,B, a
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DB,B,D,DB,B, b
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DB,B,a+c
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DB,B,b+c
buffer.time = 8





;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = $F,x
time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = x,$F
time = 3

[Command]
name = "upper_x"
command = ~F, D, DF, x
buffer.time = 5

[Command]
name = "upper_y"
command = ~F, D, DF, y

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y

[Command]
name = "upper_a"
command = ~F, D, DF, a
buffer.time = 12

[Command]
name = "upper_b"
command = ~F, D, DF, b
buffer.time = 12

[Command]
name = "upper_c"
command = ~F, D, DF, a+b
buffer.time = 12

[Command]
name = "upper_c"
command = ~F, D, DF, c
buffer.time = 12

[Command]
name = "QCF_x"
command = ~D, DF, F, x
buffer.time = 5

[Command]
name = "QCF_y"
command = ~D, DF, F, y
buffer.time = 5

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y
buffer.time = 5

[Command]
name = "QCF_z"
command = ~D, DF, F, z
buffer.time = 5

[Command]
name = "QCB_x"
command = ~D, DB, B, x
buffer.time = 5

[Command]
name = "QCB_y"
command = ~D, DB, B, y
buffer.time = 5

[Command]
name = "QCB_z"
command = ~D, DB, B, x+y
buffer.time = 5

[Command]
name = "QCB_z"
command = ~D, DB, B, z
buffer.time = 5


[Command]
name = "QCF_a"
command = ~D, DF, F, a
buffer.time = 5

[Command]
name = "QCF_b"
command = ~D, DF, F, b
buffer.time = 5

[Command]
name = "QCB_b"
command = ~D, DB, B, b
buffer.time = 5

[Command]
name = "QCB_a"
command = ~D, DB, B, a
buffer.time = 5

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b
buffer.time = 5

[Command]
name = "QCB_ab"
command = ~D, DB, B, a+b
buffer.time = 5

[Command]
name = "QCB_ab"
command = ~D, DB, B, c
buffer.time = 5

[Command]
name = "FF_ab"
command = F, F, a+b
buffer.time = 5

[Command]
name = "FF_a"
command = F, F, a
buffer.time = 5

[Command]
name = "FF_b"
command = F, F, b
buffer.time = 5

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 15

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 15

[command]
name = "superjump"
command = ~D,$U
time = 15

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1
buffer.time = 1


[command]
name = "recovery"
command = z
time = 1
buffer.time = 1

[Command]
name = "throw"
command = x+a
time = 1

[command]
name = "reload"
command = y+b

[command]
name = "dash"
command = x+y
time = 1

[command]
name = "dash"
command = z
time = 1

[command]
name = "holddash"
command = /x+y
time = 1

[command]
name = "holddash"
command = /z
time = 1

[command]
name = "superjump"
command = a+b
time = 1

[command]
name = "superjump"
command = c
time = 1



;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1
buffer.time = 1


[Command]
name = "b"
command = b
time = 1
buffer.time = 1


[Command]
name = "c"
command = c
time = 1
buffer.time = 1


[Command]
name = "x"
command = x
time = 1
buffer.time = 1


[Command]
name = "y"
command = y
time = 1
buffer.time = 1


[Command]
name = "z"
command = z
time = 1
buffer.time = 1


[Command]
name = "holdx"
command = /x
time = 1
buffer.time = 1


[command]
name = "holdy"
command = /y
time = 1
buffer.time = 1


[Command]
name = "holda"
command = /a
time = 1
buffer.time = 1


[command]
name = "holdb"
command = /b
time = 1
buffer.time = 1


[Command]
name = "start"
command = s
time = 1
buffer.time = 1


[Command]
name = "holdstart"
command = /s
time = 1
buffer.time = 1


;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1
buffer.time = 1


[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1
buffer.time = 1


[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1
buffer.time = 1


[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1
buffer.time = 1


[command]
name = "downforward"
command = /DF
time = 1
buffer.time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]
;***************************************************************************
;***************************************************************************
;                             AI                   
;***************************************************************************
;***************************************************************************


[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno = [600,640])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = (stateno != [410,411])
trigger2 = movecontact
trigger3 = stateno = [410,411]
trigger3 = movehit
var(1) = 1

;Ai adjustments for my own characters
[state -1, DON'T shoot]
type = varset
triggerall = ailevel > 0
trigger1 = enemy,name = "Bertha Hippo"
trigger1 = enemy,stateno = [1030,1035]
trigger2 = enemy,name = "Jumbo Elephant"
trigger2 = (enemy,stateno = [1000,1001]) || (enemy,stateno = [1010,1011]) || (enemy,stateno = [1020,1021]) || (enemy,stateno = [1250,1279])
trigger3 = enemy,name = "Ana 'Jiggly' Bunny"
trigger3 = (enemy,stateno = [1100,1129]) || (enemy,stateno = 700)
trigger4 = enemy,name = "Katrina Crocodile"
trigger4 = enemy,stateno = [1100,1129]
trigger4 = enemy,stateno != 1104
trigger5 = enemy,name = "Aroma Skunk"
trigger5 = enemy,stateno = [1150,1179]
trigger5 = enemy,stateno != 1155
trigger5 = enemy,stateno != 1165
trigger5 = enemy,stateno != 1175
trigger6 = enemy,name = "Enorma Pig"
trigger6 = enemy,stateno = 1120
trigger7 = enemy,name = "Zafta Giraffe"
trigger7 = enemy,stateno = [1300,1310]
trigger8 = enemy,name = "Makuyama"
trigger8 = (enemy,stateno = 1100) || (enemy,stateno = 1110) || (enemy,stateno = 1120)
trigger9 = enemy,name = "Pastilla Skunk"
trigger9 = (enemy,stateno = 1050) || (enemy,stateno = 1060) || (enemy,stateno = 1070) || (enemy,stateno = 1300) || (enemy,stateno = 1310) || (enemy,stateno = 1320)  || (enemy,stateno = 3080)
trigger10 = enemy,name = "Julian Hippo"
trigger10 = enemy,stateno = 1200
trigger11 = enemy,name = "Rapid Bunny"
trigger11 = (enemy,stateno = [1050,1070]) || (enemy,stateno = [3000,3008]) ;|| (enemy,stateno = [1200,1210])
trigger12 = enemy,name = "Akai R. Panda"
trigger12 = (enemy,stateno = [1000,1029])
trigger13 = enemy,name = "Andy Armadillo"
trigger13 = (enemy,stateno = [1100,1130]) || (enemy,stateno = (3000,3020))
var(5) = 1


[state -1, free to shoot again]
type = varset
triggerall = ailevel > 0
trigger1 = p2movetype = H
var(5) = 0




;---| AI section | --------------------------------------------------------
[State -1, AI]
type = VarSet
trigger1  = command = "cpu1"
trigger2  = command = "cpu2"
trigger3  = command = "cpu3"
trigger4  = command = "cpu4"
trigger5  = command = "cpu5"
trigger6  = command = "cpu6"
trigger7  = command = "cpu7"
trigger8  = command = "cpu8"
trigger9  = command = "cpu9"
trigger10 = command = "cpu10"
trigger11 = command = "cpu11"
trigger12 = command = "cpu12"
trigger13 = command = "cpu13"
trigger14 = command = "cpu14"
trigger15 = command = "cpu15"
trigger16 = command = "cpu16"
trigger17 = command = "cpu17"
trigger18 = command = "cpu18"
trigger19 = command = "cpu19"
trigger20 = command = "cpu20"
trigger21 = command = "cpu21"
trigger22 = command = "cpu22"
trigger23 = command = "cpu23"
trigger24 = command = "cpu24"
trigger25 = command = "cpu25"
;trigger26 = command = "cpu26"
;trigger27 = command = "cpu27"
;trigger28 = command = "cpu28"
;trigger29 = command = "cpu29"
;trigger30 = command = "cpu30"
v = 30
value = 59

[State -1, AI ON] 
Type = VarSet
TriggerAll = Var(30) < 1
TriggerAll = RoundState=2 
Trigger1 = AILevel > 0 
v = 30
value= 59 
Ignorehitpause=1

[State -1, AI OFF]
Type=VarSet
Trigger1=var(30)>0 
Trigger1=RoundState!=2 
Trigger2=!IsHelper 
Trigger2=AILevel=0 
Trigger3=!alive
v=30
value=0 
Ignorehitpause=1

;------|  Defenseive |-----------------------------------------------------
;[State -1, AI guarding - Stand]
;Type=Changestate
;Triggerall=Inguarddist
;Triggerall=var(30)=59
;Triggerall=ctrl
;triggerall = enemy,hitdefattr != S, AT
;triggerall = enemy,movetype = A
;Trigger1 = random > (Ailevel * 31)
;value = 120

;New block code

[State -1, AI guarding - Stand]
Type=Changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = stateno != 100  || stateno != [200,1399]
triggerall =! (Stateno=[120,155])
triggerall = inguarddist || enemynear,hitdefattr = SCA,NP,SP,HP || enemynear,hitdefattr = SCA,AA
triggerall = ctrl
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 16
value = 120

;[state -1, AI guard - Low]
;type = changestate
;triggerall = inguarddist
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall =! (Stateno=[120,155])
;triggerall = statetype = A
;trigger1 = random < (ailevel * 64)
;value = 132

;[State -1]; The engine will still guard by through pressing the back button, we need to disable that.
;Type=Assertspecial
;Triggerall=StateNo!=[120,160]
;Trigger1=var(30) = 59
;flag=noairguard
;flag2=nocrouchguard
;flag3=nostandguard


[state -1, Hip Check]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = power > 499
triggerall = ailevel > 5
trigger1 = random < (ailevel) && (enemy,hitdefattr = SCA,NA,NP)
trigger2 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,SA,SP)
trigger3 = random < (ailevel * 8) && (enemy,hitdefattr = SCA,HA,HP)
value = 1400

[state -1, Duck]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = Statetype != A
triggerall = Random < Ailevel * 10
triggerall = inguarddist 
triggerall = stateno != 11
trigger1 = enemy, name = "Jumbo Elephant"
trigger1 = enemy, stateno = [210,212]
trigger2 = enemy, name = "Bertha Hippo"
trigger2 = enemy, stateno = [1035,1040]
trigger3 = enemy, name = "Ana 'Jiggly' Bunny"
trigger3 = enemy, stateno != [1100, 1129]
trigger4 = enemy, name = "Enorma Pig"
trigger4 = enemy, stateno = [1000,1009]
trigger5 = enemy, name = "Makuyama"
trigger5 = enemy, stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020
value = 11

[state -1, AI jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S || Statetype = C
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = p2bodydist x = [320, 520]
trigger1 = random < ailevel * 8
trigger1 = enemy,statetype = S || enemy,statetype = C
trigger1 = ctrl
trigger2 = enemy,hitdefattr = SCA,ST
trigger2 = random < ailevel * 4
trigger2 = ctrl
trigger3 = enemy,hitdefattr = SCA, NT
trigger3 = random < ailevel * 2
trigger3 = ctrl
trigger4 = enemy,name = "Katrina Crocodile"
trigger4 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger4 = ctrl && random < (ailevel*6)
trigger5 = enemy,name = "Zafta Giraffe"
trigger5 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger5 = ctrl && random < (ailevel*6)
trigger6 = enemy,name = "Makuyama"
trigger6 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger6 = ctrl && random < (ailevel*6) 
trigger7 = enemy,name = "Julian Hippo"
trigger7 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger7 = ctrl && random < (ailevel*6)
trigger8 = enemy,name = "Pastilla Skunk"
trigger8 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger8 = ctrl && random < (ailevel*6)
value = 40

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 11
triggerall = ailevel  
triggerall = ctrl
triggerall = statetype != A 
triggerall = random < ailevel*32
triggerall = p2bodydist x > 600
triggerall = enemy,name = "Moondragon"
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 20 ;5= startup time


[state -1, AI Backdash]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = backedgedist > 60
triggerall = stateno != 100
triggerall = ailevel > 1
trigger1 = p2stateno = [5100,5120]
trigger1 = p2bodydist x = [0,300]
trigger1 = random = ailevel*64
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < ailevel * 2 && ctrl
trigger2 = !inguarddist
trigger3 = p2bodydist x < 300
trigger3 = random < (ailevel*6)
trigger4 = stateno = 1030
trigger4 = time > 15
trigger4 = p2movetype = A
trigger4 = p2bodydist x = [0,300]
trigger4 = random < ailevel * 32
value = 105

[state -1, run]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 1
trigger1 = backedgedist < 260
trigger1 = enemy,stateno = [660,669]
trigger2 = p2bodydist x > 1000
trigger2 = random < ailevel * 8
trigger2 = !inguarddist
trigger2 = life < p2life
trigger2 = life < 500
trigger3 = p2statetype = L
trigger3 = p2bodydist x > 1000
trigger3 = random < ailevel * 32
value = 100


;
[state -1, Rocket Rump]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = power > 2999
triggerall = ailevel > 3
triggerall = p2statetype != L
triggerall = p2bodydist y = [-200,5]
trigger1 = random < ailevel * 18
trigger1 = p2movetype = A
trigger1 = enemynear,animtime <  -8
trigger1 = !enemynear,ctrl
trigger1 = ctrl
trigger1 = inguarddist
trigger2 = projhit = 1, < 8
trigger2 = random < ailevel * 36
trigger2 = stateno != [3000,3010]
trigger3 = numhelper(4020)
trigger3 = helper,movehit
trigger3 = random < ailevel * 12
trigger4 = numhelper(4040)
trigger4 = helper,movehit
trigger4 = random < ailevel * 12
trigger5 = stateno = 210 || stateno = 240
trigger5 = enemynear,hitfall = 0
trigger5 = movehit
trigger5 = random < ailevel * 2436
value = 3080 

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 3080
triggerall = ailevel > 3
triggerall = statetype != A 
triggerall = power > 2999
triggerall = p2bodydist y = [-200,5]
triggerall = p2statetype != L
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -250 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 8 ;5= startup time
trigger1 = !enemynear,ctrl
trigger1 = ctrl
trigger1 = random < ailevel * 24


;--------------------------------------------------------------------------
[state -1, Gattlin Gun]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = power > 999
triggerall = !var(5)
triggerall = ailevel > 3
triggerall = p2statetype != L
triggerall = p2bodydist y = [-300, 0]
triggerall = stateno != [3000,3009]
trigger1 = random < (ailevel*48)
trigger1 = stateno = 240 && movehit
trigger2 = random < (ailevel*36)
trigger2 = stateno = 210 && movehit
trigger3 = projcontact1002 = 1, <12
trigger3 = p2bodydist x < 300
trigger3 = random < ailevel * 32
trigger4 = numhelper(4010)
trigger4 = helper(4010),movehit
trigger4 = p2bodydist x < 300
trigger4 = random < ailevel * 32
trigger5 = prevstateno = 5120
trigger5 = enemynear,movetype = A
trigger5 = p2bodydist x = [0,300]
trigger5 = enemynear,statetype != A
trigger5 = ctrl
trigger5 = random < ailevel * 24
trigger6 = ctrl
trigger6 = life > floor(lifemax * 0.5)
trigger6 = p2bodydist x > 500
trigger6 = random < ailevel * 4 
value = 3000

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 3000
triggerall = ailevel > 3
triggerall = statetype != A 
triggerall = power > 999
triggerall = p2statetype != L
triggerall = p2bodydist y = [-200,0]
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -250 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 12 ;5= startup time
trigger1 = ctrl
trigger1 = !enemynear,ctrl
trigger1 = random < ailevel * 24


[state -1, Missle Turrets]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = power > 999
triggerall = !var(5)
triggerall = ailevel > 3
trigger1 = random < (ailevel*12)
trigger1 = stateno = 411 && movehit
trigger2 = ctrl
trigger2 = random < (ailevel*36)
trigger2 = p2statetype = A 
trigger2 = p2bodydist x = [0,120]
trigger2 = p2bodydist y = [-400,-150]
value = 3040



[state -1, Reload]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = var(25) < 9 || var(26) < 7 || var(27) < 5 || var(28) < 5
triggerall = p2bodydist x > 300
trigger1 = p2stateno = [660,669]
trigger1 = random < ailevel * 40
trigger1 = ctrl
trigger2 = p2bodydist x > 800
trigger2 = random < floor(ailevel * 0.25)
trigger2 = ctrl
trigger3 = p2statetype = L
trigger3 = random < ailevel * 12
trigger3 = ctrl
trigger3 = p2bodydist x > 300
trigger4 = var(25) < 3 || var(26) < 2 || var(27) < 2 || var(28) < 2
trigger4 = stateno = 245 && movehit
trigger4 = random < ailevel * 32
trigger5 = p2stateno = 5100
trigger5 = ctrl && random < ailevel*24
trigger6 = var(25) < 3 || var(26) < 2 || var(27) < 2 || var(28) < 2
trigger6 = random < ailevel * 113
trigger6 = p2stateno = 5100 || p2bodydist x > 800 
trigger6 = p2movetype!= A
trigger6 = ctrl
value = 1030

[state -1, Grenade Launcher EX]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = !var(5)
triggerall = power > 124
triggerall = !inguarddist
triggerall = var(28) > 1
triggerall = time%30
trigger1 = p2bodydist x >= 740
trigger1 = random < (ailevel*2)
trigger1 = ctrl
trigger1 = !enemynear,ctrl
trigger2 = p2statetype = L
trigger2 = ctrl
trigger2 = random < ailevel*4
trigger2 = p2bodydist x = [0, 400]
value = 1220

[state -1, EX Scissor Bomb]
type = changestate
triggerall = var(30) = 59
triggerall = p2bodydist x = [0,470]
triggerall = ailevel > 4
triggerall = p2bodydist y = [-50, 300]
triggerall = power > 499
triggerall = enemy,stateno != [660,669]
triggerall = p2bodydist y = [-260, 0]
triggerall = !stateno = [410,419]
trigger1 = random < ailevel * 64
trigger1 = enemy,numproj > 0 || enemynear,hitdefattr = SCA,NP,SP,HP
trigger1 = ctrl 
value = 1120

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1120
triggerall = ailevel > 4 
triggerall = power > 499
triggerall = enemy, statetype != L
triggerall = p2bodydist y = [-50, 600]
triggerall = p2bodydist x = [0,800]
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 4 ;5= startup time
trigger1 = ctrl
trigger1 = random < ailevel * 36
trigger1 = enemy,animtime < -24
trigger2 = var(1)
trigger2 = random < ailevel * 32


[state -1, raw cat lawn chair]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 4
triggerall = statetype != A
triggerall = !var(5)
triggerall = numhelper(4020) < 1
triggerall = !inguarddist
triggerall = power > 124
triggerall = var(27) > 1
triggerall = p2bodydist y = [-400, 0]
triggerall = p2statetype != L
triggerall = p2stateno != [5100,5120]
triggerall = !enemynear,hitfall 
triggerall = !enemy,name = "Bertha Hippo" && enemy,stateno != [1030,1033]
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = p2bodydist x = [0,450]
trigger1 = !enemynear,ctrl
trigger2 = random < ailevel * 18
trigger2 = p2bodydist x = [450, 740]
trigger2 = ctrl
trigger3 = p2bodydist x >= 740
trigger3 = random < ailevel * 24
trigger3 = ctrl
trigger3 = !enemynear,ctrl
value = 1020

[state -1, EX Rocket Rump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2bodydist x < 300 && p2bodydist x > -100
triggerall = enemy,stateno != [660,669]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = p2movetype = A
trigger1 = random < (ailevel)
trigger2 = ctrl
trigger2 = p2statetype = A
trigger2 = p2movetype = A
trigger2 = random < (ailevel*4)
trigger3 = prevstateno = 5120
trigger3 = p2bodydist x < 100
trigger3 = p2movetype = A
trigger3 = random < (ailevel*64)
trigger3 = ctrl
trigger4 = movecontact
trigger4 = var(1)
trigger4 = enemy,movetype = A
trigger4 = random < ailevel * 12
value = 1170

[state -1, L. Scissor Bomb]
type = changestate
triggerall = var(30) = 59
triggerall = p2bodydist x =[0, 800]
triggerall = ailevel > 2
triggerall = p2stateno != [660,669]
triggerall = p2bodydist y = [-110, 600]
triggerall = stateno != [410,411]
trigger1 = stateno = 240 || stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 24
trigger2 = enemy,authorname = "Kaze Cat"
trigger2 = p2stateno = [1400,1409]
trigger2 = p2statetype != A
trigger2 = random < ailevel*24
trigger2 = ctrl || var(1)
value = 1100

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1100 
triggerall = ctrl || var(1)
triggerall = statetype != A 
triggerall = p2bodydist y = [-110, 600]
triggerall = p2bodydist x =[0, 800]
triggerall = ailevel > 2
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -110 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 6 ;5= startup time
trigger1 =random < ailevel * 18

[state -1, H. Scissor Bomb]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = p2bodydist x = [0, 1000]
triggerall = p2bodydist y = [-110, 600]
triggerall = p2stateno != [660,669]
triggerall = stateno != [410,411]
trigger1 = (stateno = 240) || (stateno = 210)
trigger1 = movehit
trigger1 = random < ailevel*36
trigger2 = enemy,authorname = "Kaze Cat"
trigger2 = p2stateno = [1400,1409]
trigger2 = p2statetype != A
trigger2 = random < ailevel*24
trigger2 = ctrl || var(1)
trigger3 = stateno = 612
trigger3 = var(7) > 1
trigger3 = movehit
trigger3 = random < ailevel * 36
trigger4 = p2stateno = [700,799]
trigger4 = ctrl
trigger4 = random < ailevel * 6
value = 1110

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1110 
triggerall = ctrl || var(1)
triggerall = statetype != A 
triggerall = p2bodydist y = [-110, 600]
triggerall = p2bodydist x =[0, 1000]
triggerall = ailevel > 2
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -110 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 10 ;5= startup time
trigger1 =random < ailevel * 24

[state -1, Shotgun]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = !var(5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x =[140, 600]
triggerall = p2bodydist y = [-320, 0]
triggerall = !inguarddist
triggerall = var(25) > 1
trigger1 = ctrl
trigger1 = random < ailevel * 16
trigger1 = time%4
trigger2 = stateno = 240 && movecontact
trigger2 = random < ailevel * 12
trigger3 = stateno = 240
trigger3 = movehit
trigger3 = p2statetype != S && p2statetype != C
value = 1000


[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1000
triggerall = ailevel > 2
triggerall = var(30) = 59
triggerall = ctrl
triggerall = var(25) > 1
triggerall = statetype != A 
triggerall = p2bodydist x = [0, 650]
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [10,12] ; 5 = startup time, 22 = active ; [0,5] for last second 
trigger1 = ctrl
trigger1 = random < ailevel * 32

[state -1, 2nd Shotgun]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = !var(5)
triggerall = p2bodydist x =[170, 600]
triggerall = p2statetype != L
triggerall = p2bodydist x < 700 && (p2bodydist y >-300 && p2bodydist y <= 0)
triggerall = var(25) > 1
triggerall = (stateno = 1000 && time > 32)
trigger1 = enemy,numproj >= 1 || enemynear,hitdefattr = SCA,AP
trigger1 = random < (ailevel * 48) 
trigger2 = enemy,statetype != L
value = 1005

[state -1, Revolver]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = var(26) > 1
triggerall = ailevel > 2
triggerall = !var(5)
triggerall = p2bodydist y = [-280, 0]
triggerall = !inguarddist
triggerall = p2statetype != C
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 48
trigger1 = time%2
trigger1 = p2bodydist x = [400,2000]
trigger2 = stateno = 210 && movehit
trigger2 = random < ailevel * 16
trigger3 = stateno = 240 && movehit
trigger3 = random < ailevel * 32
trigger4 = stateno = 240
trigger4 = movehit
trigger4 = p2statetype != C && p2statetype != A
trigger5 = ctrl
trigger5 = p2bodydist x > 1000
trigger5 = random < ailevel * 16
value = 1010

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1010
triggerall = ailevel > 2 
triggerall = var(26) > 1
triggerall = statetype != A 
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 20 ;5= startup time
trigger1 = ctrl
trigger1 = random < ailevel * 12

[state -1, Revolver]
type = changestate
triggerall = ailevel > 2
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !var(5)
triggerall = p2bodydist x > 0
triggerall = var(26) > 1
triggerall = stateno = 1010  && animelemtime(11) > 0
triggerall = p2bodydist y >-110 && p2bodydist y <= 0
triggerall = enemy,statetype = S || enemy,statetype = A
trigger1 = enemy,numproj >= 1 || enemynear,hitdefattr = SCA,AP
trigger2 = numhelper(4010)
trigger2 = helper(4010),moveguarded
trigger3 = enemy,statetype != C
trigger3 = random < ailevel * 8
trigger3 = !enemy,hitfall
value = 1015

[state -1, Grenade Launcher H]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = !var(5)
triggerall = var(28) > 1
triggerall = !inguarddist
triggerall = numhelper(4040) < 1
triggerall = time%30
trigger1 = enemy,vel x > 0
trigger1 = p2bodydist y = [-350,-250]
trigger1 = random < (ailevel*4)
trigger1 = ctrl
trigger2 = p2bodydist x = [600,1200]
trigger2 = enemy,vel x < 6
trigger2 = random < ailevel*4
trigger2 = ctrl
trigger3 = prevstateno = 106
trigger3 = ctrl
trigger3 = random < ailevel * 8
trigger4 = prevstateno = 1220
trigger4 = ctrl
trigger4 = random < ailevel * 4
value = 1200

[state -1, Grenade Launcher H]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = !var(5)
triggerall = !inguarddist
triggerall = var(28) > 1
triggerall = time%30
triggerall = numhelper(4040) < 1
trigger1 = p2bodydist x >= 740
trigger1 = random < (ailevel*4)
trigger1 = ctrl
trigger2 = p2bodydist x =[0,340]
trigger2 = p2bodydist y = [-400,0]
trigger2 = random < (ailevel*4)
trigger2 = ctrl
trigger3 = prevstateno = 1220
trigger3 = ctrl
trigger3 = random < ailevel * 4
value = 1210



[state -1, H. Rocket Rump]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2bodydist x = [0, 350]
triggerall = enemy,statetype != L
trigger1 = p2statetype = A
trigger1 = prevstateno = 5120
trigger1 = ctrl
trigger1 = random < (ailevel*48)
trigger2 = p2statetype = A && p2movetype = A
trigger2 = random < floor(ailevel*12)
trigger2 = ctrl
trigger3 = enemynear,name = "Akai R. Panda"  || enemynear,name = "Makuyama"
trigger3 = enemynear,stateno = 55 || enemynear,stateno = 650
trigger3 = ctrl || var(1)
trigger3 = random < ailevel * 18
value = 1160

[state -1, L. Rocket Rump]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2bodydist x = [0, 600]  
trigger1 = p2statetype = A && p2movetype = A
trigger1 = random < floor(ailevel*8)
trigger1 = ctrl
trigger2 = enemynear,name = "Akai R. Panda"  || enemynear,name = "Makuyama"
trigger2 = enemynear,stateno = 55 || enemynear,stateno = 650
trigger2 = ctrl || var(1)
trigger2 = random < ailevel * 18
value = 1150

[state -1, Bombing Butt]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype = A
triggerall = animelemtime(9) >= 0
triggerall = stateno = 1150 || stateno = 1160  || stateno = 1170
triggerall = p2bodydist y > 250
triggerall = p2bodydist x = [-250,900]
triggerall = enemy,stateno != 660
trigger1 = p2movetype = A
trigger1 = !enemy,ctrl
trigger1 = random < (ailevel*36)
trigger2 = enemy, statetype = L
trigger2 = random < ailevel * 36
trigger3 = random < floor(ailevel*6)
trigger3 = !inguarddist
trigger4 = stateno = 1170
trigger4 = movehit
trigger4 = random < ailevel * 48
trigger5 = random < ailevel * 4
trigger5 = life > floor(lifemax*0.5)
value = 1155


[state -1, S. Sparta]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [30,470]
triggerall = p2bodydist y = [-100,0]
trigger1 = stateno = 230 && movehit
trigger1 = random < ailevel * 32
trigger1 = var(25) < 2
trigger2 = stateno = 230 && movehit
trigger2 = random < ailevel * 32
trigger2 = var(26) < 2
trigger3 = stateno = 230 && movehit
trigger3 = random < ailevel * 32
trigger3 = var(27) < 2
trigger4 = random < ailevel *24
trigger4 = p2bodydist x > 410
trigger4 = ctrl
trigger5 = enemy,name = "Bertha Hippo" && enemy,stateno = [1030,1033]
trigger5 = ctrl && random < ailevel * 2
value = 245

[state -1, Overhead]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = statetype != L
triggerall = ctrl
triggerall = enemy,statetype != A
triggerall = stateno != 100
triggerall = p2bodydist x = [0, 300]
triggerall = !numtarget(215)
trigger1 = p2statetype = C
trigger1 = random < ailevel * 12
trigger2 = p2statetype = S
trigger2 = random < ailevel * 4
trigger3 = enemy,hitdefattr = SCA,AT
trigger3 = random < ailevel * 2
trigger4 = enemynear,name = "Jumbo Elephant" || enemynear,name = "Bertha Hippo" || enemynear,name = "Makuyama"
trigger4 = enemynear,stateno = 5120
trigger4 = random < ailevel * 32
value = 215

[state -1, C. Jab1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = p2statetype != A  
triggerall = p2statetype !=L
triggerall = p2bodydist x = [0, 210]
triggerall = p2bodydist y = [-200,0]
trigger1 = !inguarddist
trigger1 = random < ailevel * 8
trigger2 = random < ailevel * 24
trigger2 = p2movetype = H
trigger3 = numtarget(215)
trigger3 = random < ailevel * 24
trigger4 = numtarget(615)
trigger4 = random < ailevel * 24
value = 400

[state -1, C. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 320
trigger1 = enemy,stateno = [105,106]
trigger1 = ctrl
trigger1 = random < (ailevel*6)
trigger2 = stateno = 430 && movehit
trigger2 = random < (ailevel*4)
value = 440

[state -1, J. jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype = A  
triggerall = p2bodydist x < 160
triggerall = !inguarddist
triggerall = p2bodydist y > -200 && p2bodydist y < 60
trigger1 = ctrl
trigger2 = stateno = 600 && movehit
trigger2 = random < (ailevel*32)
value = 600

[state -1, S. Jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x =[0, 210]
triggerall = p2bodydist y = [-200,0]
triggerall = p2statetype != L
triggerall = !inguarddist
triggerall = ctrl
trigger1 = random < ailevel * 8
trigger2 = p2movetype = H
trigger2 = random < ailevel * 24
trigger3 = prevstateno = 52
trigger3 = p2movetype = H
trigger3 = random < ailevel * 48
value = 200

[state -1, J. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2statetype = A  
triggerall = p2bodydist x < 250
triggerall = p2bodydist y > -110 && p2bodydist y < 110
trigger1 = stateno = 600 && movecontact
value = 630

[state -1, C. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != A  
triggerall = p2statetype !=L
triggerall = p2bodydist x = [0, 280]
triggerall = p2bodydist y = [-200,0]
trigger1 = random < ailevel * 8
trigger1 = ctrl
trigger1 = p2statetype = S
trigger2 = stateno = 400 && movecontact
trigger2 = random < ailevel*36
trigger3 = enemy,name = "Bertha Hippo" && enemy,stateno = [1030,1033]
trigger3 = ctrl && random < (ailevel*8)
trigger4 = random < ailevel * 24
trigger4 = ailevel > 4
trigger4 = numtarget(240)
trigger4 = ctrl
trigger5 = random < ailevel * 24
trigger5 = ailevel > 4
trigger5 = numtarget(210)
trigger5 = ctrl
value = 430

[state -1, Belly Flop]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2statetype != A
triggerall = p2bodydist x = [-300,150]
triggerall = p2bodydist y > 0
triggerall = vel y > 0
trigger1 = ctrl
trigger1 = random < ailevel * 24
trigger2 = ctrl
trigger2 = random < ailevel * 48
trigger2 = p2bodydist x = [-200, 50]
value = 615

[state -1, J.Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 220
triggerall = p2bodydist y = [-240, 25]
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger2 = stateno = 630 && movecontact
trigger2 = random > ailevel * 62
value = 610

[state -1, J.Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 220
triggerall = p2bodydist y = [25,300]
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger2 = stateno = 630 && movecontact
trigger2 = random < ailevel * 62
value = 640


[state -1, S. Jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 210
trigger1 = stateno = 200
trigger1 = movecontact
value = 201

[state -1, S. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 225]
triggerall = p2bodydist y = [-130,0]
triggerall = !inguarddist
triggerall = p2statetype != A
trigger1 = stateno = 200 && movehit
trigger2 = stateno = 201 && movehit
value = 230

[state -1, S. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x =[0, 250]
triggerall = p2movetype != A
triggerall = p2statetype != L
triggerall = p2statetype != C
trigger1 = stateno = 230 && movehit
trigger2 = ctrl && random < ailevel * 2
trigger3 = stateno = 201 && movehit
value = 210

[state -1, C. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = enemy,statetype !=L
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x < 450
trigger1 = ctrl
trigger1 = p2bodydist y > -200  & p2bodydist y < 0
trigger2 = stateno = 430 && movehit  
trigger3 = stateno = 230 && movehit
trigger3 = random < ailevel * 48
trigger3 = p2statetype = C
trigger4 = p2bodydist y = [-450, -200]
trigger4 = p2bodydist x < 240
trigger4 = enemynear,stateno = 673 || enemynear,stateno = 678
trigger4 = ctrl
trigger5 = (stateno = 200) || (stateno = 400) || (stateno = 230) || (stateno = 430) || (stateno = 201) 
trigger5 = movehit
trigger5 = enemy,movetype = A
trigger5 = random < ailevel * 36
value = 410

[state -1, S. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 470]
triggerall = p2bodydist y = [-200,0]
triggerall = p2movetype != A
triggerall = p2statetype != L
trigger1 = stateno = 210 && movehit
trigger1 = random < ailevel * 24
trigger2 = ctrl && random < ailevel * 2
trigger3 = stateno = 230 && movehit
trigger3 = random < ailevel * 16
value = 240

[state -1, Belly to back suplex (Grab)]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
;triggerall = enemy,name != "Bertha Hippo"  
;triggerall = enemy,name != "Jumbo Elephant" 
;triggerall = enemy,name != "Jumba Elephant"
;triggerall = enemy,name != "Julian Hippo"
triggerall = statetype != A
triggerall = p2statetype = S || p2statetype = C
triggerall = ctrl
triggerall = p2movetype != H
triggerall = p2bodydist x < 110
trigger1 = Random < Ailevel * 8
trigger2 = Random < Ailevel * 16
trigger2 = p2stateno = [150,159]
trigger3 = enemy,name = "Lardo Rat"
trigger3 = enemy,stateno = [1000,10004]
trigger3 = random < (ailevel*12)
trigger4 = enemy,authorname = "Kazecat"
trigger4 = enemy,stateno = 1400
trigger4 = random < (ailevel*8)
trigger5 = p2stateno = [700,799]
trigger5 = !inguarddist
trigger5 = random < ailevel*48
value = 800









;===========================================================================
;---------------------------------------------------------------------------



;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.


;---------------------------------------------------------------------------
;SUPER
[State -1, GATTLING GUN]
type = ChangeState
value = 3000
triggerall = command = "SUPER" 
triggerall = power > 999
triggerall = ailevel = 0
triggerall = statetype != A
triggerall = stateno != 3000
trigger1 = var(1) 
trigger2 = ctrl
trigger3 = stateno = [1000,1299]
trigger3 = movecontact
trigger4 = projcontact = 1, < 18
trigger5 = numhelper(4010) || numhelper(4020) ||numhelper(4040)
trigger5 = helper,movecontact

;---------------------------------------------------------------------------
;2SUPER
[State -1, Anti Air Missile Turret]
type = ChangeState
value = 3040
triggerall = command = "Super2" 
triggerall = power > 999
triggerall = ailevel = 0
triggerall = statetype != A
triggerall = stateno != 3040
trigger1 = var(1) 
trigger2 = ctrl
trigger3 = stateno = [1000,1299]
trigger3 = movecontact 
trigger4 = projcontact = 1, < 18
trigger5 = numhelper(4010) || numhelper(4020) ||numhelper(4040)
trigger5 = helper,movecontact
;---------------------------------------------------------------------------
;Super lv 3
[state -1, Super Rocket Rump]
type = Changestate
triggerall = command = "Super3"
triggerall = power > 2999
triggerall = !ailevel
triggerall = statetype != A
triggerall = stateno != 3080
trigger1 = var(1)
trigger2 = ctrl
trigger3 = stateno = [1000,1299]
trigger3 = movecontact
trigger4 = projcontact = 1, < 18
trigger4 = stateno != [3000,3010]
trigger5 = numhelper(4010) || numhelper(4020) ||numhelper(4040)
trigger5 = helper,movecontact
value = 3080

;---------------------------------------------------------------------------
;Rocket Launcher
[State -1, RAW CAT LAWN CHAIR]
type = ChangeState
value = 1020
triggerall = command = "QCF_xy" || command = "QCF_z"
triggerall = power > 124
triggerall = ailevel = 0
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Shotgun Shot
[State -1, Shotgun Blast]
type = ChangeState
value = 1000
triggerall = command = "QCF_x"
triggerall = ailevel = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) 
;---------------------------------------------------------------------------

;Revolver Shot
[State -1, Revolver Shot]
type = ChangeState
value = 1010
triggerall = command = "QCF_y"
triggerall = ailevel = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) 

;---------------------------------------------------------------------------
;Grenade Launcher Double Grenade
[State -1, Shotgun Blast]
type = ChangeState
value = 1220
triggerall = command = "QCB_z"
triggerall = statetype != A
Triggerall = power > 124
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Grenade Launcher small arc
[State -1, Shotgun Blast]
type = ChangeState
value = 1200
triggerall = command = "QCB_x"
triggerall = statetype != A
triggerall = numhelper(4040) < 1
trigger1 = ctrl
trigger2 = var(1) 

;---------------------------------------------------------------------------
;Grenade Launcher long arc
[State -1, Shotgun Blast]
type = ChangeState
value = 1210
triggerall = command = "QCB_y"
triggerall = statetype != A
triggerall = numhelper(4040) < 1
trigger1 = ctrl
trigger2 = var(1) 

;---------------------------------------------------------------------------
;Reloading
[State -1, Shotgun Blast]
type = ChangeState
value = 1030
triggerall = command = "reload" 
triggerall = statetype != A
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1) 

;---------------------------------------------------------------------------
;Rump Rocket EX
[State -1, Light Rump Rocket]
type = changestate
value = 1170
triggerall = command = "upper_c" 
triggerall = ailevel = 0
triggerall = power > 499
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Rump Rocket L
[State -1, Light Rump Rocket]
type = changestate
value = 1150
triggerall = command = "upper_a" 
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Rump Rocket
[State -1, Heavy Rump Rocket]
type = changestate
value = 1160
triggerall = command = "upper_b" 
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Scissor Bomb EX
[State -1, scissor bomb]
type = changestate
value = 1120
triggerall = !ailevel
triggerall = command = "QCB_ab" 
triggerall = ailevel = 0
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Scissor Bomb L
[State -1, scissor bomb]
type = changestate
value = 1100
triggerall = !ailevel
triggerall = command = "QCB_a" 
triggerall = ailevel = 0
;triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)


;---------------------------------------------------------------------------
;Scissor Bomb H
[State -1, scissor bomb]
type = changestate
value = 1110
triggerall = !ailevel
triggerall = command = "QCB_b" 
triggerall = ailevel = 0
;triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = ailevel = 0
trigger1 = command = "FF" || (command = "dash" && command != "holdback")
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB" || (command = "dash" && command = "holdback")
trigger1 = statetype = S
trigger1 = ctrl

;--------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 41
trigger1 = command = "superjump"
trigger1 = statetype = S || statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = statetype != A
triggerall = stateno != 100
triggerall = command = "throw"
trigger1 = ctrl

;---------------------------------------------------------------------------
;push block - Hip check
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 499

;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl


;---------------------------------------------------------------------------
;Double Jab
[State -1, Stand Light Punch]
type = ChangeState
value = 201
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = stateno = 200
triggerall = statetype = S
trigger1 = movecontact
trigger2 = stateno = 200 && time > 12

;---------------------------------------------------------------------------
;Overhead belly flop
[State -1, Standing Strong Kick]
type = ChangeState
value = 215
triggerall = command = "y"
triggerall = command = "downforward"
triggerall = stateno != 100
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "downforward"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
trigger6 = stateno = 201 && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
trigger6 = stateno = 201 && movecontact
trigger7 = stateno = 210 && movecontact


;Standing Roundhouse
[State -1, Standing Strong Kick]
type = ChangeState
value = 245
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200)  || (stateno = 230) || (stateno = 400) || (stateno = 430) 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Taunt - Not animated
;[State -1, Taunt]
;type = ChangeState
;value = 195
;triggerall = command = "start"
;trigger1 = statetype != A
;trigger1 = ctrl


;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && animelemtime(4) > 2

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 430 || stateno = 200 || stateno = 230 || stateno = 201
trigger2 = movecontact



;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400  || stateno = 200 ||stateno = 201
trigger2 = movecontact


;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || stateno = 200 || stateno = 201 || stateno = 230
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movehit



;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 615
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = [610,612];jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

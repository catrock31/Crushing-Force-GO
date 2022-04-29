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
name = "SUPER"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 40
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = ~D, DF, F, z+x
time = 20
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = ~D, DF, F, z+y
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = c+z
time = 1

[Command]
name = "Super2"
command = ~D, DF, F, D, DF, F, a
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, D, DF, F, b
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, c+a
time = 20
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, c+b
time = 20
buffer.time = 8

[Command]
name = "Super3"
command = ~F, DF, D, a+c
time = 20
buffer.time = 8

[Command]
name = "Super3"
command = ~F, DF, D, b+c
time = 20
buffer.time = 8

[Command]
name = "Super3"
command = ~F, DF, D, F, DF, D, a
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = ~F, DF, D, F, DF, D, b
time = 40
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

[Command]
name = "upper_y"
command = ~F, D, DF, y

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCF_xy"
command = ~D, DF, F, z

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "QCB_y"
command = ~D, DB, B, y

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_c"
command = ~D, DF, F, a+b

[Command]
name = "QCF_c"
command = ~D, DF, F, c

[Command]
name = "QCB_a"
command = ~D, DB, B, a

[Command]
name = "QCB_b"
command = ~D, DB, B, b

[Command]
name = "QCB_c"
command = ~D, DB, B, c

[Command]
name = "QCB_c"
command = ~D, DB, B, a+b

[Command]
name = "QCD_a"
command = ~F,DF,D, a

[Command]
name = "QCD_b"
command = ~F,DF,D, b

[Command]
name = "QCD_c"
command = ~F,DF,D, c

[Command]
name = "QCD_c"
command = ~F,DF,D, a+b


[command]
name = "DD_a"
command = D, D, a

[command]
name = "DD_b"
command = D, D, b

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

[Command]
name = "Totem Ground"
command = D,DB,B, x
time = 20

[Command]
name = "Totem Air"
command = D,DB,B, y
time = 20

[Command]
name = "Totem EX"
command = D,DB,B, z
time = 20

[Command]
name = "Totem EX"
command = D,DB,B, x+y
time = 20

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[command]
name = "superjump"
command = ~D,$U
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name =  "recovery"
command = z
time = 1

[Command]
name = "Grab"
command = x+a
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

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

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


[Command]
name = "holdy"
command = /y
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

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
;triggerall = numhelper(21000) < 3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 
trigger2 = stateno != 410
trigger2 = movecontact
trigger3 = numhelper(21000)
trigger3 = helper(21000),movecontact && stateno = 213
trigger4 = stateno = 410
trigger4 = movehit
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

;***************************************************************************
;***************************************************************************
;                             AI                   
;***************************************************************************
;***************************************************************************
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

[State -1, AI guarding - Stand]
Type=Changestate
Triggerall=Inguarddist || enemynear,hitdefattr = SCA,NP,SP,HP || enemynear,hitdefattr = SCA, AA
Triggerall=var(30)=59
Triggerall= ailevel > 0
triggerall = stateno != 100
triggerall =! (Stateno=[120,155])
triggerall = ctrl
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 16
value = 120

[state -1, Butt Shove]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = (stateno = [150,153])
triggerall = power > 999
triggerall = ailevel > 5
triggerall = p2bodydist x < 400
trigger1 = random < (ailevel * 4) && (enemy,hitdefattr = SCA,NA,NP)
trigger2 = random < (ailevel * 8) && (enemy,hitdefattr = SCA,SA,SP)
trigger3 = random < (ailevel * 16) && (enemy,hitdefattr = SCA,HA,HP)
value = 1400


[state -1, AI jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S || Statetype = C
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = p2bodydist x = [380, 450]
trigger1 = random < ailevel * 8
trigger1 = enemy,statetype = S || enemy,statetype = C
trigger1 = ctrl
trigger2 = enemy,hitdefattr = SCA,ST
trigger2 = random < ailevel * 6
trigger2 = ctrl
trigger3 = enemy,hitdefattr = SCA, NT
trigger3 = random < ailevel * 2
trigger3 = ctrl
trigger4 = enemy, numproj > 0 && inguarddist
trigger4 = ctrl && random < (ailevel*8)
trigger5 = enemy,name = "Katrina Crocodile"
trigger5 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger5 = ctrl && random < (ailevel*6)
trigger6 = enemy,name = "Zafta Giraffe"
trigger6 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger6 = ctrl && random < (ailevel*6)
trigger7 = enemy,name = "Makuyama"
trigger7 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger7 = ctrl && random < (ailevel*6) 
trigger8 = ctrl
trigger8 = p2stateno = 673
trigger8 = random < ailevel * 8
trigger9 = enemy,name = "Julian Hippo"
trigger9 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger9 = ctrl && random < (ailevel*6)
trigger10 = enemy,name = "Pastilla Skunk"
trigger10 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger10 = ctrl && random < (ailevel*6)

value = 40

[state -1, Run]
type = changestate
triggerall= var(30) = 59
triggerall = Statetype != A
triggerall = ctrl
triggerall = ailevel > 1
triggerall = stateno != 100
trigger1 = p2bodydist x > 1200
trigger1 = random < ailevel*40
trigger1 = p2stateno = 4121
trigger2 = p2bodydist x > 1200
trigger2 = !inguarddist
trigger2 = random < ailevel* 8
trigger3 = p2statetype = L
trigger3 = p2bodydist x > 1200
trigger3 = random < ailevel * 32
value = 100

[state -1, AI Backdash]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 1
trigger1 = backedgebodydist >  120
trigger1 = p2stateno = [5100,5120]
trigger1 = p2bodydist x < 200
trigger1 = random < (ailevel*113)
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < (ailevel*2)
trigger3 = p2bodydist x <= 200
trigger3 = random < (ailevel*4)
trigger3 = backedgebodydist >  120
trigger4 = prevstateno = [1000,1020]
trigger4 = random < (ailevel*6)
value = 105

[state -1, Duck]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = Statetype != A
triggerall = Random < Ailevel * 10
triggerall = inguarddist 
trigger1 = enemy, name = "Jumbo Elephant"
trigger1 = enemy, stateno = [210,212]
trigger2 = enemy, name = "Bertha Hippo"
trigger2 = enemy, stateno = [1035,1040]
trigger3 = enemy, name = "Ana 'Jiggly' Bunny"
trigger3 = enemy, stateno != [1100, 1129]
trigger4 = enemy, name = "Enorma Pig"
trigger4 = enemy, stateno = [1000,1009]
value = 11

[state -1,SUPER Smellevator]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = numhelper(3010) < 1
triggerall = var(5)=0
triggerall = ailevel > 3
triggerall = power > 2999
triggerall = p2bodydist y > -150
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),movehit
trigger1 = random < ailevel * 48
trigger2 = stateno = 240
trigger2 = movehit
trigger2 = animelemtime(10) > 0
trigger2 = random < ailevel * 24
value = 3000

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 3040
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ailevel > 3
triggerall = ctrl
triggerall = power > 999
trigger1 = p2bodydist x < 999
trigger1 = random < ailevel * 12
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,87] ; 5 = startup time, 22 = active ; [0,5] for last second

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 3080
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ailevel > 3
triggerall = ctrl
triggerall = p2statetype != A
triggerall = power > 999
trigger1 = p2bodydist x < 1200
trigger1 = random < ailevel * 24
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [2,60] ; 5 = startup time, 22 = active ; [0,5] for last second


[state -1,SUPER Pastilla Spray]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2statetype != L
triggerall = p2bodydist x < 1200
triggerall = var(5)=0
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),movehit
trigger1 = random < ailevel * 18
trigger2 = random < ailevel * 18
trigger2 = stateno = 230 && movehit
trigger3 = enemynear,name = "Aroma Skunk"
trigger3 = enemynear,stateno = [3040,3045]
trigger3 = ctrl && p2bodydist x > 400
trigger3 = random < ailevel*48
trigger4 = var(13) = 1
trigger4 = ctrl
trigger4 = random < ailevel * 48
value = 3040

[state -1, skunk Vaccum]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = power > 999
triggerall = p2bodydist x = [0,1200]
triggerall = ailevel > 4
triggerall = !enemy,hitfall
triggerall = !inguarddist
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),movehit
trigger1 = random < ailevel * 4
trigger1 = var(10) > 1
trigger2 = ctrl || var(1)
trigger2 = enemy,movetype = A
trigger2 = enemy,statetype != A
trigger2 = random < ailevel * 8
trigger2 = p2bodydist x > 300
trigger3 = ctrl ||var(1)
trigger3 = p2stateno = [700,799]
trigger3 = random < ailevel * 4
value = 3080

[state -1, skunk blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = power > 499
triggerall = p2bodydist x < 800
triggerall = ailevel > 4
triggerall = !inguarddist
trigger1 = ctrl ||var(1)
trigger1 = p2stateno = [700,799]
trigger1 = random < ailevel * 32
trigger2 = numhelper(21000)
trigger2 = stateno = 213 && helper(21000),moveguarded
trigger2 = random < ailevel * 2
trigger2 = var(10) > 1
value = 1320

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1320
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ailevel > 4
triggerall = power > 499
triggerall = ctrl
trigger1 = p2bodydist x < 750
trigger1 = p2statetype != A
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [2,82] ; 5 = startup time, 22 = active ; [0,5] for last second

[state -1, pillar Light]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 499
triggerall = ailevel > 4
triggerall = var(5)=0
triggerall = p2statetype != L
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),movecontact
trigger1 = random < ailevel * 4
trigger2 = ctrl
trigger2 = random < ailevel* 2
trigger3 = stateno = 240 && movehit
trigger3 = random < ailevel * 12
trigger3 = p2bodydist y < -250
value = 1120

[State -1, EX Totem]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 499
triggerall = ailevel > 4
triggerall = var(5)=0
triggerall = p2stateno != [4120,4121]
triggerall = numhelper(4100) < 1
trigger1 = random < ailevel * 4
trigger1 = p2statetype = L
trigger1 = ctrl
trigger2 = p2bodydist x > 500
trigger2 = ctrl
trigger2 = !inguarddist
trigger2 = random < ailevel*2
value = 1220

[state -1, skunk blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = !numhelper(1000)
triggerall = power > 499
triggerall = var(5)=0
triggerall = ailevel > 2
triggerall = !inguarddist
trigger1 = p2bodydist x < 220
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),moveguarded
trigger1 = random < ailevel * 1
trigger1 = var(10) > 1
trigger2 = ctrl
trigger2 = random < ailevel * 2
trigger2 = p2bodydist x > 300 && p2bodydist x < 1100
trigger3 = stateno = 430 && movehit
trigger3 = random < ailevel * 2
trigger4 = stateno = 215 && movehit
trigger4 = random < ailevel * 2
value = 1020


[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1070
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ailevel > 4
triggerall = power > 499
triggerall = ctrl
trigger1 = p2bodydist x < 700
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [4,22] ; 5 = startup time, 22 = active ; [0,5] for last second



[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1050
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ailevel > 4
triggerall = ctrl
triggerall = p2bodydist x = [100, 650]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [7,27] ; 5 = startup time, 22 = active ; [0,5] for last second

[state -1, butt hammer]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x =[100, 650]
triggerall = ailevel > 2
triggerall = p2stateno != [660,669]
triggerall = !numtarget(1400)
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),movehit 
trigger1 = random < ailevel * 32
trigger1 = var(10) > 1
trigger2 = p2statetype = L
trigger2 = random < ailevel * 12
trigger2 = ctrl
trigger3 = numhelper(21000)
trigger3 = stateno = 213 && helper(21000),movehit
trigger3 = p2statetype = A
trigger3 = random < ailevel * 32
trigger4 = p2statetype = L
trigger4 = enemynear,pos y =[-100,-1]
trigger4 = ctrl
trigger4 = random < ailevel* 48
trigger5 = p2stateno = 685
trigger5 = ctrl
trigger5 = p2bodydist y = [-220,-1]
trigger5 = random < ailevel * 48
trigger6 = p2stateno = 673
trigger6 = p2bodydist x = [220,600]
trigger6 = p2bodydist y = [-200,-600]
trigger6 = ctrl
trigger6 = random < ailevel * 48
trigger7 = numtarget(610)
trigger7 = random < ailevel * 24
trigger7 = ctrl
value = 1050

[state -1, butt hammer]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [100, 450]
triggerall = ailevel > 2
triggerall = p2bodydist y < 100
triggerall = p2stateno != [660,669]
triggerall = !numtarget(1400)
trigger1 = stateno = 240 && movehit
trigger1 = random < ailevel * 6
trigger1 = enemynear,backedgebodydist < 100 
trigger2 = ctrl
trigger2 = var(13) = 1
trigger2 = random < ailevel*48
trigger3 = ctrl
trigger3 = p2stateno = 678
trigger3 = p2bodydist y = [ -300,-1]
trigger3 = random < ailevel * 40
value = 1060

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1060
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ailevel > 2
triggerall = ctrl
triggerall = p2bodydist x = [100, 450]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [10,36] ; 5 = startup time, 22 = active ; [0,5] for last second


[state -1, pillar Light]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2dist x < 650
triggerall = var(5)=0
triggerall = ailevel > 2
triggerall = !inguarddist
triggerall = enemynear,stateno != [670,673]
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),movecontact
trigger1 = random < ailevel * 12
trigger2 = ctrl
trigger2 = random < ailevel* 1
trigger2 = !inguarddist
trigger2 = p2dist x > 300
value = 1100

[state -1, pillar Light]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2dist x >= 650
triggerall = var(5)=0
triggerall = ailevel > 2
triggerall = ailevel > 2
triggerall = !inguarddist
triggerall = enemynear,stateno != [670,673]
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),movecontact
trigger1 = random < ailevel * 12
trigger2 = ctrl
trigger2 = random < ailevel* 4
trigger3 = stateno = 240 && movehit
trigger3 = random < ailevel * 8
trigger4 = numhelper(11200)
trigger4 = helper(11200),movehit && ctrl
trigger4 = random < ailevel * 32
trigger5 = numtarget(1000)
trigger5 = ctrl
trigger5 = random < ailevel * 24
trigger6 = random < ailevel * 18
trigger6 = p2bodydist x > 1000
trigger6 = ctrl
value = 1110

[state -1, skunk blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = !numhelper(1000)
triggerall = var(5)=0
triggerall = ailevel > 2
triggerall = !inguarddist
trigger1 = p2bodydist x > 300 && p2bodydist x < 1100
trigger1 = ctrl
trigger1 = random < ailevel * 6
trigger2 = numhelper(21000)
trigger2 = stateno = 213 && helper(21000),movecontact
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x < 150
trigger3 = stateno = 430 && movehit
trigger3 = random < ailevel * 8
trigger4 = stateno = 215 && movehit
trigger4 = random < ailevel * 24
value = 1000

[state -1, skunk blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = !numhelper(1000)
triggerall = var(5)=0
triggerall = ailevel > 2
triggerall = !inguarddist
trigger1 = p2bodydist x < 220
trigger1 = numhelper(21000)
trigger1 = stateno = 213 && helper(21000),moveguarded
trigger1 = random < ailevel * 32
trigger1 = var(10) > 1
trigger2 = ctrl
trigger2 = random < ailevel * 2
trigger2 = p2bodydist x > 300 && p2bodydist x < 1100
trigger3 = stateno = 430 && movehit
trigger3 = random < ailevel * 12
trigger4 = stateno = 215 && movehit
trigger4 = random < ailevel * 40
trigger5 = numhelper(21000)
trigger5 = random < ailevel * 32
trigger5 = ctrl
value = 1010

[state -1, Vaccum Ass Light]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = ailevel > 2
triggerall = !inguarddist
triggerall = p2bodydist x = [0, 1000]
triggerall = p2stateno != [4120,4121]
trigger1 = p2stateno = [700,799]
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger2 = numhelper(21000)
trigger2 = stateno = 213 && helper(21000),movehit
trigger2 = random < ailevel * 4
trigger3 = enemynear,authorname = "Kazecat"
trigger3 = p2stateno = 1400
trigger3 = random < ailevel * 16
trigger3 = ctrl || var(1)
trigger4 = ctrl || var(1)
trigger4 = enemy,numproj > 0
trigger4 = random < ailevel * 36
trigger5 = numhelper(4006)
trigger5 = var(1) || ctrl
trigger5 = p2stateno = [700,799]
trigger5 = random < ailevel * 24
trigger6 = p2bodydist x = [150,500]
trigger6 = !inguarddist
trigger6 = ctrl || var(1)
trigger6 = random < ailevel * 4
trigger6 = p2statetype != A
value = 1300

[state -1, Vaccum Ass Heavy]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = ailevel > 2
triggerall = !inguarddist
triggerall = p2bodydist x = [0, 1000]
triggerall = p2stateno != [4120,4121]
trigger1 = p2stateno = [700,799]
trigger1 = ctrl
trigger1 = random < ailevel * 24
trigger2 = numhelper(21000)
trigger2 = stateno = 213 && helper(21000),movehit
trigger2 = random < ailevel * 12
trigger3 = enemynear,authorname = "Kazecat"
trigger3 = p2stateno = 1400
trigger3 = random < ailevel * 24
trigger3 = ctrl || var(1)
trigger4 = ctrl || var(1)
trigger4 = enemy,numproj > 0
trigger4 = random < ailevel * 12
trigger5 = numhelper(4006)
trigger5 = var(1) || ctrl
trigger5 = p2stateno = [700,799]
trigger5 = random < ailevel * 24
value = 1310

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1300
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ailevel > 2
triggerall = ctrl
trigger1 = p2bodydist x < 1000
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [20,82] ; 5 = startup time, 22 = active ; [0,5] for last second

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1310
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ailevel > 2
triggerall = ctrl
trigger1 = p2bodydist x < 1000
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [26,89] ; 5 = startup time, 22 = active ; [0,5] for last second


[state -1, Fart in Face (Grab)]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
triggerall = numhelper
triggerall = statetype != A
triggerall = p2statetype = S || p2statetype = C
triggerall = ctrl
triggerall = p2movetype != H
triggerall = p2bodydist x < 100
trigger1 = Random < (Ailevel*18)
trigger2 = Random < (Ailevel*24)
trigger2 = p2stateno = [150,159]
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400 || enemy,stateno = [700,750]
trigger3 = random < (ailevel*24)
trigger4 = p2stateno = [700,799]
trigger4 = !inguarddist
trigger4 = random < ailevel*48
value = 800



[State -1, Ground Totem]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = numhelper(4100) < 1
triggerall = ailevel > 2
triggerall = !inguarddist
triggerall = p2stateno != [4120,4121]
triggerall = var(5)=0
trigger1 = random < ailevel * 4
trigger1 = ctrl
trigger1 = p2statetype != A
trigger2 = p2statetype = L
trigger2 = random < ailevel * 12
trigger2 = ctrl 
value = 1200

[State -1, Air Totem]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = numhelper(4100) < 1
triggerall = p2stateno != [4120,4121]
triggerall = ailevel > 2
triggerall = var(5)=0
triggerall = !inguarddist
trigger1 = p2bodydist x > 0  && p2bodydist x < 300
trigger1 = random < ailevel * 24
trigger1 = p2bodydist y < -150 && p2bodydist y > -600
trigger1 = var(1) || ctrl= 1
trigger2 = p2statetype = L
trigger2 = ctrl
trigger2 = random < ailevel * 2
trigger2 = enemy,name = "Jiggly Bunny" || enemy,name = "Lardo Rat" || enemy,name = "Twiggi Bunny" || enemy,name = "Enorma Pig"
value = 1210


[state -1, S.Jab1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = p2statetype != L
triggerall = !inguarddist
triggerall =! enemy,movetype = A
triggerall = p2bodydist x < 110
triggerall = (p2bodydist y > -240  && p2bodydist x < 135)
triggerall = (p2statetype = S || p2statetype = C)
triggerall = !numtarget(610)
trigger1 = random < (ailevel*32)
trigger1 = p2statetype != C
trigger2 = enemy,movetype = H
trigger2 = enemy,statetype = S
trigger3 = random < ailevel*4
trigger3 = p2statetype = C
trigger4 = stateno = 200 && time > 6
trigger4 = random < ailevel * 6
trigger4 = movecontact
value = 200

[state -1, Alt S Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = p2bodydist x < 110
triggerall = p2bodydist y < -10  && p2bodydist y > -300
trigger1 = p2statetype = A
trigger1 = !inguarddist
trigger1 = random < ailevel * 16
trigger2 = numtarget(610)
trigger2 = random < ailevel * 12
value = 215

[state -1, C. Jab1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = p2statetype != L
triggerall = !inguarddist
triggerall = p2bodydist y < 0 && p2bodydist y > -60
triggerall = p2bodydist x < 120
trigger1 = random < ailevel*24
trigger1 = p2statetype = C
trigger2 = enemy,movetype = H
trigger2 = random < ailevel* 32
trigger2 = p2statetype = C
trigger3 = random < ailevel*2
trigger3 = p2statetype = S
value = 400

[state -1, J. Jab1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ctrl
triggerall = p2statetype != L
triggerall = !inguarddist
triggerall = p2bodydist x < 150
triggerall = p2statetype = A
triggerall = p2bodydist y < 220 && p2bodydist y > -220
trigger1 = random < ailevel*56
trigger1 = p2stateno != 673
trigger2 = stateno = 600 && movecontact
trigger2 = random < ailevel * 32
trigger2 = p2stateno != 673
value = 600

[state -1, S. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 90
trigger1 = stateno = 200 && movecontact
value = 230

[state -1, J. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = stateno = 600 && movecontact
triggerall = p2statetype = A
triggerall = p2bodydist y < 220 && p2bodydist y > -220
trigger1 = stateno = 600 && movecontact
trigger1 = random < ailevel * 40
value = 630

[state -1, C. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 140
trigger1 = stateno = 400 && movecontact
trigger1 = random < ailevel * 32
trigger2 = ctrl
trigger2 = random < ailevel * 16
trigger2 = p2statetype = S
value = 430

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 210
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel  
triggerall = ctrl
triggerall = numhelper(21000) < 1
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -160 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [5,22] ; 5 = startup time, 22 = active ; [0,5] for last second
 

[state -1, S.Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = numhelper(21000) < 1
trigger1 = p2bodydist x < 510
triggerall = p2bodydist y > -140
trigger1 = stateno = 200 && moveguarded
trigger1 = random < ailevel * 40
trigger1 = p2bodydist x < 510
trigger2 = stateno = 230 && movecontact
trigger2 = random < ailevel * 48
trigger2 = p2bodydist x < 510
trigger3 = p2statetype = L
trigger3 = ctrl
trigger3 = random < ailevel * 36
value = 210

[state -1, J.Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist y < 300 && p2bodydist y > -30
trigger1 = stateno = 630 && movehit
trigger1 = random < ailevel * 36
trigger2 = random < ailevel*24
trigger2 = ctrl
trigger2 = pos y < -350 && vel y > 0
trigger3 = p2stateno = 673
trigger3 = ctrl
trigger3 = random < ailevel * 24
value = 610


[state -1, J.Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist y > 0
triggerall = pos y < -250
triggerall = p2bodydist x  < 110 && p2bodydist x > -110
trigger1 = stateno = 610 && movehit
trigger1 = random < ailevel * 4
trigger1 = p2statetype = A
trigger2 = random < ailevel*2
trigger2 = ctrl
trigger2 = p2statetype = C
trigger3 = random < ailevel
trigger3 = ctrl
value = 611

[state -1, C.Fierce - Launcher]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = p2bodydist x < 330
trigger1 = stateno = 230 && movehit
trigger1 = random < ailevel*24
trigger2 = stateno = 430 && movehit
trigger2 = random < ailevel* 40
trigger3 = ctrl
trigger3 = !inguarddist
trigger3 = enemy,statetype = A
trigger3 = random < ailevel * 2
trigger4 = enemynear,stateno = 673
trigger4 = ctrl
trigger4 = random < ailevel * 36
value = 410

[state -1, S.Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 400
triggerall = p2bodydist y > -140
trigger1 = stateno = 200 && movehit
trigger1 = random < ailevel * 6
trigger2 = stateno = 230 && movehit
trigger2 = random < ailevel * 8
trigger3 = random < ailevel * 16
trigger3 = ctrl
trigger3 = p2bodydist x = [320,380]
trigger3 = !inguarddist
trigger4 = p2bodydist x > 280 && p2bodydist x < 500
trigger4 = ctrl
trigger4 = !inguarddist
trigger4 = random < ailevel * 32
trigger5 = stateno = 230 && movehit
trigger5 = numhelper(21000)
trigger5 = random < ailevel * 48
trigger6 = enemy,name = "Bertha Hippo"
trigger6 = p2stateno = [1030,1034]
trigger6 = ctrl
trigger6 = random < ailevel * 32
trigger7 = numtarget(610)
trigger7 = random < ailevel * 18
value = 240

[state -1, C.Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 520
triggerall = !inguarddist
trigger1 = stateno = 430 && movehit
trigger1 = random < ailevel * 4
trigger2 = random < ailevel * 2
trigger2 = ctrl
trigger2 = !inguarddist
trigger2 = enemynear,statetype = S
trigger3 = enemy,name = "Bertha Hippo"
trigger3 = p2stateno = [1030,1034]
trigger3 = ctrl
trigger3 = random < ailevel * 32
value = 440

[state -1, J.Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = !inguarddist
triggerall = p2bodydist y < 60 && p2bodydist y > -220
trigger1 = stateno = 630 && movehit
trigger1 = random < ailevel * 40
trigger2 = random < ailevel * 24
trigger2 = ctrl
trigger2 = pos y < 350 && vel y > 0
value = 640


;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;[State -1, Smash Kung Fu Upper]
;type = ChangeState
;value = 3050
;triggerall = command = "SmashKFUpper"
;triggerall = power >= 1000
;triggerall = statetype != A
;trigger1 = ctrl
;trigger2 = hitdefattr = SC, NA, SA, HA
;trigger2 = stateno != [3050,3100)
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;---------------------------------------------------------------------------
;Trap Elevator(uses one super bar)
[State -1, Smellevator]
type = ChangeState
value = 3000
triggerall = command = "SUPER"
triggerall = power > 2999
triggerall = statetype != A
triggerall = numhelper(3010) < 1
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno =[1000,1399]
trigger3 = stateno != 1050
trigger3 = stateno != 1060
trigger3 = stateno != 1070
trigger3 = movecontact
trigger4 = numhelper(21000)
trigger4 = helper(21000),movecontact
trigger5 = numhelper(11000)
trigger5 = helper(11000),movecontact
trigger6 = numhelper(10000)
trigger6 = helper(10000),movecontact

[State -1, Colon Cannon]
type = ChangeState
value = 3040
triggerall = command = "Super2"
triggerall = power > 999
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno =[1000,1399]
trigger3 = stateno != 1050
trigger3 = stateno != 1060
trigger3 = stateno != 1070
trigger3 = movecontact
trigger4 = numhelper(21000)
trigger4 = helper(21000),movecontact
trigger5 = numhelper(11000)
trigger5 = helper(11000),movecontact
trigger6 = numhelper(10000)
trigger6 = helper(10000),movecontact

[State -1, Ass Vacuum]
type = changestate
value = 3080
triggerall = command = "Super3"
triggerall = power > 999
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno =[1000,1399]
trigger3 = stateno != 1050
trigger3 = stateno != 1060
trigger3 = stateno != 1070
trigger3 = movecontact
trigger4 = numhelper(21000)
trigger4 = helper(21000),movecontact
trigger5 = numhelper(11000)
trigger5 = helper(11000),movecontact
trigger6 = numhelper(10000)
trigger6 = helper(10000),movecontact



;-----------------------------------------------------------------------------
;Skunk Cannon EX
[state -1, Skunk Vacuum]
type = changestate
value = 1020
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = command = "QCF_c"
triggerall = power > 499
trigger1 = Var(1)
trigger2 = ctrl 

;-----------------------------------------------------------------------------
;Skunk Cannon light
[state -1, Skunk Cannon L]
type = changestate
value = 1000
triggerall = var(30) != 59
triggerall = !numhelper(1000)
triggerall = statetype != A
triggerall = command = "QCF_a"
triggerall = numhelper(1000) < 1
trigger1 = Var(1)
trigger2 = ctrl 

;-----------------------------------------------------------------------------
;Skunk Cannon Heavy
[state -1, Skunk Cannon H]
type = changestate
value = 1010
triggerall = statetype != A
triggerall = !numhelper(1000)
triggerall = command = "QCF_b"
triggerall = numhelper(1000) < 1
trigger1 = Var(1)
trigger2 = ctrl 

;-----------------------------------------------------------------------------
;Booty Hammer EX
[State -1, Booty Hammer]
type = ChangeState
value = 1070
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = power > 499
triggerall = command = "QCB_c"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl


;-----------------------------------------------------------------------------
;Booty Hammer Light
[State -1, Booty Hammer]
type = ChangeState
value = 1050
triggerall = statetype != A
triggerall = command = "QCB_a"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;-----------------------------------------------------------------------------
;Booty Hammer Heavy
[State -1, Booty Hammer]
type = ChangeState
value = 1060
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = command = "QCB_b"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;-----------------------------------------------------------------------------
;Skunk Vaccum
[state -1, Skunk Cannon H]
type = changestate
value = 1320
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = command = "QCD_c"
triggerall = power > 499
trigger1 = Var(1)
trigger2 = ctrl 

;-----------------------------------------------------------------------------
;Skunk Vaccum
[state -1, Skunk Cannon L]
type = changestate
value = 1300
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = command = "QCD_a"
trigger1 = Var(1)
trigger2 = ctrl 

;-----------------------------------------------------------------------------
;Skunk Vaccum
[state -1, Skunk Cannon H]
type = changestate
value = 1310
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = command = "QCD_b"
trigger1 = Var(1)
trigger2 = ctrl 



;----------------------------------------------------------------------------
;Gas Geyser EX
[State -1, Fast Kung Fu Upper]
type = ChangeState
value = 1120
triggerall = command = "QCF_xy"
triggerall = statetype != A
triggerall = power > 499
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Gas Geyser Light
[State -1, Light Kung Fu Upper]
type = ChangeState
value = 1100
triggerall = var(30) != 59
triggerall = numhelper(11000) < 1
triggerall = statetype != A
triggerall = command = "QCF_x"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
;---------------------------------------------------------------------------
;Gas Geyser Heavy
[State -1, Strong Kung Fu Upper]
type = ChangeState
value = 1110
triggerall = numhelper(11000) < 1
triggerall = statetype != A
triggerall = command = "QCF_y"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
;---------------------------------------------------------------------------
;Curse Element
[State -1, Curse Element]
type = ChangeState
value = 1150
triggerall = var(30) != 59
triggerall = ailevel > 0
triggerall = var(30) != 59
triggerall = command = "DD_a"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Poison Element
[State -1, Curse Element]
type = ChangeState
value = 1160
triggerall = var(30) != 59
triggerall = var(30) != 59
triggerall = ailevel > 0
triggerall = command = "DD_b"
triggerall = statetype != A
trigger1 = ctrl

;-----------------------------------------------------------------------------
;Totem Summon
[state -1, Totem Air]
type = changestate
value = 1220
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = numhelper(4100) < 1
triggerall = power > 499
triggerall = command = "Totem EX"
trigger1 = Var(1)
trigger2 = ctrl 

;-----------------------------------------------------------------------------
;Totem Summon
[state -1, Totem Ground]
type = changestate
value = 1200
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = numhelper(4100) < 1
triggerall = command = "Totem Ground"
trigger1 = Var(1)
trigger2 = ctrl 

;-----------------------------------------------------------------------------
;Totem Summon
[state -1, Totem Air]
type = changestate
value = 1210
triggerall = var(30) != 59
triggerall = statetype != A
triggerall = numhelper(4100) < 1
triggerall = command = "Totem Air"
trigger1 = Var(1)
trigger2 = ctrl 



;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
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
triggerall = var(30) != 59
triggerall = command = "Grab"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------
;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = var(30) != 59
triggerall = stateno = [150,153]
triggerall = statetype != A
triggerall = power > 999
trigger1 = command = "recovery"


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
trigger2 = stateno = 200 && time > 6



;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = command = "y"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400 || stateno = 230 || stateno = 430 
trigger2 = movecontact
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = var(30) != 59
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
trigger2 = movecontact



;---------------------------------------------------------------------------
;Taunt
;[State -1, Taunt]
;type = ChangeState
;value = 195
;triggerall = command = "start"
;trigger1 = statetype != A
;trigger1 = ctrl

;----------------------------------------------------------------------------





;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = var(30) != 59
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 430 || stateno = 200 || stateno = 230
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
trigger2 = stateno = 400 || stateno = 200
trigger2 = movecontact 


;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = var(30) != 59
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Belly Flop
[State -1, Jump Strong Punch]
type = ChangeState
value = 611
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 640
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
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

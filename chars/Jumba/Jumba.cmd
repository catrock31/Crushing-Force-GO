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


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "SUPER"
command = ~F, D, B, F, D, B, x
time = 40
buffer.time = 8

[Command]
name = "SUPER"
command = ~F, D, B, F, D, B, y
time = 40
buffer.time = 8

[Command]
name = "SUPER"
command = ~F, $D, B, y+z
time = 40
buffer.time = 8

[Command]
name = "SUPER"
command = ~F, $D, B, x+z
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = c+z
time = 1

[COMMAND]
name = "Super2"
command = ~D,DF,F,D,DF,F,a
time = 40
buffer.time = 8

[COMMAND]
name = "Super2"
command = ~D,F,D,F,a
time = 40
buffer.time = 8


[COMMAND]
name = "Super2"
command = ~D,DF,F,a+c
time = 20
buffer.time = 8


[COMMAND]
name = "Super2"
command = ~D,DF,F,D,DF,F,b
time = 40
buffer.time = 8


[COMMAND]
name = "Super2"
command = ~D,F,D,F,b
time = 40
buffer.time = 8


[COMMAND]
name = "Super2"
command = ~D,DF,F,b+c
time = 20
buffer.time = 8


[Command]
name = "Super3"
command = ~F,DF,D,DB,B,y+z
time = 20
buffer.time = 8


[Command]
name = "Super3"
command = ~F,D,B,y+z
time = 20
buffer.time = 8

[Command]
name = "Super3"
command = ~F,D,B,x+z
time = 20
buffer.time = 8

[Command]
name = "Super3"
command = ~F,DF,D,DB,B,x+z
time = 20
buffer.time = 8

[Command]
name = "Super3"
command = ~F,DF,D,DB,B,y+z
time = 20
buffer.time = 8

[Command]
name = "Super3"
command = ~F,DF,D,DB,B,F,DF,D,DB,B,x
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = ~F,DF,D,DB,B,F,DF,D,DB,B,y
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = ~F,D,B,F,D,B,x
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = ~F,D,B,F,D,B,y
time = 40
buffer.time = 8

[Command]
name = "AddOn"
command = $D,$D
time = 30
buffer.time = 8

[Command]
name = "AddOn"
command = $F,$B
time = 30
buffer.time = 8

[Command]
name = "AddOn"
command = a
time = 1
buffer.time = 8

[Command]
name = "AddOn"
command = /a
time = 1

[Command]
name = "AddOn"
command = b
time = 1
buffer.time = 8

[Command]
name = "AddOn"
command = /b
time = 1

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, x;~F, D, DF, F, D, DF, x
time = 20

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, D, DB, B, y;~F, D, DF, F, D, DF, y
time = 20

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
buffer.time = 12

[Command]
name = "upper_y"
command = ~F, D, DF, y
buffer.time = 12

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y
buffer.time = 12

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
name = "QCF_ab"
command = ~D, DF, F, a+b

[Command]
name = "QCF_ab"
command = ~D, DF, F, c

[command]
name = "HCB_x"
command = ~F, DF, D, DB, B, x
time = 25

[command]
name = "HCB_x"
command = ~F, $D, B, x
time = 25

[command]
name = "HCB_y"
command = ~F, DF, D, DB, B, y
time = 25

[command]
name = "HCB_y"
command = ~F,$D, B, y
time = 25

[command]
name = "HCB_z"
command = ~F, DF, D, DB, B, z
time = 25

[command]
name = "HCB_z"
command = ~F, DF, D, DB, B, x+y
time = 25

[command]
name = "HCB_z"
command = ~F, $D, B, z
time = 25

[command]
name = "HCB_z"
command = ~F, $D, B, x+y
time = 25

[command]
name = "DP_x"
command = ~F,D,DF,x
time = 25
buffer.time = 12

[command]
name = "DP_y"
command = ~F,D,DF,y
time = 25
buffer.time = 12

[command]
name = "DP_z"
command = ~F,D,DF,z
buffer.time = 8
buffer.time = 12


[command]
name = "DP_z"
command = ~F,D,DF,x+y
buffer.time = 8
buffer.time = 12


[command]
name = "RDP_x"
command = ~B,D,DB,x
buffer.time = 12


[command]
name = "RDP_y"
command = ~B,D,DB,y
buffer.time = 12



[command]
name = "RDP_z"
command = ~B,D,DB,z
buffer.time = 12



[command]
name = "RDP_z"
command = ~B,D,DB,x+y
buffer.time = 12





[command]
name = "FK_x"
command = ~30$D,$U,x
time = 40

[command]
name = "FK_y"
command = ~30$D,$U,y
time = 40

[command]
name = "FK_z"
command = ~30$D,$U,z
time = 40

[command]
name = "FK_z"
command = ~30$D,$U,x+y
time = 40


[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

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
command = D, $U
time = 10

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
buffer.time = 1

[Command]
name = "teleport"
command = y+b
time = 1
buffer.time = 1

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
buffer.time = 1


[Command]
name = "down_b"
command = /$D,b
time = 1
buffer.time = 1


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
name = "start"
command = s
time = 1
buffer.time = 1


[command]
name = "holdy"
command = /y
time = 1
buffer.time = 1


[command]
name = "holdb"
command = /b
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


[Command]
name = "downforward"
command = /DF
time = 1
buffer.time = 1


[Command]
name = "tapfwd"
command = F
time = 1
buffer.time = 1


[Command]
name = "tapback"
command = B
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
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 
trigger2 = stateno != 410
trigger2 = stateno != 245
trigger2 = movecontact
trigger3 = (stateno = [600,640])
trigger3 = stateno != 631
trigger3 = stateno != 610
trigger3 = stateno != 640
trigger3 = movehit
trigger4 = stateno = 410
trigger4 = movehit
trigger5 = stateno = 610 || stateno = 640
trigger5 = movehit
var(1) = 1
ignorehitpause

;==========================================================================
;---| AI section | --------------------------------------------------------
;==========================================================================

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
v=30
value=0 
Ignorehitpause=1

[State -1, Jump]
type = changestate
Triggerall=var(30)=59
triggerall = Statetype != A
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = ctrl
trigger1 = enemy,hitdefattr = S,AT
trigger1 = random < ailevel * 6
trigger2 = p2bodydist x = [280, 450]
trigger2 = random < ailevel * 16
trigger2 = enemy,statetype = S || enemy,statetype = C
trigger2 = ctrl
trigger3 = enemy,name = "Katrina Crocodile"
trigger3 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger3 = ctrl && random < (ailevel*6)
trigger4 = enemy,name = "Zafta Giraffe"
trigger4 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger4 = ctrl && random < (ailevel*6)
trigger5 = enemy,name = "Makuyama"
trigger5 = enemy,stateno = 1101 || enemy,stateno = 1111 || enemy,stateno = 1121
trigger5 = ctrl && random < (ailevel*8) 
trigger6 = enemy,name = "Julian Hippo"
trigger6 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger6 = ctrl && random < (ailevel*6)
trigger7 = enemy,name = "Pastilla Skunk"
trigger7 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger7 = ctrl && random < (ailevel*6)
value = 40

[state -1, AI Backdash]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 1
trigger1 = backedgebodydist >  120
trigger1 = p2stateno = [5100,5120]
trigger1 = p2bodydist x < 200
trigger1 = random < (ailevel*48)
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < (ailevel*2)
value = 105

[state -1, Normal Run]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = stateno != 100
trigger1 = p2bodydist x > 550
trigger1 = !inguarddist
trigger1 = random < ailevel * 24
trigger1 = p2statetype = L
value = 100
;Wall Jump
[State -1, wall Jump]
type = ChangeState
triggerall = var(30) = 59
triggerall = ctrl
triggerall = !inguarddist
triggerall = pos y < -200
triggerall = statetype = A
triggerall = stateno != 55
triggerall = time > 4
trigger1 = backedgebodydist < 30
trigger2 = frontedgebodydist < 30
value = 55

;Wall Grab
[state -1, Wall Jump grab]
type = changestate
triggerall = var(30) = 59
triggerall = stateno = 55
triggerall = time = 8
triggerall = ailevel > 2
triggerall = p2bodydist x < 400
trigger1 = random < ailevel * 12
trigger1 = p2statetype != C
trigger1 = p2statetype != L
value = 1040
;---------------------------------------------------------------------------
;--------Defence;
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


[state -1, defensive dodge]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = (stateno = [150,153])
triggerall = power > 999
triggerall = ailevel > 5
trigger1 = random < (ailevel) 
trigger2 = random < (ailevel * 12) && (enemy,hitdefattr = SCA,HA ||enemy,hitdefattr = SCA, HP)
trigger3 = random < (ailevel * 4) && (enemy,hitdefattr = SCA,SA)
value = 1400

[state -1, Super Izuna Drop Attempt]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = power > 2999
triggerall = statetype = A
triggerall = p2bodydist x = [-120, 360]
triggerall = p2bodydist y = [-400, 300]
triggerall = p2statetype = A
trigger1 = random < ailevel * 48
trigger1 = ctrl
value = 3000

[state -1, Super Ass Assault]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = power > 999
triggerall = statetype != A
triggerall = p2statetype = S  ||  p2statetype = C
triggerall = p2statetype != L
triggerall = p2stateno != [660,669]
triggerall = p2bodydist y = [-300, 0]
trigger1 = random < ailevel * 18
trigger1 = ctrl
trigger1 = enemynear, animtime < -24
trigger1 = enemynear, ctrl = 0
trigger2 = stateno = 240
trigger2 = random < ailevel * 12
trigger2 = movehit
trigger3 = stateno = 1006  || stateno = 1016 || stateno  = 1026
trigger3 = movehit
trigger3 = random < ailevel * 24
value = 3040

[State -1, AI Ass Assault] ;by Inktrebuchet
type = ChangeState
value = 3040
triggerall = ailevel > 3
triggerall = statetype != A
triggerall = power > 999
triggerall = ctrl
triggerall = p2stateno != [660,669]
trigger1 = random < ailevel * 24
trigger1 = enemy,ctrl = 0
trigger1 = p2statetype != A
trigger1 = p2statetype != L
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,6] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.

[state -1, Super Elephant Ninja grab]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = power > 999
triggerall = statetype != A
triggerall = p2statetype = S  ||  p2statetype = C
triggerall = p2statetype != L
triggerall = p2stateno != [660,669]
triggerall = p2bodydist x = [-50,130]
trigger1 = random < ailevel * 18
trigger1 = ctrl
value = 3050

[state -1, Jumping Buttdrop]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel 
triggerall = statetype = A
triggerall = p2bodydist x =[-180, 230]
triggerall = pos y < -250
triggerall = p2bodydist y > 0
triggerall = p2stateno != [660,669]
trigger1 = ctrl
trigger1 = random < ailevel * 24
trigger2 = p2statetype = C
trigger2 = ctrl
trigger2 = random < ailevel * 16
trigger3 = prevstateno = 1310
trigger3 = random < ailevel * 4
trigger3 = ctrl
trigger4 = p2bodydist x = [-120,120]
trigger4 = ctrl
trigger4 = random < ailevel * 18
value = 650

[state -1, air Throw]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 2
triggerall = enemy,statetype = A
triggerall = enemy,movetype != H
triggerall = p2bodydist x = [-20,120]
triggerall = p2bodydist y = [-450, 220]
triggerall = var(37) > 0
trigger1 = ctrl
trigger1 = random < ailevel * 24
value = 830

[state -1, Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != L
trigger1 = random < ailevel * 4
trigger1 = !inguarddist
trigger1 = ctrl
trigger1 = p2bodydist x =[0, 200]
trigger1 = p2bodydist y = [-500,0]
trigger2 = ctrl
trigger2 = p2bodydist x =[0, 370]
trigger2 = p2bodydist y = [-540,-200]
trigger2 = p2statetype = A
trigger2 = random < ailevel * 32
trigger3 = (stateno = 230)
trigger3 = movehit
trigger3 = random < ailevel * 4
trigger3 = p2bodydist x =[0, 200]
trigger3 = p2bodydist y = [-500,0]
trigger4 = enemynear,statetype = A
trigger4 = numtarget(800)
trigger4 = ctrl
trigger4 = random < ailevel * 24
value = 245




[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1070
triggerall = var(30) = 59
triggerall = ailevel > 4
triggerall = power > 499
triggerall = statetype != A
triggerall = Ctrl
triggerall = random < ailevel * 48
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 2 ;5= startup time
 

[state -1, Flip]
type = changestate
value = 1070
triggerall = var(30) = 59
triggerall = ailevel > 4
triggerall = p2statetype != L
triggerall = p2movetype != H
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = !inguarddist

[state -1, EX rush in]
type = changestate
value = 1020
triggerall = var(30) = 59
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2bodydist x != [-100,130]
triggerall = statetype != A
triggerall = !inguarddist
trigger1 = enemynear,ctrl = 0
trigger1 = enemynear,animtime < -12
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = enemynear,movetype != H
trigger2 = p2bodydist x > 600
trigger2 = random < ailevel * 2
trigger2 = ctrl
trigger3 = p2bodydist x > 400
trigger3 = p2statetype = L
trigger3 = ctrl
trigger3 = random < ailevel * 24

[state -1, EX Izuna Drop Attempt]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 4
triggerall = statetype = A
triggerall = p2bodydist x = [0, 260]
triggerall = p2bodydist y = [-400, 300]
triggerall = power > 499
triggerall = p2statetype = A
trigger1 = random < ailevel * 8
trigger1 = ctrl
trigger2 = random < ailevel * 16
trigger2 = p2movetype = A
trigger2 = ctrl
trigger3 = stateno = 600
trigger3 = movehit
trigger3 = random < ailevel * 4
trigger4 = p2stateno = 673
trigger4 = ctrl
trigger4 = random < ailevel * 32
trigger5 = stateno = 610
trigger5 = movehit
trigger5 = random < ailevel * 24
trigger5 = p2statetype = A
value = 1120

[state -1, Fierce Launcher]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 200]
triggerall = p2bodydist y = [-580,0]
trigger1 = Random < Ailevel * 4
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = !inguarddist
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = stateno = 230
trigger3 = random < ailevel * 16
trigger3 = movehit
trigger4 = (stateno = 200) || (stateno = 400)
trigger4 = movehit
trigger4 = p2statetype = A
trigger4 = random < ailevel * 24
value = 410

[state -1, Light Izuna Drop Attempt]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype = A
triggerall = p2bodydist x = [0, 260]
triggerall = p2bodydist y = [-400, 300]
triggerall = p2movetype != H
triggerall = p2statetype = A
trigger1 = random < ailevel * 12
trigger1 = ctrl
trigger1 = var(37) <= 0
trigger2 = random < ailevel * 2
trigger2 = ctrl
trigger2 = var(37) > 2
value = 1110

[state -1, Light Izuna Drop Attempt]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype = A
triggerall = p2bodydist x = [0, 360]
triggerall = p2bodydist y = [-400, 300]
triggerall = p2movetype != H
triggerall = p2statetype = A
trigger1 = random < ailevel * 12
trigger1 = ctrl
trigger1 = var(37) <= 0
trigger2 = random < ailevel * 2
trigger2 = ctrl
trigger2 = var(37) > 0
value = 1100

[state -1, Light Slide]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1000
triggerall = !enemy,stateno = [660,669]
triggerall = animelemtime(2) > 0
triggerall = p2bodydist x = [0, 420]
trigger1 = p2statetype = S
trigger1 = random < ailevel * 12
trigger2 = p2statetype = C
trigger2 = random < floor(16 / ailevel) 
trigger3 = p2statetype = L
trigger3 = random < ailevel * 48
trigger4 = p2bodydist x = [0,100]
trigger4 = random < ailevel * 24
value = 1002

[state -1, Heavy Slide]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1010
triggerall = !enemy,stateno = [660,669]
triggerall = animelemtime(2) > 0
triggerall = p2bodydist x = [0, 420]
trigger1 = p2statetype = S
trigger1 = random < ailevel * 12
trigger2 = p2statetype = C
trigger2 = random < floor(16 / ailevel) 
trigger3 = p2statetype = L
trigger3 = random < ailevel * 48
trigger4 = p2bodydist x = [0,100]
trigger4 = random < ailevel * 24
value = 1012

[state -1, EX Slide]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1029
triggerall = !enemy,stateno = [660,669]
triggerall = animelemtime(2) > 0
triggerall = p2bodydist x = [0, 420]
trigger1 = p2statetype = S
trigger1 = random < ailevel * 12
trigger2 = p2statetype = C
trigger2 = random < floor(16 / ailevel) 
trigger3 = p2statetype = L
trigger3 = random < ailevel * 48
trigger4 = p2bodydist x = [0,100]
trigger4 = random < ailevel * 24
value = 1022

[state -1, Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1000
triggerall = p2statetype != L
triggerall = animelemtime(2) > 0
trigger1 = inguarddist
trigger1 = enemynear,hitdefattr != SCA,HP,HA,HT
trigger1 = p2bodydist x < 160
trigger2 = p2bodydist x = [0,100]
trigger2 = random < ailevel * 24
value = 1006

[state -1, Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1010
triggerall = p2statetype != L
triggerall = animelemtime(2) > 0
trigger1 = inguarddist
trigger1 = enemynear,hitdefattr != SCA,HP,HA,HT
trigger1 = p2bodydist x < 160
trigger2 = p2bodydist x = [0,100]
trigger2 = random < ailevel * 24
value = 1016

[state -1, Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1029
triggerall = p2statetype != L
triggerall = animelemtime(2) > 0
trigger1 = inguarddist
trigger1 = enemynear,hitdefattr != SCA,HP,HA,HT
trigger1 = p2bodydist x < 160
trigger2 = p2bodydist x = [0,100]
trigger2 = random < ailevel * 24
value = 1026

[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1006
triggerall = ailevel  
triggerall = stateno = 1000
triggerall = animelemtime(2) > 0
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x < 300
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,6] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
 
[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1016
triggerall = ailevel  
triggerall = stateno = 1010
triggerall = animelemtime(2) > 0
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x < 300
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,6] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
 
[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1026
triggerall = ailevel  
triggerall = stateno = 1029
triggerall = animelemtime(2) > 0
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x < 300
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,6] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
 
[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1003
triggerall = ailevel  
triggerall = stateno = 1000
triggerall = animelemtime(2) > 0
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x < 300
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,6] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
 
[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1013
triggerall = ailevel  
triggerall = stateno = 1010
triggerall = animelemtime(2) > 0
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x < 300
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,6] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.

[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1023
triggerall = ailevel  
triggerall = stateno = 1029
triggerall = animelemtime(2) > 0
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x < 300
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,6] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
  


 
[state -1, Light Flip]
type = changestate
value = 1050
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2movetype != H
triggerall = p2bodydist x = [0,350]
trigger1 = ctrl
trigger1 = random < ailevel
trigger1 = !inguarddist
trigger2 = stateno = 240
trigger2 = moveguarded
trigger2 = random < ailevel * 8
trigger3 = stateno = 210
trigger3 = moveguarded
trigger3 = random < ailevel * 2


[state -1, Heavy Flip]
type = changestate
value = 1060
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = p2movetype != H
triggerall = statetype != A
trigger1 = p2bodydist x = [450,750]
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = !inguarddist
trigger2 = p2bodydist x = [0,300]
trigger2 = stateno = 210
trigger2 = moveguarded
trigger2 = random < ailevel * 4


[state -1, butt drop]
type = changestate
value = 1071
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = animelemtime(3) > 0
triggerall = stateno = 1070
triggerall = p2stateno != [660,669]
triggerall = p2bodydist x = [-180,230]
triggerall = p2bodydist y > 0
trigger1 = random < ailevel * 12
trigger1 = p2statetype = C
trigger2 = inguarddist
trigger2 = random < ailevel * 12
trigger3 = p2movetype = H
trigger3 = p2statetype = A
trigger3 = enemynear,ctrl = 0
trigger3 = random < ailevel * 12

[state -1, butt drop]
type = changestate
value = 1051
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = animelemtime(3) > 0
triggerall = stateno = 1050
triggerall = p2stateno != [660,669]
triggerall = p2bodydist x = [-180,230]
triggerall = p2bodydist y > 0
trigger1 = random < ailevel * 24
trigger1 = p2statetype = C
trigger2 = inguarddist
trigger2 = random < ailevel * 12
trigger3 = p2movetype = H
trigger3 = p2statetype = A
trigger3 = enemynear,ctrl = 0
trigger3 = random < ailevel * 12

[state -1, butt drop]
type = changestate
value = 1061
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = animelemtime(3) > 0
triggerall = stateno = 1060
triggerall = p2stateno != [660,669]
triggerall = p2bodydist x = [-180,230]
triggerall = p2bodydist y > 0
trigger1 = random < ailevel * 24
trigger1 = p2statetype = C
trigger2 = inguarddist
trigger2 = random < ailevel * 12
trigger3 = p2movetype = H
trigger3 = p2statetype = A
trigger3 = enemynear,ctrl = 0
trigger3 = random < ailevel * 12

[state -1, grab attempt]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = enemynear,statetype != C
triggerall = p2movetype != H
triggerall = animelemtime(3) > 0
triggerall = stateno = 1070
triggerall = p2statetype != L
triggerall = pos y < -100
triggerall = p2bodydist x = [80,340]
triggerall = p2bodydist y = [-370,300]
trigger1 = random < ailevel * 48
value = 1072

[state -1, Cancel]
type = changestate
value = 1054
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = (stateno = 1050) ||  (stateno = 1060) || (stateno = 1070)
triggerall = animelemtime(3) > 0
trigger1 = enemy,hitdefattr = SCA,HA
trigger1 = random < ailevel * 24
trigger2 = p2bodydist x < 0
trigger2 = random < ailevel * 2



[state -1, grab attempt]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = enemynear,statetype != C
triggerall = animelemtime(3) > 0
triggerall = p2movetype != H
triggerall = stateno = 1050
triggerall = p2statetype != L
triggerall = pos y < -100
triggerall = p2bodydist x = [80,340]
triggerall = p2bodydist y = [-370,300]
trigger1 = random < ailevel * 48
trigger1 = vel y > -4
value = 1052

[state -1, grab attempt]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = animelemtime(3) > 0
triggerall = stateno = 1060
triggerall = vel y > 0
triggerall = p2movetype != H
triggerall = enemynear,statetype != C
triggerall = p2statetype != L
triggerall = pos y < -100
triggerall = p2bodydist x = [80,340]
triggerall = p2bodydist y = [-370,300]
trigger1 = random < ailevel * 48 
value = 1062

[state -1, Stomp]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1010
triggerall = p2statetype != L
triggerall = p2stateno != 5120
triggerall = p2statetype != A
triggerall = animelemtime(2) > 0
triggerall = p2bodydist x = [-40, 200]
trigger1 = p2statetype = C  || p2statetype = L
trigger1 = random < ailevel * 4
trigger2 = p2statetype = S || p2statetype = A
trigger2 = random < floor(4 / ailevel) 
trigger3 = inguarddist
trigger3 = enemynear,animtime < -12
trigger3 = random < ailevel * 8
trigger3 = enemynear,statetype != A
trigger4 = enemy,hitdefattr = S,NT,ST,HT
trigger4 = random < ailevel * 12
trigger5 = p2statetype = C && p2movetype = A
trigger5 = random < ailevel * 12
trigger6 = p2bodydist x = [0,100]
trigger6 = random < ailevel * 24
value = 1013

[state -1, Stomp]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1029
triggerall = p2statetype != L
triggerall = p2stateno != 5120
triggerall = p2statetype != A
triggerall = animelemtime(2) > 0
triggerall = p2bodydist x = [-40, 200]
trigger1 = p2statetype = C  || p2statetype = L
trigger1 = random < ailevel * 4
trigger2 = p2statetype = S || p2statetype = A
trigger2 = random < floor(4 / ailevel) 
trigger3 = !inguarddist
trigger3 = enemynear,animtime < -8
trigger3 = random < ailevel * 8
trigger3 = enemynear,statetype != A
trigger4 = enemy,hitdefattr = S,NT,ST,HT
trigger4 = random < ailevel * 12
trigger5 = p2statetype = C && p2movetype = A
trigger5 = random < ailevel * 12
trigger6 = p2bodydist x = [0,100]
trigger6 = random < ailevel * 24
value = 1023

[state -1, Stomp]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1000
triggerall = p2statetype != L
triggerall = p2statetype != A
triggerall = p2stateno != 5120
triggerall = animelemtime(2) > 0
triggerall = p2bodydist x = [-40, 200]
trigger1 = p2statetype = C 
trigger1 = random < ailevel * 4
trigger2 = p2statetype = S || p2statetype = A
trigger2 = random < floor(4 / ailevel) 
trigger3 = inguarddist
trigger3 = enemynear,animtime < -8
trigger3 = random < ailevel * 8
trigger4 = enemy,hitdefattr = S,NT,ST,HT
trigger4 = random < ailevel * 12
trigger5 = p2statetype = C && p2movetype = A
trigger5 = random < ailevel * 12
trigger6 = p2bodydist x = [0,100]
trigger6 = random < ailevel * 24
value = 1003

[state -1, rush in]
type = changestate
value = 1000
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2stateno != 5120
triggerall = !inguarddist
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel
trigger2 = !inguarddist
trigger2 = enemynear,ctrl = 0
trigger2 = enemynear,animtime < -8
trigger2 = ctrl
trigger2 = random < ailevel * 2
trigger2 = p2bodydist x > 550

[state -1, rush in]
type = changestate
value = 1010
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = !inguarddist
trigger1 = stateno = 230 
trigger1 = moveguarded
trigger1 = random < ailevel * 2
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 8
trigger3 = !inguarddist
trigger3 = enemynear,ctrl = 0
trigger3 = enemynear,animtime < -8
trigger3 = ctrl
trigger3 = random < ailevel * 2


[state -1, Light stop]
type = changestate
value = 1001
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1000
triggerall = animelemtime(2) > 0
trigger1 = inguarddist
trigger1 = random < ailevel * 16
trigger2 = p2bodydist x < -550
trigger2 = random < ailevel * 12
trigger2 = p2statetype = L
trigger3 = p2bodydist x < -5

[state -1, Heavy stop]
type = changestate
value = 1011
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1010
triggerall = animelemtime(2) > 0
trigger1 = inguarddist
trigger1 = random < ailevel * 8
trigger2 = random < ailevel * 12
trigger2 = p2bodydist x < -550
trigger2 = p2statetype = L
trigger3 = p2bodydist x < -5

[state -1, EX stop]
type = changestate
value = 1021
triggerall = var(30) = 59
triggerall = ailevel > 0
triggerall = stateno = 1029
triggerall = animelemtime(2) > 0
trigger1 = p2bodydist x < -550
trigger1 = p2statetype = L
trigger1 = random < ailevel * 12
trigger2 = p2bodydist x < -5

[state -1, teleport]
type = changestate 
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = var(12) > 0
value = 1300
trigger1 = ctrl
trigger1 = random < floor(ailevel / 2)
trigger2 = stateno = 210 || stateno = 230 || stateno = 430
trigger2 = moveguarded
trigger2 = random < ailevel * 4
trigger3 = stateno = 640 || stateno = 610
trigger3 = moveguarded
trigger3 = random < ailevel * 2


[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1300
triggerall = ailevel  
triggerall = ctrl
triggerall = ailevel > 2
triggerall = statetype != A 
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [2,6] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger1 = inguarddist
trigger1 = random < ailevel * 36

[state -1, teleport]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = var(12) > 0
value = 1301
trigger1 = ctrl
trigger1 = random < ailevel

[state -1, jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != L
triggerall = p2bodydist y = [-520,0]
triggerall = p2bodydist x = [0,300]
trigger1 = Random < Ailevel * 18
trigger1 = ctrl
trigger2 = enemy,movetype = H
trigger2 = random < ailevel * 32
trigger2 = ctrl
value = 200

triggerall = p2bodydist x =[0, 180]
[state -1, C Jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 200]
triggerall = p2bodydist y = [-300,0]
trigger1 = Random < Ailevel * 18
trigger1 = ctrl
trigger2 = enemy,movetype = H
trigger2 = random < ailevel * 18
trigger2 = ctrl
trigger3 = stateno = 400
trigger3 = moveguarded
trigger3 = ctrl
trigger3 = random < ailevel
value = 400

[state -1, H. Moonsault]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2dist x = [0,600]
triggerall = p2dist y = [-600,-350]
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = A
trigger1 = random < floor(ailevel * 6)
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 24
value = 1160

[state -1, L. Moonsault]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,statetype != L
TRIGGERall = P2dist x = [0,600]
triggerall = p2dist y = [-370,0]
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = A
trigger1 = random < floor(ailevel * 6)
trigger2 = (stateno = 210) || (stateno = 240)
trigger2 = movehit
trigger2 = random < ailevel * 24
value = 1150

[state -1, Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype = L
triggerall = p2bodydist x =[0, 260]
triggerall = p2bodydist y = [-260,0]
trigger1 = Random < Ailevel * 6
trigger1 = ctrl
trigger1 = !inguarddist
trigger1 = p2statetype = S
trigger2 = stateno = 400
trigger2 = movehit
trigger2 = random < ailevel * 48
value = 430


[state -1, Overhead Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 560]
triggerall = p2bodydist y = [-300,0]
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = p2statetype = C
trigger2 = p2statetype = L
trigger2 = ctrl
trigger2 = random < ailevel* 16
trigger3 = prevstateno = 810 || prevstateno = 811
trigger3 = ctrl
trigger3 = random < ailevel * 32
value = 250


[state -1, Throw]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = ailevel > 2
triggerall = enemy,statetype != A
triggerall = enemy,statetype != L
triggerall = enemy,movetype != H
triggerall = p2bodydist x = [-20,100]
triggerall = ctrl
trigger1 = Random < Ailevel * 24
trigger2 = enemy,authorname = "Kazecat"
trigger2 = enemy,stateno = 1400
trigger2 = random < (ailevel*12)
value = 800



[state -1, Sweep]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist y = [-220,0]
triggerall = p2bodydist x = [0,510]
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger2 = p2bodydist x > 230
trigger2 = ctrl
trigger2 = random < ailevel * 4
trigger2 = p2statetype = S
value = 440

[state -1, Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 400]
triggerall = p2bodydist y = [-300,0]
trigger1 = Random < Ailevel * 12
trigger1 = ctrl
trigger1 = !inguarddist
value = 230

[state -1, Jumping Jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 320]
triggerall = p2bodydist y = [-200,200]
trigger1 = ctrl
trigger1 = random < ailevel * 32
trigger2 = stateno = 600
trigger2 = movecontact
trigger2 = random < ailevel * 18
value = 600

[state -1, Jumping short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = vel x >= 0
triggerall = (p2bodydist x =[120, 320])  || (p2bodydist x = [-320,-120])
triggerall = pos y < -150
triggerall = p2statetype != A
trigger1 = ctrl
trigger1 = random < ailevel * 16
trigger2 = (stateno = 1050) || (stateno = 1060) || (stateno = 1070)
trigger2 = animelemtime(3) > 0
trigger2 = random < ailevel * 4
trigger3 = p2dist x < 0
trigger3 = (stateno = 1050) || (stateno = 1060) || (stateno = 1070)
trigger3 = random < ailevel * 24
trigger4 = p2dist x < 0
trigger4 = ctrl
trigger4 = random < ailevel * 12
trigger5 = p2statetype = L
trigger5 = var(8) = 2
trigger5 = ctrl
trigger5 = random < ailevel * 24
value = 635

[state -1, Jumping short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 320]
triggerall = p2bodydist y = [-200,200]
trigger1 = ctrl
trigger1 = random < ailevel * 18
trigger2 = stateno = 600
trigger2 = movecontact
trigger2 = random < ailevel * 40
value = 630

[state -1, Jumping Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[-20, 500]
triggerall = p2bodydist y = [-400,300]
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = (pos y = [-420,-280])
trigger1 = vel y > 2
trigger2 = stateno = 630
trigger2 = movehit
trigger2 = random < ailevel * 40
trigger3 = (pos y = [-380,-350]) 
trigger3 = vel y > 2
trigger3 = ctrl
trigger3 = random < ailevel * 24
value = 610

[state -1, Jumping short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 320]
triggerall = p2bodydist y = [-200,200]
trigger1 = ctrl
trigger1 = random < ailevel * 6
trigger2 = stateno = 630
trigger2 = movehit
trigger2 = random < ailevel * 40
trigger3 = (pos y = [-380,-350]) 
trigger3 = vel y > 2
trigger3 = ctrl
trigger3 = random < ailevel * 24
value = 640



[state -1, jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != L
triggerall = p2bodydist x = [0,270]
trigger1 = stateno = 201
trigger1 = movehit
trigger1 = random < ailevel * 60
trigger2 = stateno = 201
trigger2 = movecontact
trigger2 = random < ailevel * 24
value = 205


[state -1, jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != L
triggerall = p2bodydist x = [0,290]
trigger1 = stateno = 200
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = random < ailevel * 32
value = 201



[state -1, Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 300]
triggerall = p2bodydist y = [-400,0]
trigger1 = Random < Ailevel * 4
trigger1 = ctrl
trigger1 = !inguarddist
trigger2 = stateno = 205
trigger2 = movehit
trigger2 = random < ailevel * 60
trigger3 = stateno = 230
trigger3 = movehit
trigger3 = random < ailevel * 40
trigger4 = stateno = 430
trigger4 = movehit
trigger4 = random < ailevel * 32
value = 210


[state -1, Throw]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
triggerall = statetype = S
triggerall = enemy,statetype != A
triggerall = enemy,statetype != L
triggerall = stateno = 210
triggerall = prevstateno = 205
triggerall = p2bodydist x = [-20,200]
trigger1 = Random < Ailevel * 48
trigger1 = backedgebodydist < 100
trigger1 = movehit
value = 801

[state -1, Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 390]
triggerall = p2bodydist y = [-450,0]
trigger1 = stateno = 210 && animelemtime(5) >= 0
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger1 = backedgebodydist >= 100
value = 240



;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;Smash Kung Fu Upper (uses one super bar)
;[State -1, Smash Kung Fu Upper]
;type = ChangeState
;value = 3050
;;triggerall = command = "SmashKFUpper"
;triggerall = power >= 1000
;triggerall = statetype != A
;trigger1 = ctrl
;trigger2 = hitdefattr = SC, NA, SA, HA
;trigger2 = stateno != [3050,3100)
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;---------------------------------------------------------------------------
;SUPER Izuna Drop 
[State -1, Super Izuna Drop]
type = ChangeState
value = 3000
triggerall = command = "SUPER"
triggerall = power > 2999
triggerall = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;SUPER Rush and Overwhelm
[State -1, Vanish and Butt Rush]
type = ChangeState
value = 3040
triggerall = command = "Super2"
triggerall = power > 999
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1006 || stateno = 1016 || stateno = 1026
trigger3 = movecontact
trigger4 = stateno = 1002 || stateno = 1012 || stateno = 1022
trigger4 = movecontact

;---------------------------------------------------------------------------
[State -1, Ground grab super by Ra lord]
type = ChangeState
value = 3050
triggerall = command = "Super3"
triggerall = power > 999
triggerall = statetype != A
trigger1 = ctrl






;===========================================================================
;EX Izuna Drop
[State -1, EX Izuna Drop]
type = changestate
value = 1120
triggerall = !ailevel
triggerall = statetype = A
triggerall = command = "HCB_z"
triggerall = power >499
trigger1 = ctrl
trigger2 = var(1)

;Light Izuna Drop
[State -1, Light Izuna Drop]
type = changestate
value = 1100
triggerall = !ailevel
triggerall = statetype = A
triggerall = command = "HCB_x"
trigger1 = ctrl
trigger2 = var(1)

;Hard Izuna Drop
[State -1, Hard Izuna Drop]
type = changestate
value = 1110
triggerall = !ailevel
triggerall = statetype = A
triggerall = command = "HCB_y"
trigger1 = ctrl
trigger2 = var(1)

;----------------------------------------------------------------------------

;Ninja Vanish Ground
[state -1, Ground Teleport]
type = changestate
value = 1300
triggerall = Statetype != A
triggerall = var(12) > 0
triggerall = command = "teleport"
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Ninja Vanish Air
[state -1, ground Teleport]
type = changestate
value = 1301
triggerall = statetype = A
triggerall = var(12) > 0
triggerall = command = "teleport"
trigger1 = ctrl
trigger2 = var(1) 


;---------------------------------------------------------------------------
;EX Slash Moonsault
[State -1, EX Slash Moonsault]
type = changestate
value = 1170
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "DP_z" || command = "RDP_z"
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)


;---------------------------------------------------------------------------

;Light Slash Moonsault
[State -1, Light Slash Moonsault]
type = changestate
value = 1150
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "DP_x" || command = "RDP_x"
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Slash Moonsault
[State -1, Heavy Slash Moonsault]
type = changestate
value = 1160
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "DP_y" || command = "RDP_y"
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;EX Jumba Rush
[State -1, Rush start]
type = changestate
value = 1020
triggerall = statetype != A
triggerall = command = "QCF_ab"
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Light Jumba Rush
[State -1, Rush start]
type = changestate
value = 1000
triggerall = statetype != A
triggerall = command = "QCF_a"
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Heavy Jumba Rush
[State -1, Rush start]
type = changestate
value = 1010
triggerall = statetype != A
triggerall = command = "QCF_b"
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;EX Jumba Flip
[State -1, EX Jumba Flip]
type = changestate
value = 1070
triggerall = statetype != A
triggerall = command = "QCF_xy"
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Light Jumba Flip
[State -1, Jumba Flip]
type = changestate
value = 1050
triggerall = statetype != A
triggerall = command = "QCF_x"
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Heavy Jumba Flip
[State -1, Jumba Flip]
type = changestate
value = 1060
triggerall = statetype != A
triggerall = command = "QCF_y"
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
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

;---------------------------------------------------------------------------

;Super Jump
[State -1, Run Back]
type = ChangeState
value = 41
trigger1 = command = "superjump"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Wall Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype = A
triggerall = ctrl
triggerall = stateno != 55
triggerall = time > 4
trigger1 = command = "tapfwd"
trigger1 = backedgebodydist < 30
trigger2 = command = "tapback"
trigger2 = frontedgebodydist < 30

;-----------------------------------------------------------------------------

;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "throw"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl

;-----------------------------------------------------------------------------

;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 830
triggerall = command = "throw"
triggerall = statetype = A
trigger1 = ctrl

;------------------------------------------------------------------------------
;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 999



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
;Stand Light Punch x2
[State -1, Stand Light Punch]
type = ChangeState
value = 201
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = movecontact
trigger1 = stateno = 200
trigger1 = command != "holdfwd"

;---------------------------------------------------------------------------
;Stand strong
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = movecontact
trigger1 = stateno = 201
trigger2 = movecontact
trigger2 = command = "holdfwd"
trigger2 = stateno = 200


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 205) || (stateno = 400)  || (stateno = 430)
trigger2 = movecontact

;------------------------------------------------------------------------------
;Follow UP throw 
[State -1, Follow up Throw]
type = ChangeState
value = 801
triggerall = command = "y"
triggerall = command = "holdback"
trigger1 = stateno = 210 && movehit
trigger1 = prevstateno = 205


;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 400)
trigger2 = movecontact


;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command != "holdback"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 400)  || (stateno = 430)
trigger2 = movecontact
trigger3 = stateno = 210 && animelemtime(5) >= 0
trigger3 = movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Launch Kick]
type = ChangeState
value = 245
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 400)  || (stateno = 430) || (stateno = 201)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Overhead Stomp]
type = ChangeState
value = 250
triggerall = command = "b"
triggerall = command = "downforward"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 400)  || (stateno = 430)
trigger2 = movecontact
;---------------------------------------------------------------------------

;Taunt
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

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || (stateno = 230)
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
trigger2 = (stateno = 400) || (stateno = 200)
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
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || (stateno = 230)
trigger2 = movecontact

;---------------------------------------------------------------------------

;Jump Butt Drop
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = !ailevel
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl

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
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 
trigger2 = movecontact
 ;Air blocking

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = command != "holddown" 
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Dive Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = vel x >= 0
triggerall = pos y < -150
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 630) || (stateno = 610)
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

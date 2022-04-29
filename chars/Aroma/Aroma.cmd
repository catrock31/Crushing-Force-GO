
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
command = ~D, DB, B, D, DB, B, a
time = 40
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = ~D, DB, B, D, DB, B, b
time = 40
buffer.time = 8


[Command]
name = "SUPER"
command = ~D,B,D,B,a
time = 40
buffer.time = 8


[Command]
name = "SUPER"
command = ~D,B,D,B,b
time = 40
buffer.time = 8


[Command]
name = "SUPER"
command = ~D,DB,B,a+c
buffer.time = 8



[Command]
name = "SUPER"
command = ~D,DB,B,b+c
buffer.time = 8


[Command]
name = "SUPER"
command = ~D,DB,B,a+b+c
buffer.time = 8


[Command]
name = "SUPERcharge"
command = c+z


[Command]
name = "SUPER"
command = c+z


;Charge variation
[Command]
name = "SUPERcharge"
command = ~40$B,F,B,F,a
buffer.time = 5

[Command]
name = "SUPERcharge"
command = ~40$B,F,B,F,b
buffer.time = 5

[Command]
name = "SUPERcharge"
command = ~40$B,F,a+c
buffer.time = 5

[Command]
name = "SUPERcharge"
command = ~40$B,F,b+c
buffer.time = 5

[Command]
name = "Super2"
command = ~D,DF,F,D,DF,F,a
time = 40
buffer.time = 5

[Command]
name = "Super2"
command = ~D,DF,F,D,DF,F,b
time = 40
buffer.time = 5

[Command]
name = "Super2"
command = ~D,F,D,F,a
time = 40
buffer.time = 5

[Command]
name = "Super2"
command = ~D,F,D,F,b
time = 40
buffer.time = 5

[Command]
name = "Super2"
command = ~D,DF,F,a+b+c
time = 20
buffer.time = 5

[Command]
name = "Super2"
command = ~D,DF,F,a+c
time = 20
buffer.time = 5

[Command]
name = "Super2"
command = ~D,DF,F,b+c
time = 20
buffer.time = 5

[Command]
name = "Super3"
command = ~D,DB,B,D,DB,B,x
time = 40
buffer.time = 5

[Command]
name = "Super3"
command = ~D,DB,B,D,DB,B,y
time = 40
buffer.time = 5

[Command]
name = "Super3"
command = ~D,DB,B,x+z
time = 30


[Command]
name = "Super3"
command = ~D,DB,B,y+z
time = 30

[Command]
name = "Super3"
command = ~D,DB,B, x+y+z
time = 30


[Command]
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, x;~F, D, DF, F, D, DF, x
time = 20
buffer.time = 5

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, D, DB, B, y;~F, D, DF, F, D, DF, y
time = 20
buffer.time = 5
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
name = "upper_a"
command = ~F, D, DF, a
buffer.time = 12
time = 25

[Command]
name = "upper_b"
command = ~F, D, DF, b
buffer.time = 12
time = 25

[Command]
name = "upper_c"
command = ~F, D, DF, c
buffer.time = 12
time = 25

[Command]
name = "upper_c"
command = ~F, D, DF, a+b
buffer.time = 12

[Command]
name = "upper_x"
command = ~F, D, DF, x
buffer.time = 5

[Command]
name = "upper_y"
command = ~F, D, DF, y
buffer.time = 5

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y
buffer.time = 5

[Command]
name = "QCF_x"
command = ~D, DF, F, x
buffer.time = 5

[Command]
name = "QCF_y"
command = ~D, DF, F, y
buffer.time = 5

[Command]
name = "QCF_z"
command = ~D, DF, F, x+y
buffer.time = 5

[Command]
name = "QCF_z"
command = ~D, DF, F, z
buffer.time = 5

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
name = "QCB_xy"
command = ~D, DB, B, z


;--------------------
;Originals

[Command]
name = "QCF_a"
command = ~D, DF, F, a


[Command]
name = "QCF_b"
command = ~D, DF, F, b
buffer.time = 5

[Command]
name = "QCF_c"
command = ~D, DF, F, a+b
buffer.time = 5

[Command]
name = "QCF_c"
command = ~D, DF, F, c
buffer.time = 5

[Command]
name = "QCB_a"
command = ~D, DB, B, a


[Command]
name = "QCB_b"
command = ~D, DB, B, b


[Command]
name = "QCB_ab"
command = ~D, DB, B, a+b

[Command]
name = "QCB_ab"
command = ~D, DB, B, c


;Charge alternate
[Command]
name = "Chargeback_a"
command = ~40$B,F,a
buffer.time = 5

[Command]
name = "Chargeback_b"
command = ~40$B,F,b
buffer.time = 5

[Command]
name = "Chargeback_c"
command = ~40$B,F,a+b
buffer.time = 5

[Command]
name = "Chargeback_c"
command = ~40$B,F,c
buffer.time = 5

[command]
name = "Chargedown_a"
command = ~40$D,U,a
buffer.time = 5

[command]
name = "Chargedown_b"
command = ~40$D,U,b
buffer.time = 5

[command]
name = "Chargedown_c"
command = ~40$D,U,c
buffer.time = 5

[command]
name = "Chargedown_c"
command = ~40$D,U,a+b
buffer.time = 5

[Command]
name = "Chargeback_x"
command = ~40$B,F,x
buffer.time = 5

[Command]
name = "Chargeback_y"
command = ~40$B,F,y
buffer.time = 5

[Command]
name = "Chargeback_z"
command = ~40$B,F,x+y
buffer.time = 5

[Command]
name = "Chargeback_z"
command = ~40$B,F,z
buffer.time = 5

[Command]
name = "nocharge_x"
command = $B,F,x
buffer.time = 5

[command]
name = "nocharge_y"
command = $B,F,y
buffer.time = 5

[command]
name = "nocharge_z"
command = $B,F,z
buffer.time = 5

[command]
name = "nocharge_z"
command = $B,F, x+y
buffer.time = 5

[command]
name = "DD_a"
command = D,D,a
buffer.time = 5

[command]
name = "DD_b"
command = D,D,b
buffer.time = 5

[command]
name = "DD_c"
command = D,D,c
buffer.time = 5

[command]
name = "DD_c"
command = D,D,a+b
buffer.time = 5

[Command]
name = "QCB_x"
command = D,DB,B,x


[Command]
name = "QCB_y"
command = D,DB,B,y


[Command]
name = "QCB_z"
command = D,DB,B,z


[Command]
name = "QCB_z"
command = D,DB,B,x+y


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
time = 15

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 15

[command]
name = "superjump"
command = ~D, $U
time = 15

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = z
time = 1

[Command]
name = "throw"
command = x+a
time = 1

[command]
name = "smokebomb"
command = y+b
time = 1

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
name = "start"
command = s
time = 1
buffer.time = 1


[command]
name = "holda"
command = /a
time = 1
buffer.time = 1


[command]
name = "holdb"
command = /b
time = 1
buffer.time = 1


[command]
name = "holdc"
command = /c
time = 1
buffer.time = 1


[command]
name = "holdc"
command = /a+b
time = 1
buffer.time = 1




[command]
name = "holdx"
command = /x
time = 1
buffer.time = 1


[command]
name = "holdy"
command = /y
time = 1
buffer.time = 1


[command]
name = "holdz"
command = /z
time = 1
buffer.time = 1


[command]
name = "holdz"
command = /x+y
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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno = [600,640])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = stateno != 410
trigger2 = movecontact
trigger3 = numhelper(411)
trigger3 = helper(411),movehit
trigger3 = stateno = 410
var(1) = 1
ignorehitpause = 1



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
;[State -1, AI guarding - Stand]
;Type=Changestate
;Triggerall=Inguarddist
;Triggerall=var(30)=59
;Triggerall=ctrl
;triggerall = enemy,hitdefattr != S, AT
;triggerall = enemy,movetype = A
;Trigger1 = random > (Ailevel * 62)
;value = 120

[State -1, AI guarding - Stand]
Type=Changestate
Triggerall=Inguarddist && enemynear,hitdefattr != SCA,AT 
Triggerall=var(30)=59
Triggerall= ailevel > 0
triggerall = stateno != 100
triggerall =! (Stateno=[120,159])
triggerall =! stateno = [200,1399]
triggerall = ctrl
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 24
trigger4 = stateno = 22
value = 120

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 120
triggerall = ctrl
triggerall = ailevel > 1
triggerall = inguarddist
triggerall =! (stateno = 50 && prevstateno = 110)
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
triggerall = PlayerID(helper(33333333),var(3)), pos y > -150 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 7 ;5= startup time
trigger1 = !var(6)
trigger1 = random < ailevel*24
trigger2 = var(6)
trigger2 = random < ailevel*64
trigger3 = stateno = 20
trigger3 = vel x < 0



;[State -1]; The engine will still guard by through pressing the back button, we need to disable that.
;Type=Assertspecial
;Triggerall=StateNo!=[120,160]
;Trigger1=var(30) = 59
;flag=noairguard
;flag2=nocrouchguard
;flag3=nostandguard


[state -1, Gas Escape]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = (stateno = [150,153])
triggerall = power > 999
triggerall = ailevel > 5
triggerall = p2bodydist x < 400
trigger1 = random < (ailevel) && (enemy,hitdefattr = SCA,NA,NP)
trigger2 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,SA,SP)
trigger3 = random < (ailevel * 8) && (enemy,hitdefattr = SCA,HA,HP)
trigger4 = random < (ailevel*4) && var(6)
value = 1400

[state -1, Duck]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = Statetype != A
triggerall = Random < Ailevel * 24
trigger1 = inguarddist 
trigger1 = enemy, name = "Jumbo Elephant"
trigger1 = enemy, stateno = [210,212]
trigger2 = enemy, name = "Bertha Hippo"
trigger2 = enemy, stateno = [1035,1040]
trigger3 = inguarddist 
trigger3 = enemy, name = "Ana 'Jiggly' Bunny"
trigger3 = enemy, stateno != [1100, 1129]
trigger3 = inguarddist 
trigger4 = enemy, name = "Enorma Pig"
trigger4 = enemy, stateno = [1000,1009]
trigger4 = inguarddist
value = 10

[state -1, AI jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S || Statetype = C
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = enemy,hitdefattr = SCA,ST
trigger1 = random < ailevel * 4
trigger1 = ctrl
trigger2 = enemy,hitdefattr = SCA, NT
trigger2 = random < ailevel * 4
trigger2 = ctrl
trigger3 = enemy, numproj > 0 && inguarddist
trigger3 = ctrl && random < (ailevel*2)
trigger4 = enemy,name = "Katrina Crocodile"
trigger4 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger4 = ctrl && random < (ailevel*8)
trigger5 = enemy,name = "Zafta Giraffe"
trigger5 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger5 = ctrl && random < (ailevel*8)
trigger6 = enemy,name = "Makuyama"
trigger6 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger6 = ctrl && random < (ailevel*8) 
trigger7 = enemy,name = "Julian Hippo"
trigger7 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger7 = ctrl && random < (ailevel*6)
trigger8 = enemy,name = "Pastilla Skunk"
trigger8 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger8 = ctrl && random < (ailevel*6)
value = 40

[state -1, Air Jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = var(3) > 0
trigger1 = movehit
trigger1 = stateno = 620
value = 45

[state -1, AI Backdash]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 1
triggerall = !inguarddist 
triggerall = backedgebodydist > 100
trigger1 = p2stateno = [5100,5120]
trigger1 = p2bodydist x < 300
trigger1 = random < (ailevel*48)
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < (ailevel*6)
trigger3 = var(6)
trigger3 = !inguarddist
trigger3 = random < ailevel * 4
value = 105

[state -1, AI Run]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 1
triggerall = p2bodydist x > 600
triggerall = stateno != 100
trigger1 = random < ailevel * 12
trigger1 = numhelper(1000)
trigger2 = !inguarddist
trigger2 = p2statetype = L
trigger2 = random < ailevel * 24
trigger3 = p2bodydist x > 1000
trigger3 = random < ailevel * 36
value = 100

[state -1, AI stop!!]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel
triggerall = stateno = 100
trigger1 = p2stateno = 5120
trigger1 = p2bodydist x < 500
value = 101

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 110
triggerall = ctrl
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = var(4) > 0
triggerall = p2bodydist x = [800,1200]
triggerall = pos y < -300
triggerall = (prevstateno = 110)
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -200 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 7 ;5= startup time


[state -1, walk away]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = backedgebodydist > 100
triggerall = !inguarddist
triggerall = stateno != 22
triggerall = p2movetype != H
triggerall = stateno != 105
triggerall = stateno != 11
triggerall = p2bodydist x < 550
trigger1 = var(6) ;if poisoned
trigger1 = p2bodydist x < 400
trigger1 = random * ailevel * 12
trigger2 = p2stateno = [5100,5120] 
trigger2 = random * ailevel * 36
trigger2 = p2bodydist x < 400
trigger3 = p2stateno = 1182
trigger3 = random * ailevel * 32
trigger3 = p2bodydist x < 400
trigger4 = (prevstateno = 1000) || (prevstateno = 1010) ||(prevstateno = 1020)
trigger4 = random * ailevel * 8
trigger4 = p2bodydist x < 400
value = 22

;-------------------------------------------------------------------------
[state -1, Super Gas Bomb]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = power > 2999
triggerall = ailevel > 3
triggerall = !var(5)
triggerall = p2bodydist x =[0, 500]
trigger1 = stateno = 1102 || stateno = 1112
trigger1 = movehit
trigger1 = random <= ailevel * 48
trigger2 = enemy,hitdefattr = SCA,HA && RANDOM < (ailevel * 6)
trigger2 = ctrl
trigger3 = enemy,ctrl = 0 && enemy,statetype = A && p2bodydist y < 150
trigger3 = ctrl & random < (ailevel * 8)
trigger4 = prevstateno = 5120
trigger4 = ctrl
trigger4 = p2movetype = A
trigger4 = random < ailevel*16
trigger5 = life < floor(lifemax *0.25)
trigger5 = enemy,life < floor(enemy,life*0.1)
trigger5 = ctrl
trigger5 = random < ailevel * 2
trigger5 = p2bodydist x < 300
trigger6 = ctrl
trigger6 = numtarget(1102)
trigger6 = random < ailevel * 36
value = 3000

[state -1, Somersault Stream]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2bodydist x = [000,600]
triggerall = enemynear,statetype != L
trigger1 = stateno = 1102 || stateno = 1112
trigger1 = movehit
trigger1 = random < ailevel * 18
trigger1 = power < 1500 || enemynear,life < floor(enemynear,lifemax * 0.25)
trigger2 = stateno = 240
trigger2 = movehit
trigger2 = random < ailevel * 36
trigger2 = power < 1500  || enemynear,life < floor(enemynear,lifemax * 0.25)
trigger3 = (stateno = 1107) || (stateno = 1117) || (stateno = 1127)
trigger3= moveguarded
trigger3 = random < ailevel * 4 
value = 3080

[state -1, Pole Catastrophe]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = numhelper(4080) < 1
triggerall = p2bodydist x = [200,1000]
trigger1 = stateno = 1112 && movehit
trigger1 = random < (ailevel * 8)
trigger2 = enemynear,stateno = [5100,5120]
trigger2 = ctrl
trigger2 = random < ailevel * 18
trigger2 = power < 2000
trigger2 = p2bodydist x > 600
trigger3 = enemynear,stateno = [5100,5120]
trigger3 = ctrl
trigger3 = random < ailevel*16
trigger3 = power > 2000
trigger4 = enemy,life < 50
trigger4 = ctrl
trigger4 = !inguarddist
trigger4 = random < ailevel * 24
trigger4 = enemy,statetype = L
trigger5 = enemynear,name = "Rapid Bunny" || enemynear,name = "Violet 'Tyla' Bunny" || enemynear,name = "Jiggly 'Ana' Bunny"
trigger5 = enemynear,hitfall = 1 || enemynear,statetype = L
trigger5 = ctrl 
trigger5 = random < ailevel * 24
trigger5 = p2bodydist x > 600
value = 3040

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1170
triggerall = var(30) = 59
triggerall = ctrl
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2bodydist x = [320,540]
triggerall = p2bodydist y = [-300,0]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 7 ;5= startup time


[state -1, EX. Fan Attack 1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150, 0]
triggerall = p2bodydist x < 305
triggerall = power > 499
triggerall = ailevel > 4
triggerall = power < 2500
triggerall = p2statetype != L
triggerall = p2stateno != [5100, 5120]
triggerall = p2statetype != A
triggerall = !inguarddist
trigger1 = stateno = 240 && movehit
trigger1 = random < (ailevel*6)
trigger2 = stateno = 210 && movehit
trigger2 = random < (ailevel*6)
trigger3 = random < ailevel * 2
trigger3 = stateno = 430 && movehit
trigger4 = ctrl
trigger4 = !enemy,ctrl
trigger4 = random < ailevel * 4
trigger4 = !inguarddist
value = 1120

[state -1, EX Overhead]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 500]
triggerall = stateno = 1120
triggerall = animelemtime(7) > 0
trigger1 = moveguarded 
trigger1 = random < ailevel * 24  
trigger1 = p2statetype = C
trigger2 = moveguarded
trigger2 = random < ailevel * 8
trigger2 = p2statetype = S 
trigger3 = movehit
trigger3 = random < ailevel * 48
value = 1125

[state -1, EX Sweep]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 305]
triggerall = stateno = 1120
triggerall = animelemtime(7) > 0 
trigger1 = moveguarded || !movecontact
trigger1 = random < ailevel * 24  
trigger1 = p2statetype = S 
trigger2 = moveguarded  || !movecontact
trigger2 = random < ailevel * 12
trigger2 = p2statetype = C
value = 1127

[state -1, EX Fan Attack 3]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 500]
triggerall = (stateno = 1126 && time > 2)
trigger1 = moveguarded
trigger1 = random < ailevel * 12
trigger2 = movehit
value = 1122

[state -1, H. Stinkoken]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 500]
triggerall = stateno = 1127
trigger1 = moveguarded || !movecontact
trigger1 = random < ailevel * 18
trigger2 = movehit
value = 1128

[state -1, H. Sommersault Seat]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,statetype != L
triggerall = p2bodydist x = [0,800]
triggerall = p2bodydist y = [-200,0]
triggerall = ctrl || var(1)
triggerall = power > 499
triggerall = enemy,hitfall = 0
trigger1 = enemy,stateno = [700,799]
trigger1 = random < ailevel * 16
trigger2 = enemy,stateno = [1400,1420]
trigger2 = enemy,authorname = "Kazecat"
trigger2 = random < ailevel * 16
value = 1170

[state -1, H. Sommersault Seat]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x = [120,740]
triggerall = ctrl
triggerall = enemy,statetype != L
triggerall = enemy,hitfall = 0
trigger1 = random < (ailevel*32)
trigger1 = enemy,hitdefattr = SCA, AP || enemy,numproj > 0
trigger2 = enemy,statetype = C
trigger2 = random < (ailevel*8)
trigger3 = enemy,authorname = "Kaze Cat"
trigger3 = p2stateno = [1400,1409]
trigger3 = p2statetype != A
trigger3 = random < ailevel*24
trigger3 = ctrl || var(1)
trigger4 = p2stateno = [700,799]
trigger4 = ctrl || var(1)
trigger4 = random < ailevel * 6
value = 1160

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1160
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x = [120,740]
triggerall = p2bodydist y = [-300,0]
triggerall = enemy,statetype != L
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;triggerall = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 12 ;5= startup time
trigger1 = ctrl
trigger1 = enemy,animtime < -26
trigger1 = ifelse(ailevel = 8, (random < ailevel*64),(random < ailevel*24))

[state -1, L. Sommersault Seat]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x = [0,480]
triggerall = enemy,hitfall = 0
triggerall = enemy,statetype != L
trigger1 = ctrl
trigger1 = random < (ailevel*36)
trigger1 = (enemynear,hitdefattr = SCA, NP,SP,HP) || (enemy,numproj > 0)
trigger2 = enemy,statetype = C
trigger2 = random < (ailevel*12) && ctrl
trigger3 = enemynear,name = "Makuyama"
trigger3 = ctrl
trigger3 = p2stateno = 1100 || p2stateno = 1110 || p2stateno = 1120
trigger3 = random < ailevel * 16
trigger4 = enemy,authorname = "Kaze Cat"
trigger4 = p2stateno = [1400,1409]
trigger4 = p2statetype != A
trigger4 = random < ailevel*8
trigger4 = ctrl || var(1)
trigger5 = p2stateno = [700,799]
trigger5 = p2movetype != A
trigger5 = random < ailevel*4
trigger5 = ctrl || var(1)
trigger6 = movehit
trigger6 = (stateno = 210) || (stateno = 240)
trigger6 = random < ailevel * 36
trigger6 = var(6) 
trigger7 = movehit
trigger7 = (stateno = 210) || (stateno = 240)
trigger7 = random < ailevel * 12
trigger7 = !var(6) 
value = 1150

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1150
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x = [0,480]
triggerall = p2bodydist y = [-300,0]
triggerall = enemy,statetype != L
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 5 ;5= startup time
trigger1 = ctrl
trigger1 = enemy,animtime < -24
trigger1 = ifelse(ailevel = 8, (random < ailevel*64),(random < ailevel*24))
trigger2 = var(1)
trigger2 = random < ailevel * 12

[state -1, EX. Skunk Blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = !var(5)
triggerall = power > 499
triggerall = p2bodydist y = [-40,0]
trigger1 = ctrl && p2bodydist x >= 300
trigger1 = random < (ailevel*4)
trigger1 = gametime%5=0
value = 1020


[state -1, EX anti air gas]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 499
triggerall = ailevel > 4
triggerall = stateno != 410
triggerall = p2bodydist x = [0, 320]
triggerall = p2bodydist y = [-450, 0]
trigger1 = ctrl
trigger1 = random < ailevel*8
trigger1 = p2movetype = A
trigger1 = p2bodydist x < 200
trigger2 = prevstateno = 5120
trigger2 = p2movetype = A
trigger2 = ctrl
trigger2 = random < ailevel * 64
trigger3 = prevstateno = 5120
trigger3 = p2bodydist y = [-450,-150]
trigger3 = ctrl
trigger3 = random < ailevel * 24
value = 1070

[state -1, L. anti air gas]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = !var(5)
triggerall = statetype != A
triggerall = p2bodydist x = [0, 320]
triggerall = p2bodydist y = [-450, 0]
triggerall = !inguarddist
triggerall = stateno != 410
trigger1 = ctrl || var(1)
trigger1 = (random < ailevel * 8 && p2movetype = A) || random < ailevel * 2
trigger1 = p2statetype = A
trigger1 = p2bodydist y = [-450,-150]
trigger2 = stateno = 215
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger3 = enemynear,name = "Akai R. Panda"  || enemynear,name = "Makuyama"
trigger3 = enemynear,stateno = 55 || enemynear,stateno = 650
trigger3 = ctrl || var(1)
trigger3 = random < ailevel * 18
value = 1050

[state -1, H. anti air gas]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x = [0, 320]
triggerall = p2bodydist y = [-450, 0]
triggerall = !inguarddist
triggerall = stateno != 410
trigger1 = ctrl
trigger1 = (random < ailevel * 12  && p2movetype = A) || (random < ailevel * 6)
trigger1 = p2bodydist y = [-450,-150]
trigger1 = p2statetype = A
trigger2 = (stateno = 215)
trigger2 = movehit
trigger2 = random < ailevel * 24 
trigger3 = enemynear,name = "Akai R. Panda"  || enemynear,name = "Makuyama"
trigger3 = enemynear,stateno = 55 || enemynear,stateno = 650
trigger3 = ctrl || var(1)
trigger3 = random < ailevel * 18
value = 1060

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1010
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x  =[0, 1220]
triggerall = p2statetype != A
triggerall = !var(5)
triggerall = enemy,statetype != L
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
triggerall = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 10 ;5= startup time
trigger1 = ctrl

[state -1, H. Skunk Blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = ailevel > 2
triggerall = !var(5)
triggerall = numhelper(4000) < 1
triggerall = p2bodydist x  =[600, 1220]
;triggerall = numhelper(4060) < 1
triggerall = p2bodydist y = [-40,0]
trigger1 = random < (ailevel*2)
trigger1 = ctrl
trigger1 = p2bodydist x = [300, 800]
trigger1 = !inguarddist
trigger1 = enemynear,ctrl = 0
trigger1 = life < enemynear,life
trigger2 = enemy,numproj = 1
trigger2 = ctrl
trigger2 = random < ailevel * 18
value = 1010

[state -1, L. Skunk Blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = numhelper(4000) < 1
triggerall = p2bodydist x  =[0, 1220]
triggerall = !var(5)
triggerall = ailevel > 2
triggerall = p2bodydist y = [-40,0]
trigger1 = random < (ailevel*2)
trigger1 = !inguarddist
trigger1 = ctrl
trigger1 = p2bodydist x = [ 300, 500]
trigger1 = enemynear,ctrl = 0
trigger1 = life > enemynear,life
trigger2 = p2stateno = [5100,5120]
trigger2 = ctrl
trigger2 = random < ailevel * 12
trigger2 = p2bodydist x > 600
value = 1000

[state -1, Smoke escape]
type = changestate
triggerall = var(30) = 59
triggerall = var(32) > 0
triggerall = ailevel > 2
triggerall = ctrl
trigger1 = backedgedist < 100
trigger1 = !inguarddist
trigger1 = random < (ailevel*12)
trigger1 = p2bodydist x = [-50,350]
trigger2 = prevstateno = 5120
trigger2 = p2movetype = A
trigger2 = random < (ailevel*12)
trigger2 = p2bodydist x = [-50,350]
trigger3 = enemy,hitdefattr = SCA,AT
trigger3 = random < ailevel * 4
trigger3 = p2bodydist x = [0,350]
value = 1200

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1200
triggerall = p2statetype != A
triggerall = ailevel > 2
triggerall = var(32) > 0
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
triggerall = PlayerID(helper(33333333),var(3)), pos y > -240 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 6 ;5= startup time
trigger1 = ctrl
trigger1 = random < ailevel * 12




[state -1, C.Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = p2bodydist x = [-100,240]
triggerall = p2bodydist y = [-400,0]
triggerall = p2statetype != L
trigger1 = stateno = 430 && movehit
trigger1 = random < (ailevel * 48)
trigger2 = stateno = 215 && movehit
trigger2 = p2statetype = A
trigger2 = random < (ailevel*48)
trigger3 = p2statetype = A
trigger3 = ctrl
trigger3 = random < ailevel * 4
trigger3 = p2bodydist y < -200
trigger4 = (stateno = 200) || (stateno = 201) || (stateno = 400) || (stateno = 401) || (stateno = 230) || (stateno = 430)
trigger4 = movehit
trigger4 = enemy,movetype = A
trigger4 = random < ailevel * 36
value = 410

[state -1, C. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != A
triggerall = p2bodydist y = [-100,0]
triggerall = p2bodydist x = [0, 420]
trigger1 = stateno = 400 && movehit
trigger1 = random < ailevel * 2
trigger2 = stateno = 401 && movehit
trigger2 = random < ailevel * 48
trigger3 = enemy,statetype = S
trigger3 = random < (ailevel*12)
trigger3 = ctrl
trigger4 = ctrl
trigger4 = random < (ailevel*6)
trigger4 = enemy,life < 120
trigger5 = random < ailevel * 24
trigger5 = stateno = 201
trigger5 = movehit
value = 430

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 430
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = ailevel > 2
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
triggerall = PlayerID(helper(33333333),var(3)), pos y > -200 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 6 ;5= startup time
trigger1 = ctrl
trigger1 = ifelse(ailevel = 8, (random < ailevel*48),(random < ailevel*12))
trigger1 = p2bodydist x = [0,450]
trigger2 = inguarddist
trigger2 = random < ailevel * 18
trigger2 = ctrl

[state -1, C. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2statetype != A
triggerall = p2bodydist x = [0, 550]
triggerall = p2bodydist y = [-80,0]
triggerall = !inguarddist
trigger1 = stateno = 430 && movehit
trigger1 = random < ailevel * 36
trigger2 = ctrl
trigger2 = random < floor(ailevel * 0.25)
trigger2 = p2statetype = S
trigger2 = p2bodydist x = [440,550]
value = 440

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 440
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2statetype != A
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;triggerall = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 8 ;5= startup time
trigger1 = ctrl
trigger1 = ifelse(ailevel = 8, (random < ailevel*12),(random < ailevel*2))
trigger1 = p2bodydist x = [0,550]
trigger2 = (stateno = 430)
trigger2 = movecontact
trigger2 = random < ailevel * 24 

[state -1, C. Jab1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = (enemy,statetype = S  || enemy,statetype = C)  
triggerall = p2bodydist x =[0, 320]
triggerall = !inguarddist
triggerall = ctrl
trigger1 = p2statetype = S
trigger1 = random < (ailevel*12)
trigger2 = p2statetype = C
trigger2 = random < ailevel*6
trigger3 = p2movetype = H
trigger3 = random < ailevel * 24
value = 400

[state -1, S.Jab1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = p2statetype != L
triggerall = !inguarddist
triggerall = p2bodydist y =[-160,0]  
triggerall = p2bodydist x =[0,240]
triggerall = (p2statetype = S || p2statetype = C)
trigger1 = random < (ailevel*24) 
trigger2 = p2stateno = [5000,5029]
trigger2 = random < (ailevel*48) 
trigger3 = enemy,animtime < -4
trigger3 = random < ailevel * 48
value = 200



[state -1, J. Jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype = A
triggerall = !inguarddist
triggerall = p2bodydist x =[0, 150]
triggerall = p2bodydist y = [-300,-40]
triggerall = ctrl
trigger1 = random < ailevel * 8
trigger2 = p2movetype = H
trigger2 = random < ailevel * 36
value = 600

[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [-120, 120]
triggerall = p2bodydist y = [-140,200]
triggerall = !inguarddist
trigger1 = stateno = 600 && movecontact
trigger1 = random < ailevel * 48
trigger2 = p2movetype = H
trigger2 = ctrl
trigger2 = random < ailevel * 36
trigger2 = stateno != [1201,1202]
trigger3 = ctrl
trigger3 = random < ailevel * 12
value = 630

[state -1, J. Strong]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0, 120]
triggerall = p2bodydist y = [-200, 10]
trigger1 = stateno = 600 && movecontact
trigger1 = random < (ailevel*36)
trigger2 = stateno = 630 && movecontact
trigger2 = random < (ailevel*36)
trigger3 = ctrl
trigger3 = random < ailevel * 8
trigger3 = !inguarddist
value = 605

[state -1, J. Forward]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0, 160]
triggerall = p2bodydist y = [-140, 120]
trigger1 = stateno = 605 && movehit
trigger1 = random < ailevel * 36
trigger2 = stateno = 630 && movehit
trigger2 = random < ailevel * 12
trigger3 = ctrl
trigger3 = !inguarddist
trigger3 = random < ailevel * 8
value = 635

[state -1, J. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall =! enemy,movetype = A
triggerall = enemynear,statetype != L
triggerall = !inguarddist
triggerall = p2bodydist x = [0,240]
triggerall = p2bodydist y = [100,310]
trigger1 = stateno = 635 && movehit
trigger1 = random < (ailevel * 36)
trigger2 = stateno = 605 && movehit
trigger2 = random < (ailevel * 12)
trigger3 = enemy,statetype != A
trigger3 = ctrl
trigger3 = random < ailevel * 8
trigger3 = vel y > 0
value = 610

[state -1, J. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall =! enemy,movetype = A
triggerall = enemynear,statetype != L
triggerall = !inguarddist
triggerall = p2bodydist x = [-140,360]
triggerall = p2bodydist y = [-200,340]
trigger1 = stateno = 635 && movehit
trigger1 = random < (ailevel * 12)
trigger2 = stateno = 605 && movehit
trigger2 = random < (ailevel * 12)
trigger3 = p2statetype != A
trigger3 = ctrl
trigger3 = random < ailevel*12 
trigger3 = vel y > 5
trigger4 = prevstateno = [1201,1202]
trigger4 = ctrl
trigger5 = stateno = 50
trigger5 = prevstateno = 110
trigger5 = random < ailevel * 36
value = 640

[state -1, Butt Drop]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [-60, 400] 
triggerall = pos y < -250
trigger1 = stateno = 640 && movehit
trigger1 = time > 8
trigger1 = random < (ailevel*48)
trigger2 = stateno = 610 && movehit
trigger2 = time > 8
trigger2 = random < (ailevel*48)
value = 645

[state -1, Air Launcher]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = var(3) > 0
triggerall = ailevel > 1
trigger1 = movehit
trigger1 = stateno = 635  || stateno = 605
trigger1 = random < (ailevel*4)
trigger1 = enemy,statetype = A
value = 620



[state -1, C. Jab2]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x =[0, 230]
trigger1 = stateno = 400 && movehit
trigger1 = random < ailevel * 48
trigger2 = stateno = 400 && moveguarded
trigger2 = random < ailevel * 24
value = 401


[state -1, S.Jab2]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 200
trigger1 = movehit
trigger1 = p2bodydist x < 165
value = 201

[state -1, S. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0,160]
triggerall = p2bodydist y = [-100, 0]
triggerall = p2statetype != L
trigger1 = stateno = 201 && movehit
trigger1 = random < ailevel * 48
trigger2 = ctrl
trigger2 = random < ailevel 
value = 230

[state -1, S. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0,360]
triggerall = p2bodydist y = [-130,0]
triggerall = !inguarddist
trigger1 = stateno = 230 && movehit
trigger1 = random < (ailevel*48)
trigger2 = ctrl
trigger2 = random < (ailevel*12)
trigger2 = p2bodydist x > 260
trigger3 = ctrl
trigger3 = enemy,ctrl = 0
trigger3 = enemy,animtime < -8
trigger3 = !inguarddist
trigger3 = random < ailevel * 36
trigger4 = numhelper(4000)
trigger4 = helper(4000),movehit
trigger4 = ctrl
trigger4 = random < ailevel * 48
value = 210

[state -1, Alt S. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [-30,100]
triggerall = p2bodydist y = [-400,0] 
trigger1 = stateno = 230 && movehit
trigger1 = random < (ailevel*24)
trigger2 = ctrl
trigger2 = random < (ailevel*8)
trigger2 = p2statetype = A
value = 215

[state -1, S. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 305
trigger1 = stateno = 210 && movehit
trigger1 = random < (ailevel*48)
value = 240

[state -1, H. Fan Attack 1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150, 0]
triggerall = p2bodydist x < 400
triggerall = ailevel > 2
triggerall = p2statetype != L
triggerall = p2stateno != [5100, 5120]
trigger1 = (stateno = 240) || (stateno = 210) || (stateno = 430)
trigger1 = movecontact
trigger1 = random < (ailevel*ifelse(power < 2000, 36,12))
trigger2 = numhelper(4000) > 1
trigger2 = ctrl && (p2bodydist x > 500)
trigger2 = random < (ailevel * 16)
trigger3 = ctrl
trigger3 = !enemy,ctrl
trigger3 = random < ailevel * 12
trigger3 = !inguarddist
value = 1110


[state -1, L. Fan Attack 1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist y = [-150, 0]
triggerall = p2bodydist x = [0, 400]
triggerall = p2statetype != L
triggerall = p2stateno != [5100, 5120]
trigger1 = (stateno = 240) || (stateno = 210) || (stateno = 430)  
trigger1 = movecontact
trigger1 = random < (ailevel*ifelse(power > 2500,48,24))
trigger2 = ctrl
trigger2 = !enemy,ctrl
trigger2 = random < ailevel * 12
trigger2 = !inguarddist
value = 1100



[state -1, L. Fan Attack Overhead]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 305]
triggerall = stateno = 1100
triggerall = time > 20
trigger1 = random < ailevel * 32  
trigger1 = p2statetype = C
trigger2 = random < ailevel * 16
trigger2 = p2statetype = S 
trigger3 = movehit
trigger3 = random < ailevel * 36
value = 1105

[state -1, L. Fan Attack Low]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 500]
triggerall = stateno = 1100
triggerall = time > 20 
trigger1 = random < ailevel * 36  
trigger1 =  p2statetype = S 
trigger2 = random < ailevel * 12
trigger2 = p2statetype = C
value = 1107

[state -1, L. Fan Attack 3]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 500]
triggerall = stateno = 1106 
triggerall = time > 2
trigger1 = moveguarded
trigger1 = random < ailevel * 8
trigger2 = movehit
value = 1102

[state -1, L. Stinkoken]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 305]
triggerall = stateno = 1107
trigger1 = movehit 
trigger2 = moveguarded
trigger2 = random < ailevel * 12
value = 1108

[state -1, H. Fan Attack 2]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 305]
triggerall = stateno = 1110
triggerall = time > 20
trigger1 = random < ailevel * 24  
trigger1 = p2statetype = C
trigger2 = random < ailevel * 12
trigger2 = p2statetype = S 
trigger3 = movehit
trigger3 = random < ailevel * 36
value = 1115

[state -1, H. Sweep]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 500]
triggerall = stateno = 1110
triggerall = time > 20 
trigger1 = random < ailevel * 36  
trigger1 =  p2statetype = S 
trigger2 = random < ailevel * 12
trigger2 = p2statetype = C
value = 1117

[state -1, H. Fan Attack 3]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 305]
triggerall = stateno = 1116 
triggerall = time > 2
trigger1 = moveguarded
trigger1 = random < ailevel * 12
trigger2 = movehit
value = 1112

[state -1, H. Stinkoken]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x =[0, 305]
triggerall = stateno = 1117
trigger1 = movehit
trigger2 = random < ailevel * 12
trigger2 = moveguarded
value = 1118

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1010
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x = [100,600]
triggerall = p2statetype != A
triggerall = enemy,statetype != L
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
triggerall = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 10 ;5= startup time
trigger1 = ctrl

[state -1, H. Skunk Blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = ailevel > 2
triggerall = !var(5)
triggerall = numhelper(4000) < 1
triggerall = p2bodydist x = [600,1200]
;triggerall = numhelper(4060) < 1
triggerall = p2bodydist y = [-40,0]
trigger1 = ctrl 
trigger1 = random < (ailevel*12)
trigger2 = ctrl 
trigger2 = random < (ailevel*18)
trigger2 = !inguarddist
trigger3 = enemy,numproj = 1
trigger3 = ctrl
trigger3 = random < ailevel * 24
value = 1010

[state -1, L. Skunk Blast]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = numhelper(4000) < 1
triggerall = !var(5)
triggerall = p2bodydist x = [600,1200]
;triggerall = var(42) = 1
triggerall = ailevel > 2
triggerall = p2bodydist y = [-40,0]
trigger1 = ctrl 
trigger1 = random < (ailevel*12)
trigger1 = !inguarddist
trigger2 = random < ailevel*18
trigger2 = ctrl
trigger2 = !inguarddist
trigger3 = enemy,numproj = 1
trigger3 = ctrl
trigger3 = random < ailevel * 16
trigger4 = p2stateno = [5100,5120]
trigger4 = ctrl
trigger4 = random < ailevel * 18
value = 1000



[state -1, Fart in Face (Grab)]
type = changestate
triggerall = var(30) = 59
triggerall = numhelper
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = p2statetype = S || p2statetype = C
triggerall = ctrl
;triggerall = enemy,name != "Bertha Hippo"
;triggerall = enemy,name != "Jumbo Elephant"
;triggerall = enemy,name != "Jumba Elephant"
;triggerall = enemy,name != "Julian Hippo"
triggerall = p2movetype != H
triggerall = p2bodydist x = [0, 140]
trigger1 = Random < (Ailevel*24)
trigger2 = Random < (Ailevel*32)
trigger2 = p2stateno = [150,159]
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400 || enemy,stateno = [700,750]
trigger3 = random < (ailevel*24)
trigger4 = p2stateno = [700,799]
trigger4 = !inguarddist
trigger4 = random < ailevel*48
value = 800

;===========================================================================
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Super Skunk Bomb (uses three bars)
[State -1, Super Skunk bomb]
type = ChangeState
value = 3000
triggerall = command = "SUPER"
triggerall = power > 2999
triggerall = !ailevel
triggerall = statetype != A
triggerall = stateno != 1151
triggerall = stateno != 1161
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1299]
trigger3 = movecontact
trigger4 = NUMHELPER(4000)
trigger4 = helper,stateno = [4000,4060]
trigger4 = helper,movecontact
trigger5 = NUMHELPER(411)
trigger5 = helper,stateno = 411
trigger5 = movecontact
trigger6 = stateno = [1000,1019]
;--------------------------------------------------------------------------------

[State -1, Pole Catastrophe]
type = ChangeState
value = 3040
triggerall = command = "Super2"
triggerall = power > 999
triggerall = ailevel = 0
triggerall = statetype != A
triggerall = stateno != 1151
triggerall = stateno != 1161
triggerall = numhelper(4080) < 1
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1299]
trigger3 = movehit
trigger4 = NUMHELPER(4000)
trigger4 = helper,stateno = [4000,4060]
trigger4 = helper,movecontact
trigger5 = NUMHELPER(411)
trigger5 = helper,stateno = 411
trigger5 = movecontact

;-----------------------------------------------------------------

[State -1, Super Somersault Seat]
type = ChangeState
value = 3080
triggerall = command = "Super3"
triggerall = power > 999
triggerall = !ailevel
triggerall = statetype != A
triggerall = stateno != 1151
triggerall = stateno != 1161
trigger1 = ctrl || var(1)
trigger2 = stateno = [1000,1299]
trigger2 = movecontact
trigger3 = NUMHELPER(4000)
trigger3 = helper,stateno = [4000,4060]
trigger3 = helper,movecontact






;----------------------------------------------------------------------------
;Somersault Skunk Spray EX
[State -1, Anti Air Skunk spray]
type = ChangeState
value = 1070
triggerall = !ailevel
triggerall = command = "upper_c";"QCB_ab"
triggerall = statetype != A
triggerall = power > 499
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl || stateno = [40,42]

;-----------------------------------------------------------------------------
;Somersault Skunk Spray L
[State -1, Anti Air Skunk Spray]
type = ChangeState
value = 1050
triggerall = !ailevel
triggerall = command = "upper_a";"QCB_a"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl || stateno = [40,42]


;-----------------------------------------------------------------------------

;Somersault Skunk Spray H
[State -1, Anti Air Skunk Spray]
type = ChangeState
value = 1060
triggerall = !ailevel
triggerall = command = "upper_b";"QCB_b"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl || stateno = [40,42]


;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
;Skunk Blast EX
[State -1, EX Skunk Blast]
type = ChangeState
value = 1020
triggerall = !ailevel
triggerall = command = "QCF_c";"Chargeback_c";
triggerall = power > 499
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Skunk Blast L
[State -1, Light Skunk Blast]
type = ChangeState
value = 1000
triggerall = !ailevel
triggerall = command = "QCF_a" ;"Chargeback_a"
triggerall = statetype != A
triggerall = numhelper(4000) < 1
;triggerall = numhelper(4060) < 1
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Skunk Blast H
[State -1, Heavy Skunk Blast]
type = ChangeState
value = 1010
triggerall = !ailevel
triggerall = command = "QCF_b";"Chargeback_b";
triggerall = statetype != A
triggerall = numhelper(4000) < 1
;triggerall = numhelper(4060) < 1
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
;---------------------------------------------------------------------------
;Sommersault Seat EX
[state -1, sommersault seat EX]
type = changestate
value = 1170
triggerall = !ailevel
triggerall = command = "QCB_z"
triggerall = power > 499
triggerall = statetype != A
trigger1 = var(1)
trigger2 = ctrl

;-----------------------------------------------------------------------------

;Sommersault Seat L
[state -1, sommersault seat L]
type = changestate
value = 1150
triggerall = !ailevel
triggerall = command = "QCB_x"
triggerall = statetype != A
trigger1 = var(1)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Sommersault Seat H
[state -1, sommersault seat H]
type = changestate
value = 1160
triggerall = !ailevel 
triggerall = command = "QCB_y"
triggerall = statetype != A
trigger1 = var(1)
trigger2 = ctrl


;---------------------------------------------------------------------------
;Fan Attack EX
[State -1, Fan Attack EX]
type = ChangeState
value = 1120
triggerall = command = "QCF_z"
triggerall = power > 499
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Fan Attack L
[State -1, Fan Attack Light]
type = ChangeState
value = 1100
triggerall = command = "QCF_x"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Fan Attack H
[State -1, Fan Attack Heavy]
type = ChangeState
value = 1110
triggerall = command = "QCF_y"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl



; Retired Move
;Skunk Trap EX
[State -1, Light Skunk Blast]
type = null
value = 1070
triggerall = ailevel = 0
triggerall = command = "DD_c"
triggerall = statetype != A
triggerall = power > 499
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Skunk Trap L
[State -1, Light Skunk Blast]
type = null
value = 1050
triggerall = ailevel = 0
triggerall = command = "DD_a"
triggerall = numhelper(4010) < 2
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Skunk Trap H
[State -1, Light Skunk Blast]
type = null
value = 1060
triggerall = ailevel = 0
triggerall = command = "DD_b"
triggerall = numhelper(4010) < 2
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Smoke bomb Teleport
[State -1, Light Skunk Blast]
type = ChangeState
value = 1200
triggerall = command = "smokebomb"
triggerall = var(32) > 0
triggerall = !ailevel
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl




;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !ailevel 
trigger1 = command = "FF"
trigger2 = command = "dash" && command != "holdback"
triggerall = statetype = S
triggerall = ctrl

;---------------------------------------------------------------------------
;Air Dash
[State -1, Air Dash]
type = ChangeState
value = 110
triggerall = var(4) > 0
triggerall = pos y < -150
triggerall = command = "FF" || (command = "dash"  && command != "holdback")
triggerall = !ailevel
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1) 

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
;Air Jump cancel
[state -1, air jump cancel]
type = changestate
value = 45
triggerall = statetype = A
triggerall = var(3) > 0
triggerall = ailevel = 0
trigger1 = var(1) = 1
trigger1 = command = "holdup"

;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800

triggerall = statetype != A
triggerall = stateno != 100
triggerall = command = "throw"
trigger1 = ctrl
;----------------------------------------------------------------------------
[state -1, Gas Escape]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
triggerall = command = "recovery"
trigger1 = power > 999


;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = !ailevel
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = !ailevel
triggerall = command = "y"
triggerall = command = "holdback" 
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 201 && movecontact
trigger5 = stateno = 400 && movecontact


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = !ailevel
triggerall = command = "y"
triggerall = command != "holdback"  
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 201 && movecontact
trigger5 = stateno = 400 && movecontact

;---------------------------------------------------------------------------

;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = !ailevel
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 201 || stateno = 400 || stateno = 401
trigger2 = movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = !ailevel
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 201 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 215 && movecontact



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
triggerall = !ailevel
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 401 || stateno = 200 || stateno = 201 || stateno = 430 || stateno = 230
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
trigger2 = stateno = 400  || stateno = 401 || stateno = 200 || stateno = 201
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
trigger2 = stateno = 400 || stateno = 210 || stateno = 200 || stateno = 230 || stateno = 201 || stateno = 430
trigger2 = movecontact







;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = !ailevel
triggerall = command = "x"
triggerall = command != "holdfwd"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 110
trigger2 = animelemtime(3) >= 0

;---------------------------------------------------------------------------
;Jump Medium Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 605
triggerall = !ailevel
triggerall = command = "x"
triggerall = statetype = A
trigger1 = stateno = 600 || stateno = 630 
trigger1 = movecontact
trigger2 = command = "holdfwd"
trigger2 = ctrl
trigger3 = stateno = 110
trigger3 = animelemtime(3) >= 0


;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = !ailevel
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 605 || stateno = 635
trigger2 = movecontact
trigger3 = stateno = 110
trigger3 = animelemtime(3) >= 0

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = !ailevel
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
trigger1 = command != "holdfwd"
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 110
trigger3 = animelemtime(3) >= 0

;---------------------------------------------------------------------------
;Jump Medium Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 635
triggerall = !ailevel
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = stateno = 600 || stateno = 630 || stateno = 605
trigger2 = movecontact
trigger3 = stateno = 110
trigger3 = animelemtime(3) >= 0

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = !ailevel
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 605 || stateno = 635
trigger2 = movecontact
trigger3 = stateno = 110
trigger3 = animelemtime(3) >= 0

;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 645
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = ailevel = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 640 || stateno = 605 || stateno = 635
trigger2 = movecontact

;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 620
triggerall = !ailevel
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 640 || stateno = 605 || stateno = 635 || stateno = 640
trigger2 = movecontact


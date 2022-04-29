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

;-| A.I. Triggers |-------------------------------------------------------
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
command = ~D, DF, F, D, DF, F, x
time = 40
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 40
buffer.time = 8

[Command]
name = "SUPER"
command = ~D, DF, F, x+z
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = ~D, DF, F, y+z
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = c+z
time = 20

[Command]
name = "Super 2"
command = ~D, DB, B, D, DB, B, x
time = 40
buffer.time = 8

[Command]
name = "Super 2"   
command = ~D, DB, B, D, DB, B, y
time = 40
buffer.time = 8

[Command]
name = "Super 2"
command = ~D, DB, B, x+z
buffer.time = 8

[Command]
name = "Super 2"
command = ~D, DB, B, y+z
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DF,F, a+c
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DF,F, b+c
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DF,F,D,DF,F,a
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DF,F,D,DF,F,b
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
time = 20
buffer.time = 12

[Command]
name = "upper_y"
command = ~F, D, DF, y
time = 20
buffer.time = 12

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y
time = 20
buffer.time = 12

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_z"
command = ~D, DF, F, x+y

[Command]
name = "QCF_z"
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
name = "DK_a"
command = ~F, D, DF, a
time = 20
buffer.time = 12

[Command]
name = "DK_b"
command = ~F, D, DF, b
time = 20
buffer.time = 12

[Command]
name = "DK_c"
command = ~F, D, DF, c
time = 20
buffer.time = 12

[Command]
name = "DK_c"
command = ~F, D, DF, a+b
time = 20
buffer.time = 12

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
command = ~D,$U
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1
buffer.time = 1

[Command]
name = "recovery"
command = z
time = 1
buffer.time = 1

[Command]
name = "teleport"
command = y+b
time = 1
buffer.time = 1

[Command]
name = "throw"
command = a+x
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
name = "holda"
command = /a
time = 1
buffer.time = 1

[Command]
name = "holdb"
command = /b
time = 1
buffer.time = 1

[Command]
name = "holdc"
command = /c
time = 1
buffer.time = 1

[Command]
name = "holdc"
command = /a+b
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
trigger2 = stateno != 635
trigger2 = stateno != 632
trigger2 = stateno != 605
trigger2 = stateno != 645
trigger2 = stateno != 410
trigger2 = movecontact
trigger3 = stateno = 410
trigger3 = movehit
trigger4 = (stateno = 210) || (stateno = 240)
trigger4 = animelemtime(6) < 0
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
TriggerAll = RoundState=2 
Triggerall = Var(30) < 1
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


[state -1, Teleport Escape]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = (stateno = [150,153])
triggerall = power > 999
triggerall = ailevel > 5
triggerall = p2bodydist x < 400
trigger1 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,NA,NP)
trigger2 = random < (ailevel * 4) && (enemy,hitdefattr = SCA,SA,SP)
trigger3 = random < (ailevel * 16) && (enemy,hitdefattr = SCA,HA,HP)
trigger4 = backedgebodydist < 30
trigger4 = random < (ailevel*12)
value = 1400

[state -1, Lipomancy]
type = changestate
Triggerall = ailevel > 4
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = power > 2999
triggerall = p2bodydist y = [-250,0]
triggerall = p2statetype != L
triggerall = stateno != [3000,3089]
trigger1 = stateno = 240
trigger1 = movehit
trigger1 = random < ailevel * 32
trigger1 = p2statetype != A
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger3 = numhelper(1055)
trigger3 = helper(1055),movehit
trigger3 = random < ailevel * 12
trigger3 = p2statetype != A
trigger4 = numhelper(1005)
trigger4 = helper(1005),movehit
trigger4 = random < ailevel * 12
trigger4 = p2statetype != A
trigger5 = numhelper(1015)
trigger5 = helper(1015),movehit
trigger5 = random < ailevel * 18
trigger5 = p2statetype != A
trigger6 = numhelper(1065)
trigger6 = helper(1065),movehit
trigger6 = random < ailevel * 12
value = 3000


[state -1, Counter]
type = changestate
Triggerall = ailevel > 4
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 300]
triggerall = p2bodydist y = [-350,0]
triggerall = power > 999
triggerall = ctrl
triggerall = enemy,hitdefattr != SCA, AT
triggerall = stateno != [3000, 3089]
trigger1 = p2movetype = A
trigger1 = random < ailevel * 15
trigger2 = prevstateno = 5120
trigger2 = p2movetype = A 
trigger2 = random < ailevel * 36
value = 3040

[state -1, Dark Voids]
type = changestate
Triggerall = ailevel > 4
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 600]
triggerall = p2bodydist y = [-350,0]
triggerall = power > 999
triggerall = stateno != [3080,3089]
trigger1 = stateno = 240
trigger1 = movehit
trigger1 = random < ailevel * 16
trigger1 = p2statetype != A
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 12
trigger3 = numhelper(1055)
trigger3 = helper(1055),movehit
trigger3 = random < ailevel * 6
trigger3 = p2statetype != A
trigger4 = numhelper(1005)
trigger4 = helper(1005),movehit
trigger4 = random < ailevel * 6
trigger4 = p2statetype != A
trigger5 = numhelper(1015)
trigger5 = helper(1015),movehit
trigger5 = random < ailevel * 12
trigger5 = p2statetype != A
trigger6 = numhelper(1065)
trigger6 = helper(1065),movehit
trigger6 = random < ailevel * 6
value = 3080

[state -1, projectile]
type = changestate
Triggerall = ailevel > 4
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist y = [-110,0]
triggerall = p2bodydist x != [0,40]
triggerall = !var(5)
triggerall = p2statetype != L
triggerall = p2statetype != C
triggerall = power > 499
trigger1 = stateno = 240
trigger1 = random < ailevel * 2
trigger1 = movehit
trigger1 = p2bodydist x < 200
trigger2 = ctrl
trigger2 = p2bodydist x > 600
trigger2 = random < ailevel * 4
trigger2 = enemy,life < 50
trigger3 = stateno = 210
trigger3 = movecontact
trigger3 = p2bodydist x < 200
trigger3 = random < ailevel * 6
trigger4 = random < ailevel * 2
trigger4 = p2statetype != A
trigger4 = ctrl 
value = 1020

[state -1, Homing drop Eliza]
type = changestate
Triggerall = ailevel > 4
Triggerall = var(30)=59
triggerall = var(32) > 0
triggerall = statetype != A
triggerall = !numhelper(4500)
triggerall = power > 499
trigger1 = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 3
trigger2 = p2statetype = L
trigger2 = ctrl
trigger2 = random < ailevel * 8
value = 1150

[state -1, EX vertical Dark Void]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = power > 499
triggerall = !var(5)
triggerall = p2bodydist y = [-600, -350]
triggerall = p2bodydist x = [-20, 300]
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger2 = enemy,name = "Jumba Elephant" || enemy,name = "Lardo Rat" || enemy,name = "Ana 'Jiggly' Bunny"
trigger2 = ctrl
trigger2 = random < ailevel * 4
trigger2 = p2bodydist x = [0,300]
trigger3 = ctrl
trigger3 = random < ailevel * 8
trigger3 = p2life < 100
value = 1072

[state -1, EX Dark Void]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = !var(5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = power > 499
triggerall = p2bodydist y = [-300, 0]
triggerall = p2bodydist x = [300, 700]
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger2 = p2life < 100
trigger2 = ctrl
trigger2 = random < ailevel * 6
value = 1070

[state -1, teleport]
type = changestate
Triggerall= ailevel > 2
Triggerall=var(30)=59
triggerall = var(14) > 0
triggerall = ctrl
triggerall = enemy,facing != Facing
trigger1 = backedgebodydist < 100
trigger1 = random < ailevel * 27
trigger1 = p2bodydist x < 500
trigger1 = !inguarddist
trigger2 = p2statetype = A
trigger2 = stateno = 640 || stateno = 610
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = enemy,hitdefattr = SCA,ST
trigger3 = random < ailevel * 12
value = 1200


[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1200
triggerall = ailevel  
triggerall = ctrl
triggerall = !numhelper(4500)
triggerall = var(14) > 0
triggerall = statetype != A 
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 12 ;5= startup time
trigger1 = random < ailevel * 24


[state -1, backdash]
type = changestate
Triggerall = ailevel > 1
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = ctrl
triggerall = backedgebodydist > 100
trigger1 = p2bodydist x < 250
trigger1 = !inguarddist
trigger1 = random < ailevel * 2
trigger2 = p2stateno = [5100,5120]
trigger2 = p2bodydist x < 430
trigger2 = random < ailevel * 24
trigger3 = backedgebodydist > 100
trigger3 = enemy,hitdefattr = SCA,AT
trigger3 = random < (ailevel*8)
trigger4 = p2stateno = [660,669]
trigger4 = p2bodydist x < 430
trigger4 = random < ailevel * 24
value = 105

[state -1, AI jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S || Statetype = C
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = p2bodydist x = [380, 450]
trigger1 = random < ailevel * 2
trigger1 = enemy,statetype = S || enemy,statetype = C
trigger1 = ctrl
trigger2 = enemy,hitdefattr = SCA,ST
trigger2 = random < ailevel * 8
trigger2 = ctrl
trigger3 = enemy,hitdefattr = SCA, NT
trigger3 = random < ailevel * 4
trigger3 = ctrl
trigger4 = enemy, numproj > 0 && inguarddist
trigger4 = ctrl && random < (ailevel*8)
trigger5 = enemy,name = "Katrina Crocodile"
trigger5 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger5 = ctrl && random < (ailevel*8)
trigger6 = enemy,name = "Zafta Giraffe"
trigger6 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger6 = ctrl && random < (ailevel*8)
trigger7 = enemy,name = "Makuyama"
trigger7 = enemy,stateno = 1101 || enemy,stateno = 1111 || enemy,stateno = 1121
trigger7 = ctrl && random < (ailevel*12) 
value = 40

[state -1, Light vertical Dark Void]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = !var(5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist y = [-300, 0]
triggerall = p2bodydist x = [300, 700]
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger2 = p2life < 100
trigger2 = ctrl
trigger2 = random < ailevel * 6
trigger3 = movehit
trigger3 = stateno = 240 || stateno = 210
trigger3 = random < ailevel * 12
value = 1050

[state -1, Heavy vertical Dark Void]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = !var(5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist y = [-300, 0]
triggerall = p2bodydist x = [300, 700]
triggerall = !inguarddist
trigger1 = stateno = 240
trigger1 = movecontact
trigger1 = random < ailevel* 24
value = 1060

[state -1, Light vertical Dark Void]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = !var(5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist y = [-700, -350]
triggerall = p2bodydist x = [100, 300]
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 6
trigger2 = enemy,name = "Jumba Elephant" || enemy,name = "Lardo Rat" || enemy,name = "Ana 'Jiggly' Bunny"
trigger2 = ctrl
trigger2 = random < ailevel * 8
value = 1052

[state -1, Light vertical Dark Void]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = !var(5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist y = [-700, -350]
triggerall = p2bodydist x = [100, 400]
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger2 = enemy,name = "Jumba Elephant" || enemy,name = "Lardo Rat" || enemy,name = "Ana 'Jiggly' Bunny"
trigger2 = ctrl
trigger2 = random < ailevel * 8
value = 1062

[state -1, projectile]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = !var(5)
triggerall = statetype != A
triggerall = p2bodydist y = [-110,0]
triggerall = p2bodydist x != [0,40]
triggerall = p2statetype != L
triggerall = p2statetype != C
trigger1 = ctrl
trigger1 = p2bodydist x > 600
trigger1 = random < ailevel * 6
value = 1000

[state -1, projectile]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = !var(5)
triggerall = !inguarddist
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x != [0,40]
triggerall = p2bodydist y = [-110,0]
trigger1 = ctrl
trigger1 = p2bodydist x > 600
trigger1 = random < ailevel * 2
trigger2 = numhelper(4500)
trigger2 = helper,stateno = 4500
trigger2 = ctrl
trigger2 = random < ailevel * 18
value = 1010

[state -1, Twirl]
type = changestate
Triggerall = ailevel > 1
Triggerall = var(30)=59
triggerall = statetype = A
triggerall = pos y < -130
trigger1 = stateno = 640 || stateno = 610
trigger1 = random < ailevel * 36
trigger1 = movehit
trigger1 = p2statetype != A
trigger1 = p2bodydist x >  300
value = 635

[state -1, Drill]
type = changestate
Triggerall = ailevel > 1
Triggerall = var(30)=59
triggerall = statetype = A
triggerall = pos y < -130
trigger1 = stateno = 610 || stateno = 640
trigger1 = random < ailevel * 36
trigger1 = movehit
trigger1 = p2statetype = A
trigger2 = pos y < -400
trigger2 = ctrl
trigger2 = p2statetype != A
trigger2 = random < ailevel * 48
trigger3 = random < ailevel * 4
trigger3 = p2bodydist x = [-130,200]
trigger3 = ctrl
trigger4 = stateno = 640 || stateno = 610
trigger4 = random < ailevel * 24
trigger4 = movehit
trigger4 = p2statetype != A
trigger4 = p2bodydist x <=  300
value = 645

[state -1, bodyblock Eliza]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = var(32) > 0
triggerall = !numhelper(4500)
triggerall = statetype != A
triggerall = ctrl
triggerall = p2bodydist x > 800
trigger1 = random < ailevel * 24
trigger1 = enemy,numproj > 0
trigger1 = var(32) > 300
trigger2 = random < ailevel * 2
trigger2 = enemy,numproj > 0
trigger2 = var(32) < 300
;trigger2 = enemy,name = "Enorma Pig" || Enemy,Name = "Pastilla Skunk" || Enemy,Name = "Twiggi Bunny" || Enemy,name = "Aroma Skunk"
;trigger2 = random < ailevel * 8
;trigger2 = p2bodydist x > 350
value = 1100

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1100
triggerall = ailevel  
triggerall = ctrl
triggerall = !numhelper(4500)
triggerall = var(32) > 0
triggerall = statetype != A 
triggerall = p2bodydist x > 800
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 6 ;5= startup time
 trigger1 = random < ailevel * ifelse(var(32) > 300, 36,2)

[state -1, Butt Bump Eliza]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = var(32) > 0
triggerall = statetype != A
triggerall = !numhelper(4500)
triggerall = ctrl
trigger1 = p2bodydist x < 350
trigger1 = random < ailevel * 4
trigger1 = !inguarddist
trigger2 = enemy,name = "Jumbo Elephant" || enemy,name = "Ana 'Jiggly' Bunny" || enemy,name = "Makuyama" || enemy,name = "Jumba Elephant"
trigger2 = random < ailevel * 8
trigger2 = p2bodydist x < 300
trigger3 = life < 475
trigger3 = random < ailevel * 12
trigger3 = !inguarddist
trigger4 = stateno = 240
trigger4 = movehit
trigger4 = random < ailevel*32
value = 1110

[state -1, heavydrop Eliza]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = var(32) > 0
triggerall = statetype != A
triggerall = p2bodydist x < 300
triggerall = !numhelper(4500)
trigger1 = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger2 = ctrl
trigger2 = var(5)
trigger2 = random < ailevel * 24
value = 1130

[state -1, heavydrop Eliza]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = var(32) > 0
triggerall = statetype != A
triggerall = p2bodydist x >= 300
triggerall = !numhelper(4500)
trigger1 = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger2 = ctrl
trigger2 = var(5)
trigger2 = random < ailevel * 16
value = 1140

[state -1, S Jab]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = ctrl
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = p2bodydist y = [-200,0]
triggerall = p2bodydist x = [0,420]
trigger1 = random < ailevel * 10
trigger2 = stateno = 200
trigger2 = moveguarded
trigger2 = random < ailevel * 24
trigger3 = p2stateno = [5000,5029]
trigger3 = random < ailevel * 64
value = 200

[state -1, J. Jab]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype = A
triggerall = p2bodydist y = [-440,30]
triggerall = p2bodydist x < 300
trigger1 = ctrl
trigger1 = random < ailevel * 64
trigger1 = p2movetype = H
trigger2 = ctrl 
trigger2 = random < ailevel * 8
value = 600

[state -1, J. Strong]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype = A
triggerall = p2bodydist y = [-400,120]
triggerall = p2bodydist x = [0,720]
trigger1 = ctrl
trigger1 = random < ailevel *6
trigger1 = !inguarddist
trigger2 = stateno = 630
trigger2 = movecontact
trigger2 = random < ailevel * 48
value = 605

[state -1, J. Forward]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype = A
triggerall = p2bodydist y = [-300,220]
triggerall = p2bodydist x = [0,770]
trigger1 = ctrl
trigger1 = random < ailevel * 18
trigger1 = !inguarddist
trigger2 = stateno = 605
trigger2 = movecontact
trigger2 = animelemtime(6) > 2
trigger2 = random < ailevel * 64
value = 632

[state -1, S Jab]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = ctrl
triggerall = p2statetype != A
trigger1 = p2bodydist x = [0,420]
trigger1 = random < ailevel * 6
trigger1 = !inguarddist
value = 400

[state -1, C. Short]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist y = [-110,0]
trigger1 = stateno = 200 || stateno = 400
trigger1 = movehit
trigger1 = random < ailevel * 8
trigger1 = p2statetype = S
trigger2 = p2statetype = S
trigger2 = ctrl
trigger2 = p2bodydist x = [0,500]
trigger2 = random < ailevel * 6
value = 430

[state -1, C. Roundhouse]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist y = [-110,0]
triggerall = p2bodydist x = [0,560]
trigger1 = ctrl
trigger1 = p2statetype = S
trigger1 = random < ailevel * 4
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 12
trigger3 = stateno = 210
trigger3 = movecontact
trigger3 = random < ailevel * 2
trigger4 = enemynear,hitdefattr = SCA,NP,SP  || enemy,numproj > 0
trigger4 = ctrl
trigger4 = random < ailevel * 48
trigger4 = inguarddist
trigger5 = stateno = 230
trigger5 = p2statetype = C
trigger5 = movehit
trigger5 = random < ailevel * 36
value = 440

[State -1, AI Slide under enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 440 
triggerall = ailevel  
triggerall = statetype = S || statetype = C
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid sliding under projectiles that are high enough to walk under. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;trigger1 = ((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) / (PlayerId(helper(33333333),var(3)), vel x) > 9 ; 9 = lowest point of moves hitbox .
;trigger1 = ((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) / (PlayerId(helper(33333333),var(3)), vel x) < 35 ; 35 = when hitboxs lowest point changes to a higher point.
trigger1 = ctrl
trigger1 = inguarddist

[state -1, J. Short]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype = A
triggerall = p2bodydist y = [-350,60]
trigger1 = stateno = 600
trigger1 = random < ailevel * 48
trigger1 = movecontact
trigger2 = ctrl
trigger2 = !inguarddist
trigger2 = random < ailevel * 4
value = 630

[state -1, J Fierce]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-60,420]
triggerall = p2bodydist y = [-320,200]
trigger1 = ctrl
trigger1 = random < ailevel * 6
trigger1 = !inguarddist
trigger2 = stateno = 605
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger2 = animelemtime(7) > 2
trigger3 = stateno = 630
trigger3 = movehit
trigger3 = random < ailevel * 8
trigger4 = stateno = 632
trigger4 = movecontact
trigger4 = animelemtime(6) > 2
trigger4 = random < ailevel * 24
value = 610


[state -1, J. Roundhouse]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype = A
triggerall = p2bodydist y = [-240,120]
triggerall = p2bodydist x < 700
trigger1 = stateno = 630
trigger1 = movecontact
trigger1 = random < ailevel * 2
trigger2 = ctrl
trigger2 = random < ailevel * 4
trigger3 = stateno = 605
trigger3 = movehit
trigger3 = random < ailevel * 8
trigger3 = animelemtime(7) > 2
trigger4 = stateno = 632
trigger4 = movecontact
trigger4 = animelemtime(6) > 2
trigger4 = random < ailevel * 48
value = 640

[state -1, S short]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = p2statetype != L
trigger1 = stateno = 200 || stateno = 400
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger2 = ctrl
trigger2 = p2bodydist x = [0,540]
trigger2 = !inguarddist
trigger2 = random < ailevel * 6
value = 230

[state -1, S Fierce]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [50, 830]
triggerall = p2bodydist y = [-300,0]
trigger1 = stateno = 230 || stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger2 = ctrl
trigger2 = random < ailevel * 4
trigger2 = !inguarddist
trigger3 = ctrl
trigger3 = p2statetype = L
trigger3 = random < ailevel * 6
trigger3 = p2bodydist x = [350, 800]
trigger3 = !inguarddist
value = 210

[state -1, C. Short]
type = changestate
Triggerall = ailevel > 1
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist y = [-640,0]
triggerall = p2bodydist x = [0, 300]
trigger1 = stateno = 200 || stateno = 400 ||stateno = 230 || stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 4
trigger2 = p2statetype = A
trigger2 = !inguarddist
trigger2 = ctrl
trigger2 = random < ailevel * 16
value = 410

[state -1, S Fierce]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2statetype != C
triggerall = p2statetype != L
triggerall = p2bodydist y = [-400,0]
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 32
trigger2 = ctrl
trigger2 = p2bodydist x = [50, 730]
trigger2 = random < ailevel * 4
trigger2 = !inguarddist
value = 240

[state -1, AI grab]
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
triggerall = p2bodydist x < 160
trigger1 = Random < Ailevel * 12
trigger2 = Random < Ailevel * 18
trigger2 = p2stateno = [120,130]
trigger3 = enemy,name = "Lardo Rat"
trigger3 = enemy,stateno = [1000,1004]
trigger3 = random < (ailevel*12)
trigger4 = enemy,authorname = "Kazecat"
trigger4 = enemy,stateno = 1400
trigger4 = random < (ailevel*12)
trigger5 = p2stateno = [700,799]
trigger5 = random < ailevel * 48
value = 800



;===========================================================================



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
trigger2 = stateno != 635
trigger2 = stateno != 632
trigger2 = stateno != 605
trigger2 = stateno != 645
trigger2 = stateno != 410
trigger2 = movecontact
trigger3 = stateno = 410
trigger3 = movehit
trigger4 = (stateno = 210) || (stateno = 240)
trigger4 = animelemtime(6) < 0
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


;=============================================================================================
;                                       Supers
;=============================================================================================


;---------------------------------------------------------------------------
;Lipomancy
[State -1, Lipomancy]
type = ChangeState
value = 3000
triggerall = !ailevel
triggerall = command = "SUPER"
triggerall = power > 2999
triggerall = stateno != [3000,3099]
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numhelper(1005)
trigger3 = helper(1005),movecontact
trigger4 = numhelper(1015)
trigger4 = helper(1015),movecontact
trigger5 = numhelper(1055)
trigger5 = helper(1055),movecontact
trigger6 = numhelper(1065)
trigger6 = helper(1065),movecontact


[state -1, Witch counter]
type = changestate
value = 3040
triggerall = !ailevel
triggerall = command = "Super 2"
triggerall = statetype != A
triggerall = power > 999
triggerall = stateno != [3000,3099]
trigger1 = ctrl

[state -1, Witch counter]
type = changestate
value = 3080
triggerall = !ailevel
triggerall = command = "Super3"
triggerall = statetype != A
triggerall = power > 999
triggerall = stateno != [3000,3099]
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numhelper(1005)
trigger3 = helper(1005),movecontact
trigger4 = numhelper(1015)
trigger4 = helper(1015),movecontact
trigger5 = numhelper(1055)
trigger5 = helper(1055),movecontact
trigger6 = numhelper(1065)
trigger6 = helper(1065),movecontact

;===========================================================================
;---------------------------------------------------------------------------
[state -1, Tri Beam]
type = changestate
value = 1020
triggerall = command = "QCF_z"
triggerall = statetype = S
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
[state -1, Fast Weak Beam]
type = changestate
value = 1000
triggerall = command = "QCF_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[state -1, Slow Strong Beam]
type = changestate
value = 1010
triggerall = command = "QCF_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[state -1, Black Hole Anti Air EX]
type = changestate
value = 1072
triggerall = command = "DK_c"
triggerall = statetype != A
triggerall = !ailevel
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[state -1, Black Hole Anti Air LK]
type = changestate
value = 1052
triggerall = command = "DK_a"
triggerall = statetype != A
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
[state -1, Black Hole Anti Air HK]
type = changestate
value = 1062
triggerall = command = "DK_b"
triggerall = statetype != A
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------

[state -1, Black Hole EX]
type = changestate
value = 1070
triggerall = command = "QCF_c"
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[state -1, Black Hole LK]
type = changestate
value = 1050
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[state -1, Black Hole LK]
type = changestate
value = 1060
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------

;Teleport
[state -1, Teleport]
type = changestate
value = 1200
triggerall = command = "teleport"
triggerall = var(14) > 0
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Eliza Bodyblock and Grab
[state -1, E. Bodyblock]
type = Changestate
value = 1100
triggerall = var(32) > 0
triggerall = command = "QCB_x"
triggerall = statetype != A
triggerall = !numhelper(4500)
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Eliza Butt Bump and Heal
[state -1, E. Bodyblock]
type = Changestate
value = 1110
triggerall = var(32) > 0
triggerall = command = "QCB_y"
triggerall = statetype != A
triggerall = !numhelper(4500)
trigger1 = ctrl
trigger2 = var(1)


;----------------------------------------------------------------------------
;Eliza Heavy Drop Far
[state -1, Eliza Heavy Drop Far]
type = changestate
value = 1150
triggerall = var(32) > 0
triggerall = command = "QCB_c"
triggerall = statetype != A
triggerall = !numhelper(4500)
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;----------------------------------------------------------------------------
;Eliza Heavy Drop
[state -1, Eliza Heavy Drop Close]
type = changestate
value = 1130
triggerall = var(32) > 0
triggerall = command = "QCB_a"
triggerall = statetype != A
triggerall = !numhelper(4500)
trigger1 = ctrl
trigger2 = var(1)

;----------------------------------------------------------------------------
;Eliza Heavy Drop Far
[state -1, Eliza Heavy Drop Far]
type = changestate
value = 1140
triggerall = var(32) > 0
triggerall = command = "QCB_b"
triggerall = statetype != A
triggerall = !numhelper(4500)
trigger1 = ctrl
trigger2 = var(1)

;-----------------------------------------------------------------------------

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
triggerall = command = "BB" || (command = "dash" && command = "holdback")
triggerall = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210) 
trigger2 = animelemtime(7) < 0
trigger3 = (stateno = 240)
trigger3 = animelemtime(6) < 0

;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "throw"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl 

;-----------------------------------------------------------------------------
[state -1, Teleport escape]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
triggerall = command = "recovery"
trigger1 = power > 999
;------------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 41
trigger1 = command = "superjump"
trigger1 = statetype = S || statetype = C
trigger1 = ctrl





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
trigger2 = stateno = 200
trigger2 = time > 10


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
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
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 210 || stateno = 400 || stateno = 430
trigger2 = movecontact


;---------------------------------------------------------------------------
;Taunt
;[State -1, Taunt]
;type = ChangeState
;value = 195
;triggerall = command = "start"
;trigger1 = statetype != A
;trigger1 = ctrl
;--------------------------------------------------------------------------

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
trigger2 = stateno = 400 || stateno = 200
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
trigger2 = (stateno = 400) || (stateno = 430)  || (stateno = 200) || (stateno = 230) || (stateno = 210)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = command != "holdfwd"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = animelemtime(5) >= 0

;---------------------------------------------------------------------------
;Jump Med Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact



;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 605 || stateno = 632
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 632
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = (stateno = 600)  || (stateno = 630) || (stateno = 605)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Twirl
[state -1, Drill]
type = changestate
value = 635
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = pos y < -130
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 640 || stateno = 605 || stateno = 632
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 605 || stateno = 632
trigger2 = movecontact

;-----------------------------------------------------------------------------
;Drill
[state -1, Drill]
type = changestate
value = 645
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = pos y < -130
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 640 || stateno = 605 || stateno = 632
trigger2 = movecontact


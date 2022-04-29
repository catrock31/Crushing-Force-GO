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

[Command]
name = "Super"
command = D,D,D,a
time = 30
buffer.time = 12

[Command]
name = "Super"
command = D,D,D,b
time = 30
buffer.time = 12

[Command]
name = "Super"
command = D,D,c
time = 20
buffer.time = 12

[Command]
name = "Super"
command = D,D,a+b
time = 20
buffer.time = 12

[Command]
name = "Super"
command = c+z


[Command]
name = "Super2"
command = ~40$B,F,B,F,a
time = 40
buffer.time  = 8

[Command]
name = "Super2"
command = ~40$B,F,B,F,b
time = 40
buffer.time  = 8

[Command]
name = "Super2"
command = ~40$B,F,a+c
time = 20
buffer.time  = 8

[Command]
name = "Super2"
command = ~40$B,F,b+c
time = 20
buffer.time  = 8

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

; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10

[Command]
name = "chargeBFa"
command = ~40$B, F, a
time = 20
buffer.time = 5

[Command]
name = "chargeBFa"
command = ~40$B, F+a
time = 20
buffer.time = 5

[Command]
name = "chargeBFb"
command = ~40$B, F, b
time = 20
buffer.time = 5

[Command]
name = "chargeBFb"
command = ~40$B, F+b
time = 20
buffer.time = 5

[Command]
name = "chargeBFc"
command = ~40$B, F, c
time = 20
buffer.time = 5

[Command]
name = "chargeBFc"
command = ~40$B, F+c
time = 20
buffer.time = 5

[Command]
name = "chargeBFc"
command = ~40$B, F, a+b
time = 20
buffer.time = 5

[Command]
name = "chargeDUa"
command = ~40$D, U+a
time = 20
buffer.time = 12

[Command]
name = "chargeDUa"
command = ~40$D, U, a
time = 20
buffer.time = 12

[Command]
name = "chargeDUb"
command = ~40$D, U, b
time = 20
buffer.time = 12

[Command]
name = "chargeDUb"
command = ~40$D, U+b
time = 20
buffer.time = 12

[Command]
name = "chargeDUc"
command = ~40$D, U+c
time = 20
buffer.time = 12

[Command]
name = "chargeDUc"
command = ~40$D, U,c
time = 20
buffer.time = 12

[Command]
name = "chargeDUc"
command = ~40$D, U, a+b
time = 20
buffer.time = 12

[Command]
name = "chargeDUc"
command = ~40$D, U+a+b
time = 20
buffer.time = 12

[Command]
name = "chargeBFx"
command = ~40$B, F, x
time = 20
buffer.time = 5

[Command]
name = "chargeBFx"
command = ~40$B, F+x
time = 20
buffer.time = 5

[Command]
name = "chargeBFy"
command = ~40$B, F, y
time = 20
buffer.time = 5

[Command]
name = "chargeBFy"
command = ~40$B, F+y
time = 20
buffer.time = 5

[Command]
name = "chargeBFz"
command = ~40$B, F, z
time = 20
buffer.time = 5

[Command]
name = "chargeBFz"
command = ~40$B, F+z
time = 20
buffer.time = 5

[Command]
name = "chargeBFz"
command = ~40$B, F, x+y
time = 20
buffer.time = 5

[Command]
name = "chargeBFz"
command = ~40$B, F+x+y
time = 20
buffer.time = 5

[Command]
name = "HCB_x"
command = ~F,D,B,x
time = 20
buffer.time = 5


[Command]
name = "HCB_x"
command = ~F,D,B+x
time = 20
buffer.time = 5


[Command]
name = "HCB_y"
command = ~F,D,B+y
time = 20
buffer.time = 5

[Command]
name = "HCB_y"
command = ~F,D,B,y
time = 20
buffer.time = 5

[Command]
name = "HCB_z"
command = ~F,D,B+z
time = 20
buffer.time = 5

[Command]
name = "HCB_z"
command = ~F,D,B,z
time = 20
buffer.time = 5

[Command]
name = "HCB_z"
command = ~F,D,B+x+y
time = 20
buffer.time = 5

[Command]
name = "HCB_z"
command = ~F,D,B,x+y
time = 20
buffer.time = 5

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

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
name = "throw"
command = x+a
time = 1
buffer.time = 1

[Command]
name = "Pose"
command = x+y
time = 1
buffer.time = 1

[command]
name = "Hold Pose"
command = /x+y
time = 1
buffer.time = 1

[command]
name = "Pose"
command = z
time = 1
buffer.time = 1

[command]
name = "Hold Pose"
command = /z
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
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = stateno != 410
trigger2 = movecontact
trigger3 = stateno = 410
trigger3 = movehit
var(1) = 1


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

;----|Movement|-----------
[State -1, Jump]
type = changestate
Triggerall=var(30)=59
triggerall = Statetype != A
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = ctrl
trigger1 = enemy,hitdefattr = S,AT
trigger1 = random < ailevel * 2
trigger2 = p2bodydist x = [140, 200]
trigger2 = random < ailevel * 8
trigger2 = enemy,statetype = S || enemy,statetype = C
trigger2 = ctrl
trigger3 = enemy,name = "Katrina Crocodile"
trigger3 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger3 = ctrl && random < (ailevel*6)
trigger4 = enemy,name = "Zafta Giraffe"
trigger4 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger4 = ctrl && random < (ailevel*6)
trigger5 = enemy,name = "Makuyama"
trigger5 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger5 = ctrl && random < (ailevel*6) 
trigger6 = enemy,name = "Violet 'Tyla' Bunny"
trigger6 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger6 = ctrl && random < ailevel*6
trigger7 = enemy,name = "Julian Hippo"
trigger7 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger7 = ctrl && random < (ailevel*6)
trigger8 = enemy,name = "Pastilla Skunk"
trigger8 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger8 = ctrl && random < (ailevel*6)
value = 40

[state -1, backdash]
type = changestate
triggerall= var(30) = 59
triggerall = Statetype != A
triggerall = ctrl
triggerall = ailevel > 1
trigger1 = enemy, stateno = 5120
trigger1 = p2bodydist x < 80
trigger1 = random < (ailevel*2)
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < ailevel * 2 && ctrl
value = 105


;---------------------------------------------------------------------------------------
; Super
;---------------------------------------------------------------------------------------

[state  -1, Taste the Rainbow]
type = changestate
triggerall=  var(30)  =  59
triggerall = statetype != A
triggerall = Ailevel  > 4
triggerall = Power > 2999
triggerall = p2statetype != L
triggerall = p2bodydist y = [-300,-60]
triggerall = p2bodydist x = [-100,180]
triggerall = p2statetype = A
trigger1 = ctrl
trigger1 = random < ailevel * 36
trigger1 = enemy,vel y > 0
trigger2 = stateno = 1150 || stateno = 1160
trigger2 = movehit
trigger2 = ailevel < random * 24
trigger3 = stateno = 1150 || stateno = 1160
trigger3 = moveguarded
trigger3 = ailevel < random * 1
trigger4 = frontedgebodydist < 40
trigger4 = stateno = 1001 || stateno = 1011
trigger4 = movehit
trigger4 = random < ailevel * 12
value = 3000


[state  -1, Power Bottom]
type = changestate
triggerall=  var(30)  =  59
triggerall = statetype != A
triggerall = Ailevel  > 4
triggerall = Power > 999
triggerall = p2statetype != L
triggerall = p2bodydist  y = [-150,0]
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 4
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random <  ailevel  * 4
trigger3 = ctrl
trigger3 = enemynear,ctrl= 0
trigger3 = enemynear,animtime < -6
trigger3 = floor(random< ailevel * 0.5)
trigger3 =  p2bodydist x  = [0, 200]
trigger4 = enemynear,stateno  =[120,155]
trigger4 = random <  floor(ailevel * 0.5)
trigger4 = ctrl
trigger5 = stateno = 1001 || stateno = 1011
trigger5 = movehit
trigger5 = random < ailevel * 24
trigger5 = p2bodydist x < 250
trigger6 = stateno = 1001 || stateno = 1011
trigger6 = moveguarded
trigger6 = random < ailevel * 2
trigger7 = stateno = 430
trigger7 = moveguarded
trigger7 = random < floor(ailevel * 0.25)
value = 3040


[state -1, Hip Check]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = ailevel > 5
triggerall = power > 499
trigger1 = random < (ailevel) && (enemy,hitdefattr = SCA,NA,NP) 
trigger2 = random < (ailevel * 8) && (enemy,hitdefattr = SCA,HA,HP) 
trigger3 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,SA,SP)
value = 1400

[state -1, Skip]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 2
triggerall = stateno != 100
trigger1 = p2bodydist x > 400
trigger1 = !inguarddist  && enemy,numproj < 1
trigger1 = random < ailevel * 6
trigger2 = p2bodydist x > 265
trigger2 = !inguarddist
trigger2 = random < ailevel * 2
trigger3 = p2statetype = L
trigger3 = p2bodydist x > 265
trigger3 = random < ailevel * 12
value = 100
 

[state -1, HK. BUTT bump]
type = changestate
Triggerall= ailevel > 4
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = power > 499
triggerall = var(42) = 1
triggerall = p2statetype != L
triggerall = stateno != 20 && vel x > 0
triggerall = enemy,hitfall = 0
triggerall = p2bodydist x =[0, 1000]
triggerall = p2bodydist y = [0,-165]
trigger1 = stateno = 230 || stateno = 430 || stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 4
trigger2 = ctrl
trigger2 = enemynear,animtime > -12
trigger2 = enemynear,ctrl = 0
trigger2 = !inguarddist
trigger3 = prevstateno = 5120
trigger3 = ctrl
trigger3 = p2movetype = A
trigger3 = inguarddist
trigger3 = random < ailevel * 12
value = 1020

[state -1, EX BUTT UP]
type = changestate
Triggerall= ailevel > 4
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = power > 499
triggerall = stateno != 20 
triggerall = var(42) = 1
triggerall = p2bodydist x = [-100,150]
triggerall = p2bodydist y = [-200,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = p2movetype = A
trigger1 = prevstateno = 5120 || prevstateno = 1400
trigger1 = random < ailevel * 24
trigger2 = ctrl
trigger2 = p2movetype = A
trigger2 = p2statetype = A
trigger2 = random < ailevel * 2
trigger3 = enemynear,hitdefattr = SCA, HA
trigger3 = ctrl
trigger3 = random < ailevel * 2
value = 1070

[state -1, Giant Swing]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = power > 499
triggerall = p2bodydist x = [0,150]
triggerall = p2bodydist y = [-300,0]
triggerall = enemynear,numproj = 0
triggerall = enemynear,vel y >= 0
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = prevstateno = 200 || prevstateno = 400 || prevstateno = 230 || prevstateno = 430
trigger1 = p2stateno = [120,155]
trigger1 = life > 600
trigger2 = ctrl
trigger2 = enemynear,animtime < -8
trigger2 = p2movetype = A || enemynear,ctrl = 0
trigger2 = random < ailevel * 12
trigger3 = p2stateno = [700,799]
trigger3 = ctrl 
trigger3 = random < ailevel * 24
trigger3 = p2statetype != A
trigger4 = enemy,hitdefattr = SCA,AT
trigger4 = ctrl || var(1)
trigger4 = random < ailevel * 2
value = 1120

[State -1, Slide EX] ;by Inktrebuchet
type = ChangeState
value = 1170
triggerall = ailevel  
triggerall = ctrl
triggerall = p2stateno != [1215,1216]
triggerall = statetype != A
triggerall = var(42) = 1
triggerall = stateno != 20 && vel x > 0
triggerall = p2bodydist x = [0,900]
triggerall = power > 499
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 0 ;5= startup time
trigger1 = random < ailevel * 32
trigger1 = enemynear,animtime < -12

[State -1, Slide EX] ;by Inktrebuchet
type = ChangeState
value = 1170
triggerall = ailevel  
triggerall = ctrl
triggerall = stateno != 20 && vel x > 0
triggerall = p2stateno != [1215,1216]
triggerall = statetype != A 
triggerall = var(42) = 1
triggerall = p2bodydist x = [0,900]
triggerall = power > 499
trigger1 = enemy,numproj > 0
trigger1 = random  < ailevel * 18
trigger2 = p2bodydist x > 600
trigger2 = random < ailevel * 4
trigger2 = p2statetype != A

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1200
triggerall = ailevel  
triggerall = ctrl
triggerall = p2stateno != [1215,1216]
triggerall = statetype != A 
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 0 ;5= startup time
trigger1 = random < ailevel * 64

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1200
triggerall = ailevel  
triggerall = ctrl
triggerall = p2stateno != [1215,1216]
triggerall = statetype != A 
trigger1 = enemy,numproj > 0 
;trigger1 =  random < ailevel  * 64
;trigger1 = random < ailevel * 36


[state -1, Giant Swing]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0,150]
triggerall = p2bodydist y = [-300,0]
triggerall = enemynear,numproj = 0
triggerall = enemynear,vel y >= 0
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = prevstateno = 200 || prevstateno = 400 || prevstateno = 230 || prevstateno = 430
trigger1 = p2stateno = [120,155]
trigger1 = p2statetype != A
trigger2 = ctrl
trigger2 = enemynear,animtime < -24
trigger2 = p2movetype = A || enemynear,ctrl = 0
trigger2 = random < ailevel * 12
trigger3 = stateno = 200 || stateno = 230 || stateno = 210 || stateno = 430
trigger3 = moveguarded
trigger3 = random < ailevel * 4
trigger4 = enemy,hitdefattr = SCA,AT
trigger4 = ctrl || var(1)
trigger4 = random < ailevel * 8
value = 1110

[state -1, Giant Swing]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0,150]
triggerall = p2bodydist y = [-300,0]
triggerall = enemynear,numproj = 0
triggerall = enemynear,vel y >= 0
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = prevstateno = 200 || prevstateno = 400 || prevstateno = 230 || prevstateno = 430
trigger1 = p2stateno = [120,155]
trigger2 = ctrl
trigger2 = enemynear,animtime < -16
trigger2 = p2movetype = A || enemynear,ctrl = 0
trigger2 = random < ailevel * 8
trigger3 = p2stateno = [700,799]
trigger3 = ctrl 
trigger3 = random < ailevel * 32
trigger3 = p2statetype != A
trigger4 = stateno = 200 || stateno = 230 || stateno = 210 || stateno = 430
trigger4 = moveguarded
trigger4 = random < ailevel * 4
trigger5 = enemy,hitdefattr = SCA,AT
trigger5 = ctrl || var(1)
trigger5 = random < ailevel * 16
value = 1100

[state -1, S. Jab]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist x = [0,150]
triggerall = statetype != A
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = !inguarddist
value = 200

[state -1, Canonball]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist x = [-125,190]
triggerall = p2bodydist y > 0
triggerall = pos y < -200
triggerall = statetype = A
triggerall = p2stateno != [660,669]
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = enemynear,ctrl = 0
trigger2 = ctrl
trigger2 = p2statetype = C || p2statetype = L
trigger2 = random < ailevel * 18
trigger3 = stateno = 640
trigger3 = movehit
trigger3 = frontedgebodydist < 100
trigger3 = p2statetype = A
trigger3 = random < ailevel * 36
trigger4 = stateno = 610
trigger4 = movehit
trigger4 = random < ailevel * 36
trigger4 = p2statetype = A
trigger5 = ctrl
trigger5 = enemynear,life < 150
trigger5 = random < ailevel * 36
value = 650


[state -1, C. Jab]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist x = [0,130]
triggerall = statetype != A
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = !inguarddist
value = 400

[state -1, J. Jab]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist X = [0,180]
triggerall = p2bodydist y = [-250,75]
triggerall = statetype = A
trigger1 = ctrl
trigger1 = random < ailevel * 24
trigger1 = !inguarddist
trigger2 = stateno = 600
trigger2 = movecontact
trigger2 = random < ailevel * 18
value = 600

[state -1, J. short]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist X = [0,200]
triggerall = p2bodydist y = [-175,175]
triggerall = statetype = A
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = !inguarddist
trigger1 = p2statetype != A
trigger2 = stateno = 600
trigger2 = movecontact
trigger2 = random < ailevel * 36
value = 630

[state -1, J. Fierce]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist X = [0,180]
triggerall = p2bodydist y = [-250,190]
triggerall = statetype = A
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = !inguarddist
trigger1 = p2statetype != A
trigger1 = vel y > 5
trigger2 = stateno = 630
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = stateno = 600
trigger3 = movehit
trigger3 = random < ailevel * 6
trigger4 = ctrl
trigger4 = random < ailevel * 32
trigger4 = p2statetype = A
trigger4 = p2movetype != H
value = 610

[state -1, J. Roundhouse]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist X = [0,240]
triggerall = p2bodydist y = [-190,175]
triggerall = statetype = A
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = !inguarddist
trigger1 = vel y > 5
trigger1 = p2statetype != A
trigger2 = stateno = 630
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = stateno = 600
trigger3 = movehit
trigger3 = random < ailevel * 6
value = 640

[state -1, S. Short]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist x = [0,140]
triggerall = statetype != A
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 6
trigger1 = !inguarddist
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = random < ailevel * 32
value = 230

[state -1, C. Short]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist x = [0,190]
triggerall = statetype != A
triggerall = !numtarget(1400) 
triggerall = !numtarget(800)
trigger1 = ctrl
trigger1 = random < ailevel * 3
trigger1 = !inguarddist
trigger2 = stateno = 400
trigger2 = movecontact
trigger2 = random < ailevel * 32
trigger3 = ctrl
trigger3 = p2statetype = S
trigger3 = random < ailevel * 6
value = 430

[state -1, S. Fierce]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist x = [0,300]
triggerall = statetype != A
triggerall = p2statetype != L
trigger1 = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = !inguarddist
trigger2 = stateno = 230
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = stateno = 430
trigger3 = movehit
trigger3 = random < ailevel * 16
trigger4 = ctrl
trigger4 = p2stateno = [1215,1216]
trigger4 = random < ailevel * 8
value = 210

[state -1, S. Fierce]
type = changestate
Triggerall= ailevel > 1
Triggerall=var(30)=59
triggerall = p2bodydist x = [0,330]
triggerall = statetype != A
triggerall = p2statetype != L
trigger1 = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 1
trigger1 = !inguarddist
trigger2 = stateno = 430 || stateno = 230
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = ctrl
trigger3 = p2stateno = [1215,1216]
trigger3 = random < ailevel * 24
value = 410

[state -1, S. Roundhouse]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = p2bodydist x = [0,290]
triggerall = statetype != A
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < floor(ailevel * 1.5)
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 32
trigger2 = p2statetype != A
value = 240

[state -1, C. Roundhouse]
type = changestate
Triggerall= ailevel 
Triggerall=var(30)=59
triggerall = p2bodydist x = [0,285]
triggerall = statetype != A
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = p2statetype = S
trigger1 = !inguarddist
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 32
trigger2 = p2statetype != A
value = 440

[state -1, HK. BUTT bump]
type = changestate
Triggerall = ailevel > 2
Triggerall =var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(42) = 1
triggerall = p2bodydist x =[0, 1000]
triggerall = p2bodydist y = [-165,0]
triggerall = stateno != 100
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 36
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger3 = ctrl
trigger3 = p2stateno = [1215,1216]
trigger3 = random < ailevel * 48
trigger4 = !inguarddist
trigger4 = ctrl
trigger4 = enemynear,animtime > -24
trigger4 = random < ailevel * 4
value = 1010

[state -1, LK. BUTT bump]
type = changestate
Triggerall = ailevel > 2
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = var(42) = 1
triggerall = p2statetype != L
triggerall = p2bodydist x =[0, 600]
triggerall = p2bodydist y = [-165,0]
triggerall = stateno != 100
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 16
trigger3 = stateno = 430
trigger3 = moveguarded
trigger3 = random < ailevel * 4
trigger4 = ctrl
trigger4 = random < ailevel * 4
trigger4 = p2bodydist x = [280,380]
trigger4 = p2statetype != A
trigger4 = !inguarddist 
value = 1000

[state -1, HP. Slide]
type = changestate
Triggerall= ailevel > 2
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(42) = 1
triggerall = p2bodydist x =[0, 640]
triggerall = stateno != 100
triggerall = p2bodydist y = [-165,0]
triggerall = enemynear,hitfall = 0
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 12
trigger2 = ctrl
trigger2 = p2statetype = S
trigger2 = random < ailevel * 8
trigger3 = enemy,numproj  > 0
trigger3 = ctrl
trigger3 = random <ailevel  * 8
trigger4 = ctrl
trigger4 = enemynear,animtime < -30
trigger4 = enemynear,ctrl = 0
trigger4 = p2statetype != A
trigger4 = random < Floor(ailevel * 0.5)
trigger5 = power > 2799
trigger5 = random < floor(ailevel * 0.25)
trigger5 = p2statetype = S
trigger5 = ctrl
value = 1160

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1160
Triggerall =var(30)=59
triggerall = ailevel > 2 
triggerall = ctrl
triggerall = var(42) = 1
triggerall = statetype != A 
triggerall = stateno != 20 && vel x > 0
triggerall = p2bodydist x = [0,480]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,22] ; 5 = startup time, 22 = active ; [0,5] for last second


[state -1, LP. Slide]
type = changestate
Triggerall= ailevel > 2
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = var(42) = 1
triggerall = p2statetype != L
triggerall = p2bodydist x =[0, 640]
triggerall = p2bodydist y = [-165,0]
triggerall = enemynear,hitfall = 0
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 2
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 2
trigger3 = ctrl
trigger3 = !inguarddist
trigger3 = p2statetype = S
trigger3 = random < floor(ailevel * 0.5)
trigger3 = enemynear,ctrl = 0
trigger4 = enemy,numproj  > 0
trigger4 = ctrl
trigger4 = random <ailevel  * 8
value = 1150

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1150
Triggerall =var(30)=59
triggerall = ailevel > 2 
triggerall = ctrl
triggerall = var(42) = 1
triggerall = stateno != 20 && vel x > 0
triggerall = statetype != A 
triggerall = p2bodydist x = [0,480]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,22] ; 5 = startup time, 22 = active ; [0,5] for last second


[state -1, LK. BUTT UP]
type = changestate
Triggerall= ailevel > 2
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno != 20 
triggerall = var(42) = 1
triggerall = p2bodydist x = [-100,150]
triggerall = p2bodydist y = [-200,0]
triggerall = p2statetype != L
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 24
trigger2 = ctrl 
trigger2 = p2statetype = A
trigger2 = p2movetype = A
trigger2 = random < ailevel * 12
trigger3 = stateno = 430
trigger3 = moveguarded
trigger3 = random < ailevel * 3
value = 1060

[state -1, LK. BUTT UP]
type = changestate
Triggerall= ailevel > 2
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno != 20 
triggerall = var(42) = 1
triggerall = p2bodydist x = [-100,150]
triggerall = p2bodydist y = [-150,0]
triggerall = p2statetype != L
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 12
trigger2 = ctrl 
trigger2 = p2statetype = A
trigger2 = p2movetype = A
trigger2 = random < ailevel * 8
trigger3 = stateno = 430
trigger3 = moveguarded
trigger3 = random < ailevel * 3
value = 1050

[state -1, Throw]
type = changestate
triggerall = ailevel > 1
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != A
triggerall = enemy,statetype != L
triggerall = enemy,movetype != H
triggerall = p2bodydist x < 70
triggerall = stateno != 100
triggerall = ctrl
trigger1 = Random < Ailevel * 16
trigger2 = enemy,name = "Lardo Rat"
trigger2 = enemy,stateno = [1000,1004]
trigger2 = random < (ailevel*12)
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*8)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel*64
value = 800








;===========================================================================


;Supers!!!
[state -1, Taste the Rainbow]
type = changestate
triggerall = command = "Super"
triggerall = !ailevel
triggerall = power > 2999
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1001 || stateno = 1011 
trigger3 = movecontact
trigger4 = (stateno = 1150) || (stateno = 1160) || (stateno = 1170)
trigger4 = movecontact
value = 3000

;---------------------------------------------------------------------------
;Supers!!!
[state -1, Power  Bottom]
type = changestate
triggerall = command = "Super2"
triggerall = !ailevel
triggerall = power > 999
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1001 || stateno = 1011 
trigger3 = movecontact
value = 3040


;-----------------------------------------------------------------------------
;Command grab, Giant Swing
[state -1, Giant Swing HP]
type = changestate
triggerall = command = "HCB_z"
triggerall = !ailevel
triggerall = power > 499
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)
value = 1120
;---------------------------------------------------------------------------
;Command grab, Giant Swing
[state -1, Giant Swing lp]
type = changestate
triggerall = command = "HCB_x"
triggerall = !ailevel
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)
value = 1100
;---------------------------------------------------------------------------
;Command grab, Giant Swing
[state -1, Giant Swing HP]
type = changestate
triggerall = command = "HCB_y"
triggerall = !ailevel
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)
value = 1110


;---------------------------------------------------------------------------
;Butter Salt
[state -1, Butt Bump LK]
type = changestate
triggerall = command = "chargeDUc"
triggerall = !ailevel
triggerall = power > 499
triggerall = statetype != A 
trigger1 = ctrl || stateno = [40,41]
trigger2 = var(1)
value = 1070
;---------------------------------------------------------------------------
;Butter Salt
[state -1, Butt Bump LK]
type = changestate
triggerall = command = "chargeDUa"
triggerall = statetype != A 
trigger1 = ctrl || stateno = [40,41]
trigger2 = var(1)
value = 1050

;---------------------------------------------------------------------------
;Butter Salt
[state -1, Butt Bump LK]
type = changestate
triggerall = command = "chargeDUb"
triggerall = statetype != A 
trigger1 = ctrl || stateno = [40,41]
trigger2 = var(1)
value = 1060
;---------------------------------------------------------------------------
;Butt Bump HK
[state -1, Butt Bump HK]
type = changestate
triggerall = command = "chargeBFc"
triggerall = !ailevel
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl 
trigger2 = var(1)
value = 1020

;---------------------------------------------------------------------------
;Butt Bump LK
[state -1, Butt Bump LK]
type = changestate
triggerall = command = "chargeBFa"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
value = 1000

;---------------------------------------------------------------------------
;Butt Bump HK
[state -1, Butt Bump HK]
type = changestate
triggerall = command = "chargeBFb"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
value = 1010

;---------------------------------------------------------------------------
;Sexy Slide EX
[state -1, Sexy Slide EX]
type = changestate
triggerall = command = "chargeBFz"
triggerall = statetype != A
triggerall = power > 499
triggerall =  !ailevel
trigger1 = ctrl
trigger2 = var(1)
value = 1170
;---------------------------------------------------------------------------
;Sexy Slide LK
[state -1, Sexy Slide LK]
type = changestate
triggerall = command = "chargeBFx"
triggerall = statetype != A
triggerall =  !ailevel
trigger1 = ctrl
trigger2 = var(1)
value = 1150

;---------------------------------------------------------------------------
;Sexy Slide HK
[state -1, Sexy Slide HK]
type = changestate
triggerall = command = "chargeBFy"
triggerall = statetype != A
triggerall =  !ailevel
trigger1 = ctrl
trigger2 = var(1)
value = 1160



;---------------------------------------------------------------------------
;Pose dodge
[state -1, Pose]
type = changestate
triggerall = ailevel = 0
triggerall = command = "Pose"
triggerall = statetype != A
trigger1 = ctrl
value = 1200

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
triggerall = command = "throw"
triggerall = statetype != A
triggerall = stateno != 100
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




;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 400) || (stateno = 430)
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
trigger2 = (stateno = 200) || (stateno = 400) 
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
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 210) || (stateno = 400) || (stateno = 430)
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
;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 499

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
;;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = command != "holdup"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 
trigger2 = movecontact


;---------------------------------------------------------------------------
;Canonball
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = !ailevel
triggerall = command = "b"
triggerall = command = "holdup"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 640 || stateno = 610
trigger2 = movehit



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
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.

[Command]
name = "Roxxie"
command = c+z
time = 1

[Command]
name = "Texas"
command = B, F
time = 10
buffer.time = 3
;
[Command]
name = "Georgia"
command = ~F,DF,D,DB,B, x+z
time = 30
buffer.time = 8

[Command]
name = "Georgia"
command = ~F,D,B, x+z
time = 30
buffer.time = 8

[Command]
name = "Georgia"
command = ~F,DF,D,DB,B, y+z
time = 30
buffer.time = 8

[Command]
name = "Georgia"
command = ~F,D,B, y+z
time = 30
buffer.time = 8

[Command]
name = "Georgia"
command = ~F,D,B,F,D,B, x
time = 30
buffer.time = 8

[Command]
name = "Georgia"
command = ~F,D,B,F,D,B, y
time = 30
buffer.time = 8

[Command]
name = "Caramel"
command = ~D,DB,B,D,DB,B,a
time = 30
buffer.time = 8

[Command]
name = "Caramel"
command = ~D,DB,B,D,DB,B,b
time = 30
buffer.time = 8

[Command]
name = "Caramel"
command = ~D,DB,B,a+c
time = 30
buffer.time = 8

[Command]
name = "Caramel"
command = ~D,DB,B,b+c
time = 30
buffer.time = 8

[Command]
name = "Caramel"
command = ~D,B,b+c
time = 30
buffer.time = 8

[Command]
name = "Caramel"
command = ~D,B,a+c
time = 30
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
name = "HCB_x"
command = ~F, DF, D, DB, B, x
time = 20

[Command]
name = "HCB_y"
command = ~F, DF, D, DB, B, y
time = 20

[Command]
name = "HCB_z"
command = ~F, DF, D, DB, B, z
time = 20

[Command]
name = "HCB_z"
command = ~F, DF, D, DB, B, x+y
time = 20

[Command]
name = "HCB_x"
command = ~F, D, B, x
time = 20

[Command]
name = "HCB_y"
command = ~F, D, B, y
time = 20

[Command]
name = "HCB_z"
command = ~F, D, B, z
time = 20

[Command]
name = "HCB_z"
command = ~F, D, B, x+y
time = 20


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
name = "QCB_z"
command = ~D, DB, B, x+y

[Command]
name = "QCB_z"
command = ~D, DB, B, z

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
name = "QCB_a"
command = ~D, DB, B, a

[Command]
name = "QCB_b"
command = ~D, DB, B, b

[Command]
name = "QCB_c"
command = ~D, DB, B, a+b

[Command]
name = "QCB_c"
command = ~D, DB, B, c




[Command]
name = "FF_c"
command = F, F, a+b

[Command]
name = "FF_c"
command = F, F, c

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

[Command]
name = "recovery"
command = z
time = 1

[command]
name = "Assist"
command = y+b
time = 1

[Command]
name = "grab"
command = a+x
time = 1

[command]
name = "holdz"
command = /x+y
time = 1

[command]
name = "kicks"
command = a+b
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

[command]
name = "holdx"
command = /x
time = 1

[Command]
name = "y"
command = y
time = 1

[command]
name = "holdy"
command = /y
time = 1

[Command]
name = "z"
command = z
time = 1

[command]
name = "holdz"
command = /z
time = 1

[command]
name = "holdz"
command = /x+y
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

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

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
trigger2 = stateno != 245
trigger2 = stateno != 246
trigger2 = stateno != 248
TRIGGER2 = stateno != 410
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
triggerall = numenemy
triggerall = inguarddist || enemynear,hitdefattr = SCA,NP,SP,HP || enemynear,hitdefattr = SCA,AA
triggerall = ctrl
trigger1 = ailevel > 6
trigger1 = random < ailevel * 64
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 32
trigger3 = ailevel < 3
trigger3 = random < ailevel * 8
value = 120

[state -1, defensive Shove]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 5
triggerall = stateno = [150,153]
triggerall = power > 499
triggerall = p2bodydist x = [0, 400]
triggerall = p2bodydist y = [-300,0]
trigger1 = random < floor(ailevel*2) && (enemy,hitdefattr = SCA,NA)
trigger2 = random < (ailevel*16) && (enemy,hitdefattr = SCA,HA)
trigger3 = random < (ailevel*4) && (enemy,hitdefattr = SCA,SA)
value = 1400


[state -1, AI backflip]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = backedgedist > 60
triggerall = numenemy
trigger1 = enemynear,stateno = [5110, 5120]
trigger1 = random < ailevel * 18
trigger1 = p2bodydist x < 150
trigger2 = enemynear,hitdefattr = SCA, AT
trigger2 = random < ailevel * 12
trigger3 = numhelper(4001)
trigger3 = helper(4001),stateno = 4035
trigger3 = helper(4001),pos y = [-1000,-200]
trigger3 = random < ailevel * 36
trigger3 = backedgebodydist > 200
trigger4 = numhelper(4000)
trigger4 = helper(4000),stateno = 4020
trigger4 = random < ailevel * 24
trigger4 = helper(4000), animelemtime(6) < 0
trigger5  = numhelper(4001)
trigger5 = helper(4001),stateno = 4035
trigger5 = helper(4001),pos y = [-1000,-200]
trigger5 = random < ailevel * 32
trigger5 = (stateno = 1051) || (stateno = 1061)
trigger6 = ctrl
trigger6 = numhelper(4100)
trigger6 = helper(4100),stateno = 4110
trigger6 = helper(4100),parentdist x = [400, 520]
trigger6 = random < ailevel * 36
trigger7 = numhelper(2500)
trigger7 = ctrl
trigger7 = random < ailevel * ifelse(helper(2500),stateno = 2503, 36, 12)
trigger7 = helper(2500),rootdist x > 100
trigger7 = enemynear,statetype = L  || !inguarddist
trigger8 = numhelper(4100)
trigger8 = helper(4100),stateno = 4100
trigger8 = ctrl
trigger8 = random < ailevel * 36
value = 105

[state -1, Jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel
triggerall = ctrl
trigger1 = enemynear,hitdefattr = SC, NT
trigger1 = random < ailevel * 15
trigger2 = enemynear,hitdefattr = SC,ST
trigger2 = random < ailevel * 18
trigger3 = stateno = 100
trigger3 = p2bodydist x = [400,600]
trigger3 = random < ailevel * 12
trigger3 = p2statetype != L
trigger4 = prevstateno = 3040
trigger5 = numhelper(4100)
trigger5 = helper(4100),stateno = 4110
trigger5 = random < ailevel * 6
trigger5 = helper(4100),parentdist x = [440,500]
value = 40

[state -1, Roxxie Hyper Fast Butt Drop]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = power > 2999
triggerall = ailevel > 3
triggerall = p2statetype != L
triggerall = p2bodydist x = [-100, 170]
triggerall = !numhelper(4300)
triggerall = !enemynear,gethitvar(isbound)
trigger1 = ctrl
trigger1 = random < ailevel * 24
trigger1 = enemynear,anim = 5300
trigger2 = stateno = 410
trigger2 = movehit
trigger2 = random < ailevel * 36
trigger3 = enemynear,pos y < -600
trigger3 = ctrl 
trigger3 = random < ailevel * 4
trigger3 = enemynear, statetype = A
trigger3 = enemynear, ctrl = 0
value = 3000

[state -1, Georgia Command Grab]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 400]
triggerall = p2bodydist y = [-150,0]
triggerall = !numhelper(4100)
triggerall = !enemynear,gethitvar(isbound)
triggerall = enemynear,anim != 5300
triggerall = backedgebodydist > 300
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = enemynear,vel y > -1
trigger1 = enemynear,pos y > -150
trigger2 = stateno = 210 || stateno = 230 || stateno = 430 || stateno = 240
trigger2 = moveguarded
trigger2 = random < ailevel * 2
value = 3040

[state -1, Smiling Jacks & Caramel Headcrush]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 1000]
triggerall = p2bodydist y = [-200,0]
triggerall = !numhelper(4200)
triggerall = !numhelper(4250)
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = enemynear,animtime < -15
trigger1 = enemynear,ctrl = 0
trigger2 = enemynear,anim = 5300
trigger2 = random < ailevel * 15
trigger2 = ctrl
trigger3 = stateno = 210
trigger3 = movehit
trigger3 = random < ailevel * 24
trigger3 = p2statetype != A
value = 3080

[state -1, Instant Dash Attack]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = power > 499
triggerall = p2bodydist y = [ -200,0]
triggerall = p2bodydist x = [0,600]
triggerall = var(7) > 0
triggerall = var(1) || ctrl
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 2
trigger2 = enemynear,ctrl = 0
trigger2 = enemynear,animtime < -12
trigger2 = random < ailevel * 8
trigger3 = prevstateno = 5120 || prevstateno = [150,155]
trigger3 = enemynear,movetype = A
trigger3 = random < ailevel * 8
value = 1120

[state -1, Dash Attack]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = stateno = 100
triggerall = power > 499
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 600]
triggerall = p2bodydist y = [-175, 0]
trigger1 = random < ailevel * 2
trigger1 = enemynear,animtime < -8
trigger1 = enemynear,ctrl = 0
trigger1 = enemynear,numproj > 0
value = 248


;Experiment - With texas we're gonna program all the fastest things she can do first and go down from that.  To help Mugen with guiding the AI to choose the fastest option.

[state -1, Dodge Roll]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = stateno = 100
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 600]
triggerall = p2bodydist y = [-175, 0]
trigger1 = numhelper(4001)
trigger1 = helper(4001),stateno = 4035
trigger1 = helper(4001), pos y = [-1000,-400]
trigger1 = p2bodydist x < 300
trigger2 = enemynear,hitdefattr = SCA, AP
trigger2 = inguarddist
trigger2 = random < ailevel * 24
trigger3 = enemynear,movetype = A
trigger3 = random < ailevel * 18
trigger3 = inguarddist
value = 700

[state -1, Dodge Roll]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = stateno = 100
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [400, 1000]
triggerall = p2bodydist y = [-175, 0]
trigger1 = numhelper(4001)
trigger1 = helper(4001),stateno = 4035
trigger1 = helper(4001), pos y = [-1000,-400]
trigger1 = p2bodydist x >= 300
trigger2 = enemynear,hitdefattr = SCA, AP
trigger2 = inguarddist
trigger2 = random < ailevel * 6
trigger3 = enemynear,movetype = A
trigger3 = random < ailevel * 9
trigger3 = inguarddist
value = 710



[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 700
triggerall = var(30) = 59 
triggerall = ailevel > 1
triggerall = ctrl
triggerall = stateno = 100
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -400 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,24] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.

[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 710
triggerall = var(30) = 59 
triggerall = ailevel > 1
triggerall = ctrl
triggerall = stateno = 100
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -400 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,37] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.




[state -1, H. Gunshot]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = power > 499
triggerall = var(26) > 1
triggerall = enemy,statetype != C
triggerall = numenemy
triggerall = p2bodydist y = [-200, 0]
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 8
trigger2 = ctrl
trigger2 = p2bodydist x > 350
trigger2 = random < ailevel * 4
trigger3 = numtarget(640)
trigger3 = target(640),stateno = 678
trigger3 = p2bodydist y = [-600,-400]
trigger3 = random < ailevel * 24
value = 1020

[state -1, S. Jab]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = ctrl
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 230]
triggerall = p2bodydist y = [-250, 0]
triggerall = !numhelper(4100)
trigger1 = random < ailevel * 12
trigger2 = enemynear,movetype = H
trigger2 = random < ailevel * 32
trigger3 = random < ailevel * 32
trigger3 = enemynear,animtime < -4
trigger4 = numtarget(630)
trigger4 = random < ailevel * 32
trigger5 = enemynear,stateno = 1091
trigger5 = random < ailevel * 48

value = 200

[state -1, C. Jab]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = ctrl
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 260]
triggerall = p2bodydist y = [-75, 0]
triggerall = !numhelper(4100)
trigger1 = random < ailevel * 8
trigger2 = enemynear,movetype = H
trigger2 = random < ailevel * 24
trigger3 = random < ailevel * 24
trigger3 = enemynear,animtime < -4
trigger4 = numtarget(630)
trigger4 = random < ailevel * 24
trigger5 = stateno = 400
trigger5 = movehit
trigger5 = random < ailevel * 18
trigger6 = numtarget(440)
trigger6 = random < ailevel * 32
trigger7 = enemynear,anim = 5300
value = 400

[state -1, S. Short]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 180]
triggerall = p2bodydist y = [-125, 0]
triggerall = !numhelper(4100)
trigger1 = random < ailevel * 8
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = random < ailevel * 32
value = 230


[state -1, S. Short]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 320]
triggerall = p2bodydist y = [-50, 0]
trigger1 = random < ailevel * Ifelse(p2statetype = S, 8, 2)
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = movecontact
trigger2 = random < ailevel * 32
trigger3 = stateno = 200
trigger3 = movecontact
trigger3 = p2statetype = S
trigger3 = random < ailevel * 12
value = 430

[state -1, S. Short]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = numenemy
triggerall = p2bodydist x = [0, 1000]
triggerall = p2bodydist y = [-50, 0]
triggerall = !numhelper(440)
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 18
trigger2 = enemynear,hitdefattr = SCA,AP
trigger2 = ctrl
trigger2 = random < ailevel * 12
trigger3 = ctrl
trigger3 = enemynear,animtime < -15
trigger3 = random < ailevel * 12
trigger3 = enemynear,ctrl = 0 
trigger3 = p2statetype != L
trigger4 = ctrl
trigger4 = numhelper(4000)
trigger4 = helper(4000),stateno = 4014
trigger4 = random < ailevel * 18
value = 440

[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 440
triggerall = var(30) = 59 
triggerall = ailevel > 1
triggerall = ctrl
triggerall = statetype != A

triggerall = p2bodydist y = [-50,0]
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -400 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [6,35] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.



[State -1, J. Jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 330]
triggerall = p2bodydist y = [-170, 310]
trigger1 = ctrl
trigger1 = random < ailevel * 32
trigger1 = enemynear,statetype = A
trigger2 = stateno = 600
trigger2 = movehit
trigger2 = random < ailevel * 24
value = 600

[State -1, J. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [-100, 340]
triggerall = p2bodydist y = [-125, 270]
trigger1 = ctrl
trigger1 = random < ailevel * 18
trigger1 = enemynear,statetype != A
trigger1 = vel y > 0
trigger2 = ctrl
trigger2 = enemynear,statetype = A
trigger2 = random < ailevel * 24
trigger3 = stateno = 600
trigger3 = movehit
trigger3 = random < ailevel * 32
value = 630


[State -1, J. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 250]
triggerall = p2bodydist y = [-360, 310]
trigger1 = stateno = 630
trigger1 = movehit
trigger1 = random < ailevel * 24
trigger2 = ctrl
trigger2 = p2statetype != A
trigger2 = vel y > 5
trigger2 = random < ailevel * 18
trigger3 = p2statetype = A
trigger3 = ctrl
trigger3 = numhelper(4100)
trigger3 = helper(4100),stateno = 4110
trigger3 = random < ailevel * 36
value = 610

[State -1, J. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 320]
triggerall = p2bodydist y = [-200, 280]
trigger1 = stateno = 630
trigger1 = movehit
trigger1 = random < ailevel * 32
trigger2 = random < ailevel * 6
trigger2 = ctrl
trigger2 = p2statetype = A
value = 640
ignorehitpause = 1

[state -1, S. Strong]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 250]
triggerall = p2bodydist y = [-250, 0]
trigger1 = stateno = 230
trigger1 = movecontact
trigger1 = random < ailevel * 32
trigger2 = stateno = 200
trigger2 = p2bodydist x > 180
trigger2 = movecontact
trigger3 = stateno = 430
trigger3 = movecontact
trigger3 = random < ailevel * 32
value = 205

[state -1, S. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 320]
triggerall = p2bodydist y = [-250, 0]
trigger1 = ctrl
trigger1 = enemynear,animtime < -10
trigger1 = random < ailevel * 8
trigger1 = enemynear,ctrl = 0
trigger2 = stateno = 205
trigger2 = movehit
trigger2 = random < ailevel * 32
trigger3 = stateno = 205
trigger3 = moveguarded
trigger3 = random < ailevel * 2
trigger4 = stateno = 430
trigger4 = movehit
trigger4 = random < ailevel * 18
value = 210

[state -1, J. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 270]
triggerall = p2bodydist y = [-480, 0]
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = enemynear,statetype = A
trigger1 = p2bodydist y < -100
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger3 = stateno = 205
trigger3 = movehit
trigger3 = random < ailevel * 18
trigger4 = ctrl
trigger4 = numtarget(440)
trigger4 = random < ailevel * 24
trigger5 = numhelper(4000)
trigger5 = helper(4000),stateno = 4014
trigger5 = ctrl
trigger5 = random < ailevel * 12
trigger6 = ctrl
trigger6 = p2stateno = 673
trigger6 = random < ailevel * 36
value = 410

[state -1, S. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 410]
triggerall = p2bodydist y = [-175, 0]
trigger1 = ctrl 
trigger1 = enemynear,animtime < -14
trigger1 = p2bodydist x > 320
trigger1 = enemynear,ctrl = 0
trigger1 = random < ailevel * 8
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 32
trigger3 = stateno = 205
trigger3 = movehit
trigger3 = random < ailevel * 12
value = 240


[state -1, Run]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !inguarddist
triggerall = numenemy
triggerall = stateno != 100
triggerall = !numhelper(4100)
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = p2bodydist x > 800
trigger2 = ctrl
trigger2 = enemynear,animtime < -15
trigger2 = enemynear,ctrl = 0
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x > 350
trigger3 = numhelper(4001)
trigger3 = helper(4001),stateno = 4035
trigger3 = random < ailevel * 24
trigger3 = ctrl
trigger4 = numhelper(2500)
trigger4 = ctrl
trigger4 = random < ailevel * ifelse(helper(2500),stateno = 2503, 36, 12)
trigger4 = helper(2500),rootdist x < -10
trigger4 = enemynear,statetype = L  || !inguarddist
trigger5 = numhelper(4001)
trigger5 = helper(4001),stateno = 4035
trigger5 = helper(4001),pos y = [-1000,-200]
trigger5 = random < ailevel * 36
trigger5 = backedgebodydist <- 200
value = 100

[state -1, Dash Attack]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = stateno = 100
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 600]
triggerall = p2bodydist y = [-175, 0]
trigger1 = random < ailevel * 4
trigger1 = enemynear,animtime < -8
trigger1 = enemynear,ctrl = 0
value = 245

[state -1, Dash Attack]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = stateno = 100
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist x = [0, 600]
triggerall = p2bodydist y = [-175, 0]
trigger1 = random < ailevel * 4
trigger1 = enemynear,animtime < -8
trigger1 = enemynear,ctrl = 0
value = 246

[state -1, Assist]
type = changestate
triggerall = var(30) = 59
triggerall = !inguarddist
triggerall = !numhelper(4000)
triggerall = !numhelper(4001)
triggerall = !numhelper(4100)
triggerall = p2bodydist y  = [-300,300]
trigger1 = ctrl
trigger1 = random < ailevel * 32
trigger1 = enemynear,stateno = 5110
trigger2 = p2bodydist x > 500
trigger2 = ctrl
trigger2 = random < ailevel * 6
trigger3 = frontedgebodydist < 500
trigger3 = ctrl
trigger3 = !inguarddist
trigger3 = random < ailevel * 12
value = 1200

[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1070
triggerall = var(30) = 59 
triggerall = ailevel > 1
triggerall = ctrl
triggerall = power > 499
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -400 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,30] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.


[state -1, Horizontal Lasso]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2bodydist x = [700,1500]
triggerall = p2bodydist y = [-200,0]
triggerall = power > 499
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = enemynear,hitdefattr = SCA, AP
trigger2 = numhelper(4100)
trigger2 = helper(4100),parentdist x < 50
trigger2 = ctrl 
trigger2 = random < ailevel * 6
value = 1070

[state -1, Horizontal Lasso]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2bodydist x = [700,1500]
triggerall = p2bodydist y = [-200,0]
triggerall = enemy,numproj = 0
triggerall = !inguarddist 
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger2 = numhelper(4000)
trigger2 = ctrl
trigger2 = random < ailevel * 12
trigger2 = helper(4000),stateno = [4010,4019]
trigger3 = numhelper(4100)
trigger3 = helper(4100),parentdist x < 50
trigger3 = ctrl 
trigger3 = random < ailevel * 24
trigger4 = numhelper(4000)
trigger4 = helper(4000),stateno = 4014
trigger4 = random < ailevel * 24
trigger4 = ctrl
value = 1050

[state -1, Diagonal Lasso]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2bodydist x = [700,1500]
trigger1 = numhelper(4000)
trigger1 = helper(4000),stateno = 4010
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger2 = numtarget(640)
trigger2 = target(640),stateno = [670,679]
trigger2 = ctrl
trigger2 = random < ailevel * 24
trigger3 = numhelper(4100)
trigger3 = helper(4100),parentdist x < 50
trigger3 = ctrl 
trigger3 = random < ailevel * 18
value = 1060

[state -1, L. Gunshot]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = var(26) > 0
triggerall = numenemy
triggerall = enemy,statetype != C
triggerall = p2bodydist y = [-200, 0]
trigger1 = ctrl
trigger1 = p2bodydist x > 500
trigger1 = random < ailevel * 4
trigger2 = enemynear,prevstateno = 5120
trigger2 = p2bodydist x > 500
trigger2 = random < ailevel * 12
trigger2 = ctrl
value = 1000

[state -1, H. Gunshot]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = var(26) > 0
triggerall = enemy,statetype != C
triggerall = numenemy
triggerall = p2bodydist y = [-200, 0]
trigger1 = ctrl
trigger1 = p2bodydist x > 350
trigger1 = random < ailevel * 4
trigger2 = enemynear, statetype != C
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 15
value = 1010

[state -1, Instant Dash Attack]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = p2bodydist y = [ -200,0]
triggerall = p2bodydist x = [0,500]
triggerall = var(1) || ctrl
trigger1 = stateno = 210 || stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 4
value = 1100

[state -1, Instant Dash Attack]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = p2bodydist y = [ -200,0]
triggerall = p2bodydist x = [0,500]
triggerall = var(1) || ctrl
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 36
trigger2 = enemynear,ctrl = 0
trigger2 = !inguarddist
trigger2 = enemynear,animtime < -12
trigger2 = random < ailevel * 24
trigger2 = ctrl
value = 1110

[state -1, Hip Toss]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = p2statetype != L
triggerall = ctrl
triggerall = p2movetype != H
triggerall = p2bodydist x =[-10, 180]
trigger1 = Random < Ailevel * 8
trigger2 = Random < Ailevel * 16
trigger2 = p2stateno = [150,159]
trigger3 = enemy,name = "Lardo Rat"
trigger3 = enemy,stateno = [1000,10004]
trigger3 = random < (ailevel*12)
trigger4 = enemy,authorname = "Kazecat"
trigger4 = enemy,stateno = 1400
trigger4 = random < (ailevel*12)
trigger5 = p2stateno = [700,799]
trigger5 = !inguarddist
trigger5 = random < ailevel*48
value = 800








;===========================================================================
;---------------------------------------------------------------------------
;SUPERS
[State -1, Roxxie Ambush]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "Roxxie"
triggerall = power > 2999
trigger1 = ctrl
trigger2 = var(1)
value = 3000

;---------------------------------------------------------------------------
;SUPERS
[State -1, Georgia Command Grab]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "Georgia"
triggerall = power > 999
trigger1 = ctrl
trigger2 = var(1)
value = 3040

;--------------------------------------------------------------------------

[State -1, Caramel Headcrush]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "Caramel"
triggerall = power > 999
trigger1 = ctrl
trigger2 = var(1)
value = 3080

;===========================================================================
;Bad ASsist
[state -1, Assist]
type = changestate
triggerall = command = "Assist"
triggerall = !numhelper(4000)
triggerall = !numhelper(4001)
trigger1 = ctrl
trigger2 = var(1)
value = 1200

;===========================================================================
;---------------------------------------------------------------------------
;Specials
[state -1, Gun Shot Double]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "QCF_z"
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)
value = 1020

;----------------------------------------------------------------------------

;Specials
[state -1, Gun Shot Slow]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "QCF_x"
trigger1 = ctrl
trigger2 = var(1)
value = 1000

;---------------------------------------------------------------------------
;Specials
[state -1, Gun Shot Fast]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "QCF_y"
trigger1 = ctrl
trigger2 = var(1)
value = 1010
;---------------------------------------------------------------------------
;Horizontal Lasso
[state -1, Diagonal Lasso]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = power > 499
triggerall = command = "HCB_z"
trigger1 = ctrl
trigger2 = var(1)
value = 1070
;---------------------------------------------------------------------------
;Horizontal Lasso
[state -1, Horizonal Lasso]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "HCB_x"
trigger1 = ctrl
trigger2 = var(1)
value = 1050

;---------------------------------------------------------------------------
;Diagonal Lasso
[state -1, Diagonal Lasso]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "HCB_y"
trigger1 = ctrl
trigger2 = var(1)
value = 1060

;===========================================================================
;Specials
[state -1, Manual Dash attack Ex]
type = changestate
triggerall = statetype != A
triggerall = command = "QCB_c"
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)
value = 1120
;;===========================================================================
;Specials
[state -1, Manual Dash attack Light]
type = changestate
triggerall = statetype != A
triggerall = command = "QCB_a"
trigger1 = ctrl
trigger2 = var(1)
value = 1100

;===========================================================================
;Specials
[state -1, Manual Dash attack Heavy]
type = changestate
triggerall = statetype != A
triggerall = command = "QCB_b"
trigger1 = ctrl
trigger2 = var(1)
value = 1110

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"  || (command = "dash" && command != "holdback")
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
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "grab"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl


;--------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 41
trigger1 = command = "superjump"
trigger1 = statetype = S || statetype = C
trigger1 = ctrl

;--------------------------------------------------------------------------
;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 499


;===========================================================================
;---------------------------------------------------------------------------
;Dodge Roll
[State -1, Dash Attack Heavy]
type = ChangeState
triggerall = !ailevel
value = 700
triggerall = stateno = 100
triggerall = command != "holddown"
trigger1 = command = "x" 

;---------------------------------------------------------------------------
;Dodge Roll
[State -1, Dash Attack Heavy]
type = ChangeState
triggerall = !ailevel
value = 710
triggerall = stateno = 100
triggerall = command != "holddown"
trigger1 = command = "y" 

;---------------------------------------------------------------------------
;Dash Attack EX
[State -1, Dash Attack Heavy]
type = ChangeState
triggerall = !ailevel
value = 248
triggerall = power > 499
triggerall = stateno = 100
triggerall = command != "holddown"
trigger1 = command = "c" || command = "kicks" 

;---------------------------------------------------------------------------
;Dash Attack Light
[State -1, Dash Attack Light]
type = ChangeState
value = 245
triggerall = !ailevel
triggerall = stateno = 100
triggerall = command != "holddown"
trigger1 = command = "a"

;---------------------------------------------------------------------------
;Dash Attack Light
[State -1, Dash Attack Heavy]
type = ChangeState
triggerall = !ailevel
value = 246
triggerall = stateno = 100
triggerall = command != "holddown"
trigger1 = command = "b" 
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
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = (stateno = 200) || (stateno = 230) || (stateno = 400) || (stateno = 430)
trigger1 = movecontact


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = !ailevel
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 205) || (stateno = 230) || (stateno = 400) || (stateno = 430)
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
triggerall = stateno != 100
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = !ailevel
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 205) || (stateno = 210) || (stateno = 230) || (stateno = 400) || (stateno = 430)
trigger2 = movecontact



;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = null;ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || (stateno = 205)  || (stateno = 230)
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
triggerall = !ailevel
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = !ailevel
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) ||(stateno = 200) || (stateno = 205) || (stateno = 210) || (stateno = 230)
trigger2 = Movecontact

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
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
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
trigger2 = stateno = 600 || stateno = 630 || stateno = 610
trigger2 = movecontact


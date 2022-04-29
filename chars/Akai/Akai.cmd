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
;
[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, x
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 20

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, x;~F, D, DF, F, D, DF, x
time = 20

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, D, DB, B, y;~F, D, DF, F, D, DF, y
time = 20

[Command]
name = "Super"
command = c+z
time = 2


[Command]
name = "Super"
command = ~D,DB,B,D,DB,B, a
time = 30
buffer.time = 4

[Command]
name = "Super"
command = ~D,DB,B,D,DB,B, b
time = 30
buffer.time = 4

[Command]
name = "Super"
command = ~D,DB,B, a+c
time = 20
buffer.time = 8

[Command]
name = "Super"
command = ~D,DB,B, b+c
time = 20
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DF,F,D,DF,F, a
time = 30
buffer.time = 4

[Command]
name = "Super2"
command = ~D,DF,F,D,DF,F, b
time = 30
buffer.time = 4

[Command]
name = "Super2"
command = ~D,DF,F,a+c
time = 20
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DF,F,b+c
time = 20
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
name = "DP_a"
COMMAND = ~F, D, DF, a
time = 20
buffer.time = 5

[Command]
name = "DP_b"
COMMAND = ~F, D, DF, b
time = 20
buffer.time = 5

[Command]
name = "DP_c"
COMMAND = ~F, D, DF, a+b
time = 20
buffer.time = 5

[Command]
name = "DP_c"
COMMAND = ~F, D, DF, c
time = 20
buffer.time = 5

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
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

[Command]
name = "QCB_a"
command = ~D, DB, B, a
buffer.time = 5

[Command]
name = "QCB_b"
command = ~D, DB, B, b
buffer.time = 5

[Command]
name = "QCB_c"
command = ~D, DB, B, c
buffer.time = 5

[Command]
name = "QCB_c"
command = ~D, DB, B, a+b
buffer.time = 5

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "superjump"
command = D,$U
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery";Required (do not remove)
command = z
time = 1

[Command]
name = "grab"
command = a+x
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

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdc"
command = /a+b
time = 1

[command]
name = "holdupfwd"
command = /UF
time = 1
buffer.time = 1

[command]
name = "holdupback"
command = /UB
time = 1
buffer.time = 1

[Command]
name = "tapfwd"
command = F
time = 1

[Command]
name = "tapback"
command = B
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
trigger4 = (stateno = [600, 640])
trigger4 = movecontact
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
trigger1 = random < ailevel * 36
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 24
trigger3 = ailevel < 3
trigger3 = random < ailevel * 8
value = 120

[State -1, Wall Cling]
type = ChangeState
triggerall = var(30) = 59
triggerall = ctrl
triggerall = pos y < -400
triggerall = statetype = A
triggerall = stateno != 55
triggerall = enemy,movetype != A
trigger1 = backedgebodydist < 130
trigger2 = frontedgebodydist < 130
value = 55


;Super 
[State -1, Minimum Panda!]
type = changestate
Triggerall = ailevel > 4
Triggerall = var(30)=59
triggerall = ailevel > 3
triggerall = statetype != A
triggerall = power > 2999
triggerall = p2statetype != L
triggerall = p2statetype != A
trigger1 = ctrl
trigger1 = enemynear,animtime < -12
trigger1 = !enemynear,ctrl
trigger1 = random < ailevel * 8
trigger2 = stateno = 1103 || stateno = 1123  || stateno = 1143
trigger2 = moveguarded
trigger2 = random < ailevel * 36
trigger3 = stateno = 1113 || stateno = 1133 || stateno = 1153
trigger3 = moveguarded
trigger4 = stateno = 210
trigger4 = movehit
trigger4 = random < ailevel * 24
trigger4 = numtarget(211)
trigger4 = p2statetype != A
trigger5 = enemynear,hitdefattr = SC,AP
trigger5 = !enemynear,ctrl
trigger5 = enemynear,animtime < 12
trigger5 = random < ailevel * 18
trigger5 = ctrl 
value = 3000


[State -1, Anti Air Pandassault Light]
type = changestate
Triggerall = ailevel > 4
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = p2bodydist x < 250
triggerall = p2bodydist y = [-800,-200]
triggerall = enemynear,statetype = A
triggerall = power > 999
triggerall = p2stateno != [150,155]
triggerall = !enemynear,gethitvar(isbound)
trigger1 = ctrl 
trigger1 = random < ailevel * 12
trigger1 = p2statetype = A
trigger2 = numtarget(1120)
trigger2 = random < ailevel * 32
trigger2 = enemynear, vel x > 0
trigger2 = ctrl
trigger3 = movehit
trigger3 = p2movetype != H
trigger3 = random < ailevel * 32
trigger3 = var(1)
trigger4 = p2bodydist x < 200
trigger4 = p2statetype = A
trigger4 = p2movetype = A
trigger4 = ctrl
trigger4 = random < ailevel * 4
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


[state -1, AI Rolling Facesit Light]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = p2bodydist x = [0,700]
triggerall = p2bodydist y = [-220,0]
triggerall = p2statetype != L
triggerall = power > 499
triggerall = ailevel > 5
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = inguarddist
trigger1 = enemynear,hitdefattr = SCA,AP
trigger2 = ctrl || var(1)
trigger2 = random < ailevel * 2
trigger2 = moveguarded
trigger2 = p2bodydist x = [250,700]
value = 1020

[State -1, AI Slide under enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1020 
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [-50,700]
triggerall = p2bodydist y = [-220,0]
triggerall = p2statetype != L
triggerall = power > 499
triggerall = ailevel > 5
trigger1 = ctrl
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -450 ; Avoid sliding under projectiles that are high enough to walk under. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 5 ;5= startup time


[state -1, AI Running Stance EX]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x  > 0
triggerall = p2bodydist y = [-400,0]
triggerall = power > 499
triggerall = !numtarget(800)
triggerall = ailevel > 5
trigger1 = stateno = 240
trigger1 = movehit
trigger1 = random < ailevel * 4
trigger1 = !numtarget(241)
trigger2 = ctrl
trigger2 = random < ailevel * 4
trigger2 = p2bodydist x > 800
trigger3 = ctrl
trigger3 = random < ailevel * 1
trigger3 = p2bodydist x = [400,800]
trigger4 = ctrl
trigger4 = p2stateno != [660,669]
trigger4 = p2statetype = L
trigger4 = random < ailevel * 12
trigger4 = !enemynear,canrecover
value = 1140

[State -1, Running Slide]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = stateno = 1141
triggerall = !numtarget(800)
triggerall = p2bodydist y = [-50,0]
triggerall = p2bodydist x =[-50, 600]
trigger1 = random < ailevel * 24
trigger1 = p2statetype = S
trigger2 = random < ailevel * 6
trigger2 = p2statetype != S
trigger3 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger3 = PlayerID(helper(33333333),var(3)), pos y > -450 ; Avoid sliding under projectiles that are high enough to walk under. 100 = char height
trigger3 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
trigger3 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 6 ;5= startup time
value = 1150

[State -1, Running Crossbody]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = stateno = 1141
triggerall = !numtarget(800)
triggerall = p2bodydist y = [-200,0]
triggerall = p2bodydist x =[-50, 400]
trigger1 = random < ailevel * 24
trigger1 = p2statetype = C
trigger2 = random < ailevel * 6
trigger2 = p2statetype != C
trigger3 = numtarget(210) || numtarget(240)
trigger3 = random < ailevel * 24
trigger4 = p2movetype = A
trigger4 = enemynear,hitdefattr = SC,AT
trigger4 = random < ailevel * 18
value = 1151

[State -1, Running Hip check]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist y = [-300,0]
triggerall = p2statetype != L
triggerall = stateno = 1141
triggerall = p2bodydist x =[-50, 400]
trigger1 = random < ailevel * 24
value = 1142



[state -1, Brakes]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1141
trigger1 = p2bodydist x < -400
trigger1 = random < ailevel * 32
trigger2 = frontedgebodydist < 10
trigger2 = random < ailevel * 36
value = 1148

[state -1, RUN in]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno != [100,101]
triggerall = ctrl
trigger1 = p2statetype = L
trigger1 = p2bodydist x > 500
trigger1 = random < ailevel * 24
value = 100

[state -1, Run Stop]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 100
trigger1 = p2bodydist x < 200
trigger1 = random < ailevel * 48
value = 101

[state -1, Backdash]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = ctrl
triggerall = backedgebodydist > 100
trigger1 = p2bodydist x = [-30,300]
trigger1 = p2stateno = [5100,5120]
trigger1 = random < ailevel * 36
trigger2 = enemynear,hitdefattr = SC,AT
trigger2 = random < ailevel * 36
trigger2 = p2bodydist x = [0,300]
trigger3 = enemy,name = "Jumbo Elephant"
trigger3 = p2stateno = [5100,5120]
trigger3 = random < ailevel * 48
trigger3 = p2bodydist x = [-50,320]
value = 105

[state -1, Jump]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = ctrl
trigger1 = p2bodydist x = [-30,450]
trigger1 = p2stateno = [5100,5120]
trigger1 = random < ailevel * 24
trigger2 = enemynear,hitdefattr = SC,AT
trigger2 = random < ailevel * 36
trigger2 = p2bodydist x = [0,300]
value = 40


[state -1, AI Butt Drop]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-300,350]
triggerall = p2bodydist y > 0
triggerall = pos y < -300
triggerall = !numtarget(800)
triggerall = p2stateno != [660,669] 
trigger1 = ctrl
trigger1 = random < ailevel * 6
trigger1 = pos y < -400
trigger1 = !enemynear,ctrl
trigger1 = !inguarddist
trigger2 = stateno = 640
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = stateno = 610
trigger3 = movehit
trigger3 = random < ailevel * 24
value = 645

[State -1, Anti Air Pandassault Light]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = power > 499
triggerall = p2bodydist x < 450
triggerall = p2bodydist y = [-600, 0]
trigger1 = ctrl 
trigger1 = random < ailevel * 4
trigger1 = p2statetype = A
trigger1 = p2movetype = A
trigger2 = prevstateno = 5120
trigger2 = ctrl
trigger2 = p2movetype = A
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x < 200
trigger3 = movehit
trigger3 = (stateno = [200,240]) || (stateno = [400,440])
trigger3 = stateno != 440
trigger3 = p2movetype != H
trigger3 = random < ailevel * 24
value = 1070


[State -1, Anti Air Pandassault Light]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x < 250
triggerall = p2bodydist y = [-600,-300]
triggerall = enemynear,hitfall = 0
trigger1 = ctrl 
trigger1 = random < ailevel * 12
trigger1 = p2statetype = A
trigger1 = p2movetype != H
value = 1050

[State -1, Anti Air Pandassault Heavy]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x < 300
triggerall = p2bodydist y = [-800,-300]
triggerall = enemynear,hitfall = 0
trigger1 = ctrl 
trigger1 = random < ailevel * 12
trigger1 = p2statetype = A
trigger1 = p2movetype != H
value = 1060

[state -1, AI Rolling Facesit Light]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = p2bodydist x = [0,450]
triggerall = p2bodydist y = [-220,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 18
trigger1 = inguarddist
trigger1 = enemynear,hitdefattr = SCA,AP
trigger2 = ctrl || var(1)
trigger2 = random < ailevel * 6
trigger2 = moveguarded
trigger2 = p2bodydist x = [250,700]
value = 1010

[State -1, AI Slide under enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1010 
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,450]
triggerall = p2bodydist y = [-220,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -450 ; Avoid sliding under projectiles that are high enough to walk under. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 15;5= startup time


[state -1, AI Rolling Facesit Light]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = p2bodydist x = [0,700]
triggerall = p2bodydist y = [-220,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 18
trigger1 = !inguarddist
trigger1 = enemynear,hitdefattr = SCA,AP
trigger2 = random < ailevel * 4
trigger2 = moveguarded
trigger2 = var(1) || ctrl
trigger2 = p2bodydist x = [200,400]
trigger3 = movehit
trigger3 = stateno = 240
trigger3 = random < ailevel * 4
value = 1000

[State -1, AI Slide under enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1000 
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0,700]
triggerall = p2bodydist y = [-220,0]
trigger1 = ctrl
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -450 ; Avoid sliding under projectiles that are high enough to walk under. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 8 ;5= startup time



[state -1, AI Running Stance Light]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x  > 0
triggerall = p2bodydist y = [-400,0]
triggerall = p2statetype != L
trigger1 = stateno = 240
trigger1 = movehit
trigger1 = random < ailevel * 36
trigger1 = !numtarget(241)
trigger2 = ctrl
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x > 800
trigger3 = ctrl
trigger3 = random < ailevel * 8
trigger3 = p2bodydist x = [400,800]
value = 1100

[State -1, Running Crossbody]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = stateno = 1101
triggerall = !numtarget(800)
triggerall = p2bodydist y = [-200,0]
triggerall = p2bodydist x =[-50, 400]
trigger1 = random < ailevel * 24
trigger1 = p2statetype = C
trigger2 = random < ailevel * 6
trigger2 = p2statetype != C
trigger3 = numtarget(210) || numtarget(240)
trigger3 = random < ailevel * 24
trigger4 = p2movetype = A
trigger4 = enemynear,hitdefattr = SC,AT
trigger4 = random < ailevel * 18
value = 1111


[State -1, Running Slide]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = stateno = 1101
triggerall = !numtarget(800)
triggerall = p2bodydist y = [-50,0]
triggerall = p2bodydist x =[-50, 600]
trigger1 = random < ailevel * 24
trigger1 = p2statetype = S
trigger2 = random < ailevel * 6
trigger2 = p2statetype != S
trigger3 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger3 = PlayerID(helper(33333333),var(3)), pos y > -450 ; Avoid sliding under projectiles that are high enough to walk under. 100 = char height
trigger3 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
trigger3 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 6 ;5= startup time
value = 1110

[State -1, Running Pandassault]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist y = [-300,0]
triggerall = p2statetype != L
triggerall = stateno = 1101
triggerall = p2bodydist x =[-50, 400]
trigger1 = random < ailevel * 18
value = 1102

[state -1, Brakes]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1101
trigger1 = p2bodydist x < -400
trigger1 = random < ailevel * 32
trigger2 = frontedgebodydist < 10
trigger2 = random < ailevel * 36
value = 1108

[state -1, AI Running Stance Heavy]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x  > 0
triggerall = p2bodydist y = [-400,0]
triggerall = p2statetype != L
trigger1 = stateno = 240
trigger1 = movehit
trigger1 = random < ailevel * 36
trigger1 = !numtarget(241)
trigger2 = ctrl
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x > 800
trigger2 = !inguarddist
trigger3 = ctrl
trigger3 = random < ailevel * 8
trigger3 = p2bodydist x = [400,800]
trigger3 = !inguarddist
value = 1120

[State -1, Running Crossbody]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = stateno = 1121
triggerall = p2statetype != L
triggerall = !numtarget(800)
triggerall = p2bodydist y = [-200,0]
triggerall = p2bodydist x =[-50, 400]
trigger1 = random < ailevel * 24
trigger1 = p2statetype = C
trigger2 = random < ailevel * 6
trigger2 = p2statetype != C
trigger3 = numtarget(210) || numtarget(240)
trigger3 = random < ailevel * 24
trigger4 = p2movetype = A
trigger4 = enemynear,hitdefattr = SC,AT
trigger4 = random < ailevel * 18
value = 1131

[State -1, Running Slide]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = stateno = 1121
triggerall = !numtarget(800)
triggerall = p2bodydist y = [-50,0]
triggerall = p2bodydist x =[-50, 600]
trigger1 = random < ailevel * 24
trigger1 = p2statetype = S
trigger2 = random < ailevel * 6
trigger2 = p2statetype != S
trigger3 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger3 = PlayerID(helper(33333333),var(3)), pos y > -450 ; Avoid sliding under projectiles that are high enough to walk under. 100 = char height
trigger3 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
trigger3 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 5 ;5= startup time
value = 1130

[State -1, Running Pandassault]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist y = [-300,0]
triggerall = p2statetype != L
triggerall = stateno = 1121
triggerall = p2bodydist x =[0, 400]
trigger1 = random < ailevel * 18
value = 1122

[state -1, Brakes]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1121
trigger1 = p2bodydist x < -400
trigger1 = random < ailevel * 32
trigger2 = frontedgebodydist < 10
trigger2 = random < ailevel * 36
value = 1128

;------------------------------------------------------
;                       Normals
;------------------------------------------------------
;                       Jabs / Short
;------------------------------------------------------

[state -1, AI S Jab]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,125]
triggerall = p2bodydist y = [-220,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = !inguarddist
value = 200

[state -1, AI C Paw]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,250]
triggerall = p2bodydist y = [-100,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 15
trigger1 = !inguarddist
trigger1 = p2statetype = S
trigger2 = ctrl
trigger2 = random < ailevel * 12
trigger2 = !inguarddist
value = 400

[state -1, AI S Jab]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-50,150]
triggerall = p2bodydist y = [-400,300]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random< ailevel * 18
trigger1 = p2statetype = A
trigger1 = !numtarget(411)
trigger2 = numtarget(411) 
trigger2 = ctrl
trigger2 = random * 36
trigger2 = pos y < -475
value = 600


[state -1, AI S short Kick]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,150]
triggerall = p2bodydist y = [-150,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = !inguarddist
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = random < ailevel * 24
trigger3 = stateno = 200
trigger3 = movehit
trigger3 = random < ailevel * 48
value = 230

[state -1, AI C Paw Thrust]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,230]
triggerall = p2bodydist y = [-50,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = !inguarddist
trigger1 = p2statetype = S
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = random < ailevel * 24
trigger2 = p2statetype = S
trigger3 = stateno = 400
trigger3 = movecontact
trigger3 = random < ailevel * 36
trigger4 = ctrl
trigger4 = numtarget(210)
trigger4 = random < ailevel * 12
value = 430

[state -1, AI J. Light kick]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [0, 300]
triggerall = p2bodydist y = [-200,450]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = !inguarddist
trigger1 = random < ailevel * 12
trigger1 = !numtarget(411)
trigger2 = stateno = 600
trigger2 = movecontact
trigger2 = random < ailevel * 12
trigger3 = ctrl 
trigger3 = pos y = [-250,-200]
trigger3 = random < ailevel * 24
trigger3 = !inguarddist
trigger3 = !numtarget(411)
value = 630

;---------------------------------------------------------------
;                         Strong/ Forward
;---------------------------------------------------------------
[state -1, AI S Double Slap]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,150]
triggerall = p2bodydist y = [-220,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = !inguarddist
trigger2 = stateno = 230
trigger2 = movecontact
trigger2 = random < ailevel * 24
trigger3 = stateno = 200
trigger3 = movecontact
trigger3 = random < ailevel * 18
trigger4 = stateno = 430
trigger4 = movecontact
trigger4 = random < ailevel * 24
trigger5 = stateno = 220
trigger5 = movehit
trigger5 = random < ailevel * 48
value = 205

[state -1, AI S Tail Whip]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,425]
triggerall = p2bodydist y = [-200,0]
triggerall = p2statetype != L
triggerall = p2stateno != [700,799]
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = !inguarddist
trigger1 = p2statetype != A
trigger2 = stateno = 205
trigger2 = random < ailevel * 24
trigger2 = movecontact
trigger2 = animelemtime(6) > 2
trigger3 = stateno = 230
trigger3 = movecontact
trigger3 = random < ailevel * 24
trigger4 = random < ailevel * 24
trigger4 = stateno = 430
trigger4 = movecontact
trigger5 = stateno = 205
trigger5 = movehit
trigger5 = random < ailevel * 48
trigger5 = numtarget(206)
value = 235

[state -1, AI J Swipe]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,250]
triggerall = p2bodydist y = [-375,225]
trigger1 = stateno = 600
trigger1 = movecontact
trigger1 = random < ailevel * 36
trigger2 = stateno = 630
trigger2 = movecontact
trigger2 = random < ailevel * 12
value = 605

[state -1, AI Tail Whip]
type = changestate
Triggerall = ailevel > 0
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,550]
triggerall = p2bodydist y = [-400,400]
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = random < ailevel * 8
trigger2 = stateno = 630
trigger2 = numtarget(631)
trigger2 = random < ailevel * 36
trigger3 = stateno = 605
trigger3 = movecontact
trigger3 = random < ailevel * 36
trigger4 = stateno = 600
trigger4 = movecontact
trigger4 = random < ailevel * 12
value = 635
;---------------------------------------------------------------------------
;                           Fierce/Roundhouse
;---------------------------------------------------------------------------

[state -1, AI S Double Paw]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,250]
triggerall = p2bodydist y = [-150,0]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = stateno = 235
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger2 = stateno = 205
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger2 = numtarget(206)
value = 210

[state -1, AI Launcher]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 410]
triggerall = p2bodydist y = [-360,0]
trigger1 = (stateno = 235) || (stateno = 205)
trigger1 = movehit
trigger1 = random < ailevel * 24
trigger2 = ctrl
trigger2 = p2statetype = A
trigger2 = enemynear,hitdefattr != SC,SA,HA
trigger2 = random < ailevel * 12
trigger3 = (stateno = 430)
trigger3 = movehit
trigger3 = random < ailevel * 36
value = 410

[state -1, AI S Hip Check w/ Tail]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,600]
triggerall = p2bodydist y = [-200,0]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger1 = numtarget(211)
trigger2 = stateno = 235
trigger2 = movehit
trigger2 = random < ailevel * 48
value = 240


[state -1, AI S Hip Check w/ Tail]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,500]
triggerall = p2statetype != A
triggerall = !inguarddist
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 24
trigger2 = stateno = 235
trigger2 = movehit
trigger2 = random < ailevel * 18
trigger2 = p2statetype = S
value = 440


[state -1, AI J Double Paw Down]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [0,225]
triggerall = p2bodydist y = [-350,375]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = stateno = 635
trigger1 = movehit
trigger1 = random < ailevel * 36
trigger1 = numtarget(636)
trigger2 = stateno = 605
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger3 = ctrl
trigger3 = random 
trigger3 = vel y > 0
trigger3 = pos y = [-600,-200]
trigger3 = !numtarget(411) 
value = 610

[state -1, AI J Dropkick]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [0,175]
triggerall = p2bodydist y = [-225,500]
trigger1 = stateno = 610
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger2 = stateno = 635 
trigger2 = movehit
trigger2 = random < ailevel * 8
trigger2 = numtarget(636)
trigger3 = p2statetype != A
trigger3 = ctrl
trigger3 = pos y = [-500,-350]
trigger3 = vel y > 0
trigger3 = random < ailevel * 24 
trigger3 = !numtarget(411)
value = 640

;---------------------------------------------------------------------------------
;                           Grab
;---------------------------------------------------------------------------------


[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y = [-200, 240]
triggerall = p2statetype = A
triggerall = !numtarget(411)
triggerall = !enemynear,hitfall
triggerall = p2bodydist x =[0, 170]
triggerall = !moveguarded
trigger1 = random < ailevel * 12
trigger1 = ctrl
value = 830

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y = [-200, 240]
triggerall = p2statetype = A
triggerall = stateno != 240
triggerall = !numtarget(411)
triggerall = !enemynear,hitfall
triggerall = p2bodydist x =[0, 170]
trigger1 = random < ailevel * 4
trigger1 = movehit
trigger1 = stateno = 600 || stateno = 630
trigger2 = random < ailevel * 12
trigger2 = movehit
trigger2 = stateno = 605 
trigger3 = stateno = 635 && animelemtime(7) > 0
trigger3 = movehit
trigger3 = random < ailevel * 32
value = 831

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
triggerall = statetype != A
triggerall = p2statetype = S || p2statetype = C
triggerall = ctrl
triggerall = numenemy
triggerall = stateno != 100
triggerall = p2movetype != H
triggerall = p2bodydist x = [0, 130]
trigger1 = Random < Ailevel * 8
trigger2 = Random < Ailevel * 16
trigger2 = p2stateno = [120,130]
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*12)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel * 24
trigger5 = prevstateno = 5120
trigger5 = random < ailevel * 36
value = 800

;===========================================================================
;---------------------------------------------------------------------------
;Supers!!
[State -1, Minumum Panda!]
type = changestate
triggerall = !ailevel
triggerall = command = "Super"
triggerall = power > 2999
trigger1 = ctrl
trigger2 = var(1)
value = 3000
;---------------------------------------------------------------------------
;Supers!!
[State -1, Super Anti Air]
type = changestate
triggerall = !ailevel
triggerall = statetype != A
triggerall = command = "Super2"
triggerall = power > 999
trigger1 = ctrl
trigger2 = var(1)
value = 3040

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.


;--------------------------------------------------------------------------
;Anti Air Pandassault
[state -1, anti air facesit EX]
type = changestate
triggerall = !ailevel
triggerall = command = "DP_c"
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1070

;--------------------------------------------------------------------------
;Anti Air Pandassault
[state -1, anti air facesit Light]
type = changestate
triggerall = !ailevel
triggerall = command = "DP_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1050

;--------------------------------------------------------------------------
;Anti Air Pandassault
[state -1, anti air facesit Heavy]
type = changestate
triggerall = !ailevel
triggerall = command = "DP_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1060

;--------------------------------------------------------------------------
;Panada Assault EX
[state -1, Rolling Facesit Heavy]
type = changestate
triggerall = !ailevel
triggerall = command = "QCB_c"
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1020


;---------------------------------------------------------------------------
;Panada Assault Heavy
[state -1, Rolling Facesit Heavy]
type = changestate
triggerall = !ailevel
triggerall = command = "QCB_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1010


;----------------------------------------------------------------------------
;Panada Assault Light
[state -1, Rolling Facesit Light]
type = changestate
triggerall = !ailevel
triggerall = command = "QCB_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1000

;---------------------------------------------------------------------------
;Command Dash EX
[state -1, Super speed Dash EX]
type = changestate
triggerall = !ailevel
triggerall = command = "QCF_c"
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1140

;---------------------------------------------------------------------------
;Command Dash Light
[state -1, Super speed Dash Light]
type = changestate
triggerall = !ailevel
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1100

;---------------------------------------------------------------------------
;Command Dash Heavy
[state -1, Super speed Dash Light]
type = changestate
triggerall = !ailevel
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
value = 1120

;===========================================================================
;--------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 41
trigger1 = command = "superjump"
trigger1 = statetype = S || statetype = C
trigger1 = ctrl
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
;Throw Air
[State -1, Kung Fu Throw]
type = ChangeState
value = 830
triggerall = command = "grab"
triggerall = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Throw Air Comboable
[State -1, Kung Fu Throw]
type = ChangeState
value = 831
triggerall = command = "grab"
triggerall = statetype = A
trigger1 = var(1)
trigger1 = stateno != 610
trigger1 = stateno != 640


;---------------------------------------------------------------------------
;Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "grab"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------

;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,155]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 499

;---------------------------------------------------------------------------
;Wall Jump
[State -1, Super Jump]
type = ChangeState
value = 54
triggerall = statetype = A
triggerall = ctrl
triggerall = stateno != 55
triggerall = time > 4
trigger1 = command = "tapfwd"
trigger1 = backedgebodydist < 130
trigger2 = command = "tapback"
trigger2 = frontedgebodydist < 130

;-----------------------------------------------------------------------------
;Wall Cling
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype = A
triggerall = ctrl
triggerall = pos y <= -400
triggerall = stateno != 55
trigger1 = command = "holdupback"
trigger1 = backedgebodydist < 130
trigger2 = command = "holdupfwd"
trigger2 = frontedgebodydist < 130



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
trigger1 = command != "holdfwd"

;---------------------------------------------------------------------------
;Stand Medium Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 400) || (stateno = 430)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 205) || (stateno = 230) || (stateno = 235) || (stateno = 400) || (stateno = 430)
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
trigger1 = command != "holdfwd"
trigger2 = (stateno = 200) || (stateno = 400)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Medium Kick
[State -1, Stand Medium Kick]
type = ChangeState
value = 235
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 205) || (stateno = 400) || (stateno = 430)
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
trigger2 = (stateno = 200) || (stateno = 205) || (stateno = 230) || (stateno = 235)|| (stateno = 210) || (stateno = 400) || (stateno = 430)
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

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || (stateno = 205) || (stateno = 230) || (stateno = 235)
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
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || (stateno = 205) || (stateno = 230) || (stateno = 235)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = !ailevel
triggerall = command = "x"
triggerall = statetype = A
triggerall = command != "holdfwd"
trigger1 = ctrl


;---------------------------------------------------------------------------
;Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 605
triggerall = command = "x"
triggerall = statetype = A
trigger1 = command = "holdfwd"
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 630)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 605 || stateno = 635
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = !ailevel
triggerall = command = "a"
triggerall = command != "holdfwd"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 635
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = (stateno = 605) || (stateno = 630) 
trigger2 = movecontact
;---------------------------------------------------------------------------
;Jump Butt Drop
[State -1, Jump Butt Drop]
type = ChangeState
value = 645
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 610) || (stateno = 640)
trigger2 = movecontact
;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
triggerall = command != "holddown"
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 605 || stateno = 635
trigger2 = movecontact




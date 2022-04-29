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
name = "Super"
command = ~D,DB,B,x+z
time = 20
buffer.time = 8

[Command]
name = "Super"
command = ~D,DB,B,y+z
time = 20
buffer.time = 8

[Command]
name = "Super"
command = ~D,DB,B,D,DB,B,x
time = 40
buffer.time = 8

[Command]
name = "Super"
command = ~D,DB,B,D,DB,B,y
time = 40
buffer.time = 8

[Command]
name = "Super"
command = c+z
time = 1


[Command]
name = "Super2"
command = ~D, DF, F, D, DF,F, a
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, D, DF, F, b
time = 40
buffer.time = 8

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
name = "HCB_z"
command = ~F,D,B, z
time = 20

[Command]
name = "HCB_z"
command = ~F,D,B, x+y
time = 20

[Command]
name = "HCB_x"
command = ~F,D,B, x
time = 20

[Command]
name = "HCB_y"
command = ~F,D,B, y
time = 20

[Command]
name = "upper_x"
command = ~F, D, DF, x

[Command]
name = "upper_a"
command = ~F, D, DF, a
time = 20
buffer.time = 12

[Command]
name = "upper_b"
command = ~F, D, DF, b
time = 20
buffer.time = 12

[Command]
name = "upper_c"
command = ~F, D, DF, c
time = 20
buffer.time = 12

[Command]
name = "upper_c"
command = ~F, D, DF, a+b
time = 20
buffer.time = 12

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
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_c"
command = ~D, DF, F, c

[Command]
name = "QCF_c"
command = ~D, DF, F, a+b


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
name = "SuperJump"
command = ~D,$U
time = 15

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
name = "Throw"
command = a+x
time = 1
buffer.time = 1

[Command]
name = "teleport"
command = b+y
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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno= [600,640])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = stateno != 410
trigger2 = stateno != 632
trigger2 = movecontact
trigger3 = stateno = 410
trigger3 = movehit
var(1) = 1

[state -1, DON'T shoot]
type = varset
triggerall = ailevel > 0
trigger1 = enemy,name = "Bertha Hippo"
trigger1 = enemy,stateno = [1030,1035]
trigger2 = enemy,name = "Jumbo Elephant"
trigger2 = (enemy,stateno = [1000,1001]) || (enemy,stateno = [1010,1011]) || (enemy,stateno = [1020,1021])
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
trigger9 = enemy,stateno = 1050 || (enemy,stateno = 1060) || (enemy,stateno = 1070) || (enemy,stateno = 1300) || (enemy,stateno = 1310) || (enemy,stateno = 1320)  || (enemy,stateno = 3080)
trigger10 = enemy,name = "Violet 'Tyla' Bunny"
trigger10 = enemy,stateno = 1120
trigger11 = enemy,name = "Julian Hippo"
trigger11 = enemy,stateno = 1200
var(5) = 1

[state -1, free to shoot again]
type = varset
triggerall = ailevel > 0
trigger1 = p2movetype = H
var(5) = 0


[State 0, VarSet]
type = VarSet
trigger1 = ailevel 
var(30) = 59

[State 0, VarSet]
type = VarSet
trigger1 = !ailevel
trigger2 = roundstate = 3
var(30) = 0




;AI


[state -1, defensive dodge]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = (stateno = [150,153])
triggerall = power > 999
triggerall = ailevel > 5
triggerall = p2statetype != A
trigger1 = random < (ailevel) 
trigger2 = random < (ailevel * 6) && (enemy,hitdefattr = SCA,HA ||enemy,hitdefattr = SCA, HP)
trigger3 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,SA)
value = 1400

[State 0,AI Jump]
type = ChangeState
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = ctrl 
triggerall = statetype != A
trigger1 = p2stateno = 5100 || p2statetype = L
trigger1 = random < ailevel * 32
value = 41

[State 0,AI Jump]
type = ChangeState
triggerall = ailevel
Triggerall = ((p2dist X = [-150,150]) || (p2bodydist X = [-300,300])) && (enemynear,hitdefattr = SC,AT && p2statetype != A); || (enemynear,hitdefattr = SC,ST,HT && p2statetype != A)
triggerall = ctrl 
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = p2movetype = A
Trigger1 = random < (Ailevel * 128)
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 32
trigger3 = ailevel < 3
trigger3 = random < ailevel * 8
trigger4 = p2stateno = 5100
trigger4 = random < ailevel * 12
trigger5 = enemy,name = "Katrina Crocodile"
trigger5 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger5 = ctrl && random < (ailevel*8)
trigger6 = enemy,name = "Zafta Giraffe"
trigger6 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger6 = ctrl && random < (ailevel*8)
trigger7 = enemy,name = "Makuyama"
trigger7 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger7 = ctrl && random < (ailevel*8) 
trigger8 = enemy,name = "Julian Hippo"
trigger8 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger8 = ctrl && random < (ailevel*6)
value = 40

[State -1, AI guarding - Stand]
Type = Changestate
triggerall = ailevel
triggerall = stateno != 100
triggerall = !(Stateno=[120,155])
Triggerall = Inguarddist || enemynear,hitdefattr = SCA,AP || enemynear,hitdefattr = SCA,AA
triggerall = ctrl ;|| Var(1)/100%10 = 1 && Movetype != H
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 16
value = 120


[state -1, AI Run] 
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = roundstate = 2
triggerall = stateno != 100
triggerall = p2bodydist x = [300,1000]
triggerall = !inguarddist
trigger1 = Random < (Ailevel * 4)
trigger1 = enemynear,movetype != A
trigger2 = enemy,movetype = I && enemy,ctrl = 0
trigger2 = enemy,animtime < -8
trigger2 = random < ailevel * 4
trigger2 = p2bodydist x > 40
value = 100

[state -1, AI backflip]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = backedgedist > 60
trigger1 = stateno = 231
trigger1 = movehit != 1
trigger2 = p2statetype = A
trigger2 = p2movetype = A
trigger2 = p2bodydist x = [0,240]
trigger2 = Random < floor(Ailevel*2)
trigger3 = p2stateno = [5100,5120]
trigger3 = p2bodydist x = [0, 240]
trigger3 = random < (ailevel*88)
trigger4 = enemy,hitdefattr = SCA,AT
trigger4 = random < (ailevel*2)
trigger4 = p2bodydist x < 160
value = 105

[state -1, Thrash by Thunder Thighs]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = statetype != A
triggerall = power > 2999
triggerall = p2bodydist x =[0, 450]
triggerall = p2bodydist y = [-200,0]
triggerall = p2statetype != L
trigger1 = (stateno = 210) || (stateno = 235) 
trigger1 = random < ailevel * 48
trigger1 = movehit
trigger2 = (stateno = 240)
trigger2 = random < ailevel * 48
trigger2 = movehit
trigger2 = p2statetype != A
trigger3 = p2bodydist x < 200
trigger3 = enemynear,ctrl = 0
trigger3 = enemy,animtime < -12
trigger3 = random < floor(ailevel * 0.25)
trigger3 = ctrl
value = 3000

[state -1, Super 2 Sexy Legs Assault]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = statetype != A
triggerall = p2bodydist x =[0, 450]
triggerall = p2bodydist y = [-200,0]
triggerall = p2statetype != L
triggerall = power > 999
trigger1 = (stateno = 210) || (stateno = 240)
trigger1 = movehit
trigger1 = random < ailevel * 24
value = 3040

[state -1, Somersault Seat]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 4
triggerall = statetype != A
triggerall = p2bodydist x = [0, 650]
triggerall = p2statetype != A
triggerall = p2statetype != L
triggerall = power > 499
trigger1 = ctrl
trigger1 = enemy,numproj > 0
trigger1 = random < ailevel * 4
value = 1120

[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1120
triggerall = ailevel > 4
triggerall = power > 499
triggerall = ctrl
triggerall = statetype = S 
triggerall = p2bodydist x = [0, 650]
triggerall = p2statetype != A
triggerall = p2statetype != L
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,20] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.


[state -1, Deception Dive Slow start]
type = changestate
value = 1170
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = !enemy,stateno = [660,669]
triggerall = power > 499
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < floor(ailevel*4)
trigger1 = p2statetype = C || p2statetype = A
trigger1 = enemy,animtime < -12
trigger2 = ctrl
trigger2 = enemy,statetype = L
trigger2 = p2bodydist x = [300,800]
trigger2 = random < ailevel * 24
trigger3 = stateno = 240
trigger3 = p2statetype = A
trigger3 = movehit
trigger3 = random < ailevel * 24

[state -1, Somersault Seat]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2bodydist x =[0, 300]
triggerall = p2statetype != A
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = p2statetype = C
trigger1 = p2movetype = A
trigger1 = random < ailevel * 6
trigger2 = stateno = 210
trigger2 = movecontact
trigger2 = random < ailevel * 4
trigger3 = var(1)
trigger3 = random < ailevel * 2
trigger3 = moveguarded
value = 1100

[state -1, EX AA Kicks]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 499
triggerall = p2bodydist x = [0, 180]
triggerall = p2bodydist y = [-400,-100]
triggerall = ailevel > 2
triggerall = p2statetype != L
triggerall = p2statetype != C
trigger1 = ctrl 
trigger1 = stateno = 5120
trigger1 = enemy, hitdefattr = A, AA
trigger1 = random < ailevel*24
trigger2 = p2movetype = A
trigger2 = p2statetype = A
trigger2 = ctrl
trigger2 = random * ailevel* 2
value = 1020

[state -1, AA Kicks Hard]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 220]
triggerall = p2bodydist y = [-450,0]
triggerall = ailevel > 2
triggerall = p2statetype != L
triggerall = p2statetype != C
trigger1 = ctrl 
trigger1 = prevstateno = 5120
trigger1 = enemynear,hitdefattr = A,AA
trigger1 = random < (ailevel * 15)
trigger2 = p2bodydist y = [-450,-150]
trigger2 = enemy,ctrl = 0
trigger2 = ctrl
trigger2 = random < ailevel*12
trigger3 = random < ailevel * 18
trigger3 = stateno = 235
trigger3 = movehit
trigger3 = p2bodydist x < 140
trigger4 = stateno = 210
trigger4 = movehit
trigger4 = random < ailevel * 24
trigger5 = (stateno = 235) || (stateno = 430) || (stateno = 240) || (stateno = 210)
trigger5 = movehit
trigger5 = inguarddist
trigger5 = random < ailevel * 36
trigger6 = (stateno = 235) || (stateno = 430) || (stateno = 240) || (stateno = 210)
trigger6 = moveguarded
trigger6 = inguarddist
trigger6 = random < ailevel * 4
value = 1010

[state -1, L AA Kicks light]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 180]
triggerall = p2bodydist y = [-400,0]
triggerall = ailevel > 2
triggerall = p2statetype != L
triggerall = p2statetype != C
trigger1 = ctrl 
trigger1 = stateno = 5120
trigger1 = enemy, hitdefattr = A, AA
trigger1 = random < ailevel*12
trigger2 = p2movetype = A
trigger2 = p2bodydist y = [-400, -150]
trigger2 = ctrl
trigger2 = random * ailevel* 8
value = 1000

;Light Needle Throw
[state -1, Needle Throw Light]
type = changestate
value = 1050
triggerall = var(30) = 59
triggerall = numhelper(1050) < 1
triggerall = ailevel > 2
triggerall = var(5) = 0
triggerall = statetype = A
triggerall = pos y < -350
triggerall = p2bodydist x = [0,350]
trigger1 = ctrl 
trigger1 = random < ailevel * 48
trigger1 = p2stateno = [5100,5120]
trigger2 = pos y < -600
trigger2 = random < ailevel * 18
trigger2 = ctrl 
trigger3 = ctrl 
trigger3 = p2bodydist y > 200
trigger3 = random < ailevel * 12
trigger4 = stateno = 640
trigger4 = movehit
trigger4 = random < ailevel * 12
trigger4 = pos y < -350

[state -1, Needle Throw Hard]
type = changestate
value = 1060
triggerall = var(30) = 59
triggerall = numhelper(1050) < 1
triggerall = ailevel > 2
triggerall = var(5) = 0
triggerall = statetype = A
triggerall = pos y < -350
triggerall = p2bodydist x = [400,900]
trigger1 = random < ailevel * 16
trigger1 = ctrl
trigger2 = stateno = 610
trigger2 = animelemtime(7) > 1
trigger2 = movehit
trigger2 = random < ailevel * 4

[state -1, Deception Dash Slow start]
type = changestate
value = 1150
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < floor(ailevel*0.5)
trigger1 = p2statetype = S
trigger2 = stateno = 240 ||stateno = 210
trigger2 = movecontact
trigger2 = random < ailevel * 2
trigger3 = stateno = 240 || stateno = 210
trigger3 = movehit
trigger3 = random < ailevel * 4

[state -1, Deception Dive Slow start]
type = changestate
value = 1160
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < floor(ailevel*0.5)
trigger1 = p2statetype = C || p2statetype = A


[state -1, Deception Dash fast start]
type = changestate
value = 1155
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2statetype != A
trigger1 = ctrl
trigger1 = random < ailevel
trigger2 = stateno = 240 ||stateno = 210
trigger2 = movecontact
trigger2 = random < ailevel * 6
trigger3 = stateno = 240 || stateno = 210
trigger3 = movehit
trigger3 = random < ailevel * 24

[state -1, Deception Dive fast start]
type = changestate
value = 1165
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2statetype != A
trigger1 = ctrl
trigger1 = random < ailevel
trigger1 = enemy,numproj > 0

[State -1, AI Reflect enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1165
triggerall = ailevel > 2 
triggerall = ctrl
triggerall = statetype != A 
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,15] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
 



[state -1, Slide]
type = changestate
value = 1151
triggerall = var(30) = 59
triggerall = ailevel 
triggerall = time > 4
triggerall = anim = 1150
triggerall = (stateno = 1150) || (stateno = 1170) || (stateno = 1155)
trigger1 = p2bodydist x = [0,400]
trigger1 = random < ailevel * 24
trigger2 = p2statetype = L
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x = [0,300]

[state -1, Thunder Thigh Clap]
type = changestate
value = 1161
triggerall = var(30) = 59
triggerall = ailevel
triggerall = anim = 1160
triggerall = time > 4
triggerall = enemynear,hitdefattr = SCA, AA,AT
triggerall = (stateno = 1160) || (stateno = 1165) || (stateno = 1175)
trigger1 = p2bodydist x = [0,300]
trigger1 = random < ailevel * 24


[state -1, Run Stop]
type = changestate
value = 1159
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = (stateno = 1150) || (stateno = 1170) || (stateno = 1155)
trigger1 = p2bodydist x = [0,40]
trigger1 = random < ailevel * 48


[state -1, Jump Stop]
type = changestate
value = 1168
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = (stateno = 1160) || (stateno = 1165) || (stateno = 1175)
trigger1 = inguarddist
trigger1 = random < ailevel * 48


[state -1, teleport]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = ctrl
triggerall = statetype != A
triggerall = var(12) > 0
trigger1 = backedgebodydist < 30
trigger1 = random <ailevel * 12
trigger2 = p2bodydist x > 800
trigger2 = random < ailevel * 6
trigger3 = p2stateno = 5120
trigger3 = random < ailevel * 2
trigger3 = enemy,animtime > -10
value = 1200

[state -1, teleport]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = ctrl
triggerall = statetype = A
triggerall = var(12) > 0
trigger1 = backedgebodydist < 30
trigger1 = random <ailevel * 12
trigger2 = p2bodydist x > 800
trigger2 = random < ailevel * 6
trigger3 = p2stateno = 5120
trigger3 = random < ailevel * 2
trigger3 = enemy,animtime > -10
value = 1201

[state -1, Somersault Seat]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2bodydist x = [0, 650]
triggerall = p2statetype != A
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = p2statetype = C
trigger1 = p2movetype = A
trigger1 = random < ailevel * 4
trigger2 = (stateno = 210) || (stateno = 240)
trigger2 = moveguarded
trigger2 = random < ailevel * 4
trigger3 = enemynear,authorname = "Kazecat"
trigger3 = enemynear,stateno = [700,730]
trigger3 = ctrl  || var(1)
trigger3 = random < ailevel * 32
trigger4 = enemy,authorname = "Kazecat"
trigger4 = p2stateno = [1400,1430]
trigger4 = ctrl || var(1)
trigger4 = random < ailevel * 32
value = 1110

[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x =[-100,200]
triggerall = p2bodydist y > 0
triggerall = pos y < -150 
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = !inguarddist
trigger1 = p2statetype != A
trigger1 = pos y < -300
trigger2 = prevstateno = 1210
trigger2 = ctrl
trigger2 = random < ailevel * 24
trigger3 = ctrl
trigger3 = p2statetype = L
trigger3 = random < ailevel * 24
trigger3 = var(8) = 2 
value = 632

[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 250
triggerall = p2bodydist y = [-210, 210]
trigger1 = ctrl
trigger1 = vel y > 0
trigger1 = random < ailevel * 32
trigger1 = !numtarget(410)
trigger2 = ctrl
trigger2 = random <ailevel * 48
trigger2 = p2statetype = A
trigger2 = numtarget(410)
trigger2 = pos y < -650
value = 600


[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 220
triggerall = p2bodydist y = [-140, 270]
trigger1 = ctrl
trigger1 = vel y > 0
trigger1 = random < ailevel * 24
trigger2 = ctrl
trigger2 = random <ailevel * 48
trigger2 = p2statetype = A
trigger3 = stateno = 600
trigger3 = movecontact
trigger3 = random < ailevel * 48
value = 630

[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 340
triggerall = p2bodydist y = [-285, 290]
trigger1 = (stateno = 630)|| (stateno = 600)
trigger1 = movehit
trigger1 = random < ailevel * 32
value = 605

[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 285
triggerall = p2bodydist y = [-265, 350]
trigger1 = (stateno = 630) || (stateno = 605)
trigger1 = movehit
trigger1 = random < ailevel * 32
value = 635

[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 230
triggerall = p2bodydist y = [-350, 160]
trigger1 = (stateno = 635)
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger1 = animelemtime(8) > 1
trigger2 = stateno = 605
trigger2 = movehit
trigger2 = random < ailevel * 48
value = 610

[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x =[-100, 200]
triggerall = p2bodydist y = [-340, 420]
trigger1 = (stateno = 635)
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger1 = animelemtime(8) > 1
trigger2 = stateno = 610
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger2 = animelemtime(7) > 1
value = 640

[state -1, Bunn Bounce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = var(23) > 0
triggerall = p2stateno != 661
triggerall = p2bodydist x = [-140,140]
triggerall = pos y < -100
triggerall = p2bodydist y > 0
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = enemy,ctrl = 1
trigger2 = stateno = 640
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger3 = ctrl
trigger3 = random < ailevel * 8
trigger3 = enemy,ctrl = 0 
value = 650


[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y = [-200, 240]
triggerall = p2statetype = A
triggerall = p2movetype = H
trigger1 = (stateno = 635) || (stateno = 605)
trigger1 = movehit
trigger1 = random < ailevel * 12
value = 831


[STATE -1, S Jab x1]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = p2bodydist x = [0,180]
triggerall = p2bodydist y = [-425,0]
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = ctrl
triggerall = !inguarddist
trigger1 = random < ailevel * 12
trigger2 = random < ailevel * 32
trigger2 = p2movetype = H
trigger2 = !moveguarded
value = 200

[STATE -1, C Jab x1]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = p2bodydist x = [0,220]
triggerall = p2bodydist y = [-425,0]
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = ctrl
triggerall = !inguarddist
trigger1 = random < ailevel * 4
trigger2 = random < ailevel * 12
trigger2 = p2statetype = S
value = 400

[STATE -1, S Jab x2]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = p2bodydist x = [0,170]
triggerall = p2bodydist y = [-425,0]
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = stateno = 200
trigger1 = movecontact
trigger1 = random < ailevel * 12
trigger2 = movehit
trigger2 = random < ailevel * 32
value = 201

[STATE -1, C Short]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = p2bodydist x = [0,250]
triggerall = p2bodydist y = [-425,0]
triggerall = statetype != A
triggerall = p2statetype != L
trigger1 = stateno = 400
trigger1 = movecontact
trigger1 = random < ailevel * 32
trigger2 = p2statetype = S
trigger2 = random < ailevel * 8
trigger2 = ctrl
value = 430

[STATE -1, C Short]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = p2bodydist x = [0,340]
triggerall = p2bodydist y = [-425,0]
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random < ailevel * 32
trigger2 = p2statetype = S
trigger2 = random < ailevel * 6
trigger2 = ctrl
value = 440

[STATE -1, S short]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = statetype != A
triggerall = p2bodydist x = [0,210]
triggerall = p2bodydist y = [-225,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger2 = stateno = 200
trigger2 = movehit
trigger2 = random < ailevel * 16
trigger3 = stateno = 201
trigger3 = movehit
trigger3 = random < ailevel * 48
value = 230

[state -1, S. Short 2]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = statetype != A
triggerall = p2bodydist x = [0,210]
triggerall = p2bodydist y = [-225,0]
triggerall = p2statetype != L
trigger1 = stateno = 230
trigger1 = movecontact
trigger1 = random < ailevel * 128
value = 231

[STATE -1, S Forward]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = statetype != A
triggerall = p2bodydist x = [0,240]
triggerall = p2bodydist y = [-225,0]
triggerall = p2statetype != L
triggerall = stateno = 231
trigger1 = movecontact
trigger1 = random < ailevel * 48
value = 235

[STATE -1, S Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = statetype != A
triggerall = p2bodydist x = [0,600]
triggerall = p2bodydist y = [-225,0]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < floor(ailevel * 2)
trigger1 = !inguarddist
trigger2 = (stateno = 230) || (stateno = 231) || (stateno = 235)
trigger2 = movehit
trigger2 = random < ailevel * 12
trigger3 = stateno = 430
trigger3 = movehit
trigger3 = random < ailevel * 24
value = 210

[STATE -1, C Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel > 1
triggerall = statetype != A
triggerall = p2bodydist x = [0,400]
triggerall = p2bodydist y = [-400,0]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = !inguarddist
trigger1 = random < ailevel * 8
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = stateno = 400
trigger3 = movehit
trigger3 = p2statetype = A
trigger3 = random < ailevel * 48
trigger4 = stateno = 230 || stateno = 231
trigger4 = movehit
trigger4 = random < ailevel * 12
trigger5 = stateno = 201
trigger5 = movehit
trigger5 = p2statetype = A
trigger5 = random < ailevel * 48
value = 410

[STATE -1, S Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = Ailevel
triggerall = statetype != A
triggerall = p2bodydist x = [0,390]
triggerall = p2bodydist y = [-300,0]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random < floor(ailevel * 0.1)
trigger1 = !inguarddist
trigger2 = stateno = 235
trigger2 = movehit
trigger2 = random < ailevel * 64
trigger3 = (stateno = 210) || (stateno = 230)
trigger3 = movehit
trigger3 = random < ailevel * 16
value = 240

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y > -200 && p2bodydist y < 240
triggerall = p2statetype = A
triggerall = !enemy,hitfall 
triggerall = stateno != 632
triggerall = p2movetype != H
triggerall = p2bodydist x < 170
trigger1 = ctrl
trigger1 = random < ailevel * 8
value = 830

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y > -200 && p2bodydist y < 240
triggerall = p2statetype = A
triggerall = !enemy,hitfall 
triggerall = stateno != 632
triggerall = p2movetype = H
triggerall = p2bodydist x < 170
trigger1 = var(1)
trigger1 = random < ailevel * 6
trigger1 = stateno = 635
trigger1 = movehit
value = 831

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
;triggerall = enemy,name != "Bertha Hippo"
;triggerall = enemy,name != "Jumbo Elephant"
;triggerall = enemy,name != "Jumba Elephant"
;triggerall = enemy,name != "Julian Hippo"
triggerall = statetype != A
triggerall = stateno != 100
triggerall = p2statetype = S || p2statetype = C
triggerall = ctrl
triggerall = p2movetype != H
triggerall = p2bodydist x = [0, 100]
trigger1 = Random < Ailevel * 12
trigger2 = Random < Ailevel * 16
trigger2 = p2stateno = [120,130]
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*8)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel * 36
value = 800

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
;Triple Kung Fu Palm (uses one super bar)
;[State -1, Triple Kung Fu Palm]
;type = ChangeState
;value = 3000
;triggerall = command = "TripleKFPalm"
;triggerall = power >= 1000
;trigger1 = statetype = S
;trigger1 = ctrl
;trigger2 = statetype != A
;trigger2 = hitdefattr = SC, NA, SA, HA
;trigger2 = stateno != [3000,3050)
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking



;Supers
;---------------------------------------------------------------------------
;Super Kicks & Rising Kicks
[state -1, Super Kicks]
type = changestate
triggerall = !ailevel
triggerall = power > 2999
triggerall = command = "Super"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
value = 3000

;---------------------------------------------------------------------------
;Super Kicks & Rising Kicks
[state -1, Super Kicks]
type = changestate
triggerall = !ailevel
triggerall = power > 999
triggerall = command = "Super2"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
value = 3040
;---------------------------------------------------------------------------
;EX Rotating Bunn Paws
[state -1, Rotating Bunn Paws]
type = changestate
value = 1020
triggerall = !ailevel
triggerall = power > 499
triggerall = command = "upper_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)


;---------------------------------------------------------------------------
;Light Rotating Bunn Paws
[state -1, Rotating Bunn Paws]
type = changestate
value = 1000
triggerall = !ailevel
triggerall = command = "upper_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Light Rotating Bunn Paws
[state -1, Rotating Bunn Paws]
type = changestate
value = 1010
triggerall = !ailevel
triggerall = command = "upper_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;EX Deception Dash
[state -1, Bunny Rush in]
type = changestate
value = 1170
triggerall = !ailevel
triggerall = power > 499
triggerall = command = "QCF_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Slow Deception Dash
[state -1, Bunny Rush in]
type = changestate
value = 1150
triggerall = !ailevel
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Fast Deception Dash
[state -1, Bunny Rush in]
type = changestate
value = 1155
triggerall = !ailevel
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)


;---------------------------------------------------------------------------
;EX Deception Dive
[state -1, Bunny Rush in]
type = changestate
value = 1175
triggerall = !ailevel
triggerall = command = "QCF_z"
triggerall = power > 499
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Slow Deception Dive
[state -1, Bunny Rush in]
type = changestate
value = 1160
triggerall = !ailevel
triggerall = command = "QCF_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Fast Deception Dive
[state -1, Bunny Rush in]
type = changestate
value = 1165
triggerall = !ailevel
triggerall = command = "QCF_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)


;---------------------------------------------------------------------------
;EX Needle Throw
[state -1, Needle Throw EX]
type = changestate
value = 1070
triggerall = !ailevel
triggerall = power > 499
triggerall = numhelper(1070) < 1
triggerall = command = "QCF_z"
triggerall = statetype = A
triggerall = pos y < -250
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Light Needle Throw
[state -1, Needle Throw Light]
type = changestate
value = 1050
triggerall = !ailevel 
triggerall = numhelper(1050) < 1
triggerall = command = "QCF_x"
triggerall = statetype = A
triggerall = pos y < -250
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Hard Needle Throw
[state -1, Needle Throw Hard]
type = changestate
value = 1060
triggerall = !ailevel
triggerall = numhelper(1050) < 1
triggerall = command = "QCF_y"
triggerall = statetype = A
triggerall = pos y < -250
trigger1 = ctrl
trigger2 = var(1)


;---------------------------------------------------------------------------
;EX Scissor Grab
[State -1, Sommersault Seat Light]
type = ChangeState
value = 1120
triggerall = power > 499
triggerall = command = "HCB_z"
triggerall = statetype != A
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Scissor Grab
[State -1, Sommersault Seat Light]
type = ChangeState
value = 1100
triggerall = command = "HCB_x"
triggerall = statetype != A
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Scissor Grab
[State -1, Sommersault Seat Light]
type = ChangeState
value = 1110
triggerall = command = "HCB_y"
triggerall = statetype != A
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)

;----------------------------------------------------------------------------

;Ninja Vanish Ground
[state -1, Ground Teleport]
type = changestate
value = 1200
triggerall = Statetype != A
triggerall = var(12) > 0
triggerall = command = "teleport"
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 201 || stateno = 205 || stateno = 210 ||stateno = 230 || stateno = 240 || stateno = 400 || stateno = 430 
trigger2 = movehit

;---------------------------------------------------------------------------
;Ninja Vanish Air
[state -1, ground Teleport]
type = changestate
value = 1201
triggerall = statetype = A
triggerall = var(12) > 0
triggerall = command = "teleport"
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 640
trigger2 = movehit

;===========================================================================
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
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF" || (command = "dash" && command != "holdback")
trigger1 = statetype = S
trigger1 = ctrl

;--------------------------------------------------------------------------
;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 999

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
trigger1 = command = "SuperJump" || command = "superjump"
trigger1 = statetype = S || statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = !ailevel 
triggerall = command = "Throw"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------
;Air Throw Non Comboable
[State -1, Kung Fu Throw]
type = ChangeState
value = 830
triggerall = command = "Throw"
triggerall = statetype = A
triggerall = enemy,movetype != H
trigger1 = ctrl
;---------------------------------------------------------------------------
;Air Throw Comboable
[State -1, Kung Fu Throw]
type = ChangeState
value = 831
triggerall = command = "Throw"
triggerall = statetype = A
triggerall = enemy,movetype = H
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 605) || stateno = (610) || (stateno = 630) || (stateno = 635) || (stateno = 640)
trigger2 = movecontact




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
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 400) || (stateno = 430) || (stateno = 201) || (stateno = 231) || (stateno = 235)
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
trigger2 = (stateno = 200) || (stateno = 201) || (stateno = 400)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 231
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = stateno = 230
trigger1 = movecontact

;---------------------------------------------------------------------------
;Stand Med Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = (stateno = 231)
trigger1 = movecontact



;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 210) || (stateno = 235) || (stateno = 400) || (stateno = 430) || (stateno = 231)
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
trigger2 = (stateno = 400) || (stateno = 430)|| (stateno = 200) || (stateno = 230) || (stateno = 201) || (stateno = 231) || (stateno = 235)
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
trigger2 = (stateno = 400) || (stateno = 200) || (stateno = 201)
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
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || (stateno = 201) || (stateno = 230) || (stateno = 231)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger1 = command != "holdfwd"

;---------------------------------------------------------------------------
;Jump Medium Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = command = "x"
triggerall = statetype = A
trigger1 = (stateno = 600) || (stateno = 630)
trigger1 = movecontact
trigger2 = ctrl
trigger2 = command = "holdfwd"

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 630) || (stateno = 605) || (stateno = 635) 
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
;Dive Butt
[state -1, Dive Butt]
type = Changestate
value = 632
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = command = "a"
triggerall = statetype = A
trigger1 = command = "holdfwd" && command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 630) || (stateno = 605) 
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = command != "holddown"
trigger2 = stateno = 600 || stateno = 605 ||stateno = 630 || stateno = 635 || stateno = 610
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = !ailevel
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 640
trigger2 = movecontact


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
command = ~D, DB, B, D, DB, B, x
time = 40
buffer.time = 8

[Command]
name = "SUPER"
command = ~D, B, D, B, x
time = 40
buffer.time = 8

[Command]
name = "SUPER"
COMMAND = ~D,DB,B,x+z
time = 20
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = ~D, DB, B, D, DB, B, y
time = 40
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = ~D, B, D, B, y
time = 40
buffer.time = 8

[Command]
name = "SUPER"
COMMAND = ~D,DB,B,y+z
time = 40
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = c+z
time = 1

[Command]
name = "SUPER"   ;Same name as above
command = ~D, DB, B, D, DB, B, z
time = 40
buffer.time = 8

[Command]
name = "SUPER"   ;Same name as above
command = ~D, B, D, B, z
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DB,B,D,DB,B,a
time = 40
buffer.time = 8


[Command]
name = "Super2"
command = ~D,DB,B,D,DB,B,b
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DB,B,a+b+c
time = 30
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DB,B,a+c
time = 20
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DB,B,b+c
time = 20
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

[Command]
name = "Super3"
command = ~D,DF,F,a+b+c
time = 20
buffer.time = 8

[Command]
name = "Super3"
command = ~D,DF,F,a+c
time = 20
buffer.time = 8

[Command]
name = "Super3"
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
name = "DP_a"
command = ~F, D, DF, a
buffer.time = 12

[Command]
name = "DP_b"
command = ~F, D, DF, b
buffer.time = 12

[Command]
name = "DP_ab"
command = ~F, D, DF, a+b
buffer.time = 12

[Command]
name = "DP_ab"
command = ~F, D, DF, c
buffer.time = 12

[Command]
name = "DD_a"
COMMAND = D,D,a

[Command]
name = "DD_b"
COMMAND = D,D,b

[Command]
name = "DD_ab"
COMMAND = D,D,c

[Command]
name = "DD_ab"
COMMAND = D,D,a+b


[Command]
name = "HCB_x"
command = ~F,DF,D,DB,B,x

[Command]
name = "HCB_x"
command = ~F,$D,B,x

[Command]
name = "HCB_x"
command = ~F,D,B,x

[Command]
name = "HCB_y"
command = ~F,DF,D,DB,B,y

[Command]
name = "HCB_y"
command = ~F,D,B,y

[Command]
name = "HCB_y"
command = ~F,$D,B,y

[Command]
name = "HCB_z"
command = ~F,DF,D,DB,B,z

[Command]
name = "HCB_z"
command = ~F,D,B,z

[Command]
name = "HCB_z"
command = ~F,$D,B,z

[Command]
name = "HCB_z"
command = ~F,DF,D,DB,B,x+y

[Command]
name = "HCB_z"
command = ~F,D,B,x+y

[Command]
name = "HCB_z"
command = ~F,$D,B,x+y


[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

[command]
name = "dodgeS"
command = a+b

[command]
name = "dodgeS"
command = c

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


[command]
name = "throw"
command = x+a
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
name = "dodge"
command = /a+b
time = 1
buffer.time = 1

[command]
name = "dodge"
command = /c

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
name = "holdx"
command = /x
time = 1
buffer.time = 1

[command]
name = "holdy"
command = /y
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

[state -1, Air Combo condition reset]
type = varset
trigger1 = 1
var(2) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) ||(stateno= [600,640])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = stateno != 410
trigger2 = stateno != 245
trigger2 = movecontact
trigger3 = stateno = 410
trigger3 = movehit
var(1) = 1

;===========================================================================
;AI START
;===========================================================================
[State -1, AI ON] 
Type = VarSet
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

[State -1, AI guarding - Stand]
Type=Changestate
triggerall = ailevel > 0
Triggerall=var(30)=59
triggerall = stateno != 100
triggerall = stateno != [200,1399]
triggerALL =! (Stateno=[120,155])
Triggerall=Inguarddist || enemynear,hitdefattr = SCA,NP,SP,HP || enemynear,hitdefattr = SCA,AA
triggerall = ctrl
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
triggerall = ailevel > 1
triggerall = !p2bodydist x = [0, 450]
triggerall = stateno != 100
trigger1 = Random < (Ailevel*2)
trigger1 = p2bodydist x > 300
trigger1 = !inguarddist
trigger2 = p2statetype = L
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x > 300
value = 100

[state -1, AI Backdash]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 1
triggerall = backedgedist > 80
trigger1 = p2stateno = [5100,5120]
trigger1 = p2bodydist x =[0, 200]
trigger1 = random < (ailevel*48)
trigger2 = p2bodydist x = [0,200] 
trigger2 = random < (ailevel*12)
value = 105

[State -1, Jump]
type = changestate
Triggerall=var(30)=59
triggerall = Statetype != A
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = ctrl
trigger1 = enemy,hitdefattr = S,AT
trigger1 = random < ailevel * 4
trigger2 = p2bodydist x = [160, 240]
trigger2 = random < ailevel * 2
trigger2 = enemy,statetype = S || enemy,statetype = C
trigger2 = ctrl
trigger3 = ctrl
trigger3 = enemy,hitdefattr = S,HT
trigger3 = random < ailevel*6
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

[state -1, Duck]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = Statetype != A
triggerall = Random < (Ailevel*12)
triggerall = inguarddist 
triggerall =! stateno = 11
trigger1 = enemy, name = "Jumbo Elephant"
trigger1 = enemy, stateno = [210,212]
trigger2 = enemy, name = "Bertha Hippo"
trigger2 = enemy, stateno = [1035,1040]
trigger3 = enemy, name = "Ana 'Jiggly' Bunny"
trigger3 = enemy, stateno != [1100, 1129]
trigger4 = enemy, name = "Enorma Pig"
trigger4 = enemy, stateno = [1000,1009]
value = 11

[state -1, Dodge Stance]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
trigger1 = ctrl 
trigger1 = enemy,numproj > 0 || enemy,hitdefattr = SCA,NP,SP,HP
trigger1 = random < (ailevel*36)
value = 1300

[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1300
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = statetype != A
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -1000 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,10] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger1 = random < ailevel * 36

[state -1, combo super jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
trigger1 = stateno = 410
trigger1 = movehit
value = 42

[state -1, Butt Check]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = power > 499
triggerall = ailevel > 5
trigger1 = random < (ailevel) && (enemy,hitdefattr = SCA,NA || enemy,hitdefattr = SCA,NP)
trigger2 = random < (ailevel * 12) && (enemy,hitdefattr = SCA,HA || enemy,hitdefattr = SCA, HP)
trigger3 = random < (ailevel * 4) && (enemy,hitdefattr = SCA,SA) || enemy,hitdefattr = SCA,SP
value = 1400

[state -1, Surra De Bunda]
TYPE = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 2999
triggerall = ailevel > 3
triggerall = p2bodydist x < 360
triggerall = !enemy,hitfall
triggerall = enemy,stateno != [660,669]
triggerall = !numtarget(1000)
trigger1 = stateno = 240 && movehit
trigger1 = random < (ailevel*32)
trigger1 = enemynear,statetype != A
trigger2 = enemynear,ctrl = 0 && enemynear,vel y > 0
trigger2 = enemynear,pos y > - 160 && !enemynear,hitfall
trigger2 = ctrl
trigger2 = random < (ailevel*32)
trigger3 = stateno = 1200 || stateno = 1210
trigger3 = movehit
trigger3 = random < ailevel * 24
trigger3 = p2statetype = S
value = 3000

[state -1, Kick Combo]
TYPE = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2bodydist x = [0, 360]
triggerall = enemy,hitfall = 0
triggerall = enemy,stateno != [660,669]
trigger1 = stateno = 240 && movehit
trigger1 = random < (ailevel*2)
trigger1 = enemynear,statetype != A
trigger2 = stateno = 210 && movehit
trigger2 = random < (ailevel*2)
trigger3 = stateno = 1200 ||stateno = 1210 
trigger3 = movehit
trigger3 = random < ceil(ailevel*0.25)
trigger3 = life > 400 || life > enemynear,life
trigger4 = stateno = 1200 ||stateno = 1210 
trigger4 = movehit
trigger4 = random < ceil(ailevel*4)
trigger4 = life < 400 || life < enemynear,life
value = 3080


[state -1, Winmill Combo]
TYPE = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2stateno != [660,669]
triggerall = p2bodydist x = [0,400]
triggerall = p2bodydist y = [-160,0]
trigger1 = movecontact
trigger1 = var(1) || ctrl
trigger1 = enemy,statetype = S
trigger1 = random < ailevel * 4
trigger1 = p2bodydist x < 300
trigger2 = enemynear,hitdefattr = SCA,AP
trigger2 = ctrl || var(1)
trigger2 = enemynear,animtime < -12
trigger2 = random < ailevel * 12
trigger2 = p2bodydist x > 150
value = 3040

[State -1, Windmill Super] ;by Inktrebuchet
type = ChangeState
value = 3040
triggerall = var(30) = 59 
triggerall = ailevel > 3
triggerall = ctrl || var(1)
triggerall = power > 999
triggerall = statetype != A
triggerall = p2bodydist x = [0,400]
triggerall = p2bodydist y = [-160,0]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [6,40] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger1 = random < ailevel * 12 ; Inhibitor

;[state -1, Rising Knee H]
;type = changestate
;triggerall = var(30) = 59
;triggerall = statetype != A
;triggerall = power > 999
;triggerall = enemy,statetype != L
;triggerall = p2bodydist x < 160
;trigger1 = ctrl
;trigger1 = random < (ailevel*2)
;trigger1 = enemy,movetype = A
;value = 1070

[state -1, Heel Kick EX]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != L
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2bodydist x = [0, 650] 
triggerall = p2bodydist y = [-250,0]
trigger1 = random < (ailevel*8)
trigger1 = enemy,statetype = A && enemy,movetype = A
trigger1 = ctrl
trigger1 = p2bodydist x = [0,250]
trigger2 = p2statetype = C
trigger2 = p2bodydist x = [450,650]
trigger2 = ctrl
trigger2 = random < ailevel * 4
trigger3 = enemy,movetype = A
trigger3 = ctrl || var(1)
trigger3 = p2bodydist x = [0,60]
trigger3 = random < ailevel * 8
trigger4 = movecontact
trigger4 = var(1)
trigger4 = enemy,movetype = A
trigger4 = random < ailevel * 8
value = 1120

[state -1, Air Heel Kick H]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != L
triggerall = p2bodydist x < 420 && p2bodydist x >= 270
triggerall = statetype = A
triggerall = power > 499 || prevstateno = 1120
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = p2statetype = C
trigger2 = stateno = 1120
trigger2 = (pos y = [-180,-140])
trigger2 = random < ailevel * 48
value = 1121

[state -1, EX Windmill]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = enemy,statetype != L
triggerall = power > 499
triggerall = ctrl || var(1)
triggerall = p2bodydist x = [0,400]
trigger1 = enemynear,movetype = A
trigger1 = random < ailevel*4
trigger1 = p2bodydist x > 250
trigger2 = enemynear,movetype = A
trigger2 = movecontact
trigger2 = random < ailevel * 12
value = 1170

[state -1, Thigh Grab EX]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = enemy,statetype != L
triggerall = ctrl
triggerall = power > 999
triggerall = p2bodydist x < 360
triggerall = !enemy,hitfall
trigger1 = enemy,numproj > 0 || enemy,hitdefattr = S,AP
trigger1 = random < (ailevel*16)
trigger1 = enemy,statetype != A
trigger1 = enemy,movetype != A
value = 1020

[state -1, Standing Jab]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = statetype != A
triggerall = p2bodydist x < 170
triggerall = p2statetype != L
trigger1 = enemy,movetype != A
trigger1 = random < (ailevel*12)
value = 200

[state -1, Swingging Headbutt]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 340
triggerall = enemy,pos y > -150
trigger1 = ctrl
trigger1 = random < (ailevel*2)
trigger1 = enemy,movetype != A
trigger1 = enemy,statetype = S
trigger1 = p2bodydist x = [180, 340]
trigger2 = stateno = 230
trigger2 = random < (ailevel*18)
trigger3 = ctrl
trigger3 = random < (ailevel*8)
trigger3 = enemy,movetype != A
trigger3 = enemy,statetype = C
trigger4 = stateno = 233 && movehit
trigger4 = random < ailevel*48
trigger4 = p2statetype = L
value = 210

[state -1, antiair slap]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x < 230
trigger1 = p2bodydist y > -270 && p2bodydist y < -100
trigger1 = random < (ailevel*24)
trigger1 = p2statetype = A
value = 201

[state -1, Standing Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 180
trigger1 = ctrl
trigger1 = random<ailevel*18
trigger1 = enemy,statetype != A
trigger2 = stateno = 200 && movecontact
trigger2 = random < (ailevel*24)
trigger3 = stateno = 200 && movehit
trigger3 = random < (ailevel*48)
trigger4 = ctrl
trigger4 = enemynear,movetype = H
trigger4 = random < ailevel * 64
trigger4 = enemynear,statetype != A
value = 230

[state -1, Standing Forward]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 240
trigger1 = random<ailevel*18
trigger1 = enemy,statetype != A
trigger1 = ctrl
trigger1 = enemy,statetype = S
trigger1 = p2bodydist x = [160,260]
trigger2 = stateno = 230 && movecontact
trigger2 = random < ailevel*32
trigger3 = random < (ailevel*4)
trigger3 = enemy,statetype != A
trigger3 = ctrl
trigger3 = enemy,statetype = C
trigger4 = stateno = 430
trigger4 = movecontact
trigger4 = random < ailevel * 24
value = 231

[state -1, Standing stomp]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = statetype != A
triggerall = p2bodydist x = [0,120]
triggerall = p2statetype != A
trigger1 = enemynear,statetype = C
trigger1 = random < (ailevel*6)
trigger2 = enemynear,statetype = L
trigger2 = stateno != [660,669]
trigger2 = random < (ailevel*4)
value = 232




[state -1, Standing Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 310
trigger1 = random<ailevel*4
trigger1 = ctrl
trigger1 = enemy,movetype != A
trigger1 = enemy,pos y >= -100
trigger1 = p2bodydist x = [180,310]
trigger2 = stateno = 231 && movecontact
trigger2 = random < ailevel*24
trigger3 = stateno = 100
trigger3 = random<ailevel*24
value = 240

[state -1, Standing Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 310
triggerall = stateno = 100
trigger1 = random<ailevel*18
value = 245


[state -1, Alt Standing Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 220
trigger1 = random<ailevel*8
trigger1 = ctrl
trigger1 = enemy,movetype != A
trigger1 = enemy,pos y < -100
trigger2 = stateno = 231 && movecontact
trigger2 = random < ailevel*2
trigger2 = p2bodydist x < 140
trigger3 = stateno = 201 && movehit
trigger3 = random < (ailevel*24)
value = 241

[state -1, Crouching 400]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 210
triggerall = ctrl
triggerall = enemy,movetype != A
trigger1 = random < (ailevel*12)
trigger1 = enemy,statetype = S
trigger2 = enemy,statetype = C
trigger2 = random < (ailevel*4)
 value = 400

[state -1, Crouching Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 200
trigger1 = random < 80/ailevel
trigger1 = stateno = 231 && moveguarded
trigger2 = random < ailevel*24
trigger2 = stateno = 231 && movehit
trigger3 = stateno = 201 && movehit
trigger3 = random < (ailevel*24)
trigger4 = stateno = 430 && movehit
trigger4 = random < (ailevel*24)
trigger5 = stateno = 400 && movehit
trigger5 = random < (ailevel*8)
trigger6 = (stateno = 200) || (stateno = 400) || (stateno = 230) || (stateno = 430) || (stateno = 235)
trigger6 = movehit
trigger6 = enemy,movetype = A
trigger6 = random < ailevel * 36
value = 410

[state -1, Crouching Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 270
trigger1 = ctrl
trigger1 = random<(ailevel*16)
trigger1 = enemy,statetype = S
trigger1 = enemy,movetype != A
trigger2 = stateno = 400 && movecontact
trigger2 = random < (ailevel*48)
trigger3 = ctrl
trigger3 = random < (ailevel*4)
trigger3 = enemy,statetype = C
trigger3 = enemy,movetype != A
value = 430


[state -1, Crouching Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 480
trigger1 = ctrl
trigger1 = random<(ailevel*4)
trigger1 = enemy,statetype = S
trigger1 = enemy,movetype != A
trigger1 = p2bodydist x = [260,480]
trigger2 = stateno = 430 && movecontact
trigger2 = random < (ailevel*24)
value = 440



[state -1, Jumping Jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 235
triggerall = p2statetype != L
trigger1  = ctrl
trigger1 = random < (ailevel*48)
trigger1 = enemy,movetype = H
trigger2 = stateno = 600 && movehit
trigger2 = random < (ailevel*36)
value = 600

[state -1, Jumping Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 190
triggerall = p2statetype != L
trigger1 = stateno = 600 && movehit
trigger1 = random < (ailevel*48)
value = 630

[state -1, Jumping Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 260
triggerall = p2bodydist y = [-200,200]
trigger1 = stateno = 630 && movehit
trigger1 = random < (ailevel*24)
value = 610

[state -1, Jumping Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x < 300
trigger1 = stateno = 630 && movehit
trigger1 = random < (ailevel*24)
trigger2 = enemy,statetype != A
trigger2 = random < (ailevel*8)
trigger2 = ctrl
trigger2 = vel y > 5
value = 640

[state -1, Thigh Grab L]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,statetype != L
triggerall = ctrl || var(1)
triggerall = p2bodydist x = [0, 280]
triggerall = !enemy,hitfall
trigger1 = p2bodydist x > 160
trigger1 = random < (ailevel*2)
trigger1 = enemy,statetype != A
trigger1 = enemy,movetype != A
trigger2 = enemy,statetype = C
trigger2 = enemy,stateno = [120,159]
trigger2 = random < (ailevel*4)
trigger3 = p2stateno = [1400,1409]
trigger3 = p2statetype != A
trigger3 = random < ailevel*24 
value = 1000

[state -1, Thigh Grab H]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,statetype != L
triggerall = !enemy,hitfall
triggerall = ctrl || var(1)
triggerall = p2bodydist x = [0,320]
trigger1 = p2bodydist x > 190
trigger1 = random < (ailevel*2)
trigger1 = enemy,statetype != A
trigger1 = enemy,movetype != A
trigger2 = enemy,statetype = C
trigger2 = enemy,stateno = [120,159]
trigger2 = random < (ailevel*2)
trigger3 = enemy,authorname = "Kaze Cat"
trigger3 = p2stateno = [1400,1409]
trigger3 = p2statetype != A
trigger3 = random < ailevel*24 
value = 1010

[state -1, Ground Heel Kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != L
triggerall = ailevel > 2
triggerall = p2bodydist x = [0, 400]
triggerall = p2bodydist y = [-160,0]
triggerall = statetype != A
trigger1 = ctrl
trigger1 = enemy,movetype != A
trigger1 = enemy,statetype = C
trigger1 = random < (ailevel*8)
trigger1 = p2bodydist x = [300,400]
trigger2 = enemy,statetype = A
trigger2 = enemy,movetype = A
trigger2 = p2bodydist x = [0,190]
trigger2 = p2bodydist y = [-145,0]
trigger2 = random < ailevel * 8
trigger2 = ctrl
value = 1100

[state -1, Air Heel Kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != L
triggerall = p2bodydist x < 270
triggerall = random < (ailevel*4)
triggerall = Statetype = A
trigger1 = stateno = 630
trigger1 = movehit
trigger2 = ctrl
trigger2 = !inguarddist
trigger2 = enemy,statetype = C
trigger3 = stateno = 1100
trigger3 = (pos y = [-160,-140])
trigger3 = random < ailevel * 48
value = 1101

[state -1, Ground Heel Kick H]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != L
triggerall = ailevel > 2
triggerall = p2bodydist x = [0, 580]
triggerall = p2bodydist y = [-200,0]
triggerall = statetype != A
trigger1 = ctrl
trigger1 = enemy,movetype != A
trigger1 = enemy,statetype = C
trigger1 = random < (ailevel*8)
trigger1 = p2bodydist x = [370,580]
trigger2 = enemy,statetype = A
trigger2 = enemy,movetype = A
trigger2 = p2bodydist x = [0,220]
trigger2 = p2bodydist y = [-160,0]
trigger2 = random < ailevel * 8
trigger2 = ctrl
value = 1110

[state -1, Air Heel Kick H]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != L
triggerall = p2bodydist x < 420 && p2bodydist x >= 270
triggerall = statetype = A
trigger1 = random < (ailevel*4)
trigger1 = stateno = 630
trigger1 = movehit
trigger2 = ctrl
trigger2 = !inguarddist
trigger2 = enemy,statetype = C
trigger3 = stateno = 1110
trigger3 = (pos y = [-180,-140])
trigger3 = random < ailevel * 48
value = 1111

[state -1, Single Windmill]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,statetype != L
triggerall = p2bodydist x = [0,400]
trigger1 = inguarddist
trigger1 = enemynear,hitdefattr = SCA,AP ||enemynear,numproj > 0
trigger1 = ctrl
trigger1 = p2bodydist x > 250
trigger1 = random < (ailevel*2)
trigger2 = !inguarddist
trigger2 = p2statetype = S
trigger2 = p2bodydist x > 250
trigger2 = random < ailevel * 2
trigger2 = ctrl
value = 1150

[state -1, Single Windmill]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,statetype != L
triggerall = p2bodydist x = [0, 400]
trigger1 = inguarddist
trigger1 = enemynear,hitdefattr = SCA,AP ||enemynear,numproj > 0
trigger1 = ctrl
trigger1 = p2bodydist x > 250
trigger1 = random < (ailevel*2)
value = 1160

[state -1, double Kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
trigger1 = stateno = 240 || stateno = 210 || stateno = 430
trigger1 = movecontact
trigger1 = random < floor(ailevel*0.5)
trigger2 = stateno = 240 || stateno = 210 || stateno = 430
trigger2 = movehit
trigger2 = random < (ailevel*32)
value = 1200

[state -1, double Kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
trigger1 = stateno = 240 || stateno = 210 || stateno = 430
trigger1 = movehit
trigger1 = random < (ailevel*32)
value = 1210

[state -1, Thigh Clap (Grab)]
type = changestate
triggerall = statetype != A
triggerall = ailevel > 1
;triggerall = enemynear,name != "Bertha Hippo"
;triggerall = enemynear,name != "Jumbo Elephant"
;triggerall = enemynear,name != "Jumba Elephant"
;triggerall = enemynear,name != "Julian Hippo"
triggerall = !enemynear,hitfall
triggerall = var(30) = 59
triggerall = ctrl
triggerall = p2bodydist X < 140
triggerall = p2statetype != A
triggerall = p2statetype != L
triggerall = enemy,movetype != H
trigger1 = Random < (Ailevel*8)
trigger2 = enemynear,authorname = "Kazecat"
trigger2 = enemynear,stateno = [1400,1410]
trigger2 = random < (ailevel*32)
trigger3 = enemynear,stateno = [700,799]
trigger3 = random < ailevel * 32
value = 800

;[state -1, Rising Knee L]
;type = changestate
;triggerall = var(30) = 59
;triggerall = statetype != A
;triggerall = enemy,statetype != L
;triggerall = p2bodydist x < 200
;trigger1 = ctrl
;trigger1 = enemy,numproj > 0 || enemy,hitdefattr = S,AP
;trigger1 = random < (ailevel*4)
;trigger1 = enemy,movetype = A
;trigger2 = stateno = 240 && movehit
;trigger2 = random < (ailevel*4)
;trigger2 = p2bodydist x < 140
;value = 1050

;[state -1, Rising Knee H]
;type = changestate
;triggerall = var(30) = 59
;triggerall = statetype != A
;triggerall = enemy,statetype != L
;triggerall = p2bodydist x < 220
;trigger1 = ctrl
;trigger1 = random < (ailevel*2)
;trigger1 = enemy,movetype = A
;trigger1 = enemy,statetype = A
;trigger2 = stateno = 240 && movehit
;trigger2 = random < (ailevel*8)
;trigger2 = p2bodydist x < 140
;trigger3 = enemy,movetype = A
;trigger3 = ctrl
;trigger3 = random < floor(ailevel*1.5)
;value = 1060







;===========================================================================
;AI END
;===========================================================================

;===========================================================================
;Supers
;---------------------------------------------------------------------------

;Surra de Bunda
[State -1, SUPER]
type = ChangeState
value = 3000
triggerall = !ailevel
triggerall = command = "SUPER"
triggerall = power > 2999
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1) = 1
trigger3 = stateno = [1030,1299]
trigger3 = movecontact
;---------------------------------------------------------------------------
;Super Windmill
[State -1, SUPER]
type = ChangeState
value = 3040
triggerall = command = "Super2"
triggerall = power > 999
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1) = 1
trigger3 = stateno = [1030,1299]
trigger3 = movecontact

;---------------------------------------------------------------------------
;Super Kick Combo
[State -1, SUPER]
type = ChangeState
value = 3080
triggerall = command = "Super3"
triggerall = power > 999
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1) = 1
trigger3 = stateno = [1030,1299]
trigger3 = movecontact




;===========================================================================



;===========================================================================
;Rising Knee H
;[State -1, Rising Knee]
;type = ChangeState
;value = 1070
;triggerall = command = "DP_ab"
;triggerall = ailevel < 1
;triggerall = power > 999
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1) = 1

;Rising Knee L
;[State -1, Rising Knee]
;type = ChangeState
;value = 1050
;triggerall = command = "DP_a"
;triggerall = ailevel < 1
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1) = 1

;Rising Knee H
;[State -1, Rising Knee]
;type = ChangeState
;value = 1060
;triggerall = command = "DP_b"
;triggerall = ailevel < 1
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1) = 1

;===========================================================================
;Ground Heel Kick EX
[State -1, Rising Knee]
type = ChangeState
value = 1120
triggerall = command = "DP_ab"
triggerall = power > 499
triggerall = ailevel < 1
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;Ground Heel Kick L
[State -1, Rising Knee]
type = ChangeState
value = 1100
triggerall = command = "DP_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;Ground Heel Kick H
[State -1, Rising Knee]
type = ChangeState
value = 1110
triggerall = command = "DP_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;===========================================================================
;Wall Kick Kick
[State -1, Rising Knee]
type = ChangeState
value = 1220
triggerall = command = "QCF_ab"
triggerall = power > 499
triggerall = ailevel < 1
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;Ground Heel Kick L
[State -1, Rising Knee]
type = ChangeState
value = 1200
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;Ground Heel Kick H
[State -1, Rising Knee]
type = ChangeState
value = 1210
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;===========================================================================




;Air Heel Kick EX
[State -1, Rising Knee]
type = ChangeState
value = 1121
triggerall = command = "DD_ab"
triggerall = power > 499
triggerall = ailevel < 1
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1) = 1

;Air Heel Kick L
[State -1, Rising Knee]
type = ChangeState
value = 1101
triggerall = command = "DD_a"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1) = 1

;Air Heel Kick H
[State -1, Rising Knee]
type = ChangeState
value = 1111
triggerall = command = "DD_b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1) = 1

;===========================================================================
;Light Windmill
[State -1, EX Windmill]
type = ChangeState
value = 1170
triggerall = command = "QCB_c"
triggerall = ailevel < 1
triggerall = power > 499
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;Light Windmill
[State -1, L Windmill]
type = ChangeState
value = 1150
triggerall = command = "QCB_a"
triggerall = ailevel < 1
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1


;Hard Windmill
[State -1, H Windmill]
type = ChangeState
value = 1160
triggerall = command = "QCB_b"
triggerall = ailevel < 1
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1




;===========================================================================
;Scissor Bomb EX
[State -1, Scissor bomb EX]
type = ChangeState
value = 1020
triggerall = command = "HCB_z"
triggerall = power > 499
triggerall = ailevel = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;---------------------------------------------------------------------------

;Scissor Bomb Light
[State -1, Scissor Bomb Light]
type = ChangeState
value = 1000
triggerall = command = "HCB_x"
triggerall = ailevel = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1


;----------------------------------------------------------------------------
;Scissor Bomb Hard
[State -1, Scissor bomb Hard]
type = ChangeState
value = 1010
triggerall = command = "HCB_y"
triggerall = ailevel = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1


;---------------------------------------------------------------------------
;Dodge Stance
[State -1, Dodge Stance]
type = ChangeState
value = 1300
triggerall = command = "dodgeS"
triggerall = ailevel = 0
triggerall = command != "holddown"  || command != "holdfwd" || command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1


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
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "throw"


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
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = time > 16

;---------------------------------------------------------------------------
;Stand Chop
[State -1, Stand Light Punch]
type = ChangeState
value = 201
triggerall = command = "x"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl



;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = !Ailevel
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430 || stateno = 231 || stateno = [232,233]
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holdfwd"  && command != "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200  || stateno = 400 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Medium Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 231
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200  || stateno = 400 || stateno = 230 || stateno = 201
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Medium Stomp
[State -1, Stand Light Kick]
type = ChangeState
value = 232
triggerall = command = "a"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200  || stateno = 400 || stateno = 230 || stateno = 201
trigger2 = movecontact

;---------------------------------------------------------------------------
;;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 245
triggerall = !Ailevel
triggerall = command = "b"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = stateno = 100
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = !Ailevel
triggerall = command = "b"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = stateno != 100
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430 || stateno = 231 || stateno = 232 || stateno = 233 ||stateno = 201
trigger2 = movecontact

;---------------------------------------------------------------------------
;Alt Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 241
triggerall = !Ailevel
triggerall = command = "b"
triggerall = command = "holdback" 
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430 || stateno = 231 || stateno = 232 || stateno = 233 ||stateno = 201
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
trigger2 = stateno = 400 && animelemtime(5) > 0

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || stateno = 200 || stateno = 230 || stateno = 231 ||  stateno = 232 || stateno = 233
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
triggerall = !ailevel 
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
trigger2 = stateno = 600 || stateno = 630 
trigger2 = movecontact


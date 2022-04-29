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
command = D, DB, B, x+z
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = D, DB, B, y+z
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = c+z
time = 1

[Command]
name = "Super2"
command = ~D, DB, B, D, DB, B, a
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DB, B, D, DB, B, b
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DB, B, D, DB, B, c
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DB, B, a+b+c
time = 20
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DB, B, a+c
time = 20
buffer.time = 8


[Command]
name = "Super2"
command = ~D, DB, B, b+c
time = 20
buffer.time = 8


[command]
name = "Super3"
command = D,D,b


[command]
name = "Super3"
command = D,D,a


[command]
name = "Super3"
command = D,b+c


[command]
name = "Super3"
command = D,a+c


;-| Special Motions |------------------------------------------------------
[Command]
name = "QCF_x"
command = ~D, DF, F, x


[Command]
name = "QCF_y"
command = ~D, DF, F, y


[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y


[command]
name = "QCF_xy"
command = ~D, DF, F, z


[command]
name = "QCF_xy"
command = ~D,F,x+y


[command]
name = "QCF_xy"
command = ~D,F,z


[Command]
name = "QCF_x"
command = ~D,F,x


[Command]
name = "QCF_y"
command = ~D,F,y


[Command]
name = "QCF_xy"
command = ~D, F,x+y


[Command]
name = "QCF_xy"
command = ~D,F,z


[Command]
name = "QCF_x"
command = ~D, DF, F+x


[Command]
name = "QCF_y"
command = ~D, DF, F+y


[Command]
name = "QCF_xy"
command = ~D, DF, F+x+y


[command]
name = "QCF_xy"
command = ~D, DF, F+z


[Command]
name = "QCB_x"
command = ~D, DB, B, x


[Command]
name = "QCB_x"
command = ~D, B, x


[Command]
name = "QCB_y"
command = ~D, DB, B, y


[Command]
name = "QCB_y"
command = ~D, B, y


[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y


[Command]
name = "QCB_xy"
command = ~D, B, x+y


[Command]
name = "QCB_xy"
command = ~D, DB, B, z


[Command]
name = "QCB_xy"
command = ~D, B, z


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
command = ~D,DB,B, a


[Command]
name = "QCB_b"
command = ~D,DB,B, b


[Command]
name = "QCB_c"
command = ~D,DB,B, c


[Command]
name = "QCB_c"
command = ~D,DB,B, a+b


[Command]
name = "QCB_a"
command = $D,$B, a


[Command]
name = "QCB_b"
command = $D,$B, b



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
name = "recovery"
command = x+y
time = 1
buffer.time = 1


[Command]
name = "recovery"
command = z
time = 1
buffer.time = 1


[command]
name = "throw"
command = a+x
time = 1

[command]
name = "focusattack"
command = y+b
time = 1
buffer.time = 1


[Command]
name = "DoubleKick"
command = a+b
time = 1
buffer.time = 1


[Command]
name = "DoubleKick"
command = c
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


[Command]
name = "holdx"
command = /x
time = 1
buffer.time = 1


[Command]
name = "holdy"
command = /y
time = 1
buffer.time = 1


[Command]
name = "holdz"
command = /z
time = 1
buffer.time = 1


[command]
name = "holdz"
command = /x+y
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

[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno = [600,640])
trigger2 = stateno != 440 
trigger2 = stateno != 410
trigger2 = stateno != 238
trigger2 = movecontact
trigger3 = stateno = [410,411]
trigger3 = movehit
var(1) = 1



;AI start


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
Triggerall= var(30)=59
triggerall = stateno != 100 || stateno != [200,1399]
triggerall =! (Stateno=[120,155])
Triggerall = Inguarddist || enemynear,hitdefattr = SCA, NP,SP,HP || enemynear,hitdefattr = SCA,AA
triggerall = ctrl
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 16
value = 120

[state -1, AI Backdash]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
triggerall = statetype = S
triggerall = ctrl
triggerall = p2bodydist x < 150
triggerall = backedgedist > 40
trigger1 = p2stateno = [5100,5120]
trigger1 = random < ailevel*48
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < ailevel*2
trigger3 = p2movetype = A && p2statetype = A
trigger3 = random < ailevel*2
value = 105

[state -1, AI Run]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = ctrl
triggerall = p2bodydist x != [0, 450]
triggerall = stateno != 100
trigger1 = Random < (Ailevel* ifelse(numhelper(4000)=1, 16,4))
trigger1 = !inguarddist
trigger1 = p2bodydist x > 520
trigger2 = p2stateno = [4499,4500]
trigger2 = p2bodydist x > 450
trigger2 = random < ailevel*48
value = 100

[state -1, Gut Check]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = power > 499
triggerall = ailevel > 5
trigger1 = random < floor(ailevel*0.5) && (enemy,hitdefattr = SCA,NA,NP)
trigger2 = random < (ailevel * 8) && (enemy,hitdefattr = SCA,HA,HP)
trigger3 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,SA,SP)
value = 1400

[state -1, AI jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S || Statetype = C && stateno != 410
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = ctrl
trigger1 = p2bodydist x = [280, 650]
trigger1 = random < floor(ailevel * 0.25)
trigger1 = enemy,statetype = S || enemy,statetype = C
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
trigger6 = enemy,stateno = 1101 || enemy,stateno = 1111 || enemy,stateno = 1121
trigger6 = ctrl && random < (ailevel*6) 
trigger7 = enemy,name = "Julian Hippo"
trigger7 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger7 = ctrl && random < (ailevel*6)
trigger8 = enemy,name = "Pastilla Skunk"
trigger8 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger8 = ctrl && random < (ailevel*6)
value = 40

[State -1, AI Neu jump over enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 40 ;This value is based on default MUGEN common1.cns "Jump Start" state.
triggerall = ailevel
triggerall = var(30) = 59
triggerall = ctrl
triggerall = stateno != 40
triggerall = statetype = S || statetype = C
trigger1 = PlayerIDExist(helper(33333333),var(3)) ; enemy projectile exist?
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -200 ; Avoid jumping over projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow.
;distance/speed = time
trigger1 = ceil(((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) / PlayerID(helper(33333333),var(3)), vel x ) = floor(abs(const(velocity.jump.y)) / const(movement.yaccel))


[state -1, Consumption]
type = changestate
triggerall = var(30)= 59
triggerall = power > 2999
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = p2bodydist y = [-350,0]
trigger1 = stateno = 210 && movehit
trigger1 = random < ailevel * 48
trigger2 = enemynear,anim = 5300
trigger2 = ctrl
trigger2 = random < ailevel * 48 
trigger3 = numhelper(4000)
trigger3 = helper,movehit
trigger3 = random < (ailevel*64)
trigger4 = enemy,hitdefattr = S,SP 
trigger4 = random < (ailevel*6)
value = 3000

[state -1, Tail based Stinkface]
type = changestate
triggerall = var(30)= 59
triggerall = power > 999
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = enemy,hitfall = 0
triggerall = p2bodydist x =[0, 420]
triggerall = p2bodydist y = [-400,0]
triggerall = p2stateno != 1205
triggerall = p2stateno != 1215
triggerall = stateno != [1200,1230]
trigger1 = stateno = 210 && movehit
trigger1 = random < (ailevel*8)
trigger1 = p2statetype != A
trigger2 = p2bodydist y = [-400,-150]
trigger2 = ctrl
trigger2 = random < (ailevel*12)
trigger3 = enemynear,stateno = 678 || enemynear,stateno = 673
trigger3 = ctrl
trigger3 = random < (ailevel*24)
trigger4 = (enemynear,stateno = [700,799])
trigger4 = ctrl || var(1)
trigger4 = random < ailevel * 24
trigger4 = p2statetype != A
value = 3040

[state -1, Flatten and farting]
type = changestate
triggerall = var(30) = 59
triggerall = power > 999
triggerall = statetype = A
triggerall = ailevel > 3
triggerall = p2bodydist y > 200
triggerall = p2bodydist x = [-150,300]
trigger1 = ctrl
trigger1 = random < (ailevel*2)
trigger1 = enemy,ctrl = 0
trigger2 = stateno = 610 || stateno = 640
trigger2 = movehit
trigger2 = enemy,hitfall = 1
trigger2 = random < ailevel*24
value = 3080

[state -1, EX Belch]
type = changestate
triggerall = var(30)= 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = p2bodydist x < 700
triggerall = power > 499
triggerall = var(9) > 0
triggerall = numhelper(4000) < 1
trigger1 = random < floor(ailevel*12)
trigger1 = ctrl
trigger1 = enemy,statetype = L
value = 1120

[state -1, EX Vore attack]
type = changestate
triggerall = var(30)=59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2bodydist x < 410
trigger1 = stateno = 210 || stateno = 205
trigger1 = movehit
trigger1 = random < (ailevel * ifelse(life < 575,64,12))
trigger2 = numhelper(4000)
trigger2 = helper(4000),movehit && p2statetype = A
trigger2 = ctrl
trigger2 = random < ailevel* ifelse(life < 550, 48,8)
trigger2 = p2bodydist y = [-400,-100]
trigger3 = enemynear,anim = 5300
trigger3 = ctrl
trigger3 = random < ailevel * 36
value = 1070

[state -1, EX Tail grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2stateno != 1215
triggerall = p2bodydist y > -400 && p2bodydist y < -200
triggerall = p2statetype != L
triggerall = enemy,movetype != H
triggerall = enemy,hitfall = 0
trigger1 = random < (ailevel*6)
trigger1 = ctrl
trigger1 = p2movetype = A
trigger1 = p2bodydist x < 400
trigger2 = numhelper(4000) = 1
trigger2 = ctrl
trigger2 = p2statetype = A
trigger2 = random < ailevel * 12
value = 1220

[state -1, Belly bump]
type = changestate
triggerall = var(30)= 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = power > 499
trigger1 = stateno = 210 && movehit
trigger1 = random < ailevel*6
trigger2 = enemy,hitdefattr = S,SP || enemy,hitdefattr = S, HP || enemy,numproj > 0
trigger2 = random < ailevel*12
trigger2 = ctrl
trigger3 = stateno = 400
trigger3 = movehit
trigger3 = random < ailevel * 18
value = 1020

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1020
triggerall = ailevel  
triggerall = ctrl
triggerall = ailevel > 4
triggerall = power > 499
triggerall = statetype != A 
triggerall = random < ailevel*24
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -340 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [4,15] ; 5 = startup time, 22 = active ; [0,5] for last second




[state -1, Fart in Face (Grab)]
type = changestate
triggerall = statetype != A
triggerall = ailevel > 1
;triggerall = enemy,name != "Bertha Hippo"
;triggerall = enemy,name != "Jumbo Elephant"
;triggerall = enemy,name != "Jumba Elephant"
;triggerall = enemy,name != "Julian Hippo"
triggerall = var(30) = 59
triggerall = stateno != 100
triggerall = p2stateno != 4500
triggerall = ctrl
triggerall = p2bodydist X = [0, 120]
triggerall = p2statetype != A
triggerall = p2statetype != L
triggerall = p2movetype != H
trigger1 = Random < (Ailevel*12)
trigger2 = enemy,authorname = "Kazecat"
trigger2 = p2stateno = 1400  || p2stateno = 700
trigger2 = random < (ailevel*24)
trigger3 = random < ailevel * 15
trigger3 = p2stateno = 700
value = 800

[state -1, S short]
type = changestate
triggerall = var(30)= 59
triggerall =! statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist x = [0, 220]
trigger1 = random < (ailevel*48)
trigger1 = stateno = 430 && movehit
trigger2 = stateno = 205 || stateno = 235
trigger2 = movehit
trigger2 = random < (ailevel*36)
trigger2 = var(17) = 0
trigger2 = power < 2999
trigger3 = numhelper(4000)
trigger3 = helper(4000),movehit
trigger3 = p2bodydist y = [-450,-100]
trigger3 = ctrl
trigger3 = random < ailevel * 36
value = 410

[state -1, Low Crush]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < ifelse(stateno = 100, 485,200)
triggerall = p2stateno != 4500
triggerall = stateno != 100
triggerall = !numtarget(238)
triggerall = (p2stateno != [5000,5029])
triggerall =! enemy,movetype = A
triggerall = ctrl
trigger1 = Random < Ailevel *2
trigger1 = p2statetype = S
trigger1 = p2movetype != A
trigger2 = Random < Ailevel *12
trigger2 = p2statetype = C
value = 238

[state -1, Belly bump]
type = changestate
triggerall = var(30)= 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2statetype != L
trigger1 = stateno = 210 && movehit
trigger1 = random < (ailevel*36)
trigger2 = enemynear,hitdefattr = SCA, NP,SP,HP || enemy,numproj > 0
trigger2 = ctrl 
trigger2 = random < (ailevel*32)
trigger3 = ctrl
trigger3 = p2bodydist x = [200,700]
trigger3 = random < floor(ailevel*0.25)
trigger3 = p2statetype != A
value = 1010

[State -1, AI Belly Bump against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1010
triggerall = ailevel  
triggerall = ctrl
triggerall = ailevel > 2
triggerall = statetype != A 
triggerall = random < ailevel * 36
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -180 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [8,23] ; 5 = startup time, 22 = active ; [0,5] for last second


[state -1, Belly bump]
type = changestate
triggerall = var(30)= 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2statetype != L
trigger1 = stateno = 210 || stateno = 205 || stateno = 235 
trigger1 = movehit
trigger1 = random < (ailevel*24)
trigger2 = enemynear,hitdefattr = SCA,NP,SP,HP || enemy,numproj > 0
trigger2 = ctrl
trigger2 = random < (ailevel*32)
trigger3 = ctrl
trigger3 = p2bodydist x = [230,700]
trigger3 = random < floor(ailevel*0.25)
trigger3 = p2statetype != A
value = 1000

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1000
triggerall = ailevel  
triggerall = ctrl
triggerall = ailevel > 2
triggerall = statetype != A 
triggerall = random < ailevel*48
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [4,13] ; 5 = startup time, 22 = active ; [0,5] for last second


[state -1, Hard Super Fang]
type = changestate
triggerall = var(30)= 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x < 340
triggerall = p2statetype != L
trigger1 = random < (ailevel*ifelse(life < 575,48,24)) 
trigger1 = stateno = 210
trigger1 = movehit
trigger2 = enemynear,anim = 5300
trigger2 = ctrl
trigger2 = random < ailevel * 24
value = 1060

[state -1, Light Super Fang]
type = changestate
triggerall = var(30)= 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x < 230
triggerall = p2statetype != L
trigger1 = random < (ailevel * ifelse(life < 575,48,24))
trigger1 = stateno = 430 || stateno = 205
trigger1 = power < 999
trigger1 = movehit
trigger2 = stateno = 230
trigger2 = p2statetype = A
trigger2 = movehit
trigger2 = random < ailevel * 24
value = 1050

[state -1, Heavy Belch]
type = changestate
triggerall = var(30)= 59
triggerall = statetype != A
triggerall = var(9) > 0
triggerall = numhelper(4000) < 1
triggerall = ailevel > 2
trigger1 = enemy,stateno = 5100
trigger1 = random < (ailevel*12)
trigger1 = ctrl
trigger1 = p2bodydist x = [200,600] 
trigger2 = p2bodydist x = [400,800]
trigger2 = !inguarddist
trigger2 = ctrl
trigger2 = random < ailevel * 2
trigger2 = enemynear,ctrl = 0
value = 1110

[state -1, Light Belch]
type = changestate
triggerall = var(30)=59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = numhelper(4000) < 1
trigger1 = random < (ailevel*8)
trigger1 = ctrl
trigger1 = p2bodydist x = [200, 600]
trigger1 = !inguarddist
trigger1 = enemynear,ctrl = 0
trigger2 = enemynear,stateno = [5100,5120]
trigger2 = p2bodydist x = [150, 470]
trigger2 = ctrl
trigger2 = random < (ailevel*36)
value = 1100

[state -1, Tail grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist y > -250 && p2bodydist y <= 0
triggerall = enemy,statetype != A
triggerall = p2statetype != L
triggerall = var(17) > 0
triggerall = p2bodydist x = [320,620]
trigger1 = random < (ailevel*16)
trigger1 = ctrl && enemy,ctrl = 0
trigger1 = enemy,vel y >= 0
trigger1 = enemy,movetype != A
trigger2 = stateno = 210 && moveguarded
trigger2 = random < (ailevel*2)
trigger3 = stateno = 210 && movehit
trigger3 = random < (ailevel*24)
trigger4 = numhelper(4000) = 1
trigger4 = ctrl
trigger4 = p2statetype != A
trigger4 = random < ailevel * 8
trigger5 = p2stateno = [700,799]
trigger5 = var(1) || ctrl
trigger5 = random < ailevel * 24
value = 1200

[state -1, Tail grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2bodydist x = [0,300]
triggerall = p2bodydist y = [-650, -150]
triggerall = p2statetype = A
triggerall = p2statetype != L
triggerall = enemy,hitfall = 0
trigger1 = random < (ailevel*12)
trigger1 = ctrl
trigger1 = p2bodydist x < 400
trigger2 = numhelper(4000) = 1
trigger2 = ctrl
trigger2 = random < ailevel * 8
value = 1210




[state -1, C jab]
type = changestate
triggerall = var(30)= 59
triggerall = statetype = C
triggerall = p2bodydist x < 260 
trigger1 = ctrl
trigger1 = p2statetype = S
trigger1 = random < (ailevel*8)
trigger1 = p2movetype != A
trigger2 = ctrl
trigger2 = p2statetype = C
trigger2 = random < (ailevel*2)
trigger3 = ctrl
trigger3 = numhelper(4000)
trigger3 = helper(4000),movehit
trigger3 = random < ailevel * 24
trigger4 = numtarget(238)
trigger4 = ctrl
trigger4 = random < ailevel * 24
value = 400

[state -1, S jab]
type = changestate
triggerall = var(30)= 59
triggerall = statetype = S
triggerall = p2bodydist x < 180
triggerall = p2bodydist y = [0,-180]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = p2movetype != A
trigger1 = random < (ailevel*16)
trigger2 = ctrl
trigger2 = p2statetype = S
trigger2 = random < (ailevel*4)
trigger3 = p2movetype = H
trigger3 = random < (ailevel*64)
trigger3 = ctrl
trigger4 = p2stateno = 4500
trigger4 = ctrl 
trigger4 = p2bodydist x = [0,50]
trigger4 = random < ailevel*115
trigger5 = p2stateno = 678
trigger5 = ctrl
trigger5 = p2bodydist y = [-180,-120]
trigger5 = random < ailevel*48
trigger6 = numtarget(238)
trigger6 = ctrl
trigger6 = random < ailevel * 48
value = 200
ignorehitpause = 1

[state -1, J jab]
type = changestate
trigger1 = var(30)= 59
triggerall = statetype = A
triggerall = ctrl
triggerall = p2bodydist x < 350
triggerall = p2bodydist y < 190 && p2bodydist y > -240
triggerall = enemy,statetype != L
trigger1 = random < (ailevel*24)
trigger1 = enemy,statetype = A
trigger2 = vel y > 1
trigger2 = random < (ailevel*4)
value = 600

[state -1, J short]
type = changestate
trigger1 = var(30)= 59
triggerall = statetype = A
triggerall = p2bodydist x < 350
triggerall = p2bodydist y < 270 && p2bodydist y > -180
trigger1 = stateno = 600 && movecontact
trigger2 = ctrl
trigger2 = random < (ailevel*24)
value = 630

[state -1, J. strong]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype = A
trigger1 = stateno = 600 && movecontact
trigger1 = random < (ailevel*36)
trigger2 = stateno = 630 && movecontact
trigger3 = p2statetype != A
trigger3 = random < ailevel * 12
trigger3 = ctrl
value = 605

[state -1, J. Forward]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0,380]
triggerall = p2bodydist y = [-200,350]
trigger1 = stateno = 605 && movehit
trigger2 = stateno = 630 && movehit
trigger2 = random < (ailevel*24)
trigger3 = p2bodydist y > 250 && vel y > 1
trigger3 = ctrl
trigger3 = random < (ailevel*12)
value = 635

[state -1, J Fierce]
type = changestate
trigger1 = var(30)= 59
triggerall = statetype = A
triggerall = p2bodydist y = [-250,0]
triggerall = p2bodydist x = [0,350]
trigger1 = stateno = 635 && movecontact
trigger1 = animtime = -12
trigger2 = ctrl
trigger2 = random < (ailevel*8)
trigger2 = vel y > 0

value = 610

[state -1, J heavy]
type = changestate
triggerall = var(30)= 59
triggerall = statetype = A
triggerall = p2bodydist x =[0, 400]
triggerall = p2bodydist y = [-100,250]
trigger1 = vel y > 0
trigger1 = ctrl
trigger1 = random < (ailevel * 16)
trigger1 = enemy,statetype != A
trigger2 = stateno = 610 && movehit
trigger2 = enemy,statetype != A
trigger2 = random < (ailevel*8)
trigger3 = animtime = -12
trigger3 = stateno = 635 && movecontact
trigger3 = p2bodydist y = [0,250]
value = 640

[state -1, S short]
type = changestate
triggerall = var(30)= 59
triggerall =! statetype = A
triggerall = p2bodydist x < 280
triggerall = p2statetype != A
trigger1 = stateno = 400 && movecontact
trigger1 = random < ailevel * 32
trigger2 = ctrl
trigger2 = random < ailevel * 8
trigger2 = p2statetype = S
trigger3 = enemynear,anim = 5300
trigger3 = ctrl
trigger3 = random < ailevel * 24
trigger4 = numtarget(238)
trigger4 = ctrl
trigger4 = random < ailevel * 24
value = 430

[state -1, C Roundhouse]
type = changestate
triggerall = var(30)= 59
triggerall =! statetype = A
triggerall = p2bodydist x < 680
trigger1 = stateno = 430 && movecontact
trigger1 = random < (ailevel*32)
trigger2 = ctrl
trigger2 = enemy,statetype = S
trigger2 = random < (ailevel*2)
value = 440



[state -1, S short]
type = changestate
triggerall = var(30)= 59
triggerall =! statetype = A
triggerall = p2bodydist x < 120
triggerall = p2statetype != A
trigger1 = stateno = 200 && movecontact
trigger1 = random < ailevel*48
value = 230


[state -1, S strong]
type = changestate
triggerall = var(30)= 59
triggerall =! statetype = A
triggerall = p2bodydist x < 300
trigger1 = stateno = 230 && movecontact
trigger1 = random < (ailevel*48)
trigger2 = stateno = 200 && movecontact
trigger2 = random < ailevel *24
value = 205


[state -1, S forward]
type = changestate
triggerall = var(30)= 59
triggerall =! statetype = A
triggerall = p2statetype != A
trigger1 = stateno = 205 && movehit
trigger1 = random < ailevel*48
value = 235

[state -1, S fierce]
type = changestate
triggerall = var(30)= 59
triggerall =! statetype = A
triggerall = p2bodydist x < 280
triggerall = p2statetype != L
trigger1 = stateno = 205 && movehit
trigger1 = random < ailevel*24
trigger2 = stateno = 235 && movehit
trigger2 = random < ailevel*48
value = 210

[state -1, S Roundhouse]
type = changestate
triggerall = var(30)= 59
triggerall =! statetype = A
triggerall = p2bodydist x < 520
trigger1 = random < (ailevel*12)
trigger1 = stateno = 210 && movehit
value = 240

[state -1, Butt Drop]
type = changestate
triggerall = var(30)= 59
triggerall = statetype = A
triggerall = p2bodydist x < 200
trigger1 = stateno = 610 && movehit
trigger1 = enemy,statetype = A
trigger1 = random < (ailevel*48)
trigger2 = enemy,statetype = L
trigger2 = random < ailevel*24
trigger2 = pos y < -300
trigger2 = ctrl
trigger3 = stateno = 640 && movehit
trigger3 = random < (ailevel*48)
value = 645

[state -1, butt drop escape]
type = changestate
triggerall = var(30) = 59
triggerall = stateno = 646
triggerall = random < (ailevel*64)
trigger1 = !movecontact || moveguarded
trigger1 = time > 6
trigger1 = var(12) > 0
value = 649

[State -1, pocket Sand/Cheese]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = stateno = 5110
triggerall = alive = 1
triggerall = p2bodydist x = [0,400]
trigger1 = random < (ailevel*12)
trigger1 = p2movetype = A
trigger2 = random < (ailevel*4)
trigger2 = p2movetype = I
trigger3 = random < (ailevel*6)
trigger3 = p2movetype = H
value = 1500

[state -1, AI grab Combo]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
triggerall = statetype = A
triggerall = p2bodydist y > -200 && p2bodydist y < 240
triggerall = p2statetype != L
triggerall = enemy,hitfall = 0
triggerall = !enemy,hitfall 
triggerall = random < ailevel * 16
triggerall = p2statetype = A
triggerall = stateno != 642
triggerall = p2movetype = H
triggerall = ctrl
trigger1 = p2bodydist x < 400
value = 831

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y > -200 && p2bodydist y < 240
triggerall = p2statetype != L
triggerall = p2statetype = A
triggerall = !enemy,hitfall 
triggerall = stateno != 642
triggerall = random < ailevel * 12
triggerall = p2movetype != H
triggerall = ctrl
trigger1 = p2bodydist x < 400
value = 830



































;===========================================================================



;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.

;---------------------------------------------------------------------------

;===========================================================================
;SUPER
[state -1, CONSUMPTION]
type = changestate
value = 3000
triggerall = command = "SUPER"  
triggerall = Statetype != A
triggerall = power > 2999
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1029]
trigger3 = movecontact
trigger4 = stateno = [1100, 1129]
trigger4 = numhelper(4000)
trigger4 = helper,movecontact
trigger5 = stateno = 1050 || stateno = 1060 

;---------------------------------------------------------------------------
;SUPER 2
[state -1, TAIL GRAB GAS TRAP]
type = changestate
value = 3040
triggerall = command = "Super2"  
triggerall = Statetype != A
triggerall = power > 999
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1029]
trigger3 = movecontact
trigger4 = stateno = [1100, 1129]
trigger4 = numhelper(4000)
trigger4 = helper(4000),movecontact
trigger5 = stateno = 1050 || stateno = 1060 

;---------------------------------------------------------------------------
;SUPER 3
[state -1, Facesit and fart super]
type = changestate
value = 3080
triggerall = command = "Super3"  
triggerall = Statetype = A
triggerall = power > 999
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1029]
trigger3 = movecontact
trigger4 = numhelper(4000)
trigger4 = helper(4000),movecontact
trigger5 = stateno = 1050 || stateno = 1060 


;---------------------------------------------------------------------------



;---------------------------------------------------------------------------
;Air Throw Normal
[State -1, Kung Fu Throw]
type = ChangeState
value = 830
triggerall = command = "throw"
triggerall = statetype = A
triggerall = enemynear,movetype != H
triggerall = stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------
;Air Throw - comboable
[State -1, Kung Fu Throw]
type = ChangeState
value = 831
triggerall = command = "throw"
triggerall = statetype = A
triggerall = enemynear,movetype = H
triggerall = stateno != 100
trigger1 = ctrl
trigger2 = var(1)


;---------------------------------------------------------------------------
;EX Belly bump
[state -1, Light Belly Bump]
type = changestate
value = 1020
triggerall = command = "QCF_ab"  
triggerall = Statetype != A
triggerall = ailevel = 0
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Light Belly bump
[state -1, Light Belly Bump]
type = changestate
value = 1000
triggerall = command = "QCF_a"  
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Hard Belly bump
[state -1, Light Belly Bump]
type = changestate
value = 1010
triggerall = command = "QCF_b"  
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)

;-----------------------------------------------------------------------------
;EX Hard Bite
[state -1, Light Belly Bump]
type = changestate
value = 1070
triggerall = command = "QCB_xy"  
triggerall = Statetype != A
triggerall = ailevel = 0
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;-----------------------------------------------------------------------------
;Light Bite
[state -1, Light Belly Bump]
type = changestate
value = 1050
triggerall = command = "QCB_x"  
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)

;-----------------------------------------------------------------------------
;Hard Bite
[state -1, Light Belly Bump]
type = changestate
value = 1060
triggerall = command = "QCB_y"  
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)


;----------------------------------------------------------------------------
;EX Burp
[state -1, Light Burp]
type = changestate
value = 1120
triggerall = command = "QCF_xy"
triggerall = numhelper(4000) < 1
triggerall = power > 499
triggerall = ailevel = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;----------------------------------------------------------------------------
;Light Burp
[state -1, Light Burp]
type = changestate
value = 1100
triggerall = command = "QCF_x"
triggerall = numhelper(4000) < 1
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;----------------------------------------------------------------------------
;Heavy Burp
[state -1, Light Burp]
type = changestate
value = 1110
triggerall = command = "QCF_y"
triggerall = numhelper(4000) < 1
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;EX Tail Grab
[state -1, Light Belly Bump]
type = changestate
value = 1220
triggerall = command = "QCB_c"  
triggerall = ailevel = 0
triggerall = Statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Low Tail Grab
[state -1, Light Belly Bump]
type = changestate
value = 1200
triggerall = command = "QCB_a"  
triggerall = ailevel = 0
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)


;---------------------------------------------------------------------------
;High Tail Grab
[state -1, Light Belly Bump]
type = changestate
value = 1210
triggerall = command = "QCB_b"  
triggerall = ailevel = 0
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = var(1)

;--------------------------------------------------------------------------
;Pocket Cheese
[state -1, Pocket Cheese]
type = changestate
value = 1500

triggerall = statetype != A
triggerall = alive = 1
triggerall = stateno = 5110
triggerall = ailevel = 0
trigger1 = canrecover = 1
trigger1 = command = "a" || command = "b" || command = "c" || command = "holda" || command = "holdb" || command = "holdc"




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
;Throw
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
trigger2 = stateno = 200 && time >= 10


;---------------------------------------------------------------------------
;Stand Med Punch
[State -1, Stand med Punch]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = stateno = 200 && movecontact
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 400 && movecontact
;---------------------------------------------------------------------------
;Stand Fierce Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 430 && movecontact

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
trigger3 = stateno = 400 && movecontact

;---------------------------------------------------------------------------
;Stand Med Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = stateno = 230 && movecontact
trigger2 = stateno = 205 && movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command != "downforward"
triggerall = ailevel = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 210 && movecontact
trigger7 = stateno = 400 && movecontact
trigger7 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
;Low Crush (Overhead)
[State -1, Low crush]
type = ChangeState
value = 238
triggerall = command = "b"
triggerall = command = "downforward"
triggerall = ailevel = 0
triggerall = stateno != 100
trigger1 = statetype != A
trigger1 = ctrl



;---------------------------------------------------------------------------
;Taunt
;[State -1, Taunt]
;type = ChangeState
;value = 195
;triggerall = command = "start"
;trigger1 = statetype != A
;trigger1 = ctrl
;----------------------------------------------------------------------------
;push block - Pelvic Thrust
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 499



;---------------------------------------------------------------------------
;Wall Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype = A
triggerall = ctrl
trigger1 = command = "tapfwd"
trigger1 = backedgebodydist < 30
trigger2 = command = "tapback"
trigger2 = frontedgebodydist < 30

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && time > 8

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = ailevel = 0
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
trigger2 = (stateno = 400) || (stateno = 430) || (stateno=235) || (stateno =200) || (stateno=230) || (stateno=205)
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


;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = command = "x"
triggerall = statetype = A
trigger1 = stateno = 600 || stateno = 630
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
trigger2 = stateno = 600 || stateno = 630 || stateno = 605 || stateno = 635
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
trigger1 = command != "holdfwd"
trigger2 = stateno = 600 && movecontact


;---------------------------------------------------------------------------
;Jump Med Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = command = "a"
triggerall = statetype = A
trigger2 = ctrl
trigger2 = command = "holdfwd"
trigger1 = stateno = 600 || stateno = 630 || stateno = 605
trigger1 = movecontact

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600  || stateno = 630 || stateno = 610 || stateno = 605 || stateno = 635
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 645
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 640 || stateno = 605 || stateno = 635
trigger2 = movecontact



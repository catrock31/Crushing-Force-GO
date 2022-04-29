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
name = "SUPER"
command = ~D,DB,B,D,DB,B, x
time = 30
buffer.time = 12

[Command]
name = "SUPER"
command = ~D,DB,B,D,DB,B, y
time = 30
buffer.time = 12

[Command]
name = "SUPER"
command = ~D,DB,B, x+z
time = 20
buffer.time = 12

[Command]
name = "SUPER"
command = ~D,DB,B, y+z
time = 20
buffer.time = 12

[Command]
name = "SUPER"
command = c+z
time = 3
buffer.time = 12

[Command]
name = "Super2"
command = ~D,D,D,x
time = 25
buffer.time = 5

[Command]
name = "Super2"
command = ~D,D,D,y
time = 25
buffer.time = 5

[Command]
name = "Super2"
command = ~D,D,x+z
time = 8
buffer.time = 5

[Command]
name = "Super2"
command = ~D,D,y+z
time = 8
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
name = "sonicboom_x"
command = ~40$B, F, x
time = 8
buffer.time = 15

[Command]
name = "sonicboom_y"
command = ~40$B, F, y
time = 8
buffer.time = 15

[Command]
name = "sonicboom_z"
command = ~40$B, F, z
time = 8
buffer.time = 15

[Command]
name = "sonicboom_z"
command = ~40$B, F, x+y
time = 8
buffer.time = 15

[Command]
name = "sonicboom_a"
command = ~40$B, F, a
time = 8
buffer.time = 15

[Command]
name = "sonicboom_b"
command = ~40$B, F, b
time = 8
buffer.time = 15

[Command]
name = "sonicboom_c"
command = ~40$B, F, c
time = 8
buffer.time = 15

[Command]
name = "sonicboom_c"
command = ~40$B, F, a+b
time = 8
buffer.time = 15

[Command]
name = "flashkick_a"
command = ~40$D, $U, a
time = 8
buffer.time = 15

[Command]
name = "flashkick_b"
command = ~40$D, $U, b
time = 8
buffer.time = 15

[Command]
name = "flashkick_c"
command = ~40$D, $U, c
time = 8
buffer.time = 15

[Command]
name = "flashkick_c"
command = ~40$D, $U, a+b
time = 8
buffer.time = 15

[Command]
name = "flashkick_x"
command = ~40$D, $U, x
time = 8
buffer.time = 15

[Command]
name = "flashkick_y"
command = ~40$D, $U, y
time = 8
buffer.time = 15

[Command]
name = "flashkick_z"
command = ~40$D, $U, z
time = 8
buffer.time = 15

[Command]
name = "flashkick_z"
command = ~40$D, $U, x+y
time = 8
buffer.time = 15


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

[Command]
name = "superjump"
command = ~D, $U
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

[Command]
name = "grab"
command = a+x
time = 3

[Command]
name = "assist"
command = b+y
time = 3

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
buffer.time = 3

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
buffer.time = 3

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
trigger2 = stateno != 241
trigger2 = stateno != 435
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = (stateno = 435) || (stateno = 436) || (stateno = 440) || (stateno = 241)
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

[state -1 Approach set]
type = varset
triggerall = ailevel
trigger1 = p2bodydist x > 800
v = 40
value = 1

[state -1, Walkback]
type = varset
triggerall = ailevel
trigger1 = p2bodydist x = [0,400]
v = 40
value = -1

[state -1 Neutral]
type = varset
triggerall = ailevel
trigger1 = p2bodydist x = [400,800]
v = 40
value = 0

[state -1, free to shoot again]
type = varset
triggerall = ailevel > 0
trigger1 = p2movetype = H
var(5) = 0

;===========================================================================
; AI behavior
;===========================================================================

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
trigger3 = !alive
v=30
value=0 
Ignorehitpause=1

[State -1, AI guarding]
Type = Changestate
triggerall = ailevel && alive
triggerall = var(30) = 59
triggerall = !(Stateno=[120,155])
triggerall = ctrl || (stateno = [100,101]) || Var(1)/100%10 = 5 && movetype != H || stateno = 52; && time
Trigger1 = Inguarddist
Trigger2 = enemynear,hitdefattr = SCA,AP,AA || enemynear,numproj 
trigger3 = numhelper(100000)
trigger3 = PlayerIDExist(helper(100000),var(3))
trigger3 = PlayerID(helper(100000),var(3)),p2bodydist x = [-130,230]
trigger3 = PlayerID(helper(100000),var(3)),hitdefattr = SCA,AP,AA || helper(100000),inguarddist
value = 120

[state -1, assertspecial]
type = assertspecial
trigger1 = ailevel
trigger1 = var(30) = 59
flag = nowalk

[state -1, Hip Check]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = ailevel > 5
triggerall = power > 249
triggerall = enemynear,animtime > -12
trigger1 = random < (ailevel * 1) && (enemy,hitdefattr = SCA,NA,NP) 
trigger2 = random < (ailevel * 6) && (enemy,hitdefattr = SCA,HA,HP) 
trigger3 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,SA,SP)
trigger4 = enemynear,stateno = [632,638]
trigger4 = random < ailevel * 12
value = 1400

[state -1, Duck, just cause]
type = null;changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = ailevel
triggerall = ctrl
triggerall = stateno != [10,12]
triggerall = stateno != [100,101]
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x = [400,800]
value = 10
persistent = 60



[state -1, AI Jump]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
trigger1 = ctrl
trigger1 = enemynear,hitdefattr = SCA,AT
trigger1 = random < ailevel * 8
trigger2 = ctrl
trigger2 = p2bodydist x = [200,600]
trigger2 = random < ailevel * ifelse(life > enemynear,life, 0, 8)
trigger3 = stateno = 100
trigger3 = random < ailevel * ifelse(life > enemynear,life, 0, 12)
trigger3 = p2bodydist x = [200,600]
trigger4 = backedgebodydist < 100
trigger4 = random < ailevel * 8
trigger4 = p2statetype = L
trigger4 = ctrl
value = 40

[state -1, AI SUPER!!]
type = changestate
triggerall = ailevel
triggerall = ailevel > 3
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !var(5)
triggerall = power > 2999
triggerall = !numhelper(4000)
trigger1 = ctrl || var(1)
trigger1 = p2bodydist x = [-300,150]
trigger1 = p2bodydist y = [-600,-200]
trigger1 = random < ailevel * 24
trigger1 = p2statetype = A
trigger1 = p2movetype = A
trigger2 = stateno = 411
trigger2 = movehit
trigger2 = random < ailevel * 18
trigger2 = p2bodydist x = [-230,150]
value = 3000

[state -1, AI SUPER!!]
type = changestate
triggerall = ailevel
triggerall = ailevel > 3
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = !var(5)
triggerall = power > 2999
triggerall = !numhelper(4000)
triggerall = p2bodydist x = [-300,175]
triggerall = p2bodydist y = [-500,200]
trigger1 = stateno = [1050,1079]
trigger1 = movehit
trigger1 = random < ailevel * 36
trigger1 = pos y < -400
value = 3005

[state -1, AI Defense Buff]
type = changestate
triggerall = ailevel
triggerall = ailevel > 3
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 999
triggerall = var(15) < 4
triggerall = stateno != 3040
triggerall = !numhelper(4000)
triggerall = !numexplod(4000)
trigger1 = ctrl
trigger1 = p2statetype = L
trigger1 = p2bodydist x > 400
trigger1 = random < ailevel * 24
trigger1 = life < floor(lifemax * 0.9)
trigger1 = enemy,name = "Jumbo Elephant"  || enemy,name = "Bertha Hippo"  || enemy,name = "Jumba Elephant"  || enemy,name = "Julian Hippo"  || enemy,name = "Makuyama"
trigger2 = ctrl
trigger2 = p2statetype = L || enemy,hitfall = 1
trigger2 = p2bodydist x > 400
trigger2 = var(15) < 3
trigger2 = random < ailevel * 24
trigger2 = life < floor(lifemax * 0.9)
trigger3 = life < floor(lifemax * 0.5)
trigger3 = enemy,life > life
trigger3 = p2statetype = L || enemy,hitfall = 1
trigger3 = ctrl
trigger3 = random < ailevel * 48
trigger3 = p2bodydist x > 400
value = 3040

[state -1, S Roundhouse]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 560]
triggerall = p2bodydist y = [-200,0]
triggerall = stateno = 100
triggerall = time > 8
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = enemynear,ctrl = 0
trigger1 = enemynear,animtime < -12
value = 245

[state -1, AI backdash]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = p2bodydist x = [0, 300]
triggerall = backedgebodydist > 100
trigger1 = p2statetype = L
trigger1 = random < ailevel * 32
trigger2 = p2movetype = A
trigger2 = enemynear,hitdefattr = S, AT
trigger2 = random < ailevel * 8
value = 105

[state -1, AI dash]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = prevstateno != 105
trigger1 = p2statetype = L 
trigger1 = random < ailevel * 24
trigger1 = backedgebodydist < 100
trigger1 = p2bodydist x < 300
trigger2 = life < enemy,life
trigger2 = random < ailevel * 2
trigger2 = p2bodydist x > 600
trigger3 = p2stateno != 0 || p2stateno != 11
trigger3 = p2movetype = I
trigger3 = p2bodydist x > 600
trigger3 = random < ailevel * 2
trigger3 = life < enemy,life
value = 100


[state -1, AI Dash Rollball]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 100
trigger1 = p2bodydist x = [0, 400]
trigger1 = random < ailevel * 4
value = 245

[state -1, AI Dash Rollball]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 100
triggerall = time > 8
triggerall = p2stateno != [660,669]
trigger1 = p2statetype != L
trigger1 = random < ailevel * 24
trigger1 = p2bodydist x = [0, 250]
trigger2 = p2statetype != L
trigger2 = p2bodydist x = [0, 400]
trigger2 = random < ailevel * 4
value = 436

[State -1, EX Shield Bash] ;by Inktrebuchet
type = ChangeState
value = 1120
triggerall = ailevel  
triggerall = ctrl
triggerall = var(30) = 59
triggerall = power > 499
triggerall = !numexplod(9998) 
triggerall = p2statetype != L
triggerall = statetype != A 
triggerall = p2bodydist x = [0, 900]
triggerall = p2bodydist y = [-300, 0]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -550 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 0 ;5= startup time
;trigger1 = enemynear,animtime < -8

[state -1, Anti Air Missile Homing]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 499
triggerall = !numexplod(9998) 
triggerall = !var(5)
triggerall = ctrl
trigger1 = random < ailevel * 12
trigger1 = p2bodydist x > 400
trigger1 = enemynear,statetype = L
value = 1170

[state -1, EX Missile]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !numhelper(1000)
triggerall = !var(5)
triggerall = p2statetype != L
triggerall = power > 499
triggerall = !numexplod(9998)
triggerall = p2bodydist x = [0, 1250]
triggerall = p2bodydist y = [-250, 0]
triggerall = prevstateno != 5120
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 8
value = 1020

[state -1, Panacea Summon]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = var(32) > 0
triggerall = !numhelper(4000)
triggerall = !numexplod(4000)
triggerall = !numexplod(4999)
triggerall = p2bodydist x = [0, 650]
triggerall = p2bodydist y = [-300, 0]
triggerall = p2stateno != [660,669]
triggerall = ctrl
triggerall = life > floor(lifemax * 0.25)
trigger1 = p2statetype = L
trigger1 = random < ailevel * 8
trigger2 = p2statetype = S
trigger2 = random < ailevel * 4
trigger2 = !inguarddist
trigger2 = var(32) > floor(var(34) * 0.5)
value = 1200


[state -1, Rocket Shield Light]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !numexplod(9998) 
triggerall = p2statetype != L
trigger1 = p2bodydist x = [0, 775]
triggerall = p2bodydist y = [-300, 0]
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = enemynear,numproj > 0
trigger1 = enemynear,animtime < -12
trigger1 = !enemynear,ctrl
trigger2 = enemynear,numproj > 0
trigger2 = random < ailevel * 12
trigger2 = ctrl
trigger2 = enemynear,animtime < -15
value = 1100

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1100
triggerall = ailevel  
triggerall = ctrl
triggerall = var(30) = 59
triggerall = !numexplod(9998) 
triggerall = p2statetype != L
triggerall = statetype != A 
;triggerall = p2bodydist x = [0, 775]
triggerall = p2bodydist y = [-300, 0]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -550 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 10 ;5= startup time
;trigger1 = enemynear,animtime < -12

[state -1, Rocket Shield Heavy]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = !numexplod(9998) 
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 1200]
triggerall = p2bodydist y = [-300, 0]
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = enemynear,numproj > 0
trigger1 = enemynear,animtime < -15
trigger2 = stateno = 405
trigger2 = movehit
trigger2 = random < ailevel * 18
trigger3 = stateno = 210
trigger3 = movehit
trigger3 = random < ailevel * 36
trigger4 = stateno = 440
trigger4 = movehit
trigger4 = numtarget(441)
trigger4 = random < ailevel * 24
value = 1110

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1110
triggerall = ailevel  
triggerall = ctrl
triggerall = !numexplod(9998) 
triggerall = var(30) = 59
triggerall = statetype != A 
triggerall = p2statetype != L
;triggerall = p2bodydist x = [0, 1200]
triggerall = p2bodydist y = [-300, 0]
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -550 ; Avoid attempt to counter projectiles that are to high. 100 = char height
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 8 ;5= startup time
;trigger1 = enemynear,animtime < -14

[state -1, EX Rocket Roll]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !numexplod(9998) 
triggerall = p2bodydist x = [0,625]
triggerall = p2bodydist y = [-750,0]
triggerall = power > 499
trigger1 = ctrl
trigger1 = prevstateno = 5120
trigger1 = p2movetype = A
trigger1 = random < ailevel * 32
trigger2 = ctrl
trigger2 = enemynear,hitdefattr = SCA,ST,HT
trigger2 = random < ailevel * ifelse(statetype = C, 24, 4)
trigger3 = prevstateno = 1400
trigger3 = ctrl
trigger3 = p2movetype = A
trigger3 = random < ailevel * 24
value = 1070

[state -1, Heavy Rocket Roll]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !numexplod(9998) 
triggerall = p2bodydist x = [0,480]
triggerall = p2bodydist y = [-700,0]
trigger1 = ctrl
trigger1 = p2movetype = A
trigger1 = p2statetype = A
trigger1 = random < ailevel * ifelse(statetype = C, 15, 3)
trigger2 = ctrl
trigger2 = p2statetype = A
trigger2 = random < ailevel * ifelse(statetype = C, 4, 1)
trigger3 = enemynear,stateno = [700,799]
trigger3 = ctrl
trigger3 = enemynear,animtime > -4
trigger3 = random < ailevel * ifelse(statetype = C, 15, 3)
trigger4 = stateno = 405
trigger4 = random < ailevel * 18
trigger4 = movehit
trigger4 = p2bodydist x < ifelse(p2statetype = C, 260,300)
trigger5 = var(1) 
trigger5 = movehit
trigger5 = p2movetype = A
trigger5 = random < ailevel * ifelse(statetype = C, 32, 8)
trigger6 = stateno = 440
trigger6 = movehit
trigger6 = numtarget(441)
trigger6 = random < ailevel * 24
value = 1060

[state -1, Light Rocket Roll]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !numexplod(9998) 
triggerall = p2bodydist x = [0,420]
triggerall = p2bodydist y = [-550,0]
trigger1 = ctrl
trigger1 = p2movetype = A
trigger1 = p2statetype = A
trigger1 = p2bodydist y < -150
trigger1 = random < ailevel * ifelse(statetype  = C, 15, 3)
trigger2 = ctrl
trigger2 = p2statetype = A
trigger2 = random < ailevel * ifelse(statetype = C, 8, 2)
trigger2 = p2bodydist y < -150
value = 1050

[state -1, Anti Air Missile Low angle]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !numexplod(9998) 
triggerall = !var(5)
triggerall = numhelper(1150) < 3
triggerall = p2bodydist x = [500,2000]
triggerall = p2bodydist y < -200
triggerall = p2statetype = A
trigger1 = ctrl
trigger1 = random < ailevel * ifelse(statetype = C, 12, 3)
trigger2 = p2stateno = [670,679]
trigger2 = ctrl
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x > 500
value = 1150

[state -1, Anti Air Missile Steep angle]
type = changestate
triggerall = ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !numexplod(9998) 
triggerall = !var(5)
triggerall = numhelper(1150) < 3
triggerall = p2bodydist x = [0,500]
triggerall = p2bodydist y < -200
triggerall = p2statetype = A
trigger1 = ctrl
trigger1 = random < ailevel * ifelse(statetype = C, 15,4)
trigger2 = p2stateno = [670,679]
trigger2 = ctrl
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x =[0, 500]
value = 1160

[state -1, Light Missile]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !var(5)
triggerall = !numhelper(1000)
triggerall = !numexplod(9998)
triggerall = prevstateno != 5120
triggerall = p2bodydist x = [0, 1250]
triggerall = p2bodydist y = [-250, 0]
trigger1 = ctrl
trigger1 = random < ailevel * 6
trigger1 = !inguarddist
trigger1 = p2bodydist x > 400
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger2 = p2bodydist x < 180
trigger3 = p2bodydist x > 300
trigger3 = p2statetype = L
trigger3 = ctrl
trigger3 = random < ailevel * 24
trigger4 = ctrl
trigger4 = p2bodydist x > 800
trigger4 = random < ailevel * 4
trigger5 = ctrl
trigger5 = stateno = 11
trigger5 = !inguarddist
trigger5 = p2movetype = I
trigger5 = random < ailevel * 12
value = 1000

[state -1, Heavy Missile]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = !numhelper(1000)
triggerall = !var(5)
triggerall = !numexplod(9998)
triggerall = prevstateno != 5120
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 1250]
triggerall = p2bodydist y = [-250, 0]
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = !inguarddist
trigger1 = p2bodydist x > 400
trigger2 = stateno = 210
trigger2 = movehit
trigger2 = random < ailevel * 18
trigger2 = p2bodydist x >= 180
trigger3 = ctrl
trigger3 = p2bodydist x > 800
trigger3 = random < ailevel * 16
trigger4 = stateno = 405
trigger4 = movehit
trigger4 = p2bodydist x > 230
trigger4 = random < ailevel * 12
value = 1010

[state -1, C Jab]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0,300]
triggerall = p2bodydist y = [-180,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = !inguarddist
trigger2 = enemynear, animtime < -6
trigger2 = ctrl
trigger2 = random < ailevel * 12
trigger3 = random < ailevel * 36
trigger3 = numtarget(436)
trigger3 = ctrl
trigger4 = numtarget(240)
trigger4 = ctrl
trigger4 = random < ailevel * 24
trigger5 = random < ailevel * 32
trigger5 = p2movetype = I
trigger5 = ctrl
value = 400

[state -1, J Jab]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0,290]
triggerall = p2bodydist y = [-270,350]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger1 = !inguarddist
trigger1 = p2statetype = A
trigger2 = stateno = 600
trigger2 = movecontact
trigger2 = random < ailevel * 15
value = 600



[state -1, S Jab]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0,250]
triggerall = p2bodydist y = [-250,0]
triggerall = p2statetype != L
trigger1 = random < ailevel * 8
trigger1 = ctrl
trigger1 = !inguarddist
trigger2 = enemynear,animtime < -6
trigger2 = ctrl
trigger2 = random < ailevel * 18
trigger2 = p2statetype != C
trigger3 = random < ailevel * 32
trigger3 = p2movetype = I
trigger3 = ctrl
value = 200

[state -1, 2nd S Jab]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = stateno = 200
trigger1 = movecontact
trigger1 = p2bodydist x < 220
trigger1 = random < ailevel * 32
value = 201

[state -1, AI C Short]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype = L
triggerall = p2bodydist x = [0, 285]
triggerall = p2bodydist y = [-100, 0]
trigger1 = p2statetype = S
trigger1 = random < ailevel * 8
trigger1 = ctrl 
trigger1 = !inguarddist
trigger2 = stateno = 400
trigger2 = movecontact
trigger2 = random < ailevel * 24
value = 430

[state -1, J Short]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0,320]
triggerall = p2bodydist y = [-320,290]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = !inguarddist
trigger1 = p2statetype = A
trigger2 = stateno = 600
trigger2 = movecontact
trigger2 = random < ailevel * 32
value = 630

[state -1, C Strong]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 400]
triggerall = p2bodydist y = [-200, 0]
trigger1 = stateno = 430
trigger1 = moveguarded
trigger1 = random < ailevel * 4
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < ailevel * 42
trigger3 = stateno = 400
trigger3 = movehit
trigger3 = random < ailevel * 24
value = 405

[state -1, C Forward]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 500]
triggerall = p2bodydist y = [-300, 0]
trigger1 = stateno = 405
trigger1 = movehit
trigger1 = random < ailevel * 36
trigger2 = stateno = 430
trigger2 = random < ailevel *12
trigger2 = movehit
value = 435

[state -1, S Short]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 260]
triggerall = p2bodydist y = [-100,0]
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = !inguarddist
trigger2 = stateno = 201
trigger2 = movecontact
trigger2 = random < ailevel * 40
trigger3 = stateno = 200
trigger3 = p2bodydist x > 220
trigger3 = movecontact
trigger3 = p2movetype != A
trigger3 = random < ailevel * 40
trigger4 = p2statetype = C
trigger4 = ctrl
trigger4 = enemynear,animtime < -6
trigger4 = random < ailevel * 30
value = 230

[state -1, S Fierce]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 585]
triggerall = p2bodydist y = [-250,0]
triggerall = enemynear,stateno != [700,799]
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = p2bodydist x > 400
trigger1 = !inguarddist
trigger2 = numhelper(1000)
trigger2 = ctrl
trigger2 = random < ailevel * 12
trigger2 = helper(1000),movecontact
trigger3 = numhelper(1000)
trigger3 = ctrl
trigger3 = random < ailevel * 4
trigger3 = enemynear,ctrl = 0
trigger4 = numexplod(9998)
trigger4 = enemynear,ctrl = 0
trigger4 = ctrl
trigger4 = random < ailevel * 4
trigger4 = !inguarddist
value = 215

[state -1, S Fierce]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 350]
triggerall = p2bodydist y = [-250,0]
trigger1 = ctrl
trigger1 = random < ailevel * 4
trigger1 = enemynear,animtime < - 10
trigger1 = !enemynear,ctrl 
trigger1 = !inguarddist
trigger2 = stateno = 230
trigger2 = movehit
trigger2 = random < ailevel * 36
trigger3 = stateno = [200,201]
trigger3 = movehit
trigger3 = p2bodydist y < -100
trigger3 = random < ailevel * 40
trigger4 = stateno = 201
trigger4 = p2bodydist y < -100
trigger4 = movehit
trigger4 = random < ailevel * 24
trigger5 = stateno = 435
trigger5 = movehit
trigger5 = p2bodydist x > -280
trigger5 = random < ailevel * 24
value = 210


[state -1, C Fierce]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [-100, 230]
triggerall = p2bodydist y = [-550,0]
trigger1 = ctrl
trigger1 = random < ailevel * ifelse(statetype = C, 30, 12)
trigger1 = p2statetype = A
trigger1 = p2movetype = A
trigger2 = stateno = 405
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger3 = random < ailevel * 18
trigger3 = stateno = 230 
trigger3 = movehit
trigger4 = stateno = 435
trigger4 = movehit
trigger4 = random < ailevel * 32
trigger5 = stateno = 201
trigger5 = movehit
trigger5 = p2statetype = A
trigger5 = random < ailevel * 24
value = 410

[state -1, J Fierce]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [-40,380]
triggerall = p2bodydist y = [-240,380]
trigger1 = ctrl
trigger1 = random < ailevel * 32
trigger1 = vel y > 0
trigger1 = p2statetype != A
trigger2 = ctrl
trigger2 = p2statetype = A
trigger2 = random < ailevel * 4
trigger3 = stateno = 630
trigger3 = movehit
trigger3 = random < ailevel * 32
value = 610

[state -1, S Roundhouse]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 560]
triggerall = p2bodydist y = [-200,0]
trigger1 = ctrl
trigger1 = random < ailevel * 2
trigger1 = enemynear,ctrl = 0
trigger1 = p2statetype != A
trigger2 = (stateno = 230)  || (stateno = 430)
trigger2 = movecontact
trigger2 = random < ailevel
trigger3 = (stateno = 230) || (stateno = 430)
trigger3 = moveguarded
trigger3 = random < ailevel * 4
value = 240

[state -1, S Roundhouse]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 420]
triggerall = p2bodydist y = [-100,0]
trigger1 = ctrl
trigger1 = random < ailevel *2 
trigger1 = p2statetype = S
trigger2 = stateno = 435
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger3 = stateno = 230
trigger3 = random < ailevel * 18
trigger3 = movehit
value = 440

[state -1, J Roundhouse]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0,380]
triggerall = p2bodydist y = [-230,380]
trigger1 = ctrl
trigger1 = random < ailevel * 18
trigger1 = vel y > 0
trigger1 = p2statetype != A
trigger2 = ctrl
trigger2 = p2statetype = A
trigger2 = random < ailevel * 12
trigger3 = stateno = 630
trigger3 = movehit
trigger3 = random < ailevel * 24
value = 640

[state -1, J Iron Ball]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [-120,120]
triggerall = p2bodydist y = [0,600]
triggerall = enemynear,stateno != [660,669]
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger1 = vel y > 0
trigger1 = p2statetype != A
trigger1 = enemy,ctrl = 0
value = 650

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y = [-400, 370]
triggerall = p2statetype = A
triggerall = stateno != [410,415]
triggerall = !numtarget(410)
triggerall = !enemynear,hitfall
triggerall = p2bodydist x =[0, 220]
triggerall = !moveguarded
trigger1 = random < ailevel * 12
trigger1 = ctrl
value = 830

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y = [-400, 370]
triggerall = p2statetype = A
triggerall = stateno != 240
triggerall = !numtarget(410)
triggerall = !enemynear,hitfall
triggerall = p2bodydist x =[0, 220]
trigger1 = random < ailevel * 4
trigger1 = movehit
trigger1 = stateno = 600 || stateno = 630
value = 831

[state -1, Grab]
type = changestate
triggerall = Ailevel
triggerall = var(30) = 59
triggerall = statetype != A 
triggerall = p2statetype != L
triggerall = ctrl
triggerall = enemynear,movetype != H 
triggerall = p2bodydist x = [0,175]
triggerall = p2bodydist y = [-100,0]
trigger1 = Random < Ailevel * 8
trigger2 = Random < Ailevel * 12
trigger2 = p2stateno = [120,130]
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*12)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel * ifelse(statetype = C, 24,12)
trigger5 = p2stateno = 52
trigger5 = random < ailevel * 12
trigger6 = random < ailevel * 24
trigger6 = backedgebodydist < 230
trigger7 = random < ailevel * 12
trigger7 = p2statetype = C
value = 800

[state -1, Walk fwd]
type = changestate
triggerall = ailevel && alive
triggerall = var(30) = 59
triggerall = ctrl
triggerall = !inguarddist
triggerall = statetype != A
triggerall = stateno != 20
trigger1 = var(40) = 1
trigger1 = random < ailevel * 12
value = 25

[state -1, Crouch]
type = changestate
triggerall = ailevel && alive
triggerall = var(30) = 59
triggerall = ctrl
triggerall = roundstate = 2
triggerall = !inguarddist
triggerall = statetype != A
triggerall = p2statetype != L
trigger1 = var(40) = 0
value = 11



[state -1, Walk back]
type = changestate
triggerall = ailevel && alive
triggerall = var(30) = 59
triggerall = ctrl
triggerall = !inguarddist
triggerall = statetype != A
triggerall = stateno != 20
trigger1 = var(40) = -1
trigger1 = random < ailevel * 12
value = 26

;===========================================================================
;---------------------------------------------------------------------------
;Supers
[state -1, Armored Anti Air Assault]
type = changestate
triggerall = !ailevel
triggerall = Statetype != A
triggerall = power > 2999
triggerall = command = "SUPER"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numhelper(1000)
trigger3 = helper(1000),movecontact
trigger4 = stateno = [1100,1129]
trigger4 = movecontact
value = 3000

[state -1, Armored Anti Air Assault]
type = changestate
triggerall = !ailevel
triggerall = Statetype = A
triggerall = power > 2999
triggerall = command = "SUPER"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numhelper(1000)
trigger3 = helper(1000),movecontact
trigger4 = stateno = [1100,1129]
trigger4 = movecontact
trigger5 = stateno = [1050,1079]
trigger5 = movecontact
value = 3005

;-----------------------------------------------------------------------------
;Fortify
[state -1, Fortify]
type = changestate
triggerall = !ailevel
triggerall = Statetype != A
triggerall = power > 999
triggerall = command = "Super2"
triggerall = var(15) < 4
triggerall = !numhelper(4000)
triggerall = !numexplod(4000)
triggerall = stateno != 3040
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numhelper(1000)
trigger3 = helper(1000),movecontact
trigger4 = stateno = [1100,1129]
trigger4 = movecontact
trigger5 = stateno = [1050,1079]
trigger5 = movecontact
trigger6 = numhelper(1150)
trigger6 = helper(1160),movecontact
value = 3040

;---------------------------------------------------------------------------
;Specials
;--------------------------------------------------------------------------
[State -1, Missile EX]
type = ChangeState
value = 1020
triggerall = command = "sonicboom_z"
triggerall = statetype != A
triggerall = !ailevel
triggerall = !numhelper(1000)
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Missile Light
[State -1, Missile Light]
type = ChangeState
value = 1000
triggerall = command = "sonicboom_x"
triggerall = !ailevel
triggerall = statetype != A
triggerall = !numhelper(1000)
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Missile Heavy
[State -1, Missile Heavy]
type = ChangeState
value = 1010
triggerall = command = "sonicboom_y"
triggerall = !ailevel
triggerall = statetype != A
triggerall = !numhelper(1000)
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
[state -1, Rocket Ball EX]
type = changestate
value = 1070
triggerall = command = "flashkick_c"
triggerall = !ailevel
triggerall = power > 499
triggerall = statetype != A
trigger1 = ctrl || stateno = 40
trigger2 = var(1)
;---------------------------------------------------------------------------
[state -1, Rocket Ball light]
type = changestate
value = 1050
triggerall = command = "flashkick_a"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl || stateno = 40
trigger2 = var(1)

;---------------------------------------------------------------------------
[state -1, Rocket Ball Heavy]
type = changestate
value = 1060
triggerall = command = "flashkick_b"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl || stateno = 40
trigger2 = var(1)

;---------------------------------------------------------------------------
;Rocket Shield EX
[State -1, Rocket Shield Light]
type = ChangeState
value = 1120
triggerall = power > 499
triggerall = command = "sonicboom_c"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Rocket Shield Light
[State -1, Rocket Shield Light]
type = ChangeState
value = 1100
triggerall = command = "sonicboom_a"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Rocket Shield Light
[State -1, Rocket Shield Light]
type = ChangeState
value = 1110
triggerall = command = "sonicboom_b"
triggerall = !ailevel
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)


;--------------------------------------------------------------------------
;Anti-Air Missile Homing
[State -1, Missile Light]
type = ChangeState
value = 1170
triggerall = command = "flashkick_z"
triggerall = !ailevel
triggerall = statetype != A
triggerall = power > 499
triggerall = numhelper(1170) < 2
trigger1 = ctrl || stateno = 40
trigger2 = var(1) ;Use combo condition (above)
;--------------------------------------------------------------------------
;Anti-Air Missile Low
[State -1, Missile Light]
type = ChangeState
value = 1150
triggerall = command = "flashkick_x"
triggerall = !ailevel
triggerall = statetype != A
triggerall = numhelper(1150) < 3
trigger1 = ctrl || stateno = 40
trigger2 = var(1) ;Use combo condition (above)

;--------------------------------------------------------------------------
;Anti-Air Missile Steep
[State -1, Missile Light]
type = ChangeState
value = 1160
triggerall = command = "flashkick_y"
triggerall = !ailevel
triggerall = statetype != A
triggerall = numhelper(1150) < 3
trigger1 = ctrl || stateno = 40
trigger2 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
[state -1, Panacea Breast Splash]
type = changestate
value = 1200
triggerall = command = "assist"
triggerall = !ailevel
triggerall = var(32) > 0
triggerall = !numhelper(4000)
triggerall = !numexplod(4000)
triggerall = !numexplod(4999)
trigger1 = ctrl 








;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !ailevel
trigger1 = command = "FF" || (command = "dash" && command != "holdback")
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !ailevel
trigger1 = command = "BB" || (command = "dash" && command = "holdback")
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 41
triggerall = !ailevel
trigger1 = command = "superjump"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Hip Toss & ball
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = !ailevel
triggerall = command = "grab"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------
;Hip Toss & ball
[State -1, Kung Fu Throw]
type = ChangeState
value = 830
triggerall = !ailevel
triggerall = command = "grab"
triggerall = statetype = A
triggerall = stateno != [410,419]
trigger1 = ctrl

;---------------------------------------------------------------------------
;Hip Toss & ball
[State -1, Kung Fu Throw]
type = ChangeState
value = 831
triggerall = !ailevel
triggerall = command = "grab"
triggerall = statetype = A
trigger1 = var(1)

;---------------------------------------------------------------------------

;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = !ailevel 
triggerall = stateno = [150,155]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = command = "holdback"
trigger1 = power > 249



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
;Spinning Backhand
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = !ailevel
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 201) || (stateno = 230) || (stateno = 400) || (stateno = 430) || (stateno = 405)
trigger2 = movecontact


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = !ailevel
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 201) || (stateno = 230) || (stateno = 400) || (stateno = 430) || (stateno = 405)
trigger2 = movecontact
trigger3 = (stateno = 435) || (stateno = 436)
trigger3 = movehit

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
trigger2 = (stateno = 200) || (stateno = 201) || (stateno = 400)
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
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 400)  || (stateno = 430) || (stateno = 201) 
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
triggerall = !ailevel
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 405
triggerall = !ailevel
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = (stateno = 200) || (stateno = 201) || (stateno = 400) || (stateno = 230) || (stateno = 430)
trigger1 = movecontact

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
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 405) || (stateno = 200) || (stateno = 201) || (stateno = 230) 
trigger2 = movecontact
trigger3 = (stateno = 435) || (stateno = 436)
trigger3 = movehit

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = !ailevel
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = command != "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 435
triggerall = !ailevel
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype = C
trigger1 = command = "holdfwd"
trigger1 = ctrl
trigger2 = (stateno = 430) || stateno = (405) || (stateno = 230)
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
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 405) || (stateno = 200)  || (stateno = 201)  || (stateno = 230)
trigger2 = movecontact
trigger3 = (stateno = 435)
trigger3 = movehit

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = !ailevel
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
triggerall = !ailevel
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
triggerall = !ailevel
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
trigger1 = command != "holdup"
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact

;---------------------------------------------------------------------------
;Ball Curl
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = !ailevel
triggerall = command = "b"
trigger1 = statetype = A
triggerall = command = "holdup"
trigger1 = ctrl
trigger2 = stateno = 610
trigger2 = movecontact



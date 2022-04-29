 ; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:  -ticks)
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
command = ~D,DB,B,D,DB,B, x
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = ~D,DB,B,D,DB,B, y
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = ~D, DB, B, x+z
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = ~D, DB, B, y+z
time = 20
buffer.time = 8

[Command]
name = "SUPER"
command = c+z
time = 1
buffer.time = 8


[Command]
name = "super2"
command = ~D, DF, F, D, DF, F, x
time = 20
buffer.time = 8

[Command]
name = "super2"
command = ~D, DF, F, D, DF, F, y
time = 20
buffer.time = 8

[Command]
name = "super2"
command = ~D, DF, F, x+z
time = 20
buffer.time = 8

[Command]
name = "super2"
command = ~D, DF, F, y+z
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
name = "upper_xy"
command = ~F, D, DF, z
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
name = "QCB_xy"
command = ~D, DB, B, z

[Command]
name = "QCF_a"
command = ~D, DF, F, a
buffer.time = 8

[Command]
name = "QCF_b"
command = ~D, DF, F, b
buffer.time = 8

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b
buffer.time = 8

[Command]
name = "QCF_ab"
command = ~D, DF, F, c
buffer.time = 8


[Command]
name = "QCB_a"
command = ~D, DB, B, a

[Command]
name = "QCB_b"
command = ~D, DB, B, b

[Command]
name = "QCB_c"
command = ~D, DB, B, c
buffer.time = 12


[Command]
name = "QCB_c"
command = ~D, DB, B, a+b
buffer.time = 12



[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_ab"
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
buffer.time = 1

[Command]
name = "recovery";Required (do not remove)
command = z
time = 1
buffer.time = 1

[Command]
name = "grab"
command = x+a
time = 1
buffer.time = 1

[Command]
name = "dodge"
command = y+b
time = 1
buffer.time = 1

[Command]
name = "holddodge"
command = /y+b
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
name = "b"
command = b
time = 1
buffer.time = 1

[Command]
name = "holdb"
command = /b
time = 1
buffer.time = 1

[Command]
name = "c"
command = c
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
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])  ||(stateno = [600,699])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = stateno != 638
trigger2 = stateno != 639
trigger2 = stateno != 410
trigger2 = stateno != 215
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 241
trigger4 = movecontact
trigger5 = stateno = 410
trigger5 = movehit
trigger6 = stateno = 215
trigger6 = movehit
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

[state -1, Chest Check]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = power > 999
triggerall = ailevel > 5
trigger1 = random < (ailevel * 1) && (enemy,hitdefattr = SCA, NA)
trigger2 = random < (ailevel * 12) && (enemy,hitdefattr = SCA,HA ||enemy,hitdefattr = SCA, HP)
trigger3 = random < (ailevel * 4) && (enemy,hitdefattr = SCA,SA)
value = 1400

;Wall Jump
[State -1, wall Jump]
type = ChangeState
triggerall = var(30) = 59
triggerall = ctrl
triggerall = pos y < -200
triggerall = stateno != 55
triggerall = statetype = A
triggerall = time > 4
trigger1 = backedgebodydist < 30
trigger1 = random < ailevel * 12
trigger2 = frontedgebodydist < 30
trigger2 = random < ailevel * 12
value = 55

[state -1, Maximum Bunny Super]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = power > 2999
triggerall = p2statetype != L
triggerall = p2stateno != [700,799]
triggerall = p2stateno != [1400,1420]
trigger1 = ctrl || var(1)
trigger1 = !inguarddist
trigger1 = enemynear,animtime < -18
trigger1 = enemynear,ctrl = 0
trigger1 = enemynear,movetype = I
trigger1 = random < ailevel * 8
trigger2 = stateno = 610
trigger2 = movehit
trigger2 = numtarget(610)
trigger2 = random < ailevel * 48
trigger2 = var(7) > 0
trigger3 = backedgebodydist < 360
trigger3 = stateno = 240
trigger3 = movehit
trigger3 = random < ailevel * 12
trigger4 = ctrl || var(1)
trigger4 = numtarget(1103) || numtarget(1123)
trigger4 = random < ailevel * 24
trigger5 = stateno = 1001 || stateno = 1011
trigger5 = movehit
trigger5 = random < ailevel * 18
trigger5 = vel Y < 0
trigger6 = numtarget(1050) || numtarget(1060)
trigger6 = random < ailevel * 24
trigger6 = (stateno = 1050) || (stateno = 1060)
trigger6 = movehit
value = 3000

[state -1, ZigZag Super]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = power > 999
triggerall = p2stateno != [700,799]
triggerall = p2bodydist x = [50,500]
triggerall = p2bodydist y = [-120,0]
triggerall = p2statetype != L
triggerall = (power < 2500) || (enemynear,life < floor(enemynear,lifemax * 0.25))
trigger1 = ctrl || var(1)
trigger1 = random < ailevel * 2
trigger1 = enemynear,animtime < -12
trigger1 = enemynear,ctrl = 0
trigger1 = !inguarddist
trigger2 = random < ailevel * 12
trigger2 = (stateno = 241)  || (stateno = 210) 
trigger2 = movehit
trigger3 = (stateno = 1000) || (stateno = 1010)
trigger3 = movehit
trigger3 = random < ailevel * 6
trigger4 = enemynear,movetype = I
trigger4 = enemynear,ctrl = 0
trigger4 = enemynear,animtime < -12
trigger4 = random < ailevel * 6
trigger4 = !inguarddist
trigger4 = ctrl
value = 3040

[state -1, ZigZag Super]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 3
triggerall = power > 999
triggerall = p2stateno != [700,799]
triggerall = p2bodydist x = [50,500]
triggerall = p2bodydist y = [-120,0]
triggerall = p2statetype != L
trigger1 = ctrl || var(1)
trigger1 = random < ailevel * 2
trigger1 = enemynear,ctrl = 0
trigger1 = enemynear,animtime < -12
trigger1 = !inguarddist
trigger2 = random < ailevel * 18
trigger2 = (stateno = 240)
trigger2 = movehit
trigger3 = (stateno = [1000,1001]) || (stateno = [1010,1011]) || (stateno = [1020,1021])
trigger3 = movehit
trigger3 = random < ailevel * 6
trigger4 = enemynear,numproj != 0
trigger4 = ctrl || var(1)
trigger4 = random < ailevel * 12
trigger4 = enemynear,ctrl = 0
trigger5 = stateno = 1112
trigger5 = movehit
trigger5 = enemynear,hitfall = 0
trigger5 = random < ailevel * 24
value = 3039


[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1070
triggerall = var(30) = 59 
triggerall = ailevel > 3
triggerall = power > 499
triggerall = p2bodydist y = [-200,100]
triggerall = p2bodydist x = [-100,200]
triggerall = stateno != 240
trigger1 = prevstateno = 5120
trigger1 = p2movetype = A
trigger1 = random < ailevel * 24
trigger1 = ctrl
trigger2 = prevstateno = 5120
trigger2 = random < ailevel * 2
trigger2 = ctrl
trigger3 = (stateno = 205) || (stateno = 235) || (stateno = 430) || (stateno = 210) || (stateno = 200) || (stateno = 400)
trigger3 = movehit
trigger3 = enemynear,movetype = A
trigger3 = random < ailevel * 8
trigger4 = enemynear,movetype = A
trigger4 = random < ailevel * 4
trigger4 = ctrl
trigger4 = statetype != A
trigger5 = stateno = 635
trigger5 = movehit
trigger5 = animelemtime(12) > 0
trigger5 = random < ailevel * 12
trigger5 = enemynear,life <= floor(enemynear,lifemax  * 0.333)
trigger6 = statetype = A
trigger6 = enemynear,hitdefattr = A,HT
trigger6 = random < ailevel * 36
trigger6 = ctrl || var(1)
trigger7 = statetype = A
trigger7 = enemynear,hitdefattr = S,HT
trigger7 = random < ailevel * 24
trigger7 = ctrl || var(1)



[state -1, Dodge Stance]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
trigger1 = ctrl || var(1)
trigger1 = enemy,numproj > 0 || enemy,hitdefattr = SCA,NP,SP,HP
trigger1 = random < (ailevel*32)
value = 1200

[State -1, Whirlwind Kick Light] ;by Inktrebuchet
type = ChangeState
value = 1220
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1200
triggerall = vel y > 0
triggerall = pos y > -vel y
triggerall = var(13) < 5
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,30] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.


[state -1, Dodge Stance]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 2
triggerall = var(12) > 0
triggerall = p2bodydist y = [-800,800]
triggerall = p2bodydist x = [-300,300]
triggerall = p2movetype = A
triggerall = p2movetype != I
triggerall = ctrl 
trigger1 = !inguarddist
trigger1 = random < ailevel * 8
trigger2 = enemy,ailevel
trigger2 = enemy,hitdefattr = SCA, HP, HT, HA, ST
trigger2 = ctrl
trigger2 = random < ailevel * 32
trigger3 = enemy,ailevel
trigger3 = enemy,hitdefattr = SCA, SP,SA
trigger3 = ctrl
trigger3 = random < ailevel * 12
value = 1210

[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1200
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -350 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,12] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.

[state -1, AI Dashing Elbow]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = power > 499
triggerall = p2statetype != L
triggerall = p2bodydist x = [-100,750]
triggerall = p2bodydist y = [-280,0]
trigger1 = numtarget(240)
trigger1 = random < ailevel * 12
trigger1 = stateno = 241
trigger1 = power > 1200
trigger2 = ctrl
trigger2 = stateno = 210  & animelemtime(6) > 0
trigger2 = movehit
trigger2 = random < ailevel * 24
trigger2 = power > 1200
value = 1020

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

[state -1, AI jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S || Statetype = C
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
triggerall = numenemy
triggerall = ctrl
trigger1 = enemy,hitdefattr = S,AT
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger2 = p2bodydist x = [385, 530]
trigger2 = random < ailevel * 6
trigger2 = ctrl
trigger3 = backedgebodydist < 50
trigger3 = random < (ailevel*32)
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

;=======================================
;Running Stance Activations
;=======================================

[state -1, AI Running Stance - EX]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = var(6) > 1
triggerall = power > 499
triggerall = p2stateno != [5100,5120]
trigger1 = p2bodydist x < 250
trigger1 = ctrl
trigger1 = random< ailevel * 2
trigger1 = prevstateno = 5120
trigger1 = !inguarddist 
trigger4 = p2bodydist x = [-1000,-10]
trigger4 = ctrl
trigger4 = random < ailevel * 8
value = 1140

[state -1, AI Running Stance - Heavy]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = var(6) > 1
triggerall = p2stateno != [5100,5120]
trigger1 = ctrl
trigger1 = random< ailevel * 8
trigger1 = !inguarddist
trigger1 = p2bodydist x > 600
trigger2 = p2bodydist x > 400
trigger2 = ctrl
trigger2 = p2statetype = L
trigger2 = random < ailevel * 24
trigger3 = p2movetype = I
trigger3 = enemy,ctrl = 0
trigger3 = !inguarddist
trigger3 = random < ailevel * 4
trigger3 = ctrl
trigger4 = p2bodydist x = [-1000,-250]
trigger4 = ctrl
trigger4 = random < ailevel * 24
value = 1120

[state -1, AI Running Stance - Light]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = var(6) > 1
triggerall = p2stateno != [5100,5120]
trigger1 = ctrl
trigger1 = random< floor(ailevel * 6)
trigger1 = !inguarddist
trigger1 = p2bodydist x > 600
trigger2 = numtarget(240)
trigger2 = random < ailevel * 24
trigger2 = stateno = 241
trigger3 = stateno = 210
trigger3 = animelemtime(6) > 0
trigger3 = movehit
trigger3 = random < ailevel * 24
trigger4 = p2bodydist x = [-750,-10]
trigger4 = ctrl
trigger4 = random < ailevel * 24
value = 1100

;=======================================================
; Running Stance Options
;=======================================================

;Combo Extension or Starter
[state -1, AI Running Stance - Hip Check & Elbow]
type = changestate
value = 1103
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1101
triggerall = var(6) > 1
triggerall = !inguarddist
triggerall = p2bodydist x = [-50,300]
triggerall = p2bodydist y = [-150, 0]
trigger1 = (random < ailevel * 24)
trigger2 = numtarget(210)
trigger2 = random < ailevel * 36

[state -1, AI Running Stance - Hip Check & Elbow]
type = changestate
value = 1123
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1121
triggerall = var(6) > 1
triggerall = !inguarddist
triggerall = p2bodydist x = [-50,300]
triggerall = p2bodydist y = [-150, 0]
trigger1 = (random < ailevel * 24)
trigger2 = numtarget(210)
trigger2 = random < ailevel * 36

[state -1, AI Running Stance - Hip Check & Elbow]
type = changestate
value = 1143
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1141
triggerall = var(6) > 1
triggerall = !inguarddist
triggerall = p2bodydist x = [-50,300]
triggerall = p2bodydist y = [-150, 0]
trigger1 = (random < ailevel * 24)
trigger2 = numtarget(210)
trigger2 = random < ailevel * 36


[State -1, Whirlwind Kick Light] 
type = ChangeState
value = 1050
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = p2bodydist y = [-200,100] 
triggerall = p2bodydist x = [-100,800]
triggerall = stateno != 240
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [10,45] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger1 = statetype != A
trigger1 = random < ailevel * 8
trigger1 = ctrl
trigger2 = stateno = 635
trigger2 = movehit
trigger2 = animelemtime(10) > 0
trigger2 = random < ailevel * 12
trigger3 = stateno = 210
trigger3 = movehit
trigger3 = animelemtime(6) > 0
trigger3 = random < ailevel * 6
trigger4 = stateno = 205 || stateno = 235 || stateno = 430
trigger4 = movecontact
trigger4 = enemynear,numproj > 0
trigger4 = random < ailevel * 24
trigger5 = stateno = 605
trigger5 = random < ailevel * 6
trigger5 = movehit


[State -1, Whirlwind Kick Heavy] 
type = ChangeState
value = 1060
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = p2bodydist y = [-200,100] 
triggerall = p2bodydist x = [-100,1300]
triggerall = stateno != 240
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [10,45] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = random < ailevel * 8
trigger2 = stateno = 635
trigger2 = movehit
trigger2 = animelemtime(12) > 0
trigger2 = random < ailevel * 18
trigger3 = stateno = 210
trigger3 = movehit
trigger3 = animelemtime(6) > 0
trigger3 = random < ailevel * 12
trigger4 = (stateno = 210) 
trigger4 = movehit
trigger4 = animelemtime(6) > 0
trigger4 = random < ailevel * 12
trigger5 = stateno = 605
trigger5 = random < ailevel * 8
trigger5 = movehit



;------------------------------------------------------
;Slide Attack, Hard Knockdown
[state -1, AI Running Stance - Attack Slide]
type = changestate
value = 1110
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1101
triggerall = p2bodydist x = [-100, 450]
triggerall = p2statetype != A
triggerall = !inguarddist
trigger1 = random < ailevel * 24
trigger1 = p2statetype = L
trigger2 = random < ailevel * 12
trigger2 = p2statetype = S
trigger3 = random < ailevel * 2
trigger3 = p2statetype != A
trigger4 = p2statetype = C
trigger4 = random < floor(80 / ailevel)

[state -1, AI Running Stance - Attack Slide]
type = changestate
value = 1130
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1121
triggerall = p2bodydist x = [-100, 450]
triggerall = p2statetype != A
triggerall = !inguarddist
trigger1 = random < ailevel * 24
trigger1 = p2statetype = L
trigger2 = random < ailevel * 12
trigger2 = p2statetype = S
trigger3 = random < ailevel * 2
trigger3 = p2statetype != A
trigger4 = p2statetype = C
trigger4 = random < floor(80 / ailevel)

[state -1, AI Running Stance - Attack Slide]
type = changestate
value = 1150
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = stateno = 1141
triggerall = p2bodydist x = [-100, 450]
triggerall = p2statetype != A
triggerall = !inguarddist
trigger1 = random < ailevel * 36
trigger1 = p2statetype = L
trigger1 = var(8) > 1
trigger2 = random < ailevel * 12
trigger2 = p2statetype = S
trigger3 = random < ailevel * 2
trigger3 = p2statetype != A
trigger4 = p2statetype = C
trigger4 = random < floor(80 / ailevel)


;Projectile Dodge Hurdle
[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1102
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = stateno = 1101
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,18] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
Trigger2 = p2statetype = C || p2statetype = L
trigger2 = random < ailevel * 4
trigger2 = p2bodydist x < 300
trigger3 = enemynear,hitdefattr = SCA,HT,ST
trigger3 = random < ailevel * 36

[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1122
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = stateno = 1121
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,12] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
Trigger2 = p2statetype = C || p2statetype = L
trigger2 = random < ailevel * 4
trigger2 = p2bodydist x < 300
trigger3 = enemynear,hitdefattr = SCA,HT,ST
trigger3 = random < ailevel * 36


[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1142
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = stateno = 1141
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,18] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
Trigger2 = p2statetype = C || p2statetype = L
trigger2 = random < ailevel * 4
trigger2 = p2bodydist x < 300
trigger3 = enemynear,hitdefattr = SCA,HT,ST
trigger3 = random < ailevel * 36

;Projectile Dodge\ Attack Dodge Cross Up option Slide
[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1106
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = stateno = 1101
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,18] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger2 = p2movetype = A
trigger2 = inguarddist
trigger2 = random < ailevel * 24
trigger3 = p2bodydist x < 250
trigger3 = random < ailevel * 4
trigger4 = enemynear,hitdefattr = SCA,HA,HP
trigger4 = random < ailevel * 40


[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1126
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = stateno = 1121
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,12] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger2 = p2movetype = A
trigger2 = inguarddist
trigger2 = random < ailevel * 24
trigger3 = p2bodydist x < 250
trigger3 = random < ailevel * 4
trigger4 = enemynear,hitdefattr = SCA,HA,HP
trigger4 = random < ailevel * 40

[State -1, Dodge stance Projectile sense] ;by Inktrebuchet
type = ChangeState
value = 1146
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = stateno = 1141
triggerall = statetype != A
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [0,18] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger2 = p2movetype = A
trigger2 = inguarddist
trigger2 = random < ailevel * 24
trigger3 = p2bodydist x < 250
trigger3 = random < ailevel * 4
trigger4 = enemynear,hitdefattr = SCA,HA,HP
trigger4 = random < ailevel * 40

;Brakes, no option decided 
[State -1, Brakes] 
type = ChangeState
value = 1108
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1101
triggerall = time > 6
trigger1 = p2bodydist x < 5
trigger1 = random < ailevel * 24
trigger2 = p2movetype = A
trigger2 = random < ailevel * 2
trigger3 = p2stateno = [5100,5120]
trigger3 = p2bodydist x = [-100,150]

[State -1, Brakes] 
type = ChangeState
value = 1128
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1121
triggerall = time > 6
trigger1 = p2bodydist x < 5
trigger1 = random < ailevel * 24
trigger2 = p2movetype = A
trigger2 = random < ailevel * 2
trigger3 = p2stateno = [5100,5120]
trigger3 = p2bodydist x = [-100,150]

[State -1, Brakes] 
type = ChangeState
value = 1148
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1141
triggerall = time > 6
trigger1 = p2bodydist x < 5
trigger1 = random < ailevel * 24
trigger2 = p2movetype = A
trigger2 = random < ailevel * 2
trigger3 = p2stateno = [5100,5120]
trigger3 = p2bodydist x = [-100,150]

[State -1, Phase Kick] 
type = ChangeState
value = 1111
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1101
triggerall = p2statetype != A
triggerall = p2bodydist x =[-20, 300]
triggerall = enemy,backedgebodydist > 60
trigger1 = random < ailevel * 12
trigger1 = p2movetype = A
trigger2 = random < ailevel * 8
trigger2 = p2statetype != A
trigger3 = p2stateno = [5100,5120]
trigger3 = random < ailevel * 18

[State -1, Phase Kick] 
type = ChangeState
value = 1131
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1121
triggerall = p2statetype != A
triggerall = p2bodydist x =[-20, 300]
triggerall = enemy,backedgebodydist > 60
trigger1 = random < ailevel * 12
trigger1 = p2movetype = A
trigger2 = random < ailevel * 8
trigger2 = p2statetype != A
trigger3 = p2stateno = [5100,5120]
trigger3 = random < ailevel * 18

[State -1, Phase Kick] 
type = ChangeState
value = 1151
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1141
triggerall = p2statetype != A
triggerall = p2bodydist x =[-20, 300]
triggerall = enemy,backedgebodydist > 60
trigger1 = random < ailevel * 12
trigger1 = p2movetype = A
trigger2 = random < ailevel * 8
trigger2 = p2statetype != A
trigger3 = p2stateno = [5100,5120]
trigger3 = random < ailevel * 18

;Overhead Option

[state -1, Leap Frog]
type = ChangeState
value = 1112
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1101
triggerall = p2statetype != A
triggerall = p2bodydist x =[-50, 300]
trigger1 = random < ailevel * 18
trigger1 = p2statetype = C
trigger2 = random < floor(40 / ailevel)
trigger2 = p2statetype = S

[state -1, Leap Frog]
type = ChangeState
value = 1132
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1121
triggerall = p2statetype != A
triggerall = p2bodydist x =[-50, 300]
trigger1 = random < ailevel * 18
trigger1 = p2statetype = C
trigger2 = random < floor(40 / ailevel)
trigger2 = p2statetype = S

[state -1, Leap Frog]
type = ChangeState
value = 1152
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = stateno = 1141
triggerall = p2statetype != A
triggerall = p2bodydist x =[-50, 300]
trigger1 = random < ailevel * 18
trigger1 = p2statetype = C
trigger2 = random < floor(40 / ailevel)
trigger2 = p2statetype = S

[state -1, AI Dashing Elbow]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [-50,750]
triggerall = p2bodydist y = [-280,0]
trigger1 = ctrl
trigger1 = random< ailevel * 2
trigger1 = !inguarddist
trigger1 = enemy,animtime < -12
trigger1 = enemy,ctrl = 0
trigger1 = p2bodydist x > 600
trigger2 = numtarget(240)
trigger2 = random < ailevel * 24
trigger2 = stateno = 241
trigger3 = stateno = 210
trigger3 = animelem >= 7
trigger3 = movehit
trigger3 = random < ailevel * 24
value = 1000

[state -1, AI Dashing Elbow]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x = [-50,1000]
triggerall = p2bodydist y = [-280,0]
trigger1 = ctrl
trigger1 = random< ailevel * 4
trigger1 = !inguarddist
trigger1 = enemy,animtime < -16
trigger1 = enemy,ctrl = 0
trigger1 = p2bodydist x > 600
trigger2 = numtarget(240)
trigger2 = random < ailevel * 36
trigger2 = stateno = 241
trigger3 = stateno = 210
trigger3 = movehit
trigger3 = animelem >= 7
trigger3 = random < ailevel * 24
value = 1010

[State -1, Whirlwind Kick Light] ;by Inktrebuchet
type = ChangeState
value = 1050
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = p2bodydist y = [-200,0] 
triggerall = p2bodydist x = [-100,800]
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [10,45] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger1 = statetype != A
trigger1 = random < ailevel * 24
trigger2 = stateno = 635
trigger2 = movehit
trigger2 = animelemtime(10) > 0
trigger2 = random < ailevel * 12
trigger3 = stateno = 210
trigger3 = movehit
trigger3 = animelemtime(6) > 0
trigger3 = random < ailevel * 6
trigger4 = stateno = 205 || stateno = 235 || stateno = 430
trigger4 = movecontact
trigger4 = enemynear,numproj > 0
trigger4 = random < ailevel * 12


[State -1, Whirlwind Kick Heavy] ;by Inktrebuchet
type = ChangeState
value = 1060
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl
triggerall = p2bodydist y = [-200,0] 
triggerall = p2dist x < 1300
;triggerall = random < ailevel*8
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -500 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [10,45] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger1 = statetype != A
trigger1 = random < ailevel * 36
trigger2 = stateno = 635
trigger2 = movehit
trigger2 = animelemtime(10) > 0
trigger2 = random < ailevel * 24
trigger3 = stateno = 210
trigger3 = movehit
trigger3 = animelemtime(6) > 0
trigger3 = random < ailevel * 18
trigger4 = stateno = 241
trigger4 = numtarget(240)
trigger4 = random < ailevel * 24


[state -1, AI S short]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [0,230]
triggerall = p2bodydist y = [-100,400]
triggerall = p2statetype != L
triggerall = !inguarddist
triggerall = !numtarget(410)
trigger1 = ctrl
trigger1 = random< ailevel * 8
trigger2 = stateno = 600
trigger2 = movehit
trigger2 = random < ailevel * 2
trigger3 = stateno = 600
trigger3 = moveguarded
trigger3 = random < ailevel * 12
value = 630

[state -1, AI S short]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-50,600]
triggerall = p2bodydist y = [-160,380]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random< ailevel * 12
trigger1 = p2statetype != A
trigger1 = vel y > 0
trigger2 = (stateno = 630) && animelemtime(8) > 0
trigger2 = movecontact
trigger2 = random < ailevel * 16
trigger3 = stateno = 605
trigger3 = movehit
trigger3 = random < ailevel * 36
value = 635

[state -1, AI S short]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-50,160]
triggerall = p2bodydist y = [-440,440]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = p2statetype != A
trigger1 = random < ailevel * 4
trigger1 = vel y > 0
trigger2 = (stateno = 635)  && animelemtime(12) > 0
trigger2 = movehit
trigger2 = random < ailevel * 24
value = 610

[state -1, AI S Roundhouse]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-50,270]
triggerall = p2bodydist y = [-220,420]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = (stateno = 630) || (stateno = 600) 
trigger1 = movecontact
trigger1 = random < ailevel * 2
trigger2 = (stateno = 605) 
trigger2 = random < ailevel * 12
trigger2 = movecontact
trigger3 = ctrl
trigger3 = random < ailevel * 8
trigger3 = p2statetype != A
trigger3 = pos y > -250
trigger4 = stateno = 635
trigger4 = movehit
trigger4 = animelemtime(12) > 0
trigger4 = random < ailevel * 36
value = 640

[state -1, AI Dive Butt]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-100,160]
triggerall = p2bodydist y >= 0
triggerall = pos y < -150
triggerall = p2statetype != A
triggerall = var(8) > 1
trigger1 = ctrl
trigger1 = random< ailevel * 8
trigger2 = (stateno = 610) || (stateno = 640)
trigger2 = movecontact
trigger2 = random < ailevel * 24
trigger3 = stateno = 640
trigger3 = movehit
trigger3 = random < ailevel * 36
value = 638

[state -1, AI S Jab]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-50,250]
triggerall = p2bodydist y = [-400,150]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = random< ailevel * 16
trigger1 = p2statetype = A
trigger1 = !numtarget(410)
trigger2 = numtarget(410) 
trigger2 = pos y < -680
trigger2 = ctrl
trigger2 = random * 36
value = 600

[state -1, AI S strong]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype = A
triggerall = p2bodydist x = [-50,250]
triggerall = p2bodydist y = [-400,150]
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = stateno = 630  && animelemtime(8) > 0
trigger1 = random < ailevel * 24
trigger1 = movehit  
trigger2 = stateno = 600
trigger2 = movehit
trigger2 = random < ailevel * 36
value = 605


[state -1, AI S Jab]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,200]
triggerall = p2bodydist y = [-220,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random< ailevel * 18
trigger2 = numtarget(1103) || numtarget(1123)  || numtarget(1143)
trigger2 = random < ailevel * 48
trigger2 = ctrl
trigger3 = numtarget(638)
trigger3 = ctrl
trigger3 = random < ailevel * 48
trigger4 = numtarget(630)
trigger4 = ctrl
trigger4 = random < ailevel * 24
trigger5 = p2bodydist x < 30
trigger5 = random < ailevel * 36
trigger5 = !inguarddist
trigger5 = ctrl
value = 200
ignorehitpause = 1

[state -1, AI C Jab]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0,260]
triggerall = p2bodydist y = [-130,0]
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = random< ailevel * 12
trigger2 = numtarget(1103) || numtarget(1123)  || numtarget(1143)
trigger2 = random < ailevel * 24
trigger2 = ctrl
trigger3 = numtarget(638)
trigger3 = ctrl
trigger3 = random < ailevel * 48
trigger4 = numtarget(630)
trigger4 = ctrl
trigger4 = random < ailevel * 12
value = 400


[state -1, AI S Short]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 260]
triggerall = p2bodydist y = [-130,0]
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = !inguarddist
trigger1 = random < ailevel * 4
trigger1 = p2statetype = S
trigger2 = (stateno = 200) || (stateno = 400)
trigger2 = movecontact
trigger2 = p2statetype = S
trigger2 = random < ailevel * 12
trigger3 = p2statetype = C
trigger3 = ctrl
trigger3 = random < ailevel * 4
trigger3 = !inguarddist
trigger4 = stateno = 400
trigger4 = movehit
trigger4 = random < ailevel * 32
value = 430

[state -1, AI S Short]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 220]
triggerall = p2bodydist y = [-300,0]
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = !inguarddist
trigger1 = random < ailevel * 8
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = random < ailevel * 32
trigger3 = stateno = 400
trigger3 = movehit
trigger3 = random < ailevel * 8
value = 230


[state -1, AI S strong]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 350]
triggerall = p2bodydist y = [-280,0]
triggerall = !inguarddist
trigger1 = (stateno = 230) || (stateno = 200) || (stateno = 430)
trigger1 = movecontact
trigger1 = random < ailevel * 36
trigger2 = stateno = 215
trigger2 = movehit
trigger2 = random < ailevel * 36
trigger2 = animelemtime(6) > 0
value = 205

[state -1, AI S Forward]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 550]
triggerall = p2bodydist y = [-280, 0]
triggerall = !inguarddist
trigger1 = (stateno = 230) || (stateno = 430)
trigger1 = movecontact
trigger1 = random < ailevel * 24
trigger2 = stateno = 205 && animelemtime(6) > 0
trigger2 = movehit
trigger2 = random < ailevel * 32
value = 235

[state -1, AI C Fierce]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 280]
triggerall = p2bodydist y = [-280,0]
trigger1 = (stateno = 235) || (stateno = 205)
trigger1 = movehit
trigger1 = random < ailevel * 24
trigger1 = animelem >= 6
trigger2 = ctrl
trigger2 = p2statetype = A
trigger2 = enemynear,hitdefattr != SC,SA,HA
trigger2 = random < ailevel * 12
trigger3 = (stateno = 235) || (stateno = 205) || (stateno = 430)
trigger3 = movehit
trigger3 = random < ailevel * 32
trigger3 = p2statetype = A
trigger4 = (stateno = 430)
trigger4 = movehit
trigger4 = random < ailevel * 36
trigger5 = (stateno = 430) 
trigger5 = moveguarded
trigger5 = random < ailevel * 6
trigger6 = numtarget(1151)
trigger6 = ctrl
trigger6 = random < ailevel * 18
trigger7 = (stateno = 200) || (stateno = 205) || (stateno = 400) || (stateno = 430) || (stateno = 230) || (stateno = 235)
trigger7 = movecontact
trigger7 = enemynear,hitdefattr = SCA,AT
trigger7 = random < ailevel * 12
value = 410

[state -1, AI C Fierce]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 620]
triggerall = p2bodydist y = [-100,0]
trigger1 = (stateno = 235) || (stateno = 205) 
trigger1 = moveguarded
trigger1 = random < ailevel * 8
trigger1 = animelem >= 6
trigger1 = p2statetype = S
trigger2 = ctrl
trigger2 = !inguarddist
trigger2 = p2statetype = S
trigger2 = random < floor(ailevel * 0.25)
trigger3 = (stateno = 430)
trigger3 = random < ailevel * 24
trigger3 = movehit
value = 440

[state -1, AI S strong]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 280]
triggerall = p2bodydist y = [-280,0]
trigger1 = (stateno = 205) && animelemtime(6) > 0
trigger1 = movehit
trigger1 = random < ailevel * 24
trigger2 = (stateno = 235) && animelemtime(6) > 0
trigger2 = movehit
trigger2 = random < ailevel * 24 
value = 210

[state -1, AI S Overhead]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 450]
triggerall = p2bodydist y = [-150,0]
triggerall = ctrl
trigger1 = p2statetype = C
trigger1 = random < ailevel * 6
trigger1 = !inguarddist
trigger2 = stateno = 205 || stateno = 230
trigger2 = moveguarded
trigger2 = random < ailevel * 6
trigger3 = stateno = 430
trigger3 = moveguarded
trigger3 = random < ailevel * 6
trigger4 = enemy,prevstateno = 5120
trigger4 = random < ailevel * 15
trigger4 = p2bodydist x > 200
value = 215

[state -1, AI S Roundhouse]
type = changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 500]
triggerall = p2bodydist y = [-280,0]
trigger1 = (stateno = 205) || (stateno = 235)
trigger1 = movehit
trigger1 = animelemtime(6) > 0
trigger1 = random < ailevel * 18
trigger2 = ctrl
trigger2 = random < ailevel * 2
trigger2 = p2bodydist x = [450,500]
trigger2 = !inguarddist
trigger3 = (stateno = 210) && animelemtime(7) > 0
trigger3 = movehit
trigger3 = random < ailevel * 24
value = 240

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 1
triggerall = p2bodydist y = [-200, 240]
triggerall = p2statetype = A
triggerall = !numtarget(410)
triggerall = !enemynear,hitfall
triggerall = p2bodydist x =[0, 150]
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
triggerall = !numtarget(410)
triggerall = !enemynear,hitfall
triggerall = p2bodydist x =[0, 150]
trigger1 = random < ailevel * 4
trigger1 = movehit
trigger1 = stateno = 600 || stateno = 630
trigger2 = random < ailevel * 12
trigger2 = movehit
trigger2 = stateno = 605 
trigger3 = stateno = 635 && animelemtime(12) > 0
trigger3 = movehit
trigger3 = random < ailevel * 32
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
triggerall = p2statetype = S || p2statetype = C
triggerall = ctrl
triggerall = numenemy
triggerall = stateno != 100
triggerall = p2movetype != H
triggerall = p2bodydist x = [0, 80]
trigger1 = Random < Ailevel * 8
trigger2 = Random < Ailevel * 16
trigger2 = p2stateno = [120,130]
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*12)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel * 24
trigger5 = enemy,name = "Frank West Arr"
trigger5 = enemy,stateno = 900
trigger5 = random < ailevel * 24
value = 800








;AI section end



;===========================================================================
;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Maximum Bunny]
type = ChangeState
value = 3000
triggerall = command = "SUPER"
triggerall = power >= 3000
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact
trigger3 = (stateno = [1000, 1080]) || (stateno = [1100, 1160]) 

;---------------------------------------------------------------------------
;Zip Around Super
[state -1, Zip down]
type = changestate
value = 3039
triggerall = !ailevel
triggerall = power > 999
triggerall = command = "super2"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [1000,1001]) || (stateno = [1010,1011]) || (stateno = [1100,1151]) || (stateno = [1050,1080])
trigger3 = movecontact

;---------------------------------------------------------------------------
;EX Quick Elbow
[state -1, Quick Elbow]
type = changestate
value = 3040
triggerall = !ailevel
triggerall = power > 999
triggerall = command = "super2"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [1000,1001]) || (stateno = [1010,1011])
trigger3 = movecontact




;---------------------------------------------------------------------------
;EX Quick Elbow
[state -1, Quick Elbow]
type = changestate
value = 1020
triggerall = !ailevel
triggerall = command = "upper_xy"
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Quick Elbow
[state -1, Quick Elbow]
type = changestate
value = 1000
triggerall = !ailevel
triggerall = command = "upper_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Quick Elbow
[state -1, Quick Elbow]
type = changestate
value = 1010
triggerall = !ailevel
triggerall = command = "upper_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Whirlwind Kick
[state -1, EX Whirlwind Kick]
type = changestate
value = 1070
triggerall = !ailevel
triggerall = command = "QCB_c"
triggerall = power > 499
triggerall = stateno != 240
triggerall = stateno != 410
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Whirlwind Kick
[state -1, Light Whirlwind Kick]
type = changestate
value = 1050
triggerall = !ailevel
triggerall = command = "QCB_a"
triggerall = stateno != 240
triggerall = stateno != 410
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Whirlwind Kick
[state -1, Heavy Whirlwind Kick]
type = changestate
value = 1060
triggerall = !ailevel
triggerall = command = "QCB_b"
triggerall = stateno != 240
triggerall = stateno != 410
trigger1 = ctrl
trigger2 = var(1)


;-----------------------------------------------------------

;Running Stance - EX
[State -1, Running Stance - Ready: Light]
type = ChangeState
value = 1140
triggerall = !ailevel
triggerall = command = "QCF_ab"
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;-----------------------------------------------------------

;Running Stance - Light
[State -1, Running Stance - Ready: Light]
type = ChangeState
value = 1100
triggerall = !ailevel
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) 

;-------------------------------------------------------------

;Running Stance - Heavy
[State -1, Running Stance - Ready: Heavy]
type = ChangeState
value = 1120
triggerall = !ailevel
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) 

;---------------------------------------------------------------------------
;Air Dodge
[state -1, All Dodge Dodge]
type = changestate
value = 1210
triggerall = !ailevel
triggerall = command = "dodge"
triggerall = var(12) > 0
triggerall = statetype = A
trigger1 = ctrl


;---------------------------------------------------------------------------
;Projectile Dodge
[state -1, Projectile Dodge]
type = changestate
value = 1200
triggerall = !ailevel
triggerall = command = "dodge"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) 




;-------------------------------------------------------------------------------
;Additional Dodges
[state -1, More Dodges]
type = changestate
triggerall = command = "dodge"  || command = "holddodge"
triggerall = !ailevel
triggerall = var(13) < 5
trigger1 = stateno = 1200
trigger1 = vel y > 0
trigger1 = pos y > -30
value = 1220
;===========================================================================

;---------------------------------------------------------------------------
;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 999


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
trigger1 = command = "BB" || (command = "dash" && command = "holdback")
trigger1 = statetype = S
trigger1 = ctrl

;----------------------------------------------------------------------------

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
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 830
triggerall = command = "grab"
triggerall = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 831
triggerall = command = "grab"
triggerall = statetype = A
triggerall = stateno != 240
triggerall = stateno != 410
trigger1 = var(1)

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
trigger1 = command != "holdfwd"


;---------------------------------------------------------------------------
;Stand Medpunch Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = !ailevel
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 400)
trigger2 = movecontact
trigger3 = movehit
trigger3 = stateno = 215



;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = !ailevel
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command != "holdfwd"
trigger2 = (stateno = 200) || (stateno = 205) || (stateno = 230) || (stateno = 235) || (stateno = 400) || (stateno = 430)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = !ailevel
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
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
trigger1 = command != "holdfwd"
trigger2 = (stateno = 200) || (stateno = 400)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Medium Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = !ailevel
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = (stateno = 230) || (stateno = 205) || (stateno = 400)
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
trigger2 = (stateno = 200 ) || (stateno = 205) || (stateno = 210) || (stateno = 230) || (stateno = 235) || (stateno = 400)
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
triggerall = !ailevel
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = time > 8  || movecontact

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || (stateno = 205)  || (stateno = 230) || (stateno = 235)
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
trigger2 = (stateno = 400)|| (stateno = 200)
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
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || (stateno = 205)  || (stateno = 230) || (stateno = 235)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = !ailevel
triggerall = command = "x"
triggerall = command != "holdfwd";
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = !ailevel
triggerall = command = "x";
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = (stateno = 600) || (stateno = 630)
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
trigger2 = (stateno = 600) || (stateno = 605) ||(stateno = 630) ||(stateno = 635)
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = !ailevel
triggerall = command = "a"
trigger1 = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = command != "holdfwd"
trigger2 = (stateno = 600)
trigger2 = movecontact
trigger2 = command != "holdfwd"


;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = !ailevel
triggerall = command = "a"
trigger1 = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 =(stateno = 630) || (stateno = 605)
trigger2 = movecontact
trigger3 = command = "holdfwd"
trigger3 = stateno = 600
trigger3 = movecontact

;---------------------------------------------------------------------------
;Dive Kicks
[State -1, Jump Light Kick]
type = ChangeState
value = 638
triggerall = !ailevel
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = vel x >= 0 
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 610)  || (stateno = 640)
trigger2 = movecontact
;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = !ailevel
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 630) || (stateno = 605) ||(stateno = 635)
trigger2 = movecontact


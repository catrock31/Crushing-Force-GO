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
command = ~D, DF, F, D, DF, F, x
time = 40
buffer.time = 8

[Command]
name = "Super"   
command = ~D, DF, F, D, DF, F, y
time = 40
buffer.time = 8

[Command]
name = "Super"   
command = ~D, F, D, F, x
time = 40
buffer.time = 8

[Command]
name = "Super"   
command = ~D, F, D, F, y
time = 40
buffer.time = 8

[Command]
name = "Super"   
command = ~D, DF, F, x+z
time = 20
buffer.time = 8

[Command]
name = "Super"   
command = ~D, DF, F, y+z
time = 20
buffer.time = 8

[Command]
name = "Super"   
command = c+z
time = 1

[Command]
name = "Super2"
command = ~D,DB,B,D,DB,B,x
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DB,B,D,DB,B,y
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,B,D,B,x
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,B,D,B,y
time = 40
buffer.time = 8

[command]
name = "Super2"
command = ~D,DB,B,x+y+z
time = 20
buffer.time = 8

[command]
name = "Super2"
command = ~D,DB,B,x+z
time = 20
buffer.time = 8

[command]
name = "Super2"
command = ~D,DB,B,y+z
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
command = ~D,F,D,F,a
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = ~D,F,D,F,b
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
name = "HCB_xy"
command = ~F, D, B, x+y
time = 15

[Command]
name = "HCB_xy"
command = ~F, D, B, z
time = 15

[Command]
name = "HCB_xy"
command = ~F, $D, B, z
time = 15

[Command]
name = "HCB_xy"
command = ~F,DF,D,DB,B, x+y
time = 15

[Command]
name = "HCB_xy"
command = ~F,DF,D,DB,B, z
time = 15

[Command]
name = "HCB_x"
command = ~F,DF,D,DB,B, x
time = 15

[Command]
name = "HCB_x"
command = ~F, D, B, x
time = 15

[Command]
name = "HCB_x"
command = ~F, $D, B, x
time = 15

[Command]
name = "HCB_y"
command = ~F,DF,D,DB,B, y
time = 15

[Command]
name = "HCB_y"
command = ~F, D, B, y
time = 15

[Command]
name = "HCB_y"
command = ~F, $D, B, y
time = 15


;-----------------------

[Command]
name = "HCB_ab"
command = ~F,DF,D,DB,B, a+b
time = 15

[Command]
name = "HCB_ab"
command = ~F, D, B, a+b
time = 15

[Command]
name = "HCB_ab"
command = ~F,DF,D,DB,B, c
time = 15

[Command]
name = "HCB_ab"
command = ~F, D, B, c
time = 15

[Command]
name = "HCB_a"
command = ~F,DF,D,DB,B, a
time = 15

[Command]
name = "HCB_a"
command = ~F, D, B, a
time = 15

[Command]
name = "HCB_b"
command = ~F,DF,D,DB,B, b
time = 15

[Command]
name = "HCB_b"
command = ~F, D, B, b
time = 15


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
name = "QCF_a"
command = ~D, DF, F, a
time = 15
buffer.time = 5

[Command]
name = "QCF_b"
command = ~D, DF, F, b
time = 15
buffer.time = 5

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b
time = 15
buffer.time = 5

[Command]
name = "QCF_ab"
command = ~D, DF, F, c
time = 15
buffer.time = 5

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
name = "grab"
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

[Command]
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
name = "holdupfwd"
command = /UF
time = 1
buffer.time = 1

[command]
name = "holdupback"
command = /UB
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
trigger2 = stateno != 200
trigger2 = stateno != 205
trigger2 = stateno != 210
trigger2 = stateno != 410
trigger2 = stateno != 238
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 200 || stateno = 205 && var(4) > 0
trigger5 = stateno = 210 && movecontact
trigger5 = animelemtime(6) < 0  
trigger6 = stateno = 410 
trigger6 = movehit
var(1) = 1



;==========================================================================
;---| AI section | --------------------------------------------------------
;==========================================================================

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
v=30
value=0 
Ignorehitpause=1

;--------Defence;
[State -1, AI guarding - Stand]
Type=Changestate
Triggerall=var(30)=59
triggerall = stateno != 100
triggerall = stateno != [200,1399]
triggerall =! (Stateno=[120,155])
Triggerall= ctrl
Triggerall = Inguarddist || enemynear,hitdefattr = SCA,AP || enemynear,hitdefattr = SCA,AA
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 16
value = 120

;[state -1, AI guard - air]
;type = changestate
;triggerall = inguarddist
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall = statetype = A
;trigger1 = enemy,movetype = A
;triggerall =! (Stateno=[120,155])
;trigger1 = random < (ailevel * 32)
;value = 132

;[State -1]; The engine will still guard by through pressing the back button, we need to disable that.
;Type=Assertspecial
;Triggerall=StateNo!=[120,160]
;Trigger1=var(30) = 59
;flag=noairguard
;flag2=nocrouchguard
;flag3=nostandguard

[state -1, Push Block]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = power > 499
triggerall = ailevel > 5
trigger1 = random < (ailevel) && (enemy,hitdefattr = SCA,NA,NP)
trigger2 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,SA,SP)
trigger3 = random < (ailevel * 8) && (enemy,hitdefattr = SCA,HA,HP)
value = 1400

[State -1, jump]
type = changestate
triggerall = statetype = S || statetype = C 
triggerall = var(30) = 59
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = ctrl
trigger1 = enemy,hitdefattr = S,AT
trigger1 = Random < Ailevel * 12
trigger2 = p2bodydist x = [140, 360]
trigger2 = random < ailevel * 6
trigger2 = enemy,statetype = S || enemy,statetype = C
trigger2 = ctrl
trigger3 = enemy,name = "Katrina Crocodile"
trigger3 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger3 = ctrl && random < (ailevel*6)
trigger4 = enemy,name = "Zafta Giraffe"
trigger4 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger4 = ctrl && random < (ailevel*6)
trigger5 = enemy,name = "Makuyama"
trigger5 = enemy,stateno = 1101 || enemy,stateno = 1111 || enemy,stateno = 1121
trigger5 = ctrl && random < (ailevel*6) 
trigger6 = enemy,statetype = L && ctrl
trigger6 = random < (ailevel*4)
trigger7 = stateno = 240 && movehit
trigger7 = ctrl
value = 40

[State -1, Wall Cling]
type = ChangeState
triggerall = var(30) = 59
triggerall = ctrl
triggerall = pos y < -140
triggerall = statetype = A
triggerall = stateno != 55
triggerall = enemy,movetype != A
trigger1 = !stateno = 50 && !prevstateno = 56
trigger1 = backedgebodydist < 50
trigger2 = !stateno = 50 && !prevstateno = 56
trigger2 = frontedgebodydist < 50
value = 55

[state -1, AI Run] 
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 1
triggerall = stateno != 100
trigger1 = Random < (Ailevel*8)
trigger1 = !inguarddist
trigger1 = p2bodydist x > 400
value = 100

[state -1, backdash]
type = changestate
triggerall= var(30) = 59
triggerall = Statetype != A
triggerall = ctrl
triggerall = ailevel > 1
triggerall = backedgebodydist > 100
trigger1 = enemynear, stateno = 5110
trigger1 = p2bodydist x < 150
trigger1 = Random < (Ailevel*36)
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < (ailevel*2) && ctrl
value = 105

[State -1, Palm & Banzai Drop]
type = ChangeState
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 2999
triggerall = p2bodydist x > -1
triggerall = ailevel > 3
triggerall = enemy,statetype != L
trigger1 = stateno = 1000 && movehit
trigger1 = animelemtime(3) >= 1 && animelemtime(7) <= 1
trigger1 = random < (ailevel*24)
trigger2 = stateno = 1010 && movehit
trigger2 = animelemtime(3) >= 1 && animelemtime(15) <= 1
trigger2 = random < (ailevel*24)
value = 3000

[State -1, Super Bear Hug]
type = ChangeState
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 999
triggerall = ailevel > 3
trigger1 = stateno = 1010 && moveguarded
trigger1 = animelemtime(4) >= 1 && animelemtime(7) <=1
trigger1 = random <(ailevel*4)
value = 3040


[state -1, Super anti air grab]
type = changestate
value = 3080
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype = A
triggerall = enemy,statetype != L
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2bodydist y = [-350,-100]
triggerall = p2bodydist x = [0,240]
trigger1 = ctrl
trigger1 = random < (ailevel*6)
trigger2 = enemy,stateno = 673
trigger2 = random < (ailevel*36)
trigger2 = var(1) || ctrl
trigger2 = numtarget(1120)





[state -1, Butt Drop]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = pos y < -70
triggerall = p2stateno != [660,669]
trigger1 = p2bodydist x < 60  && p2bodydist x > 20
trigger1 = ctrl
trigger1 = Random < Ailevel * 4
trigger1 = enemy,statetype != A
trigger2 = random < ailevel * 48
trigger2 = stateno = 610
trigger2 = animelemtime(6) > 0
trigger2 = movehit
trigger3 = p2bodydist x <= 20  && p2bodydist x > -90
trigger3 = ctrl
trigger3 = Random < Ailevel * 4
trigger3 = enemy,statetype != A
trigger4 = pos y < -365
trigger4 = random < ailevel * 24
trigger4 = ctrl
trigger4 = p2bodydist x = [-60,60]
value = 645

[state -1, Sumo Palm EX]
type = changestate
value = 1020
triggerall = var(30) = 59
triggerall = statetype != A
;triggerall = enemy,statetype != C
triggerall = power > 999
triggerall = ailevel > 4
triggerall = p2bodydist x < 240
trigger1 = ctrl
trigger1 = enemy,movetype = A
trigger1 = random < ailevel*6
trigger2 = stateno = 205 && movecontact
trigger2 = random < ailevel*2
trigger2 = var(4)>0

[state -1, Bear Hug EX]
type = changestate
value = 1120
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 999
triggerall = ailevel > 4
triggerall = p2stateno != [670,679]
triggerall = (enemynear,stateno != [5100,5120]) && (p2bodydist x < 250)
trigger1= enemynear,hitdefattr = SCA,NP,SP,HP || enemynear,numproj > 0
trigger1 = random < (ailevel*24)
trigger1 = ctrl
trigger2 = stateno = 210 || stateno = 410 
trigger2 = var(1)
trigger2 = random < (ailevel*2)
trigger3 = enemy,hitdefattr = S,AT
trigger3 = random < (ailevel*16)
trigger3 = ctrl
trigger4 = p2bodydist x < 250
trigger4 = ctrl
trigger4 = enemy,movetype != A
trigger4 = random < (ailevel*2)
trigger5 = stateno = 240 && moveguarded
trigger5 = random < (ailevel*8)
trigger6 = enemy,hitdefattr = SCA,AT
trigger6 = ctrl || var(1)
trigger6 = random < ailevel * 2

[state -1, Sumo Palm addition EX]
type = changestate
value = 1023
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 1020
triggerall = enemy,statetype != L
triggerall = animelemtime(16) > 0
triggerall = p2bodydist x < 200
trigger1 = random < (ailevel*16)
trigger1 = enemy,statetype = C
trigger2 = random < (ailevel*4)
trigger2 = enemy,statetype = S
trigger3 = enemy,statetype = A

[state -1, Follow Up LOW]
type = changestate
value = 1025
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 1020
triggerall = enemy,statetype != L
triggerall = enemy,statetype != A
triggerall = animelemtime(16) > 0
trigger1 = p2bodydist x < 200
trigger1 = random < (ailevel*16)
trigger1 = enemy,statetype = S
trigger2 = random < floor(40/ailevel)
trigger2 = enemy,statetype = S

[state -1, anti air grab]
type = changestate
value = 1150
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,hitfall = 0
triggerall = p2movetype != H
triggerall = p2statetype = A
triggerall = p2bodydist y = [-300, -50]
triggerall = p2bodydist x = [0, 180]
trigger1 = ctrl
trigger1 = random < (ailevel*8)

[state -1, anti air grab]
type = changestate
value = 1160
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,hitfall = 0
triggerall = p2statetype = A
triggerall = p2movetype != H
triggerall = p2bodydist y = [-350,-100]
triggerall = p2bodydist x = [0, 230]
trigger1 = ctrl
trigger1 = random < (ailevel*12)

[state -1, anti air grab]
type = changestate
value = 1170
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2statetype = A
triggerall = power > 499
triggerall = p2bodydist y = [-350,-100] 
triggerall = p2bodydist x = [0, 220]
trigger1 = ctrl
trigger1 = random < (ailevel*8)
trigger1 = p2movetype = A
trigger2 = stateno = 240 && movehit
trigger2 = random < (ailevel*8)

[state -1, Bear Hug Light]
type = changestate
value = 1100
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2stateno != [670,679]
triggerall = (enemynear,stateno != [5100,5120]) && (p2bodydist x < 250)
trigger1 = p2bodydist x < 300 && p2bodydist x > 150
trigger1 = ctrl
trigger1 = random < (ailevel*2)
trigger2 = enemynear,numproj > 0 || enemy,hitdefattr = SCA,NP,SP,HP
trigger2 = ctrl
trigger2 = random < (ailevel*80)
trigger2 = p2bodydist x < 200
trigger3 = enemynear,authorname = "Kazecat"
trigger3 = enemynear,stateno = [1400,1410]
trigger3 = ctrl || var(1)
trigger3 = random < ailevel * 12
trigger4 = p2stateno = [700,799]
trigger4 = ctrl
trigger4 = random < ailevel * 8
trigger5 = stateno = 230
trigger5 = moveguarded
trigger5 = random < ailevel * 12

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1100
triggerall = ailevel  
triggerall = ctrl
triggerall = ailevel > 2
triggerall = statetype != A 
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [1,8] ; 5 = startup time, 22 = active ; [0,5] for last second
trigger1 = random < ailevel * 12 

[state -1, Bear Hug Heavy]
type = changestate
value = 1110
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2stateno != [670,679]
triggerall = (enemynear,stateno != [5100,5120]) && (p2bodydist x < 250)
trigger1 = p2bodydist x < 360
trigger1 = ctrl
trigger1 = enemy,movetype != A
trigger1 = random < (ailevel*2)
trigger2 = enemynear,numproj > 0 || enemy,hitdefattr = SCA,NP,SP,HP
trigger2 = ctrl
trigger2 = random < (ailevel*80)
trigger2 = p2bodydist x >= 200
trigger3 = enemynear,authorname = "Kazecat"
trigger3 = enemynear,stateno = [1400,1410]
trigger3 = ctrl || var(1)
trigger3 = random < ailevel * 12
trigger4 = p2stateno = [700,799]
trigger4 = ctrl
trigger4 = random < ailevel * 8

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1110
triggerall = ailevel  
triggerall = ailevel > 2
triggerall = ctrl
triggerall = statetype != A 
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -100 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to counter projectiles that are to high. 100 = char height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [1,12] ; 5 = startup time, 22 = active ; [0,5] for last second
trigger1 = random < ailevel * 12


[state -1, Sumo Palm Light]
type = changestate
value = 1000
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2statetype != L
;triggerall = p2statetype != C
triggerall = p2bodydist x < 240
trigger1 = ctrl
trigger1 = enemy,movetype = A && enemy,hitdefattr = SCA,AA
trigger1 = random < (ailevel*2)
trigger2 = stateno = 205 || stateno = 200 && movehit
trigger2 = random < (ailevel*8)
trigger2 = var(4) <= 2

[state -1, Follow Up OVERHEAD]
type = changestate
value = 1003
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 1000
triggerall = enemy,statetype != L
triggerall = animelemtime(8) > 0
triggerall = p2bodydist x < 200
trigger1 = random < (ailevel*16)
trigger1 = enemy,statetype = C
trigger2 = random < floor(40/ailevel)
trigger2 = enemy,statetype = S
trigger3 = enemy,statetype = A

[state -1, Follow Up LOW]
type = changestate
value = 1005
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 1000
triggerall = enemy,statetype != L
triggerall = enemy,statetype != A
triggerall = animelemtime(8) > 0
trigger1 = p2bodydist x < 200
trigger1 = random < (ailevel*16)
trigger1 = enemy,statetype = S
trigger2 = random < floor(40/ailevel)
trigger2 = enemy,statetype = C

[state -1, Sumo Palm Heavy]
type = changestate
value = 1010
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = p2statetype != L
;triggerall = p2statetype != C
triggerall = p2bodydist x < 240
trigger1 = ctrl
trigger1 = enemy,movetype = A && enemy,hitdefattr = SCA,AA
trigger1 = random < ailevel*2
trigger2 = stateno = 210 && movecontact
trigger2 = random < ailevel*12
trigger2 = var(1)
trigger2 = enemy,statetype != A
trigger3 = stateno = 230 && movecontact
trigger3 = random < ailevel*12
trigger3 = enemy,statetype = S
trigger4 = stateno = 210 && movehit
trigger4 = var(1)
trigger4 = enemy,statetype = A
trigger4 = random < (ailevel*48)

[state -1, Sumo Palm addition]
type = changestate
value = 1013
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 1010
triggerall = enemy,statetype != L
triggerall = animelemtime(16) > 0
triggerall = p2bodydist x < 200
trigger1 = random < (ailevel*16)
trigger1 = p2statetype = C
trigger2 = random < (ailevel*4)
trigger2 = p2statetype = S
trigger3 = p2statetype = A

[state -1, Follow Up LOW]
type = changestate
value = 1015
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = 1010
triggerall = enemy,statetype != L
triggerall = enemy,statetype != A
triggerall = animelemtime(16) > 0
trigger1 = p2bodydist x < 200
trigger1 = random < (ailevel*16)
trigger1 = enemy,statetype = S
trigger2 = random < floor(40/ailevel)
trigger2 = enemy,statetype = C

[State -1, Banzai Drop]
type = ChangeState
triggerall = var(30) = 59
triggerall = stateno = 55
triggerall = animelemtime(5) >= 0
triggerall = p2bodydist x < 450
trigger1 = random < (ailevel*64)
trigger1 = enemynear,stateno != [5110,5120]
value = 650

[State -1, Dismount]
type = ChangeState
triggerall = var(30) = 59
triggerall = stateno = 55
triggerall = animelemtime(5) >= 0
triggerall = p2bodydist x >= 450
trigger1 = random < (ailevel*64)
value = 56



[state -1, Jab]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = p2bodydist x < 140
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = !inguarddist
trigger1 = random < (ailevel*12)
trigger1 = enemy,statetype = S
trigger2 = random < (ailevel*2)
trigger2 = enemy,statetype = C
trigger3 = stateno = 205
trigger3 = moveguarded
trigger3 = var(4) > 0
trigger3 = random < (ailevel*32)
trigger4 = stateno = 205
trigger4 = time > 8
trigger4 = !movecontact
trigger4 = var(4) > 0
trigger4 = random < (ailevel*24)
value = 200

[state -1, Strong]
type = changestate
triggerall = var(30) = 59
triggerall = p2bodydist x < 140
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = !inguarddist
triggerall = stateno = 200
triggerall= var(4) > 0
trigger1 = enemy,statetype != A
trigger1 = random < (ailevel*36)
trigger1 = moveguarded
trigger2 = enemy,statetype != A
trigger2 = time > 8
trigger2 = random < (ailevel*24)
trigger2 = !movecontact
value = 205




[state -1, J. Jab]
type = changestate
triggerall = var(30) = 59
triggerall = enemy,statetype != L
triggerall = !inguarddist
triggerall = statetype = A
triggerall = enemy,statetype = A
triggerall = p2bodydist x < 180
trigger1 = Random < Ailevel * 16
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger2 = var(24) > 2
value = 600

[state -1, J. Short]
type = changestate
triggerall = var(30) = 59
triggerall = enemy,statetype != L
triggerall =! enemy,movetype = A
triggerall = statetype = A
triggerall = p2bodydist x < 180
trigger1 = vel y > 0
trigger1 = Random < Ailevel * 16
trigger1 = ctrl
trigger2 = stateno = 600 && movehit
trigger2 = random < (ailevel*24)
value = 630

[state -1, J. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = enemy,statetype != L
triggerall =! enemy,movetype = A
triggerall = statetype = A
triggerall = p2bodydist x < 180
triggerall = p2bodydist y < 80 && p2bodydist y > -200
trigger1 = Random < (Ailevel*2)
trigger1 = vel y > 0
trigger1 = p2bodydist y < 50
trigger1 = ctrl
trigger2 = stateno = 630 && movehit
trigger2 = random < (ailevel*48)
value = 610

[state -1, J. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = enemy,statetype != L
triggerall =! enemy,movetype = A
triggerall = statetype = A
triggerall = p2bodydist x < 180
trigger1 = Random < (Ailevel*32)
trigger1 = vel y > 0
trigger1 = p2bodydist y < 180 && p2bodydist y > 0
trigger1 = ctrl
trigger2 = stateno = 630 && movehit
trigger2 = random < (ailevel*16)
value = 640

[state -1, C. Jab]
type = changestate
triggerall = var(30) = 59
triggerall = enemy,statetype != L
triggerall = statetype != A
triggerall = enemy,movetype != A
triggerall = p2bodydist y = [-150,0]
triggerall = p2bodydist x < 160
trigger1 = random < (ailevel*12)
trigger1 = ctrl
value = 400

[state -1, Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x < 130
triggerall = enemy,movetype != A
trigger1 = random < (ailevel*48)
trigger1 = movecontact
trigger1 = stateno = 200
trigger2 = ctrl
trigger2 = random < (ailevel*4)
value = 230

[state -1, C. Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 180
triggerall = enemy,movetype != A
triggerall = enemy,statetype != A
trigger1 = random < (ailevel*6)
trigger1 = ctrl
trigger1 = enemy,statetype = S || enemy,statetype = C
trigger2 = stateno = 400  
trigger2 = movecontact
trigger2 = random < (ailevel*32)
trigger3 = stateno = 200
trigger3 = enemy,statetype = S
trigger3 = movecontact
trigger3 = random < (ailevel*16)
trigger4 = enemy,statetype = L && random < (ailevel*4)
trigger4 = ctrl
value = 430

[state -1, Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 400
triggerall = !inguarddist
trigger1 = random < (ailevel*24)
trigger1 = enemy,statetype = A
trigger1 = stateno = 200 && movecontact
trigger1 = p2bodydist x >= 130
trigger2 = random < (ailevel*48)
trigger2 = movecontact
trigger2 = stateno = 230
value = 210

[state -1, Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = enemy,statetype != L
triggerall = p2bodydist x < 280
trigger1 = random < (ailevel*2)
trigger1 = enemy,movetype = A && enemy,hitdefattr != SCA,SA || enemy,hitdefattr != SCA,HP || enemy,hitdefattr != SCA,HA
trigger1 = ctrl
trigger2 = stateno = 430
trigger2 = movehit
trigger2 = random < (ailevel*32)
trigger3 = stateno = 400
trigger3 = movecontact
trigger3 = random < (ailevel*4)
trigger4 = enemy,stateno = 673
trigger4 = ctrl
trigger4 = random < ailevel*24
trigger5 = stateno = 430
trigger5 = movecontact
trigger5 = random < (ailevel * 2)
value = 410

[state -1, roundhouse]
type = changestate
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x > 230  && p2bodydist x < 440
triggerall = var(30) = 59
trigger1 = ctrl
trigger1 = random < (ailevel*12)
trigger1 = enemy,pos y < -150
trigger2 = stateno = 230
trigger2 = movecontact
trigger2 = enemy,statetype = A
trigger2 = random < (40/ailevel)
value = 240

[state -1, roundhouse]
type = changestate
triggerall = statetype != A
triggerall = p2bodydist x < 220
triggerall = var(30) = 59
triggerall = enemy,movetype != A
trigger1 = ctrl
trigger1 = random < (ailevel*12)
trigger1 = enemy,statetype = S
trigger2 = stateno = 430
trigger2 = movecontact
trigger2 = random < (ailevel*32)
value = 440

[state -1, Throw]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 1
triggerall = statetype = S
triggerall = enemy,statetype != A
triggerall = enemy,statetype != L
triggerall = enemy,movetype != H
triggerall = p2bodydist x < 90
triggerall = ctrl
trigger1 = Random < Ailevel * 32
trigger2 = enemy,name = "Lardo Rat"
trigger2 = enemy,stateno = [1000,10004]
trigger2 = random < (ailevel*12)
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*12)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel*64
value = 800



;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)


;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)




;===========================================================================
; SUPER
;===========================================================================
;Super Palm Thrust - Banzai Drop
[State -1, Makuyama Banzai Drop ]
type = ChangeState
value = 3000
triggerall = command = "Super"
triggerall = power > 2999
triggerall = !ailevel
triggerall = statetype != A
trigger1 = stateno = [200, 1099]
trigger1 = movecontact
trigger2 = ctrl


;--------------------------------------------------------------------------
;Super Bear Hug
[State -1, Makuyama Banzai Drop ]
type = ChangeState
value = 3040
triggerall = command = "Super2"
triggerall = power > 999
triggerall = !ailevel
triggerall = statetype != A
trigger1 = stateno = [200, 1099]
trigger1 = movecontact
trigger2 = ctrl


;--------------------------------------------------------------------------
;Super Bear Hug
[State -1, Makuyama Banzai Drop ]
type = ChangeState
value = 3080
triggerall = command = "Super3"
triggerall = power > 999
triggerall = !ailevel
triggerall = statetype != A
trigger1 = stateno = [200, 1099]
trigger1 = movecontact
trigger2 = ctrl


;===========================================================================
; Special Moves
;===========================================================================
;Sumo Palms EX
[state -1, Sumo Palms EX]
type = changestate
value = 1020
triggerall = Statetype != A
triggerall = command = "QCF_xy"
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Sumo Palms Light
[state -1, Sumo Palms Light]
type = changestate
value = 1000
triggerall = Statetype != A
triggerall = command = "QCF_x"
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Sumo Palms Hard
[state -1, Sumo Palms Hard]
type = changestate
value = 1010
triggerall = Statetype != A
triggerall = command = "QCF_y"
trigger1 = ctrl
trigger2 = var(1)

;--------------------------------------------------------------------------
;Bear Hug EX
[state -1, Bear Hug EX]
type = changestate
value = 1120
triggerall = Statetype != A
triggerall = command = "HCB_xy"
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;--------------------------------------------------------------------------
;Bear Hug Light
[state -1, Bear Hug Light]
type = changestate
value = 1100
triggerall = Statetype != A
triggerall = command = "HCB_x"
trigger1 = ctrl
trigger2 = var(1)

;--------------------------------------------------------------------------
;Bear Hug Heavy
[state -1, Bear Hug Heavy]
type = changestate
value = 1110
triggerall = Statetype != A
triggerall = command = "HCB_y"
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Anti Air Grab
[state -1, Anti Air Grab EX]
type = changestate
value = 1170
triggerall = Statetype != A
triggerall = power > 499
triggerall = command = "QCF_ab"
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)

;-----------------------------------------------------------------------------
;Anti Air Grab
[state -1, Anti Air Grab L]
type = changestate
value = 1150
triggerall = Statetype != A
triggerall = command = "QCF_a"
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Anti Air Grab
[state -1, Anti Air Grab H]
type = changestate
value = 1160
triggerall = Statetype != A
triggerall = command = "QCF_b"
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)



;===========================================================================
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
trigger1 = command = "BB"  || (command = "dash" && command = "holdback")
trigger1 = statetype = S
trigger1 = ctrl
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
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "grab"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl

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
trigger2 = stateno = 205
trigger2 = var(4) > 0
trigger2 = movecontact
trigger3 = stateno = 205
trigger3 = var(4) > 0
trigger3 = time > 8
trigger3 = !movecontact


;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = var(4) > 0
trigger2 = movecontact
trigger3 = stateno = 200
trigger3 = var(4) > 0
trigger3 = time > 8
trigger3 = !movecontact


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = stateno != 100
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
trigger2 = movecontact
trigger3 = stateno = 205 && movecontact
trigger3 = var(4) > 0

;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = Stateno = 100
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
trigger2 = movecontact
trigger3 = stateno = 205 && movecontact
trigger3 = var(4) > 0

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
trigger3 = stateno = 205 && movecontact
trigger3 = var(4) > 0

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
trigger2 = movecontact
trigger3 = stateno = 205 && movecontact
trigger3 = var(4) > 0

;---------------------------------------------------------------------------

;Wall Cling
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype = A
triggerall = ctrl
triggerall = pos y <= -140
triggerall = stateno != 55
trigger1 = command = "holdupback"
trigger1 = backedgebodydist < 50
trigger2 = command = "holdupfwd"
trigger2 = frontedgebodydist < 50

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
trigger2 = stateno = 400 && movecontact
trigger2 = animelemtime(4) > 0

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || stateno = 200 || stateno = 230
trigger2 = movecontact
trigger3 = stateno = 205 && movecontact
trigger3 = var(4) > 0

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
trigger3 = stateno = 205 && movecontact
trigger3 = var(4) > 0


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
trigger3 = stateno = 205 && movecontact
trigger3 = var(4) > 0

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
;Jump Butt Drop
[State -1, Jump Strong Kick]
type = ChangeState
value = 645
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno = 610
trigger2 = animelemtime(5) > 2



;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 
trigger2 = movecontact


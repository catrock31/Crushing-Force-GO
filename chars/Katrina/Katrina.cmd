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
[command]
name = "SUPER"
command = ~40$B, $F, $B, F, x
time = 40
buffer.time = 8

[command]
name = "SUPER"
command = ~40$B, $F, $B, F, y
time = 40
buffer.time = 8

[command]
name = "SUPER"
command = ~40$B, F, x+y+z
time = 40
buffer.time = 8

[command]
name = "SUPER"
command = ~40$B, F, x+z
time = 40
buffer.time = 8

[command]
name = "SUPER"
command = ~40$B, F, y+z
time = 40
buffer.time = 8

[Command]
name = "SUPER"
command = c+z
time = 1


[command]
name = "Super2"
command = ~40DB,DF,DB,UF,x
time = 40
buffer.time = 8

[command]
name = "Super2"
command = ~40DB,DF,DB,UF,y
time = 40
buffer.time = 8

[command]
name = "Super2"
command = ~40DB,DF,DB,UF,z
time = 40
buffer.time = 8

[command]
name = "Super2"
command = ~$D,$U,x+y+z
time = 40
buffer.time = 8

[command]
name = "Super2"
command = ~$D,$U,x+z
time = 40
buffer.time = 8

[command]
name = "Super2"
command = ~$D,$U,y+z
time = 40
buffer.time = 8

[command]
name = "altsuper2"
command = ~D,DF,F,D,DF,F,x
time = 40
buffer.time = 8

[command]
name = "altsuper2"
command = ~D,DF,F,D,DF,F,y
time = 40
buffer.time = 8

[command]
name = "altsuper2"
command = ~D,DF,F,D,DF,F,z
time = 40
buffer.time = 8

[command]
name = "altsuper2"
command = ~D,F,D,F,x
time = 40
buffer.time = 8

[command]
name = "altsuper2"
command = ~D,F,D,F,y
time = 40
buffer.time = 8

[command]
name = "altsuper2"
command = ~D,F,D,F,z
time = 40
buffer.time = 8

[command]
name = "altsuper2"
command = ~D,F,D,F,z
time = 40
buffer.time = 8

[Command]
name = "altsuper2"
command = ~D,DF,F,x+y+z
buffer.time = 8


[Command]
name = "altsuper2"
command = ~D,DF,F,x+z
buffer.time = 8


[Command]
name = "altsuper2"
command = ~D,DF,F,y+z
buffer.time = 8



[Command]
name = "Super3"
command = ~D,DB,B, b+y


[Command]
name = "Super3"
command = ~D,B, b+y


[Command]
name = "ASSistSoup"
command = y+b+c


[Command]
name = "ASSistSoup"
command = y+b+z


[Command]
name = "ASSistSoup"
command = y+c


[Command]
name = "ASSistSoup"
command = b+z


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
command = ~D, DB, B, a+b

[Command]
name = "QCB_c"
command = ~D, DB, B, c

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
name = "Chargebackx"
command = ~40$B, F, x
time = 10
buffer.time = 12

[command]
name = "Chargebacky"
command = ~40$B, F, y
time = 10
buffer.time = 12

[command]
name = "ChargebackEX"
command = ~40$B, F, z
time = 10
buffer.time = 12

[command]
name = "ChargebackEX"
command = ~40$B, F, x+y
time = 10
buffer.time = 12

[command]
name = "Chargedownx"
command = ~40$D, U, x
time = 20
buffer.time = 12

[command]
name = "Chargedowny"
command = ~40$D, U, y
time = 20
buffer.time = 12

[command]
name = "ChargedownEX"
command = ~40$D, U, z
time = 20
buffer.time = 12

[command]
name = "ChargedownEX"
command = ~40$D, U, x+y
time = 20
buffer.time = 12

[command]
name = "rachelle"
command = y+b
buffer.time = 5

[command]
name = "HCB_x"
command = ~F,D,B,x
time = 20
buffer.time = 5

[command]
name = "HCB_y"
command = ~F,D,B,y
time = 20
buffer.time = 5

[command]
name = "HCB_z"
command = ~F,D,B, z
time = 20
buffer.time = 5

[command]
name = "HCB_z"
command = ~F,D,B, x+y
time = 20
buffer.time = 5


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 15

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 15

[Command]
name = "superjump"
command = D,$U
time = 15
;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery";Required (do not remove)
command = z
time = 1

[command]
name = "throw"
command = a+x
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

;==========================================================================
;---| AI section | --------------------------------------------------------
;==========================================================================

[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno = [600,649])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = stateno != 410
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 410
trigger4 = movehit
var(1) = 1

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
Trigger1=var(30)=59 
Trigger1=RoundState!=2 
Trigger2=!IsHelper 
Trigger2=AILevel=0 
v=30
value=0 
Ignorehitpause=1
;--------------------------------------
;[State -1, AI guarding - Stand]
;Type=Changestate
;Triggerall=Inguarddist
;Triggerall=var(30)=59
;Triggerall=ctrl
;triggerall = enemy,hitdefattr != S,AT
;triggerall = enemy,movetype = A
;Trigger1 = random > (Ailevel * 62)
;value = 120

[State -1, AI guarding - Stand]
Type=Changestate
Triggerall= var(30)=59
triggerall = stateno != 100 || stateno != [200,1399]
triggerall =! (Stateno=[120,159])
triggerall = ctrl
Triggerall = Inguarddist || enemynear,hitdefattr = SCA,AP || enemynear,hitdefattr = SCA,AA
Triggerall = enemynear,hitdefattr != SCA,AT 
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 16
trigger4 = PlayerIDExist(helper(33333333),var(3))
trigger4 = PlayerID(helper(33333333),var(3)),p2bodydist x = [-230,230]
trigger4 = PlayerID(helper(33333333),var(3)),hitdefattr = SCA,AP,AA || helper(100000),inguarddist
value = 120

[State -1, Guard]
type = ChangeState
value = 120
triggerall= AILevel && numenemy&& (StateNo!=[120,155]) && !(enemynear,ctrl) && random < (450 * (AIlevel ** 2 / 64.0))
triggerall= Ctrl
triggerall = ailevel > 6
triggerall=enemynear,Movetype=A && !(enemynear,hitdefattr=SCA,AT) 
trigger1 = inguarddist

;[state -1, AI guard - air]
;type = changestate
;triggerall = inguarddist
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall =! (Stateno=[120,155])
;triggerall = statetype = A
;trigger1 = random > ailevel * 60
;value = 132

;[State -1]; The engine will still guard by through pressing the back button, we need to disable that.
;Type=Assertspecial
;Triggerall=StateNo!=[120,160]
;Trigger1=var(30) = 59
;flag=noairguard
;flag2=nocrouchguard
;flag3=nostandguard

[state -1, Chest Check]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = power > 499
triggerall = ailevel > 5
trigger1 = random < (ailevel * 1)
trigger2 = random < (ailevel * 12) && (enemy,hitdefattr = SCA,HA ||enemy,hitdefattr = SCA, HP)
trigger3 = random < (ailevel * 6) && (enemy,hitdefattr = SCA,SA)
value = 1400



;-----|  SUPER  |--------------------
[STATE -1, Crocodile Sandwich]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
Triggerall = Power > 2999
triggerall = var(32) > 0
triggerall = p2bodydist y > -120
triggerall = ailevel > 4
triggerall = var(42) = 1
triggerall = stateno != 100
trigger1 = random < (ailevel * 48)
Trigger1 = stateno = 1050 && movehit
trigger2 = random < (ailevel * 48)
trigger2 = stateno = 1060 && movehit
trigger3 = stateno = 430 && movehit
trigger3 = random < (ailevel * 2)
trigger4 = stateno = 210 && movehit
trigger4 = random < (ailevel * 24)
trigger5 = enemy,numproj > 0 || enemy,hitdefattr = S,SP,HP
trigger5 = ctrl 
value = 3000

[STATE -1, Boobryureppa]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
Triggerall = Power > 999
triggerall = p2bodydist x = [0,220]
triggerall = p2statetype != L
triggerall = ailevel > 4
trigger1 = prevstateno = 5120 && ctrl
trigger1 = enemynear,movetype = A
trigger1 = random < (ailevel*18)
trigger2 = p2bodydist y = [-120,0]
trigger2 = ctrl
trigger2 = random < (ailevel*2)
trigger3 = stateno = 410 && movehit
trigger3 = random < (ailevel*6)
trigger3 = var(9) = 1
trigger4 = stateno = 210 && movehit
trigger4 = random < (ailevel*12)
trigger5 = helper,stateno = 4032 && movehit
trigger5 = random < (ailevel*6)
trigger5 = ctrl
trigger6 = (stateno = 1050) || (stateno = 1060)
trigger6 = movehit
trigger6 = random < ailevel * 8
value = 3040

[state -1, Counter]
type = changestate
Triggerall = ailevel > 4
Triggerall = var(30)=59
triggerall = statetype != A
triggerall = p2bodydist y = [-350,0]
triggerall = power > 999
triggerall = !numhelper(4000)
triggerall = ctrl
triggerall = inguarddist
triggerall = enemy,hitdefattr != SCA, AT
trigger1 = p2movetype = A
trigger1 = random < ailevel * 6
trigger2 = prevstateno = 5120
trigger2 = p2movetype = A 
trigger2 = random < ailevel * 32
value = 3080


;------------------------------------

[state -1, taunt]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = ailevel > 3
triggerall = statetype != A
triggerall = p2bodydist x > 650
trigger1 = life > 700 && p2life < 200
trigger1 = random < ailevel
trigger1 = p2statetype = L
trigger2 = life > 1000
trigger2 = p2life < 200 
trigger2 = Random < Ailevel 
value = 195

;----|Movement|-----------
[State -1, Jump]
type = changestate
Triggerall=var(30)=59
triggerall = Statetype = S || statetype = C
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = ctrl
trigger1 = enemy,hitdefattr = S,AT
trigger1 = Random < Ailevel * 4
trigger2 = enemy,stateno = 440
trigger2 = Random < Ailevel 
trigger2 = ctrl
trigger3 = ctrl
trigger3 = prevstateno = 835
trigger3 = random < ailevel * 62
trigger4 = p2bodydist x = [350,530]
trigger4 = random < ailevel * 4
trigger4 = ctrl
trigger5 = enemy,name = "Katrina Crocodile"
trigger5 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger5 = ctrl && random < (ailevel*6)
trigger6 = enemy,name = "Zafta Giraffe"
trigger6 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 || enemy,stateno = 3000 
trigger6 = ctrl && random < (ailevel*6)
trigger7 = enemy,name = "Makuyama"
trigger7 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger7 = ctrl && random < (ailevel*6) 
value = 40

[state -1, AI Run] 
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = ailevel > 1
triggerall = stateno != 100
triggerall = p2stateno != [670,679]
trigger1 = Random < (Ailevel*24)
trigger1 = !inguarddist
trigger1 = p2bodydist x > 400
value = 100

[state -1, backdash]
type = changestate
triggerall= var(30) = 59
triggerall = Statetype != A
triggerall = ctrl
triggerall = ailevel > 1
trigger1 = enemy, stateno = 5120
trigger1 = p2bodydist x < 80
trigger1 = Random < Ailevel * 11
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < ailevel * 2 && ctrl
value = 105


[state -1, Duck]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = Statetype != A
triggerall = Random < Ailevel * 10
triggerall = inguarddist 
trigger1 = enemy, name = "Jumbo Elephant"
trigger1 = enemy, stateno = [210,212]
trigger2 = enemy, name = "Bertha Hippo"
trigger2 = enemy, stateno = [1035,1040]
trigger3 = enemy, name = "Ana 'Jiggly' Bunny"
trigger3 = enemy, stateno != [1100, 1129]
trigger4 = enemy, name = "Enorma Pig"
trigger4 = enemy, stateno = [1000,1009]
value = 11

;-----Organize---------------------
[state -1, Launching Crunch]
type = changestate
triggerall = var(30) = 59
triggerall = stateno = 410
triggerall = ailevel > 1
triggerall = time > 24 && time < 28
trigger1 = movehit
value = 415

[state -1, EX command grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2movetype != H
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2bodydist x < 500
triggerall = enemynear,statetype != A
trigger1 = enemynear,hitdefattr = S,SP || enemy,numproj > 0
trigger1 = ctrl
trigger1 = Random < (Ailevel * 24)
trigger2 = p2bodydist x = [400,1100]
trigger2 = random < ailevel * 8
trigger2 = p2statetype != A
trigger2 = enemy,ctrl = 0
trigger2 = enemy,hitdefattr != SC,AA
trigger2 = ctrl
; Mistake
trigger3 = enemy,movetype = A
trigger3 = enemy,statetype != A
trigger3 = random%40 < floor(40 / ailevel)-4
trigger3 = ctrl
value = 1220

[State -1, AI Spin Through projectile] ;by Inktrebuchet
type = ChangeState
value = 1220
triggerall = var(30) = 59 
triggerall = ailevel > 4
triggerall = ctrl
triggerall = p2statetype != A
triggerall = p2statetype != L
triggerall = p2movetype != H
triggerall = power > 499
triggerall = p2bodydist x < 600
triggerall = statetype != A
triggerall = random < ailevel*24
trigger1 = PlayerIDExist(helper(33333333),var(3)) ; enemy projectile exist?
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0
;distance/speed = time
;trigger1 = ceil(PlayerID(helper(33333333),var(3)), p2bodydist x / PlayerID(helper(33333333),var(3)), vel x ) = ceil( 95 / abs(const(velocity.jump.y))) ; 95 = max height during a neu jump.


[state -1, Bust Rush]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno != 100  
triggerall = prevstateno != 100
triggerall = ailevel > 3
triggerall = var(42) = 1
triggerall = Random < ailevel * 24
trigger1 = stateno = 201 && movecontact
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 430 && movecontact
value = 1050

[state -1, Bust Rush]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno != 100 
triggerall = var(42) = 1 
triggerall = prevstateno != 100
triggerall = ailevel > 3
trigger1 = Random < ailevel * 48
trigger1 = stateno = 210 && movehit
value = 1060

[state -1, C.Jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 230
triggerall = p2statetype != A
trigger1 = ctrl
trigger1 = p2statetype = S
trigger1 = random < ailevel * 8
value = 400

[state -1, C.short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 230
triggerall = enemy,statetype != A
triggerall = enemy,statetype != L
trigger1 = ctrl
trigger1 = random < ailevel * 16
trigger2 = stateno = 400 && movecontact
value = 430 

[state -1, Launching Bite]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = C
triggerall = p2bodydist x = [0, 160]
trigger1 = stateno = 430 && movehit
trigger2 = stateno = 400 && movehit
trigger3 = ctrl 
trigger3 = p2bodydist y = -340  && enemy,vel y > 0
trigger3 = random < ailevel * 8
value = 410

[state -1, Jumping jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2statetype = A
trigger1 = Random < Ailevel * 36
trigger1 = ctrl
trigger1 = p2bodydist x < 250
value = 600

[state -1, Jumping Short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
trigger1 = stateno = 600 && movecontact
trigger1 = random < ailevel* 24
value = 630

[state -1, Jumping Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0,420]
triggerall = p2bodydist y = [-200, 300]
trigger1 = stateno = 630 && movecontact
trigger1 = random < ailevel * ifelse(var(8) > 1,48,8)
value = 610

[state -1, Jumping Fierce Latch]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = stateno = 610
triggerall = animelemtime(4) > 0 && animelemtime(6) < 0
trigger1 = movehit
trigger1 = var(8) > 0
value = 615

[state -1, Jumping Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall =! enemy,movetype = A
triggerall = p2bodydist x = [0, 470]
triggerall = p2bodydist y = [-150,300]
trigger1 = stateno = 630 && movehit
trigger1 = random < ailevel * ifelse(var(8) > 1, 8, 48)
trigger2 = Random < Ailevel * 36
trigger2 = p2bodydist x < 200
trigger2 = ctrl
trigger2 = vel y > 0 && pos y < -370
trigger2 = enemy,statetype = S || enemy,statetype = C
trigger3 = enemy,statetype = A
trigger3 = ctrl
trigger3 = p2bodydist x < 470
trigger3 = p2bodydist y > -150 && p2bodydist y < 300
trigger3 = random < ailevel * 16
trigger4 = stateno = 610
trigger4 = movehit
trigger4 = random < ailevel * ifelse(var(8) > 1, 0,32)
value = 640

[state -1, L. Moonsault]
type = changestate
triggerall = var(30) = 59
;triggerall = statetype = A
triggerall = ailevel > 3
triggerall = p2bodydist x < 240
triggerall = p2bodydist y < 300 && p2bodydist y > -200
trigger1 = enemy,hitdefattr = S,AP || enemy,numproj > 0
trigger1 = ctrl
trigger1 = random < ailevel * 24
trigger2 = Random < Ailevel * 24
trigger2 = enemynear,hitdefattr = SCA,AP || enemy,numproj > 0
trigger2 = ctrl
trigger3 = p2stateno = 661
trigger3 = ctrl
trigger3 = random < ailevel * 12
value = 1100

[state -1, H. Moonsault]
type = changestate
triggerall = var(30) = 59
;triggerall = statetype = A
triggerall = ailevel > 3
triggerall = p2bodydist y < 300 && p2bodydist y > - 200
triggerall = p2bodydist x > 240 && p2bodydist x < 1000
trigger1 = stateno = 640 && movehit
trigger1 = enemy,statetype = A
trigger1 = random < ailevel * 24
trigger2 = Random < Ailevel * 36
trigger2 = enemynear,hitdefattr = SCA,AP || enemy,numproj > 0
trigger2 = ctrl
trigger3 = p2stateno = 661
trigger3 = ctrl
trigger3 = random < ailevel * 12
value = 1110

[State -1, AI Moonsault] ;by Inktrebuchet
type = ChangeState
value = 1110
triggerall = var(30) = 59 
triggerall = ailevel > 3
triggerall = ctrl
triggerall = p2stateno != 661
triggerall = p2bodydist x > 240 && p2bodydist x < 1000
;triggerall = statetype = A
triggerall = random < ailevel*18
trigger1 = PlayerIDExist(helper(33333333),var(3)) ; enemy projectile exist?
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0
;distance/speed = time
;trigger1 = ceil(PlayerID(helper(33333333),var(3)), p2bodydist x / PlayerID(helper(33333333),var(3)), vel x ) = ceil( 95 / abs(const(velocity.jump.y))) ; 95 = max height during a neu jump.


[state -1, jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = p2statetype != L
triggerall = p2bodydist x < 240
triggerall = p2bodydist y > -300
trigger1 = ctrl
trigger1 = random < ailevel * 12
trigger2 = enemy,movetype = H
trigger2 = random < ailevel * 24
trigger2 = ctrl
value = 200

[state -1, short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = p2statetype != L
triggerall = p2statetype != A
triggerall = p2bodydist x < 250
trigger1 = random < ailevel * 2
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger2 = random < ailevel*24
value = 230

[state -1, strong]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = p2bodydist x < 260
trigger1 = stateno = 230 && movecontact
trigger1 = random < ailevel*24
trigger2 = stateno = 200 && movecontact
trigger2 = random < ailevel*24
value = 201

[state -1, fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = p2bodydist x < 340
trigger1 = stateno = 201 && movehit
trigger1 = random < ailevel*24
trigger2 = stateno = 200 && movehit
trigger2 = random < ailevel*24
trigger3 = stateno = 230 && movehit
trigger3 = random < ailevel*24
value = 210

[state -1, fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = ailevel > 1
triggerall = p2bodydist x < 230
trigger1 = stateno = 210 && movehit
trigger1 = random < ailevel * 36
value = 215

[state -1, roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = p2statetype != L
triggerall = p2bodydist x < 560
trigger1 = stateno = 210 && movehit
trigger1 = random < ailevel * 24
value = 240

[state -1, Heavy Bust Upper]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 160] 
triggerall = var(42) = 1
triggerall = ailevel > 4
triggerall = power > 499
trigger1 = ctrl
trigger1 = p2movetype = A
trigger1 = random < ailevel *2
trigger2 = p2movetype = A  
trigger2 = p2bodydist y = [-500,-200]
trigger2 = ctrl
trigger2 = random < ailevel * 4
trigger3 = prevstateno = 5120
trigger3 = p2movetype = A
trigger3 = ctrl
trigger3 = random < ailevel * 36
value = 1020

[state -1, Heavy Bust Upper]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x =[-20, 180] 
triggerall = var(42) = 1
triggerall = ailevel > 3
trigger1 = ctrl
trigger1 = p2movetype = A
trigger1 = random < ailevel *8
trigger2 = p2movetype = A
trigger2 = p2bodydist y = [-500, -200]
trigger2 = ctrl
trigger2 = random < ailevel * 12
trigger3 = prevstateno = 835
trigger3 = ctrl
trigger3 = random > floor(ailevel * 1.5)
trigger4 = prevstateno = 5120  
trigger4 = ctrl
trigger4 = random < ailevel * 64
trigger4 = p2movetype = A
value = 1010

[state -1, Light Bust Upper]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = var(42) = 1 
triggerall = p2bodydist x = [-20, 180]
trigger1 = stateno = 400 && movehit
trigger1 = random < ailevel * 2
trigger2 = stateno = 430 && movehit
trigger2 = random < ailevel * 2
value = 1000

[state -1, Rachelle Summon]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = numhelper(4000) = 0
triggerall = ailevel > 3
triggerall = var(29) >= 3
trigger1 = p2bodydist x > 300
trigger1 = ctrl
trigger1 = random < ailevel * 10
trigger2 = stateno = 210 && moveguarded
trigger2 = random < ailevel * 25
trigger3 = enemy,stateno = 5120 && time > 6
trigger3 = random < ailevel * 12
trigger3 = ctrl
value = 1150


[state -1, Throw]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = ailevel > 2
triggerall = enemy,statetype != A
triggerall = enemy,movetype != H
triggerall = p2bodydist x = [0, 100]
triggerall = ctrl
triggerall = p2stateno != [5100,5120]
trigger1 = random < ailevel * 16
trigger2 = enemy,name = "Lardo Rat"
trigger2 = enemy,stateno = [1000,10004]
trigger2 = random < (ailevel*12)
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*8)
value = 800




[state -1, sweep]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x =[5, 820]
trigger1 = ctrl
trigger1 = random < ailevel * 1
trigger2 = stateno = 430 && movehit
trigger2 = random < ailevel * 36
trigger3 = enemy,stateno = [105,106]
trigger3 = ctrl
trigger3 = random < (ailevel*16)
value = 440 

[state -1, L. Death Roll Suplex]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = enemy,movetype != H
trigger1 = Random < Ailevel 
trigger1 = ctrl || var(1)
trigger1 = p2bodydist x < 495
trigger2 = enemy,hitdefattr = S,NT
trigger2 = ctrl
trigger2 = random < ailevel * 8
trigger3 = stateno = 201 && moveguarded
trigger3 = random < ailevel * 2
trigger4 = stateno = 230 && moveguarded
trigger4 = random < ailevel * 2
trigger5 = enemy,authorname = "Kaze Cat"
trigger5 = p2stateno = [1400,1409]
trigger5 = p2statetype != A
trigger5 = random < ailevel*8
trigger5 = ctrl
value = 1200

[state -1, H. Death Roll Suplex]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = enemy,movetype != H
triggerall = p2bodydist x > 496
trigger1 = enemy,hitdefattr != S,AP
trigger1 = random < Ailevel 
trigger1 = enemy,statetype = C
trigger1 = ctrl
trigger2 = stateno = 240 && moveguarded
trigger2 = random < ailevel * 2
trigger3 = enemy,authorname = "Kaze Cat"
trigger3 = p2stateno = [1400,1409]
trigger3 = p2statetype != A
trigger3 = random < ailevel*24
trigger3 = ctrl || var(1)
value = 1210



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

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.


;Super Combo	
[State -1, Crocodile Sandwich]
type = ChangeState
value = 3000
triggerall = command = "SUPER"
triggerall = statetype != A
Triggerall = Power > 2999
triggerall = var(32) > 0
triggerall = ailevel = 0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = [1000,1399]
trigger3 = movecontact 
trigger4 = stateno = [1050,1069]


;---------------------------------------------------------------------------
;Super Combo	
[State -1, Boobryureppa]
type = ChangeState
value = 3040
triggerall = command = "Super2" || command = "altsuper2"
triggerall = statetype != A
Triggerall = Power > 999
triggerall = ailevel = 0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = [1000,1399]
trigger3 = movecontact 
trigger4 = stateno = [1050,1069]
trigger4 = movecontact
trigger5 = stateno = [40,42]

;---------------------------------------------------------------------------
;Assist super	
;[State -1, GO AND GET THIS BITCH!]
;type = ChangeState
;value = 3200
;triggerall = var(32) > 0 ;Rachelle is not Dead dammit
;triggerall = var(29) >= 3
;triggerall = !numhelper(4000)
;triggerall = command = "ASSistSoup"
;triggerall = statetype != A
;Triggerall = Power >= 1000
;triggerall = ailevel = 0
;trigger1 = var(1) ;Use combo condition (above)
;trigger2 = ctrl
;trigger3 = stateno = [1000,1399]
;trigger3 = movecontact 
;trigger4 = stateno = [1050,1069]

[state -1, OH MAH GAWD A CHAIR!!]
type = changestate
triggerall = var(32) > 0 ;Rachelle is not Dead dammit
triggerall = var(29) >= 3
triggerall = !numhelper(4000)
triggerall = command = "Super3"
triggerall = statetype != A
Triggerall = Power >= 1000
triggerall = ailevel = 0
trigger1 = var(1)
trigger2 = ctrl
value = 3080

;---------------------------------------------------------------------------
;Assist
[State -1, Rachelle Summon]
type = ChangeState
value = 1150
triggerall = !numhelper(4000)
triggerall = command = "rachelle"
trigger1 = ctrl


;---------------------------------------------------------------------------
;Breast Upper EX
[State -1, Busty Upper Light]
type = ChangeState
value = 1020
triggerall = command = "ChargedownEX"
triggerall = statetype != A
Triggerall = Power > 499
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl || stateno = 40
trigger3 = stateno = 40

;---------------------------------------------------------------------------
;Breast Upper Light
[State -1, Busty Upper x]
type = ChangeState
value = 1000
triggerall = command = "Chargedownx"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl || stateno = 40
trigger3 = stateno = 40

;----------------------------------------------------------------------------
;Breast Upper Heavy
[State -1, Busty Upper Heavy]
type = ChangeState
value = 1010
triggerall = command = "Chargedowny"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl || stateno = 40
trigger3 = stateno = 40

;---------------------------------------------------------------------------
;Bust Rush EX
[State -1, Bust Rush EX]
type = ChangeState
value = 1070
triggerall = command = "ChargebackEX"
triggerall = statetype != A
triggerall = power > 499
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl


;---------------------------------------------------------------------------
;Bust Rush Light
[State -1, Bust Rush light]
type = ChangeState
value = 1050
triggerall = command = "Chargebackx"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Bust Rush Heavy
[State -1, Bust Rush heavy]
type = ChangeState
value = 1060
triggerall = command = "Chargebacky"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
;---------------------------------------------------------------------------
;Moonsault EX
[State -1, Moonsault EX]
type = ChangeState
value = 1120
triggerall = !ailevel 
triggerall = command = "QCB_c"
triggerall = power > 499
;triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Moonsault Light
[State -1, Moonsault Light]
type = ChangeState
value = 1100
triggerall = !ailevel 
triggerall = command = "QCB_a"
;triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------

;Moonsault Heavy
[State -1, Moonsault heavy]
type = ChangeState
value = 1110
triggerall = !ailevel 
triggerall = command = "QCB_b"
;triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Death Roll Suplex EX
[State -1, Death Roll Suplex EX]
type = ChangeState
value = 1220
triggerall = command = "HCB_z"
triggerall = power > 499
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;----------------------------------------------------------------------------
;Death Roll Suplex Light
[State -1, Death Roll Suplex light]
type = ChangeState
value = 1200
triggerall = command = "HCB_x"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Death Roll Suplex heavy
[State -1, Death Roll Suplex hard]
type = ChangeState
value = 1210
triggerall = command = "HCB_y"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger2 = command = "dash"  && command != "holdback"
trigger1 = command = "FF" 
triggerall = statetype = S
triggerall = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger2 = command = "dash" && command = "holdback"
trigger1 = command = "BB"
triggerall = statetype = S
triggerall = ctrl

;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = changestate
value = 41
trigger1 = command = "superjump"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "throw"
triggerall = statetype = S
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
trigger1 = stateno != 200

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Slash]
type = ChangeState
value = 201
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = stateno = 200 || stateno = 230
trigger1 = statetype = S
trigger1 = movecontact

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = stateno = 201 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = stateno = 201 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 430 && movecontact

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
;Taunt
[State -1, Taunt]
type = ChangeState
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
trigger2 = stateno = 400 && animelemtime(4) > 1

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 200) || stateno = 201 || stateno = 230
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
trigger2 = (stateno = 400) || (stateno = 430) || stateno = 200 || stateno = 230 || stateno = 201 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact


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
trigger2 = stateno = 600 && movecontact ;Air blocking


;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

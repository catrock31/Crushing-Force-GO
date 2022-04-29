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
name = "Super combo"
command = ~D, DF, F, a+b+c
time = 20
buffer.time = 8


[command]
name = "Super combo"
command = ~D, DF, F, D, DF, F, a
time = 40
buffer.time = 8


[command]
name = "Super combo"
command = ~D, F, D, F, a
time = 40
buffer.time = 8


[command]
name = "Super combo"
command = ~D, DF, F, D, DF, F, b
time = 40
buffer.time = 8

[command]
name = "Super combo"
command = ~D, F, D, F, b
time = 40
buffer.time = 8


[command]
name = "Super combo"
command = ~D, DF, F, a+c
buffer.time = 8


[command]
name = "Super combo"
command = ~D, DF, F, b+c
buffer.time = 8

[command]
name = "Super2"
command = ~D, DF, F, z+x
buffer.time = 8

[command]
name = "Super2"
command = ~D, DF, F, y+z
buffer.time = 8

[command]
name = "Super2"
command = ~D, DF, F, D, DF,F,x
time = 40
buffer.time = 8

[command]
name = "Super2"
command = ~D, DF, F, D,DF,F,y
time = 40
buffer.time = 8




[command]
name = "Super3"
command = ~D,DB,B,D,DB,B,a
time = 30
buffer.time = 8


[command]
name = "Super3"
command = ~D,DB,B,D,DB,B,b
time = 30
buffer.time = 8


[command]
name = "Super3"
command = ~D,DB,B,D,DB,B,c
time = 30
buffer.time = 8

[command]
name = "Super3"
command = ~D,B,D,B,a
time = 30
buffer.time = 8

[command]
name = "Super3"
command = ~D,B,D,B,b
time = 30
buffer.time = 8

[command]
name = "Super3"
command = ~D,B,D,B,c
time = 30
buffer.time = 8

[command]
name = "Super3"
command = ~D,DB,B,a+b+c
buffer.time = 8


[command]
name = "Super3"
command = ~D,DB,B,a+c
buffer.time = 8


[command]
name = "Super3"
command = ~D,DB,B,b+c
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
buffer.time = 8

[Command]
name = "upper_y"
command = ~F, D, DF, y
buffer.time = 8

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y
buffer.time = 8

[command]
name = "upper_a"
command = ~F, D, DF, a
buffer.time = 12

[command]
name = "upper_b"
command = ~F, D, DF, b
buffer.time = 12

[command]
name = "upper_c"
command = ~F, D, DF, c
buffer.time = 12


[command]
name = "upper_ab"
command = ~F, D, DF, a+b
buffer.time = 12


[command]
name = "upper_a"
command = ~F, D, F, a
buffer.time = 12


[command]
name = "upper_b"
command = ~F, D, F, b
buffer.time = 12

[command]
name = "upper_c"
command = ~F, D, F, c
buffer.time = 12

[command]
name = "upper_ab"
command = ~F, D, F, a+b
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
name = "QCF_c"
command = ~D, DF, F, c


[Command]
name = "QCB_a"
command = ~D, DB, B, a


[Command]
name = "QCB_b"
command = ~D, DB, B, b


[Command]
name = "QCB_ab"
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

[Command]
name = "FF_xy"
command = F, F, x+y

[Command]
name = "FF_x"
command = F, F, x

[Command]
name = "FF_y"
command = F, F, y

[command]
name = "mash_lk"
command = a, a, a, a
time = 35


[command]
name = "mash_lk"
command = b, a, b, a
time = 35


[command]
name = "mash_hk"
command = b, b, b, b
time = 35


[command]
name = "mash_hk"
command = a, b, a, b
time = 35


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
command = ~D, $U
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[command]
name = "grab"
command = x+a
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


[command]
name = "Super combo"
command = z+c
time = 3

[Command]
name = "Dodge"
command = b+y
time = 1

[Command]
name = "recovery"
command = z
time = 1

[command]
name = "Defensive"
command = x+b
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
;-| Hold Button |-----------------------------------------------------------

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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno = [600,640]) ||stateno = 645 || (stateno = 646)
trigger2 = stateno != 440
trigger2 = stateno != 642
trigger2 = stateno != 410 
trigger2 = stateno != 411
trigger2 = movecontact
trigger3 = stateno = 410 || stateno = 440 || stateno = 240 ||stateno = 411
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


;------|  Defenseive |-----------------------------------------------------
;[State -1, AI guarding - Stand]
;Type=Changestate
;Triggerall=Inguarddist
;Triggerall=var(30)=59
;Triggerall=ctrl
;triggerall = enemy,hitdefattr != S, AT
;triggerall = enemy,movetype = A
;Trigger1 = random > (Ailevel * 31)
;value = 120

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
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 16
value = 120

;[state -1, AI guard - Air]
;type = changestate
;triggerall = inguarddist  && ctrl
;triggerall = var(30) = 59
;triggerall =! (Stateno=[120,155])
;triggerall = statetype = A
;trigger1 = random < (ailevel * 90)
;value = 132


;[State -1]; The engine will still guard by through pressing the back button, we need to disable that.
;Type=Assertspecial
;Triggerall=StateNo!=[120,160]
;Trigger1=var(30) = 59
;flag=noairguard
;flag2=nocrouchguard
;flag3=nostandguard


[state -1, defensive dodge]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = (stateno = [150,153])
triggerall = power > 999
triggerall = ailevel > 5
triggerall = numenemy
trigger1 = random < floor(ailevel*0.25) && (enemy,hitdefattr = SCA,NA,NP)
trigger2 = random < (ailevel * 4) && (enemy,hitdefattr = SCA,HA ||enemy,hitdefattr = SCA, HP)
trigger3 = random < floor(ailevel * 1) && (enemy,hitdefattr = SCA,SA)
value = 1400

[state -1, defensive dodge]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = power > 999
triggerall = time%8
triggerall = ailevel > 5
triggerall = numenemy
trigger1 = random < floor(ailevel*0.25) && (p2bodydist x < 250) || (backedgebodydist < 300)
trigger2 = random < floor(ailevel * 0.25) && (enemy,hitdefattr = SCA,HA ||enemy,hitdefattr = SCA, HP) && (p2bodydist x < 250) || (backedgebodydist < 300)
trigger3 = random < floor(ailevel * 0.25) && (enemy,hitdefattr = SCA,SA) && (p2bodydist x < 250) || (backedgebodydist < 300)
value = 1401

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
trigger2 = frontedgebodydist < 30
value = 55

;------|  Movement  |------------------------------------------------------

[state -1, AI backflip]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = backedgedist > 60
triggerall = numenemy
trigger1 = stateno = 231
trigger1 = movehit != 1
trigger2 = p2statetype = A
trigger2 = p2movetype = A
trigger2 = p2bodydist x = [0,240]
trigger2 = Random < floor(Ailevel*0.25)
trigger3 = p2stateno = [5100,5120]
trigger3 = p2bodydist x = [0, 240]
trigger3 = random < (ailevel*88)
trigger4 = enemy,hitdefattr = SCA,AT
trigger4 = random < (ailevel*2)
trigger4 = p2bodydist x < 160
value = 105

[state -1, AI Run] 
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ctrl
triggerall = stateno != 100
triggerall = !inguarddist
triggerall = p2stateno != [670,679]
triggerall = numenemy
trigger1 = Random < (Ailevel * 12)
trigger1 = enemynear,movetype != A
trigger1 = p2bodydist x > 300
trigger2 = enemy,movetype = I && enemy,ctrl = 0
trigger2 = enemy,animtime < -8
trigger2 = random < ailevel * 32
trigger2 = p2bodydist x > 40
value = 100

[state -1, AI jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S || Statetype = C
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
triggerall = numenemy
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
trigger9 = stateno = 100
trigger9 = random < ailevel * 24
trigger9 = p2bodydist x = [400, 1000]
value = 40

[state -1, Air Jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = var(4) > 0
trigger1 = movehit
trigger1 = stateno = 645
value = 45

[state -1, Duck]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = stateno != [10,11]
triggerall = Statetype != A
triggerall = Random < (Ailevel*36)
triggerall = stateno != 11
triggerall = inguarddist 
triggerall = numenemy
trigger1 = enemy, name = "Jumbo Elephant"
trigger1 = enemy, stateno = [210,212]
trigger2 = enemy, name = "Bertha Hippo"
trigger2 = enemy, stateno = [1035,1040]
trigger3 = enemy, name = "Ana 'Jiggly' Bunny"
trigger3 = enemy, stateno != [1100, 1129]
trigger4 = enemy, name = "Enorma Pig"
trigger4 = enemy, stateno = [1000,1009]
trigger5 = enemy, stateno = [231,241]
trigger5 = enemy, name = "Zafta Giraffe"
value = 10



;------| Combos |----------------------------------------------------------
[state -1, Super Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = power > 2999
triggerall = ailevel > 4
triggerall = numenemy
triggerall = enemy,statetype != L
triggerall = p2bodydist y = [-100, 300]
triggerall = p2bodydist x = [-10, 620]
trigger1 = random < ailevel*64
trigger1 = stateno = 1100 || stateno = 1110
trigger1 = movehit 
trigger2 = stateno = 1003 || stateno = 1013 || stateno = 1202 || stateno = 1212
trigger2 = movehit
trigger2 = random < ailevel*64
trigger3 = stateno = 1050 || stateno = 1060
trigger3 = vel y > -15 && vel y < 15
trigger3 = movehit
trigger3 = random < ailevel*64
trigger4 = stateno = 240
trigger4 = movehit
trigger4 = random < ailevel * 24
value = 3000

[state -1, Super Rising Butt]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = power > 999
triggerall =! enemy,statetype = L
triggerall = ailevel > 4
triggerall = (p2bodydist y = [-300, 0])
triggerall = (p2bodydist x = [-10, 90])
triggerall = numenemy
trigger1 = stateno = 1102 && movehit
trigger1 = random < (ailevel*4)
trigger2 = stateno = 1112 && movehit
trigger2 = random < (ailevel*4)
trigger3 = ctrl
trigger3 = p2movetype = A
trigger3 = random < (ailevel*2)
trigger4 = prevstateno = 5120
trigger4 = p2movetype = A
trigger4 = random < (ailevel*32)
value = 3040

[state -1, Super Flip Kick]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype != A
triggerall = power > 999
triggerall = ailevel > 4
triggerall = enemy,statetype != L
triggerall = numenemy
triggerall = (p2bodydist y = [-40, 200])
triggerall = (p2bodydist x = [-10, 1200])
;triggerall = var(6) = 1
trigger1 = stateno = 210 && movehit
trigger1 = random < (ailevel*12)
trigger2 = stateno = 240 && movehit
trigger2 = random < (ailevel*18)
trigger3 = enemy,numproj > 0 || enemynear,hitdefattr = SC,NP,SP
trigger3 = ctrl  || var(1)
trigger3 = random < (ailevel*6)
value = 3080

[State -1, AI Sommersault against enemy's Projectile] ;by Inktrebuchet
type = ChangeState
triggerall = var(30) = 59
triggerall = ailevel > 4 
triggerall = (p2bodydist y = [-40, 200])
triggerall = (p2bodydist x = [-10, 1200])
triggerall = power > 999
triggerall = !enemy,statetype = L
triggerall = numenemy
triggerall = statetype != A
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists  
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0;Avoids division by zero debug flood;distance / velocity = time >= startup time
;trigger1 = (PlayerId(helper(33333333),var(3)),p2bodydist x) / (PlayerId(helper(33333333),var(3)),vel x) >= 2 ;5= startup time
trigger1 = ctrl ||var(1)
trigger1 = random < ailevel * 24
value = 3080



[state -1, EX Anti Air Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x =[0,120]
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2statetype != L
triggerall = p2bodydist y =[-420, 0]
trigger1 = p2bodydist y =[-420, -150] 
trigger1 = ctrl
trigger1 = p2movetype = A
trigger1 = random < (ailevel*4)
trigger2 = prevstateno = 5120
trigger2 = random < (ailevel*32)
trigger2 = p2movetype = A
trigger2 = ctrl
trigger2 = p2bodydist x = [0,200]
value = 1070





[state -1, EX flip kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = stateno != 410 && movehit
triggerall = ailevel > 4
triggerall = numenemy
triggerall = p2bodydist x < 950
triggerall = var(6) > 0
triggerall = power > 499
triggerall = ctrl
trigger1 = enemy, numproj > 0  || enemynear,hitdefattr = SC,NP,SP,HP
trigger1 = p2bodydist x > 400
trigger1 = Random < (Ailevel * 64)
value = 1120

[state -1, Air Launcher]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = var(4) > 1
triggerall = ailevel > 2
triggerall = numenemy
trigger1 = movehit
trigger1 = stateno = 631 || stateno = 601 || stateno = 640
trigger1 = random < (ailevel*24)
trigger1 = enemy,statetype = A
trigger2 = movehit
trigger2 = stateno = 632 
trigger2 = random < (ailevel*64)
trigger2 = enemy,statetype = A
value = 645

[state -1, Corkscrew Butt]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = var(36) = 1
trigger1 = ctrl
trigger1 = p2bodydist y > -350
trigger1 = Random < Ailevel * 18
value = 646

[state -1, J. jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = !inguarddist
triggerall = p2bodydist x < 120
triggerall = p2bodydist y > -200 && p2bodydist y < 240
trigger1 = ctrl
trigger1 = vel y <= 0
trigger1 = Random < Ailevel * 12
value = 600

[state -1, J. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = !inguarddist
triggerall = p2bodydist x < 120
triggerall = p2bodydist y > -100 && p2bodydist y < 420
trigger1 = ctrl
trigger1 = vel y > 0
trigger2 = stateno = 600
trigger2 = movecontact
value = 630

[state -1, J. strong]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist y =[-100, -20]
trigger1 = stateno = 630 && movecontact
value = 601

[state -1, J. strong]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
trigger1 = stateno = 601 && movecontact
trigger2 = stateno = 630 && movehit
trigger2 = random < ailevel * 36
value = 631

[state -1, J. strong]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
trigger1 = stateno = 631 && movecontact
value = 632

[state -1, Jumping Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 2
triggerall = var(36) = 0
triggerall = numenemy
trigger1 = movehit
trigger1 = stateno = 632 
trigger1 = random < (ailevel*48)
trigger1 = enemy,statetype = A
trigger2 = ctrl
trigger2 = vel y > 0
trigger2 = random < ailevel * 2
trigger2 = p2statetype != A
trigger2 = !inguarddist
value = 640

[state -1, air butt bump]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype = A
triggerall = ailevel > 3
triggerall = power >= 2000
trigger1 = stateno = 632 && movehit
value = 1200

[state -1, air butt bump]
type = changestate
triggerall = var(30) = 59
triggerall = Statetype = A
triggerall = ailevel > 3
triggerall = power < 2000
trigger1 = stateno = 632 && movehit
value = 1210



[state -1, J. H Punch]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
trigger1 = ctrl
trigger1 = vel y > 0
trigger1 = p2bodydist y = 380
trigger1 = Random < Ailevel * 8
trigger2 = stateno = 632 && movecontact
trigger2 = random < ailevel * 6
value = 610




[state -1, AI 1st jab]
type = changestate
triggerall = var(30) = 59
triggerall =! statetype = A
triggerall = ctrl
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = numenemy
triggerall = p2bodydist y > -140 && p2bodydist x < 130
trigger1 = Random < (Ailevel*18)
trigger2 = enemy,movetype = H  && Random < (Ailevel*48)
trigger3 = enemy,animtime < -4
trigger3 = random < ailevel * 36
value = 200

[state -1, AI C. jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = ctrl
triggerall = !inguarddist
triggerall = p2statetype != L
triggerall = p2bodydist x < 205
trigger1 = Random < (Ailevel*18)
trigger1 = p2movetype != H
value = 400

[state -1, AI C. short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = numenemy
triggerall = enemy,statetype != A
triggerall =! enemynear,movetype = A
triggerall = p2bodydist x < 200
triggerall = p2bodydist y > -90
trigger1 = Random < (Ailevel*8)
trigger1 = ctrl
trigger2 = stateno = 400 && movehit
trigger2 = movehit
trigger3 = random < ailevel * 16  && ctrl
trigger3 = enemy,statetype = S
trigger4 = stateno = 430 && moveguarded
trigger4 = ctrl
value = 430

[state -1, AI C hard punch]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = p2bodydist x < 190
triggerall = p2statetype != L
triggerall = numenemy
triggerall = var(11) > 0 || ailevel <= 4
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random < (ailevel * 48)
trigger2 = ctrl
trigger2 = p2movetype = H
trigger2 = p2statetype = A
trigger2 = enemy,hitfall = 0
trigger2 = random < ailevel * 2
trigger3 = ctrl
trigger3 = p2bodydist y > -30
trigger3 = Random < (Ailevel * 2)
trigger4 = stateno = 231
trigger4 = movehit
trigger4 = p2statetype = A
trigger5 = stateno = 210
trigger5 = movehit
trigger5 = random < (ailevel * 24)
;escape armor
trigger6 = (stateno = 200) || (stateno = 400) || (stateno = 230) || (stateno = 430) || (stateno = 201) || (stateno = 231)
trigger6 = movehit
trigger6 = enemy,movetype = A
trigger6 = random < ailevel * 36
value = 410


[state -1, AI C. Hard Kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 455
triggerall = numenemy
triggerall = enemy,statetype != A
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random < ailevel*48
trigger2 = ctrl
trigger2 = enemy,statetype = S
trigger2 = Random < (Ailevel*4)
trigger3 = stateno = 430
trigger3 = moveguarded
trigger3 = random < floor(8/ailevel)
value = 440


[state -1, AI 2nd jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
trigger1 = stateno = 200
trigger1 = movehit
trigger2 = stateno = 200
trigger2 = movecontact
value = 201

[state -1,  AI light kick 1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = p2bodydist x < 110
trigger1 = stateno = 201
trigger1 = movehit
trigger2 = stateno = 201
trigger2 = movecontact
value = 230

[state -1, AI L. KICK 2]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
trigger1 = stateno = 230
trigger1 = movehit
trigger2 = stateno = 230
trigger2 = movecontact
value = 231

[state -1, AI hard punch]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = numenemy
triggerall =! enemynear,movetype = A
trigger1 = stateno = 231
trigger1 = movehit
trigger1 = random < ailevel * 48
value = 210



[state -1, AI Hard Kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S && enemynear,statetype != A
triggerall = p2bodydist x < 350
triggerall = numenemy
triggerall =! enemynear,movetype = A
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random < ailevel * 48
trigger2 = ctrl
trigger2 = Random < Ailevel
trigger2 = stateno = 100
value = 240

[state -1, Dodge Roll]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = stateno != 410
triggerall = numenemy
triggerall = stateno != 440
trigger1 = stateno = 240 || stateno = 210 || stateno = 231
trigger1 = moveguarded
trigger1 = random < ailevel * 4
trigger2 = ctrl
trigger2 = enemy,numproj > 0
trigger2 = random < ailevel * 18
trigger2 = inguarddist
trigger3 = movetype = A
trigger3 = inguarddist
trigger3 = random < ailevel * 4
trigger3 = ctrl
trigger4 = p2movetype = A
trigger4 = inguarddist
trigger4 = enemy,animtime < -24
trigger4 = random < ailevel * 6
trigger4 = ctrl || var(1)
value = 700

[State -1, AI Sommersault against enemy's Projectile] ;by Inktrebuchet
type = ChangeState
triggerall = var(30) = 59
triggerall = ailevel > 3 
triggerall = statetype != A
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists  
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0;Avoids division by zero debug flood;distance / velocity = time >= startup time
;trigger1 = (PlayerId(helper(33333333),var(3)),p2bodydist x) / (PlayerId(helper(33333333),var(3)),vel x) >= 5 ;5= startup time
trigger1 = ctrl
trigger1 = inguarddist
trigger1 = random < ailevel * 48
trigger2 = (stateno = [200,201]) || (stateno = [230,231]) || (stateno = 210) || (stateno = 240) || (stateno = 400) || (stateno = 430)
trigger2 = movecontact
trigger2 = random < ailevel * 12
value = 700

[state -1, Twerk Light]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 3
triggerall = p2statetype != L
trigger1 = stateno = 210 || stateno = 430 || stateno = 240 || stateno = 231
trigger1 = moveguarded
trigger1 = random < ailevel * 6
trigger2 = stateno = 231
trigger2 = moveguarded
trigger2 = random < ailevel * 18
value = 1150

[state -1, Twerk Light]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = numenemy
triggerall = ailevel > 3
trigger1 = stateno = 210 || stateno = 430 || stateno = 240 || stateno = 230
trigger1 = moveguarded
trigger1 = random < ailevel * 2
trigger2 = stateno = 231
trigger2 = moveguarded
trigger2 = random < ailevel * 18
trigger3 = stateno = 210 || stateno = 430 || stateno = 240 || stateno = 230
trigger3 = moveguarded
trigger3 = random < ailevel * 12
trigger3 = enemy,backedgebodydist < 40
value = 1160

[state -1, flip kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = var(6) > 0
triggerall = ailevel > 3
triggerall = numenemy
triggerall = p2bodydist x = [0, 1000] 
triggerall = stateno != 410 && movehit
trigger1 = stateno = 240
trigger1 = movehit
trigger1 = Random < Ailevel * 2
trigger2 = enemy, numproj > 0 || enemynear, hitdefattr= SC,NP,SP
trigger2 = ctrl
trigger2 = random < ailevel *18
trigger3 = p2statetype = C
trigger3 = ctrl 
trigger3 = random < ailevel*4
value = 1100

[State -1, AI Sommersault against enemy's Projectile] ;by Inktrebuchet
type = ChangeState
triggerall = var(30) = 59
triggerall = ailevel > 3 
triggerall = numenemy
triggerall = statetype != A
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists  
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0;Avoids division by zero debug flood;distance / velocity = time >= startup time
;trigger1 = (PlayerId(helper(33333333),var(3)),p2bodydist x) / (PlayerId(helper(33333333),var(3)),vel x) >= 5 ;5= startup time
trigger1 = ctrl
trigger1 = p2bodydist x = [0,1000]
trigger1 = ifelse(ailevel = 8, (random < ailevel*64),(random < ailevel*24))
trigger1 = enemy,animtime < -12
trigger2 = (stateno = [200,201]) || (stateno = [230,231]) || (stateno = 210) || (stateno = 240) || (stateno = 400) || (stateno = 430)
trigger2 = movecontact
trigger2 = ifelse(ailevel = 8, (random < ailevel*64),(random < ailevel*24))
trigger2 = inguarddist
value = 1100

[state -1, flip kick]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = var(6) > 0
triggerall = ailevel > 3
triggerall = numenemy
triggerall = stateno != 410 && movehit
triggerall = p2bodydist x = [0,1200]
triggerall = ctrl
trigger1 = enemy, numproj > 0 || enemynear,hitdefattr = SCA,NP,SP,HP
trigger1 = Random < Ailevel * 32
value = 1110

[State -1, AI Sommersault against enemy's] ;by Inktrebuchet
type = ChangeState
value = 1110
triggerall = var(30) = 59
triggerall = ailevel > 3 
triggerall = ctrl
triggerall = statetype != A
triggerall = numenemy
triggerall = var(6) > 0
triggerall = random < ailevel*24
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0;Avoids division by zero debug flood;distance / velocity = time >= startup time
;trigger1 = (PlayerId(helper(33333333),var(3)),p2bodydist x) / (PlayerId(helper(33333333),var(3)),vel x) >= 5 ;5= startup time
trigger1 = ctrl
trigger1 = p2bodydist x = [0,1200]
trigger1 = ifelse(ailevel = 8, (random < ailevel*48),(random < ailevel*24))
trigger1 = enemy,animtime < -18

[state -1, L Anti Air Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 140
triggerall = numenemy
triggerall = ailevel > 3
triggerall = p2statetype != L
trigger1 = ctrl 
trigger1 = stateno = 5120
trigger1 = p2bodydist y = [-400,-150]
trigger1 = random < ailevel*6
value = 1050

[state -1, H Anti Air Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 140
triggerall = ailevel > 3
triggerall = numenemy
triggerall = p2statetype != L
trigger1 = ctrl 
trigger1 = prevstateno = 5120
trigger1 = enemynear,hitdefattr = A,AA
trigger1 = p2bodydist y =[-420, 0] 
trigger1 = random < (ailevel * 24)
trigger2 = p2bodydist y = [-500,-150]
trigger2 = p2movetype = A
trigger2 = ctrl
trigger2 = random < ailevel*6
value = 1060

[state -1, Dive Butt]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ctrl
triggerall = p2stateno != [660,669]
triggerall = pos y < - 150
trigger1 = p2bodydist x = [-100, 300]
trigger1 = random < (ailevel*2)
trigger1 = pos y < -300
trigger1 = p2statetype != A
trigger2 = p2statetype = L
trigger2 = random < ailevel * 24
trigger2 = var(8) = 2
value = 635

[state -1, Butt Drop]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2statetype != S || p2statetype != C
triggerall = p2bodydist x = [-100,300]
trigger1 = stateno = 611
trigger1 = movehit
trigger1 = random < (ailevel*48)
trigger2 = p2statetype = L
trigger2 = pos y < -100
trigger2 = ctrl
trigger2 = random < (ailevel * 12)
value = 650

[state -1, Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = ailevel > 3
triggerall = p2bodydist x =[0, 400]
triggerall = p2bodydist y = [-170, 0]
trigger1 = stateno = 240
trigger1 = movehit
trigger1 = var(6) <= 0
trigger1 = random < ailevel*8
trigger2 = ctrl 
trigger2 = p2bodydist x < 300
trigger2 = Random < Ailevel 
trigger2 = p2movetype != A
trigger3 = stateno = 240
trigger3 = moveguarded
trigger3 = random < (80/ailevel) ;Intentional Mistake
value = 1000

[state -1, Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = ailevel > 3
triggerall = p2bodydist x < 770
triggerall = p2bodydist y = [-170, 0]
trigger1 = stateno = 240
trigger1 = movehit
trigger1 = random < ailevel*32
trigger2 = stateno = 240
trigger2 = movehit
trigger2 = var(6) <= 0 
trigger3 = ctrl 
trigger3 = Random < Ailevel 
trigger4 = stateno = 440
trigger4 = movehit
trigger4 = random < ailevel*24
trigger5 = stateno = 240
trigger5 = moveguarded
trigger5 = random < (160/ailevel) ;Mistake
value = 1010

[state -1, Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2bodydist y = [-170, 0]
triggerall = p2statetype != L
trigger1 = stateno = 210 || stateno = 240 ||stateno = 440
trigger1 = movehit
trigger1 = Random < (Ailevel * 2)
value = 1020

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
;triggerall = enemy,name != "Bertha Hippo"
;triggerall = enemy,name != "Jumbo Elephant"
;triggerall = enemy,name != "Jumba Elephant"
;triggerall = enemy,name != "Julian Hippo"
triggerall = statetype != A
triggerall = p2statetype = S || p2statetype = C
triggerall = ctrl
triggerall = stateno != 100
triggerall = numenemy
triggerall = p2movetype != H
triggerall = p2bodydist x = [0, 90]
trigger1 = Random < Ailevel * 12
trigger2 = Random < Ailevel * 16
trigger2 = p2stateno = [120,130]
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*8)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel * 24
value = 800

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 2
triggerall = p2bodydist y = [-200, 240]
triggerall = p2statetype = A
triggerall = stateno != 642
triggerall = !enemynear,hitfall
triggerall = p2movetype = H
triggerall = ctrl
trigger1 = p2bodydist x < 170
trigger1 = random < ailevel * 4
trigger2 = stateno = 632
trigger2 = movehit
trigger2 = random < ailevel * 24
value = 831

[state -1, AI grab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = ailevel > 2
triggerall = p2bodydist y > -200 && p2bodydist y < 240
triggerall = p2statetype = A
triggerall = stateno != 642
triggerall = random < ailevel * 12
triggerall = p2movetype != H
triggerall = ctrl
triggerall = !enemynear,hitfall
trigger1 = p2bodydist x < 170
value = 830

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.

;---------------------------------------------------------------------------
[state -1, Sweet Bunns]
type = changestate
value = 3000
triggerall = command = "Super combo"
Triggerall = power > 2999
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1399]
trigger3 = movecontact
trigger4 = stateno = [1000,1019] 
trigger4 = movecontact
trigger5 = stateno = [1200,1219]
trigger5 = movecontact

;---------------------------------------------------------------------------
[state -1, Super Rising Butt]
type = changestate
value = 3040
triggerall = command = "Super2"
triggerall = Statetype != A
Triggerall = power > 999
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1150,1169]
trigger3 = movecontact
trigger4 = stateno = [1100,1130]
trigger4 = movecontact


;---------------------------------------------------------------------------
[state -1, Flip 2 Twerk]
type = changestate
value = 3080
triggerall = command = "Super3"
triggerall = Statetype != A
Triggerall = power > 999
triggerall = !ailevel
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1150,1169]
trigger3 = movecontact
trigger4 = stateno = [1100,1130]
trigger4 = movecontact


;---------------------------------------------------------------------------
[State -1,EX Rising Butt]
type = ChangeState
value = 1070
triggerall = command = "upper_c" || command = "upper_ab"
triggerall = statetype != A
triggerall = ailevel = 0
triggerall = power > 499
trigger1 = ctrl 
trigger2 = var(1)
;---------------------------------------------------------------------------
[State -1,Rising Butt L]
type = ChangeState
value = 1050
triggerall = ailevel = 0
triggerall = command = "upper_a"
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = var(1)

;---------------------------------------------------------------------------
[State -1,Rising Butt H]
type = ChangeState
value = 1060
triggerall = ailevel = 0
triggerall = command = "upper_b"
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = var(1)
;--------------------------------------------------------------------------
[State -1,Butt bump EX]
type = ChangeState
value = 1020
triggerall = command = "QCF_c" || command = "QCF_ab"
triggerall = ailevel = 0
triggerall = power > 499
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
[state -1, Air Butt Bump EX]
type = changestate
value = 1220
triggerall = statetype = A
triggerall = power > 499
triggerall = command = "QCF_c" || command = "QCF_ab"
triggerall = stateno != 642
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1003 || stateno = 1013

;---------------------------------------------------------------------------
[State -1,Butt bump L]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = ailevel = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[state -1, Air Butt Bump L]
type = changestate
value = 1200
triggerall = statetype = A
triggerall = command = "QCF_a"
triggerall = stateno != 642
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
[State -1,Butt bump H]
type = ChangeState
value = 1010
triggerall = command = "QCF_b"
triggerall = ailevel = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
[state -1, Air Butt Bump H]
type = changestate
value = 1210
triggerall = statetype = A
triggerall = command = "QCF_b"
triggerall = stateno != 642
trigger1 = ctrl
trigger2 = var(1)

;----------------------------------------------------------------------------

[State -1,EX Flip Kick]
type = ChangeState
value = 1120
triggerall = command = "QCB_c" || command = "QCB_ab"
triggerall = statetype != A
triggerall = ailevel = 0
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------

[State -1,Flip Kick L]
type = ChangeState
value = 1100
triggerall = command = "QCB_a"
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)

;----------------------------------------------------------------------------
[State -1,Flip Kick  H]
type = ChangeState
value = 1110
triggerall = command = "QCB_b"
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[state -1, Gatling Bunn L]
type = changestate
value = 1150
triggerall = command ="mash_lk"
triggerall = statetype != A
triggerall = Stateno  != 440
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 230 || stateno = 231 || stateno = 240

;---------------------------------------------------------------------------
[state -1, Gatling Bunn L]
type = changestate
value = 1160
triggerall = command ="mash_hk"
triggerall = statetype != A
triggerall = Stateno  != 440
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 230 || stateno = 231 || stateno = 240

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
;Dodge
[state -1, Dodge roll]
type = changestate
triggerALL = command = "Dodge"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
value = 700

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 41
trigger1 = command = "superjump"
trigger1 = statetype = S || statetype = C
trigger1 = ctrl

;Air Jump cancel
[state -1, air jump cancel]
type = changestate
value = 45
triggerall = statetype = A
triggerall = ailevel = 0
triggerall = var(4) > 0
trigger1 = var(1) = 1
trigger1 = command = "holdup"

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
;Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "grab"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl

;Air Throw
[State -1, Air Throw raw]
type = ChangeState
value = 830
triggerall = command = "grab"
triggerall = statetype = A
triggerall = numenemy
triggerall = enemy, movetype != H
trigger1 = ctrl

[State -1, Air Throw comobable]
type = ChangeState
value = 831
triggerall = command = "grab"
triggerall = statetype = A
triggerall = numenemy
triggerall = enemy, movetype = H
trigger1 = stateno = 600 || stateno = 630 || stateno = 601 || stateno = 631 || stateno = 632
trigger1 = movecontact




;----------------------------------------------------------------------------
;Defensive roll - backward
[state -1, defensive roll]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
triggerall = command = "holdback"
trigger1 = command = "recovery"
trigger1 = power > 999

;----------------------------------------------------------------------------
;Defensive cartwheel - forward
[state -1, defensive roll]
type = changestate
value = 1401
triggerall = stateno = [150,152]
triggerall = statetype != A
triggerall = command != "holdback"
trigger1 = command = "recovery"
trigger1 = power > 999




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
;Stand Light Punch 2nd hit
[State -1, Stand Light Punch]
type = ChangeState
value = 201
triggerall = command = "x"
triggerall = stateno = 200
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = movecontact

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = stateno = 201 && movecontact
trigger5 = stateno = 231 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 201) && movecontact
trigger4 = (stateno = 400) && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick 2nd hit
[State -1, Stand Light Kick]
type = ChangeState
value = 231
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = stateno = 230
triggerall = statetype != A
trigger1 = movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = stateno = 201 && movecontact
trigger5 = stateno = 231 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 430 && movecontact
trigger8 = stateno = 210 && movecontact
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
trigger2 = stateno = 400 && animelemtime(4) > 2

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = !ailevel
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact
trigger3 = (stateno = 200) || (stateno = 230) || (stateno = 201) || (stateno = 231)
trigger3 = movecontact
trigger4 = stateno = 210 && movehit


;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact 
trigger3 = (stateno = 200) || (stateno = 201)
trigger3 = movecontact

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
trigger3 = (stateno = 200) || (stateno = 201) || (stateno = 230) || (stateno = 231) || (stateno = 210)
trigger3 = movecontact

;----------------------------------------------------------------------------
;Jump Medium Punch
[State -1, Jump medium punch]
type = ChangeState
value = 601
triggerall = command = "x"
triggerall = statetype = A
trigger1 = stateno = 600 && movecontact
trigger2 = stateno = 630 && movecontact
trigger3 = ctrl
trigger3 = command = "holdfwd"

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(30) != 59
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl




;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601 || stateno = 630 || stateno = 631 || stateno = 632;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking


;---------------------------------------------------------------------------

;Jump Medium Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 631
triggerall = command = "a"
triggerall = statetype = A
trigger1 = stateno = 630 && movecontact
trigger2 = stateno = 601 && movecontact
trigger3 = ctrl
trigger3 = command = "holdfwd"

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact

;Jump Butt drop
[State -1, Jump Strong Kick]
type = ChangeState
value = 635
triggerall = command = "a" && command = "holddown"
triggerall = statetype = A
trigger1 = ctrl




;Jump Medium Kick
[State -1, Jump Light Kick 2nd hit]
type = ChangeState
value = 632
triggerall = command = "a"
triggerall = statetype = A
trigger1 = stateno = 631 && movecontact


;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = var(36) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || Stateno = 601 || stateno = 630 || stateno = 611 || stateno = 631 || stateno = 632 ;jump_x or jump_a
trigger2 = movecontact

;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 646
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = var(36) = 1
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || Stateno = 601 || stateno = 630 || stateno = 611 || stateno = 631 || stateno = 632 ;jump_x or jump_a
trigger2 = movecontact

;Jump Butt drop
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = command = "b" && command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 611 || stateno = 612
trigger2 = movecontact


;Air Launcher
[State -1, Air Launcher]
type = ChangeState
value = 645
triggerall = command = "y" && command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || Stateno = 601 || stateno = 630 || stateno = 611 || stateno = 631 || stateno = 632 || stateno = 640 || stateno = 610
trigger2 = movecontact
trigger2 = prevstateno != 1050
trigger2 = prevstateno != 1060
trigger2 = prevstateno != 1070
 
 
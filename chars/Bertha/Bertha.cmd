[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

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
command = ~D, DB, B, D, DB, B, a
time = 40
buffer.time = 8

[Command]
name = "Super"
command = ~D, B, D, B, a
time = 40
buffer.time = 8

[Command]
name = "Super"
command = ~D, DB, B, D, DB, B, b
time = 40
buffer.time = 8

[Command]
name = "Super"
command = ~D, B, D, B, b
time = 40
buffer.time = 8

[Command]
name = "Super"
command = ~D, DB, B, a+b+c
time = 20
buffer.time = 8

[Command]
name = "Super"
command = ~D, DB, B, b+c
time = 20
buffer.time = 8

[Command]
name = "Super"
command = ~D, DB, B, a+c
time = 20
buffer.time = 8

[Command]
name = "Super"
command = c+z
time = 1

[Command]
name = "Super2"
command = ~D,DF,F,D,DF,F, a
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DF,F,D,DF,F, b
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DF,F,D,DF,F, c
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,F,D,F, a
buffer.time = 8


[Command]
name = "Super2"
command = ~D,F,D,F, b
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,F,D,F, c
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DF,F,a+b+c
time = 20
buffer.time = 8

[Command]
name = "Super2"
command = ~D,DF,F,a+c
buffer.time = 8


[Command]
name = "Super2"
command = ~D,DF,F,b+c
buffer.time = 8


[command]
name = "Super3"
command = D,a+b+c
time = 3



[command]
name = "Super3"
command = D,a+c
time = 3



[command]
name = "Super3"
command = D,b+c
time = 30



[command]
name = "Super3"
command = D,D,a
time = 20



[command]
name = "Super3"
command = D,D,b
time = 20



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

[command]
name = "DP_a"
command = ~F,D,DF, a
buffer.time = 12

[command]
name = "DP_b"
command = ~F,D,DF, b
buffer.time = 12

[command]
name = "DP_ab"
command = ~F,D,DF, a+b
buffer.time = 12

[command]
name = "DP_ab"
command = ~F,D,DF, c
buffer.time = 12

[command]
name = "DP_a"
command = ~F,D,F, a
buffer.time = 12


[command]
name = "DP_b"
command = ~F,D,F, b
buffer.time = 12

[command]
name = "DP_ab"
command = ~F,D,F, a+b
buffer.time = 12

[command]
name = "DP_ab"
command = ~F,D,F, c
buffer.time = 12

[Command]
name = "QCF_x"
command = ~D, DF, F, x
buffer.time = 5

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

[command]
name = "HCB_x"
command = ~F,DF,D,DB,B, x
time = 20
buffer.time = 5

[command]
name = "HCB_x"
command = ~F,D,B, x
time = 20
buffer.time = 5

[command]
name = "HCB_x"
command = $F,$D,$B, x
time = 20
buffer.time = 5

[command]
name = "HCB_y"
command = ~F,DF,D,DB,B, y
time = 20
buffer.time = 5

[command]
name = "HCB_y"
command = ~F,D,B, y
time = 20
buffer.time = 5

[command]
name = "HCB_y"
command = ~F,$D,$B, y
time = 20
buffer.time = 5

[command]
name = "HCB_z"
command = ~F,DF,D,DB,B, z
time = 20
buffer.time = 5

[command]
name = "HCB_z"
command = ~F,D,B, z
time = 20
buffer.time = 5

[command]
name = "HCB_z"
command = ~F,$D,$B, z
time = 20
buffer.time = 5

[command]
name = "HCB_z"
command = ~F,DF,D,DB,B, x+y
time = 20
buffer.time = 5

[command]
name = "HCB_z"
command = ~F,D,B, x+y
time = 20
buffer.time = 5

[command]
name = "HCB_z"
command = ~F,$D,$B, x+y
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

[command]
name = "superjump"
command = ~D,$U
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
name = "grab"
command = x+a
time = 3

[Command]
name = "2kick"
command = a+b
time = 1

[Command]
name = "2kick"
command = c
time = 1

[command]
name = "2kickheld"
command = /a+b
time = 1

[command]
name = "2kickheld"
command = /c
time = 1

[command]
name = "aheld"
command = /a
time = 1

[command]
name = "bheld"
command = /b
time = 1

[command]
name = "cheld"
command = /c
time = 1

[command]
name = "xheld"
command = /x
time = 1

[command]
name = "yheld"
command = /y
time = 1

[command]
name = "zheld"
command = /z
time = 1

[command]
name = "zheld"
command = /x+y
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
name = "add on hip"
command = a
time = 1
buffer.time = 5


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


[command]
name = "downforward"
command = /DF
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
trigger2 = stateno != [440,449] ;Except for sweep kick
trigger2 = movecontact
trigger2 = stateno != 410
trigger3 = stateno = 410
trigger3 = movehit
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


;----|Movement|-----------
[State -1, Jump]
type = changestate
Triggerall=var(30)=59
triggerall = Statetype != A
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
trigger1 = ctrl
trigger1 = enemy,hitdefattr = S,AT
trigger1 = random < ailevel * 2
trigger2 = p2bodydist x = [140, 200]
trigger2 = random < ailevel * 8
trigger2 = enemy,statetype = S || enemy,statetype = C
trigger2 = ctrl
trigger3 = enemy,name = "Katrina Crocodile"
trigger3 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger3 = ctrl && random < (ailevel*6)
trigger4 = enemy,name = "Zafta Giraffe"
trigger4 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger4 = ctrl && random < (ailevel*6)
trigger5 = enemy,name = "Makuyama"
trigger5 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger5 = ctrl && random < (ailevel*6) 
trigger6 = enemy,name = "Julian Hippo"
trigger6 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger6 = ctrl && random < (ailevel*6)
trigger7 = enemy,name = "Pastilla Skunk"
trigger7 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger7 = ctrl && random < (ailevel*6)
trigger8 = enemy,name = "Jumbo Elephant"
trigger8 = enemy,stateno = 1250 || enemy,stateno = 1260 || enemy,stateno = 1270
trigger8 = ctrl && random < ailevel * 6
value = 40

[State -1, Jump]
type = changestate
Triggerall=var(30)=59
triggerall = Statetype != A
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
triggerall = ctrl
trigger1 = enemy,hitdefattr = S,AT
trigger1 = random < ailevel * 6
trigger2 = enemy,name = "Katrina Crocodile"
trigger2 = enemy,stateno = 1200 || enemy,stateno = 1210 || enemy,stateno = 1220
trigger2 = random < (ailevel*8)
trigger3 = enemy,name = "Zafta Giraffe"
trigger3 = enemy,stateno = 1000 || enemy,stateno = 1010 || enemy,stateno = 1020 ||enemy,stateno = 3000 
trigger3 = random < (ailevel*8)
trigger4 = enemy,name = "Makuyama"
trigger4 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger4 = random < (ailevel*8) 
trigger5 = enemy,name = "Julian Hippo"
trigger5 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger5 = random < (ailevel*8)
trigger6 = enemy,name = "Pastilla Skunk"
trigger6 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger6 = random < (ailevel*8)
trigger7 = enemy,name = "Jumbo Elephant"
trigger7 = enemy,stateno = 1250 || enemy,stateno = 1260 || enemy,stateno = 1270
trigger7 = random < ailevel * 8
trigger8 = p2statetype = A
trigger8 = p2bodydist x = [100,250]
trigger8 = p2bodydist y = [-350,-100]
trigger8 = random < ailevel * 18
trigger8 = !inguarddist
trigger9 = random < ailevel * 6
trigger9 = p2bodydist x  = [0,100]
trigger9 = p2stateno = 5120
value = 43


[state -1, backdash]
type = changestate
triggerall= var(30) = 59
triggerall = Statetype != A
triggerall = ctrl
triggerall = ailevel > 1
trigger1 = p2stateno = 5120
trigger1 = p2bodydist x =[0, 80]
trigger1 = random < (ailevel*8)
trigger1 = enemynear,animtime > -2
trigger2 = enemy,hitdefattr = SCA,AT
trigger2 = random < ailevel * 2 && ctrl
value = 105

[state -1, Run]
type = changestate
triggerall= var(30) = 59
triggerall = Statetype != A
triggerall = ctrl
triggerall = ailevel > 1
trigger1 = p2bodydist x > 300
trigger1 = random < ailevel * 24
trigger1 = life > 600 
trigger2 = p2bodydist x > 300
trigger2 = !inguarddist
trigger2 = random < ailevel* 8
trigger3 = enemynear,anim = 5300
trigger3 = random < ailevel * 48
trigger3 = p2bodydist x > 100
value = 100

[state -1, Duck]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = Statetype != A
triggerall = Random < Ailevel * 10
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

;--------Defence;
[State -1, AI guarding - Stand]
Type=Changestate
Triggerall= ailevel > 0
Triggerall=var(30)=59
triggerall = stateno != 100  || stateno != [200,1399]
triggerall =! (Stateno=[120,155])
triggerall = inguarddist || enemynear,hitdefattr = SCA,AP || enemynear,hitdefattr = SCA,AA
triggerall = enemynear,hitdefattr != SCA,NT
triggerall = ctrl
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 16
value = 120

;[state -1, AI guard - air]
;type = changestate
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall = statetype = A
;triggerall =! (Stateno=[120,155])
;trigger1 = random < (ailevel * 32)
;trigger1 = inguarddist
;value = 132

;[State -1]; The engine will still guard by through pressing the back button, we need to disable that.
;Type=Assertspecial
;Triggerall=StateNo!=[120,160]
;Trigger1=var(30) = 59
;flag=noairguard
;flag2=nocrouchguard
;flag3=nostandguard

[state -1, Hip Check]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno = [150,153]
triggerall = ailevel > 5
triggerall = power > 199
trigger1 = random < (ailevel) && (enemy,hitdefattr = SCA,NA,NP) 
trigger2 = random < (ailevel * 8) && (enemy,hitdefattr = SCA,HA,HP) 
trigger3 = random < (ailevel * 2) && (enemy,hitdefattr = SCA,SA,SP)
value = 1400

[state -1, taunt]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = statetype != A
triggerall = p2bodydist x > 300
triggerall = ailevel > 4
trigger1 = life > 700 && p2life < 300
trigger1 = random < ailevel
trigger1 = p2statetype = L
trigger2 = life > 1000
trigger2 = p2life < 200 
trigger2 = random < ailevel
value = 195

[state -1, spin]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = (stateno != [1030,1034]) 
trigger1 = enemynear,hitdefattr = SCA,AP  || enemy,numproj > 0
trigger1 = random < ailevel*48
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 400 && p2bodydist x < 50 && movehit
trigger2 = random < ailevel*8
trigger3 = stateno = 430 && p2bodydist x < 50 && movehit
trigger3 = random < ailevel*8
trigger4 = stateno = 200 && movehit
trigger4 = random < ailevel*4
trigger4 = p2bodydist x < 50
value = 1030

[State -1, AI Spin Through projectile] ;by Inktrebuchet
type = ChangeState
value = 1030
triggerall = var(30) = 59 
triggerall = ailevel > 2
triggerall = ctrl  || stateno = 100
triggerall = p2stateno != [660,669]
triggerall = statetype != A
trigger1 = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
trigger1 = PlayerID(helper(33333333),var(3)), pos y > -300 || PlayerID(helper(33333333),var(3)), vel y > 0 ; Avoid attempt to reflect projectiles that are to high. 100 = char height or reflector height, unless the enemy projectile is moving downwards.
trigger1 = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time = startup time + active 
trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [5,20] ; 5 = startup time, 22 = active ; [0,5] for last second reflect.
trigger1 = random < ailevel * 36

;-----|Super|----------------------
[state -1, Gigaton Facesit]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 2999
triggerall = ailevel > 3
triggerall = enemynear,stateno != [660,669]
triggerall = p2bodydist x < 240
trigger1 = ctrl
trigger1 = enemy, pos y < -170
trigger1 = random < ailevel * 8
trigger1 = enemynear,ctrl = 0
trigger2 = stateno = 1030 && movehit
trigger2 = random < ailevel * 32
trigger3 = stateno = 1011 || stateno = 1012 || stateno = 1013
trigger3 = enemy,movetype = H
trigger3 = random < ailevel * 64
trigger4 = stateno = 410 && movehit
trigger4 = random < ailevel * 125
trigger5 = inguarddist
trigger5 = p2statetype = A
trigger5 = p2movetype = A
trigger5 = ctrl
trigger5 = ctrl || var(1)
trigger5 = random < ailevel * 18
value = 3000

[state -1, Bountiful Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2bodydist y = [-200,300]
triggerall = enemynear,stateno != [660,669]
trigger1 = p2bodydist x = [0,110]
trigger1 = prevstateno = 5120 && ctrl
trigger1 = p2bodydist y = [-90, 0]
trigger1 = random < ailevel*16
trigger1 = enemynear,movetype = A
trigger2 = stateno = 210 && movehit
trigger2 = enemynear,statetype = A
trigger2 = random < (ailevel*32)
trigger3 = stateno = 241 && movehit
trigger3 = random < (ailevel*24)
trigger4 = stateno = 240 && movehit
trigger4 = enemynear,statetype != A
trigger4 = random < (ailevel*18)
trigger5 = stateno = 441 && movehit
trigger5 = random < (ailevel*36)
trigger5 = p2statetype = A
value = 3040

[state -1, bionic ass downward]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = power > 999
triggerall = ailevel > 3
triggerall = p2bodydist y > 125
triggerall = p2bodydist x = [-100,40]
trigger1 = ctrl
trigger1 = random < ailevel*32
trigger1 = p2movetype = A
trigger2 = stateno = 610 || stateno = 640
trigger2 = movehit
trigger2 = random < ailevel*2
value = 3080

[state -1, Split Leg Drop]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = statetype != A
triggerall = (stateno = [1031,1034]) 
triggerall = animtime = 0
trigger1 = enemy,statetype = C
trigger1 = random < (ailevel*40)
trigger2 = enemy,statetype = S
trigger2 = random < (ailevel*2)
value = 1042

[state -1, C.short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 1
triggerall = p2bodydist x < 90
trigger1 = ctrl
trigger1 = Random < Ailevel *8
trigger1 = enemy,statetype = S
trigger2 = stateno = 430 && movehit
trigger2 = random < ailevel * 36
trigger3 = random < ailevel
trigger3 = ctrl
trigger4 = (stateno = 200) || (stateno = 400) || (stateno = 230) || (stateno = 430)
trigger4 = movehit
trigger4 = enemy,movetype = H
trigger4 = random < ailevel * 36
value = 410 

[state -1, Low Crush]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy,statetype != L
triggerall = p2bodydist x < ifelse(stateno = 100, 285,200)
triggerall =! enemy,movetype = A
triggerall = ctrl
triggerall = stateno != 100
trigger1 = Random < Ailevel *2
trigger1 = enemy,statetype = S
trigger1 = enemy,movetype != A
trigger2 = Random < Ailevel *8
trigger2 = enemy,statetype = C
trigger2 = enemy,movetype != A
trigger3 = enemy,movetype = A
trigger3 = enemy,statetype = C
trigger3 = random < ailevel*4
trigger4 = p2stateno = 5120
trigger4 = enemynear,animtime > -2
trigger4 = ctrl
trigger4 = random < ailevel * 12
value = 235

;-----EX Moves---------------------
[state -1, Butt Bump EX]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = power > 499
triggerall = ailevel > 4
triggerall = random < ailevel * 32
trigger1 = stateno = 440 && movehit
trigger2 = stateno = 410 && movehit
trigger2 = enemy,statetype != A
trigger3 = stateno = 210 && movehit
value = 1020

[state -1, EX Command Throw]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 4
triggerall = enemy,statetype != A
triggerall = enemy,statetype != L
triggerall = enemy,movetype != H
triggerall = power > 499
triggerall = p2bodydist x = [76,110]
triggerall = ctrl || var(1)
trigger1 = enemy,hitdefattr = S,NA  || enemy,hitdefattr = C,NA
trigger1 = Random < Ailevel * 12
trigger2 = enemy,pos y < 0 && enemy,pos y >-100 ; mistake
trigger2 = random < floor(30/ailevel)
trigger3 = stateno = [200,699]
trigger3 = movereversed
trigger4 = stateno = 232
trigger4 = animtime = 0
trigger4 = random < ailevel * 24
trigger4 = movecontact
trigger5 = prevstateno = 232
trigger5 = random < ailevel * 24
value = 1120

[state -1, EX AA Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = ailevel > 4
triggerall = statetype != A
triggerall = p2bodydist x < 270
triggerall = p2bodydist y =[-460, 0]
triggerall = power > 499
trigger1 = prevstateno = 5120 && ctrl
trigger1 = enemynear,movetype = A
trigger1 = random < (ailevel*24)
trigger2 = ctrl || var(1)
trigger2 = p2statetype = A
trigger2 = p2movetype = A
trigger2 = random < ailevel * 2
value = 1070

;-----Special Moves-----------------
[state -1, hard Command Throw]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = enemy,statetype != A
triggerall = enemy,statetype != L
triggerall = enemy,movetype != H
triggerall = p2bodydist x = [0,55]
triggerall = ctrl 
trigger1 = Random < (Ailevel*32)
trigger2 = enemy,name = "Lardo Rat"
trigger2 = enemy,stateno = [1000,1004]
trigger2 = random < (ailevel*12)
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*16)
trigger4 = enemy,pos y < 0 && enemy,pos y >-100 ;mistake
trigger4 = random < floor(20/ailevel)
trigger5 = stateno = [200,699]
trigger5 = movereversed
trigger6 = stateno = 232
trigger6 = p2movetype != H
trigger6 = random < ailevel * 40
trigger6 = ctrl
trigger6 = movecontact
trigger7 = prevstateno = 232
trigger7 = random < ailevel * 36
value = 1110

[state -1, Light Command Throw]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 2
triggerall = (enemy,statetype = S  || enemy,statetype = C)
triggerall =! enemy,movetype = H
triggerall = p2bodydist x = [56,75] 
triggerall = ctrl 
trigger1 = Random < Ailevel * 28
trigger2 = prevstateno = [120,159]
trigger2 = Random < (Ailevel*32)
trigger3 = enemy,name = "Lardo Rat"
trigger3 = enemy,stateno = [1000,1004]
trigger3 = random < (ailevel*12)
trigger4 = enemy,authorname = "Kazecat"
trigger4 = enemy,stateno = 1400
trigger4 = random < (ailevel*16)
trigger5 = enemy,pos y < 0 && enemy,pos y >-100 ;mistake
trigger5 = random < floor(30/ailevel)
trigger6 = stateno = [200,699]
trigger6 = movereversed
trigger7 = enemy,animtime < -4
trigger7 = random < ailevel * 36
trigger7 = !inguarddist
trigger8 = stateno = 232
trigger8 = p2movetype != H
trigger8 = random < ailevel * 40
trigger8 = ctrl
trigger8 = movecontact
trigger9 = prevstateno = 232
trigger9 = random < ailevel * 36
value = 1100

[state -1, Throw]
type = changestate
triggerall = ailevel > 2
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != A
triggerall = enemy,statetype != L
triggerall = enemy,movetype != H
triggerall = p2bodydist x = [0, 95]
triggerall = ctrl
trigger1 = Random < Ailevel * 16
trigger2 = enemy,name = "Lardo Rat"
trigger2 = enemy,stateno = [1000,1004]
trigger2 = random < (ailevel*12)
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*8)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel*64
trigger5 = enemy,authorname = "Dcat Power"
trigger5 = ctrl
trigger5 = p2stateno = [700,799]
trigger6 = stateno = 232
trigger6 = animtime = 0
trigger6 = random < ailevel * 18
trigger6 = movecontact
value = 800

[state -1, Air Throw]
type = changestate
triggerall = ailevel > 2
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype = A
triggerall = enemy,movetype != H
triggerall = p2bodydist x = [0, 110]
triggerall = p2bodydist y = [-200, 160]
trigger1 = ctrl
trigger1 = random < ailevel * 24
value = 830

[state -1, Butt Bump L]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = ailevel > 2
triggerall = p2bodydist x < 350
triggerall = enemynear,statetype != L
trigger1 = random < floor(ailevel*0.5)
trigger1 = ctrl
trigger1 = p2bodydist x < 380
trigger1 = enemynear,ctrl = 0
trigger2 = stateno = 210  && movehit
trigger2 = random < (ailevel*32)
trigger2 = enemy,statetype != A
trigger3 = stateno = 240
trigger3 = movehit
trigger3 = random < (ailevel * 4)
trigger4 = stateno = 241
trigger4 = movehit
trigger4 = random < (ailevel*8)
trigger5 = stateno = 233
trigger5 = movehit
trigger5 = random < ailevel * 24
value = 1000

[state -1, Butt Bump H]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = ailevel > 2
triggerall = p2bodydist x < 600
triggerall = enemynear,statetype != L
trigger1 = stateno = 410 && movehit
trigger1 = random < (ailevel*2)
trigger2 = Random < floor(Ailevel*1.5) 
trigger2 = ctrl
trigger2 = enemynear,ctrl = 0
trigger3 = stateno = 210 && movehit
trigger3 = enemy,statetype = A
trigger3 = random < (ailevel*36)
value = 1010

[state -1, Butt Drop]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = pos y < -150
triggerall = p2bodydist x = [-160,60]
triggerall = p2stateno != 5120
triggerall =! (enemy,stateno = [660,669])
trigger1 = ctrl
trigger1 = enemy,statetype = L
trigger1 = Random < (Ailevel * 32)
trigger2 = stateno = 610 && movehit
trigger3 = p2bodydist y > 180
trigger3 = enemy,ctrl = 0
trigger3 = random > ailevel * 32
trigger3 = ctrl
trigger4 = p2bodydist y > 180
trigger4 = ctrl 
trigger4 = enemy,movetype = A
trigger4 = random < ailevel * 56
value = 650

[state -1, AA Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 110
triggerall = ailevel > 2
triggerall = (p2bodydist y < -160  && p2bodydist y > - 380)
trigger1 = ctrl || var(1)
trigger1 = random < ailevel * 8
trigger1 = enemy,statetype = A
trigger1 = enemy,movetype = A || random < ailevel * 4 ; mistakes
trigger2 = (enemynear,hitdefattr = SCA,AP || enemy,numproj > 0)
trigger2 = ctrl
trigger2 = random < (ailevel * 8)
value = 1050

[state -1, AA Butt Bump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 220
triggerall = ailevel > 2
triggerall = p2bodydist y < -160  && p2bodydist y > - 460
trigger1 = ctrl  || var(1)
trigger1 = random < floor(ailevel * 12)
trigger1 = p2statetype = A
trigger1 = p2movetype = A
trigger2 = p2movetype = A || random < ailevel * 4 ; mistakes
trigger2 = ctrl
trigger2 = random < (ailevel * 64)
trigger2 = prevstateno = 5120
trigger2 = p2statetype = A
trigger3 = stateno = 410 && movehit
trigger3 = random < (ailevel * 8)
value = 1060



;----Normal strings------

[state -1, C.short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [0, 90]
triggerall = p2bodydist y = [-80,0]
triggerall = p2movetype != A
trigger1 = !inguarddist
trigger1 = ctrl
trigger1 = Random < (Ailevel*8)
trigger1 = p2statetype = S
value = 400 

[state -1, C.short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x < 90
triggerall =! enemy,movetype = A
trigger1 = ctrl
trigger1 = Random < (Ailevel*8)
trigger1 = p2statetype = S
trigger2 = stateno = 400 && movecontact
value = 430 



[state -1, C.Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2bodydist x = [130,230]
triggerall = p2bodydist y = [-40,0]
trigger1 = ctrl
trigger1 = Random < (Ailevel*2) 
trigger1 = !inguarddist
trigger2 = p2stateno = [105,106]
trigger2 = ctrl
trigger2 = random < (ailevel*12)
value = 440 

[state -1, Jump]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
trigger1 = prevstateno = 410
trigger1 = ctrl
trigger1 = enemy,movetype = H
value = 40 

[state -1, jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0, 140]
triggerall = p2bodydist y = [-170,0]
trigger1 = Random < Ailevel * 8
trigger1 = ctrl
trigger1 = enemy,statetype != C
trigger1 = !inguarddist
trigger2 = random < ailevel * 32
trigger2 = enemynear,movetype = H
trigger2 = ctrl
value = 200

[state -1, Jumping Crunch]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype != L
triggerall = ctrl
triggerall = prevstateno != 42
triggerall = vel x = [-1, 1]
triggerall = p2bodydist y = [-190,150]
triggerall = p2bodydist x = [0,70]
trigger1 = Random < (Ailevel * 36)
trigger1 = p2statetype != A
trigger1 = vel y > 0
trigger1 = pos y > -200
trigger2 = random < ailevel * 36
trigger2 = p2statetype = A
value = 620

[state -1, Jumping jab]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype = A
triggerall = p2bodydist x < 140
triggerall = p2bodydist y > -200 && p2bodydist y <100 
trigger1 = ctrl
trigger1 = enemy,movetype = H  &&  random < (ailevel * 32)
trigger1 = !inguarddist
trigger2 = stateno = 600 && movehit
trigger2 = random < (ailevel*36)
value = 600

[state -1, Jumping short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype != L
triggerall = p2bodydist x =[0,400]
triggerall = enemy,movetype != A
trigger1 = stateno = 600 && movehit
trigger2 = ctrl
trigger2 = random < ailevel * 18
trigger2 = vel y > 0
value = 630

[state -1, Jumping fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype != L
trigger1 = stateno = 630 && movehit
trigger1 = Random < (Ailevel * 24)
value = 610

[state -1, Jumping roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = enemy,statetype != L
trigger1 = stateno = 630 && movehit
trigger1 = Random < (Ailevel * 64)
value = 640

[state -1, short]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = p2statetype != L
triggerall = p2movetype != A
triggerall = p2bodydist x = [0,145]
triggerall = p2bodydist y = [-50,0]
trigger1 = Random < Ailevel * 4
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movehit
value = 230

[state -1, Forward part 1]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 0
triggerall = enemy, statetype != L
triggerall = p2bodydist x = [0, 275]
triggerall = p2bodydist y = [-250,0] 
trigger1 = Random < Ailevel * 16
trigger1 = ctrl
trigger1 = p2bodydist x = [175,275]
trigger1 = !inguarddist
trigger2 = (stateno = 230) || (stateno = 200) || (stateno = 430) || (stateno = 400)
trigger2 = movecontact
trigger2 = Random < (Ailevel * 24)
value = 232


[state -1, Forward part 2]
type = changestate
triggerall = animelemtime(6) > 0
triggerall = ailevel > 0
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = enemy, statetype != L
triggerall = stateno = 232
trigger1 = random < ailevel * 24
trigger1 = movehit
trigger1 = p2bodydist x > 180
trigger2 = random < ailevel * 8
trigger2 = !movecontact
trigger3 = random < ailevel * 6
trigger3 = p2bodydist x <= 180
trigger3 = movecontact
value = 233


[state -1, Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall =! enemy, statetype = L
triggerall =! enemy,movetype = A
triggerall = p2bodydist x < 130 ||  (p2bodydist y > -250 && p2bodydist y < 0)
trigger1 = Random < (Ailevel * 1)
trigger1 = ctrl
trigger2 = stateno = 230 && movehit
trigger2 = Random < (Ailevel * 64)
trigger3 = stateno = 200 && movehit
trigger3 = enemy,statetype = A
trigger3 = random < (ailevel*32)
value = 210



[state -1, Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = enemy, statetype != L
triggerall = p2bodydist x < 145 && (p2bodydist y < 0 && p2bodydist y > -250)
trigger1 = Random < Ailevel * 4
trigger1 = ctrl
trigger2 = stateno = 230 && movehit
trigger2 = Random < (Ailevel * 64)
value = 240

[state -1, Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = S
triggerall = p2bodydist x < 145
triggerall = animelemtime(9) < 0
trigger1 = stateno = 240 && movecontact
value = 241



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
;Asstroid Crush
[State -1, Bertha Asstroid Crush]
type = ChangeState
value = 3000
triggerall = command = "Super"
triggerall = power > 2999
triggerall = ailevel = 0
triggerall = statetype != A
trigger1 = stateno = [200, 1200]
trigger1 = movecontact
trigger2 = ctrl
trigger3 = stateno = [1011,1013]
trigger4 = stateno = [1000,1019]

;---------------------------------------------------------------------------
;Bountiful Butt Baragge
[State -1, Bertha Asstroid Crush]
type = ChangeState
value = 3040
triggerall = command = "Super2"
triggerall = power > 999
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = stateno = [200, 1200]
trigger1 = movecontact
trigger2 = ctrl
trigger3 = stateno = [1011,1013]
trigger4 = stateno = [1000,1019]

;----------------------------------------------------------------------------
;Big Butt Drop
[State -1, Bertha Asstroid Crush]
type = ChangeState
value = 3080
triggerall = command = "Super3"
triggerall = ailevel = 0
triggerall = power > 999
triggerall = pos y < -100
triggerall = statetype = A
triggerall = stateno != 1051
triggerall = stateno != 1061
triggerall = stateno != 1071
trigger1 = stateno = [200, 1200]
trigger1 = movecontact
trigger2 = ctrl
trigger3 = stateno = [1011,1013]
trigger4 = stateno = [1000,1019]
trigger5 = stateno = [1050,1070]


;===========================================================================


;---------------------------------------------------------------------------
;Anti-Air Butt Bump Light
[state -1, AA butt bump EX]
type = changestate
value = 1070
triggerall = !ailevel
triggerall = command = "DP_ab"
triggerall = statetype != A
triggerall = power > 499
trigger1 = ctrl
trigger2 = var(1) = 1


;Anti-Air Butt Bump Light
[state -1, AA butt bump L]
type = changestate
value = 1050
triggerall = !ailevel
triggerall = command = "DP_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1


;Anti-Air Butt Bump Light
[state -1, AA butt bump L]
type = changestate
value = 1060
triggerall = !ailevel
triggerall = command = "DP_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1

;---------------------------------------------------------------------------
;Butt Bump EX
[state -1, butt bump]
type = changestate
value = 1020
triggerall = power > 499
triggerall = command = "QCF_c"
triggerall = statetype != A
triggerall = !ailevel 
trigger1 = ctrl
trigger2 = var(1) = 1

;---------------------------------------------------------------------------
;Butt Bump Heavy
[state -1, butt bump]
type = changestate
value = 1010
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
;---------------------------------------------------------------------------
;Butt Bump Light
[state -1, butt bump]
type = changestate
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
;---------------------------------------------------------------------------
;Pique
[state -1, Pique]
type = changestate
value = 1030
triggerall = command = "2kick"
triggerall = var(30) != 59
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) = 1
trigger3 = stateno = 100




;--------------------------------------------------------------------------
;EX Leg Scissor Grab 
[state -1, Leg Scissor EX]
type = changestate
value = 1120
triggerall = power > 499
triggerall = command = "HCB_z"
triggerall = ailevel = 0
triggerall = statetype != A
trigger1 = ctrl 


;--------------------------------------------------------------------------
;Light Leg Scissor Grab
[state -1, Leg Scissor Light]
type = changestate
value = 1100
triggerall = command = "HCB_x"
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl 


;---------------------------------------------------------------------------
;Heavy Leg Scissor Grab
[state -1, Leg Scissor hard]
type = changestate
value = 1110
triggerall = command = "HCB_y"
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl 


;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger2 = command = "dash" && command != "holdback"
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
;Belly to Belly Suplex
[State -1, Belly to Belly]
type = ChangeState
value = 800
triggerall = command = "grab"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100

;---------------------------------------------------------------------------
;Belly to Belly Suplex
[State -1, Belly to Belly]
type = ChangeState
value = 830
triggerall = command = "grab"
triggerall = statetype = A
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
trigger2 = stateno = 200 && time > 12


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 230 && movecontact 
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 400 && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 232
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "holdfwd"
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 400 && movecontact
trigger4 = (stateno = 230)  || (stateno = 430)
trigger4 = movecontact



;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command != "downforward"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 230 && movecontact 
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 235
triggerall = command = "b"
triggerall = command = "downforward"
trigger1 = statetype != A
trigger1 = ctrl




;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------

;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 199


;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 41
trigger1 = command = "superjump"
trigger1 = statetype = S || statetype = C
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
trigger2 = stateno = 400 && animelemtime(3) > 3


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
trigger2 = (stateno = 400) || (stateno = 430)  || stateno = 200 || stateno = 230 
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
trigger1 = command != "holdup"
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Chomp
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "y"
triggerall = vel x = [-1,1]
triggerall = prevstateno != 42
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = command = "holdup"




;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
;---------------------------------------------------------------------------
;Butt Drop
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 640
trigger2 = movecontact


;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

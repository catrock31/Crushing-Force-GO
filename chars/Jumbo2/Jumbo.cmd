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


;[Command]
;name = "cpu26"
;command = ~D,DB, B, s, a, s, U, x+y+z+a+b+c+s
;time = 1

;[Command]
;name = "cpu27"
;command = ~D,UB, F, b, s, U,x+y+z+a+b+c+s
;time = 1


;[Command]
;name = "cpu27"
;command = ~D,UB, F, c, s, U,x+y+z+a+b+c+s
;time = 1


;[Command]
;name = "cpu28"
;command = ~D,DF, F, s, s, U,x+y+z+a+b+c+s
;time = 1


;[Command]
;name = "cpu29"
;command = ~D,DB, B, s, a, s, U, x+y+z+a+b+c+s
;time = 1

;[Command]
;name = "cpu30"
;command = ~D,DB, B, s, a, s, U, x+y+z+a+b+c+s
;time = 1

;


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
; Super 1 Command Grab
[Command]
name = "supercombo"
command = ~F, DF, D, DB, B, F, DF, D, DB, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"   ;Same name as above
command = ~F, DF, D, DB, B, F, DF, D, DB, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"   ;Same name as above
command = ~F, D, B, F, D, B, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"   ;Same name as above
command = ~F, D, B, F, D, B, x
time = 40
buffer.time = 8

;Double Half Circle's
[Command]
name = "supercombo"  
command = ~F, D, B, F, D, B, y
time = 40
buffer.time = 8

;Actual 360's, 5 points
[Command]
name = "supercombo"  
command = ~F, D, B, U, F, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~D, B, U, F, D, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~B, U, F, D, B, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~U, F, D, B, U, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~U, B, D, F, U, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~B, D, F, U, B, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~D, F, U, B, D, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~F, U, B, D, F, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~F, D, B, U, F, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~D, B, U, F, D, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~B, U, F, D, B, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~U, F, D, B, U, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~U, B, D, F, U, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~B, D, F, U, B, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~D, F, U, B, D, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~F, U, B, D, F, x
time = 40
buffer.time = 8


;360's 4 Point

[Command]
name = "supercombo"  
command = ~F, D, B, U, y
time = 40

[Command]
name = "supercombo"  
command = ~D, B, U, F, y
time = 40

[Command]
name = "supercombo"  
command = ~B, U, F, D, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~U, F, D, B, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~U, B, D, F, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~B, D, F, U, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~D, F, U, B, y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~F, U, B, D, y
time = 40
buffer.time = 8


[Command]
name = "supercombo"  
command = ~F, D, B, U, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~D, B, U, F, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~B, U, F, D, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~U, F, D, B, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~U, B, D, F, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~B, D, F, U, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~D, F, U, B, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~F, U, B, D, x
time = 40
buffer.time = 8

;Half Circles

[Command]
name = "supercombo"  
command = ~F, D, B, F, D, B, x
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~F, D, B, F, D, B,  y
time = 40
buffer.time = 8

[Command]
name = "supercombo"  
command = ~F, D, B, F, D, B,  y
time = 40
buffer.time = 8

[Command]
name = "supercombo"
command = ~F, DF, D, DB, B, x+z
time = 30
buffer.time = 8

[Command]
name = "supercombo"
command = ~F, D, B, x+z
time = 40
buffer.time = 8

[Command]
name = "supercombo"
command = ~F, DF, D, DB, B, y+z
time = 40
buffer.time = 8
[Command]
name = "supercombo"
command = ~F, $D, B, y+z
time = 40
buffer.time = 8
;Super Combo 2 Dymanic Ass entry

[Command]
name = "Super2"
command = ~D, DF, F, D, DF, F, x
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, D, DF, F, y
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, D, DF, F, z
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, F, D, F, x
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, F, D, F, y
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, F, D, F, z
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, x+y+z
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, x+z
time = 40
buffer.time = 8

[Command]
name = "Super2"
command = ~D, DF, F, y+z
time = 40
buffer.time = 8

[Command]
name = "Super3"
command = D,D,D, a
time = 15
buffer.time = 8

[Command]
name = "Super3"
command = D,D,D, b
time = 15
buffer.time = 8

[Command]
name = "Super3"
command = D,D, b+c
time = 15
buffer.time = 8

[Command]
name = "Super3"
command = D,D, a+c
time = 15
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
name = "upper_xy"
command = ~F, D, DF, z

[Command]
name = "upper_a"
command = ~F, D, DF, a

[Command]
name = "upper_b"
command = ~F, D, DF, b

[Command]
name = "upper_ab"
command = ~F, D, DF, a+b

[Command]
name = "upper_ab"
command = ~F, D, DF, c

[Command]
name = "HCB_x"
command = ~F, DF, D, DB, B, x
time = 15

[Command]
name = "HCB_x"
command = ~F, D, B, x
time = 15

[Command]
name = "HCB_x"
Command = $F, $D, $B, x
time = 15

[Command]
name = "HCB_y"
Command = ~F, DF, D, DB, B, y
time = 15

[Command]
name = "HCB_y"
Command = ~F, D, B, y
time = 15

[Command]
name = "HCB_y"
Command = $F, $D, $B, y
time = 15


[Command]
name = "HCB_z"
Command = ~F, DF, D, DB, B, x+y
time = 30

[Command]
name = "HCB_z"
Command = ~F, D, B, x+y
time = 15

[Command]
name = "HCB_z"
Command = $F, $D, $B, x+y
time = 30

[Command]
name = "HCB_z"
Command = ~F, DF, D, DB, B, z
time = 15

[Command]
name = "HCB_z"
Command = ~F, D, B, z
time = 15

[Command]
name = "HCB_z"
Command = $F, $D, $B, z
time = 15

[Command]
name = "HCB_a"
command = ~F, DF, D, DB, B, a
time = 15

[Command]
name = "HCB_a"
command = ~F, D, B, a
time = 15

[Command]
name = "HCB_a"
Command = $F, $D, $B, a
time = 30

[Command]
name = "HCB_b"
command = ~F, DF, D, DB, B, b
time = 15

[Command]
name = "HCB_b"
command = ~F, D, B, b
time = 15

[Command]
name = "HCB_b"
Command = $F, $D, $B, b
time = 15

[Command]
name = "HCB_c"
command = ~F, DF, D, DB, B, c
time = 15

[Command]
name = "HCB_c"
command = ~F, D, B, a+b
time = 30

[Command]
name = "HCB_c"
Command = $F, $D, $B, a+b
time = 15

[Command]
name = "HCB_c"
command = ~F, DF, D, DB, B, a+b
time = 15

[Command]
name = "HCB_c"
command = ~F, D, B, c
time = 15

[Command]
name = "HCB_c"
Command = $F, $D, $B, c
time = 15

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[command]
name = "QCF_z"
command = ~D, DF, F, z

[Command]
name = "QCF_z"
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

[command]
name = "RDP_a"
command = ~B, D, DB, a

[command]
name = "RDP_b"
command = ~B, D, DB, b

[command]
name = "RDP_ab"
command = ~B, D, DB, c

[command]
name = "RDP_ab"
command = ~B, D, DB, a+b

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

[command]
name = "QCB_a"
command = ~D, DB, B, a

[command]
name = "DD_a"
command = ~D, D, a

[command]
name = "QCB_b"
command = ~D, DB, B, b

[command]
name = "DD_b"
command = ~D, D, b

[command]
name = "QCB_c"
command = ~D, DB, B, c

[command]
name = "DD_c"
command = ~D, D, c

[command]
name = "QCB_a+b"
command = ~D, DB, B, a+b

[command]
name = "QCB_a+b"
command = ~D, D, a+b


[Command]
name = "FF_c"
command = F, F, c
time = 20

[Command]
name = "FF_c"
command = F, F, a+b
time = 20

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

[command]
name = "FF_x"
command = F, F, x

[command]
name = "FF_y"
command = F, F, y

[command]
name = "FF_z"
command = F, F, z


[command]
name = "FF_x+y"
command = F, F, x+y

[Command]
name = "sumodrop_a"
command = ~20$D, U, a
time = 15

[Command]
name = "sumodrop_b"
command = ~20$D, U, b
time = 15


[Command]
name = "sumodrop_ab"
command = ~20$D, U, a+b
time = 15


[Command]
name = "sumodrop_ab"
command = ~20$D, U, c
time = 15

[command]
name = "sumobump_a"
command = ~20$B, F, a
time = 15

[command]
name = "sumobump_b"
command = ~20$B, F, b
time = 15


[command]
name = "sumobump_ab"
command = ~20$B, F, a+b
time = 15

[command]
name = "sumobump_ab"
command = ~20$B, F, c
time = 15

[command]
name = "DD_a"
command = D,D, a
time = 15

[command]
name = "DD_b"
command = D,D, b
time = 15

[command]
name = "DD_c"
command = D,D, c
time = 15

[command]
name = "DD_c"
command = D,D, a+b
time = 15


[command]
name = "trunkup"
command = /U
time = 1

[command]
name = "trunkdia"
command = /UF
time = 1

[command]
name = "trunkfwd"
command = /F
time = 1


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
command = ~D, $U
time = 15

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
name = "throw"
command = x+a
time = 3

[command]
name = "supercombo"
command = z+c
time = 3

[Command]
name = "superjump"
command = a+b
time = 1

[command]
name = "superjump"
command = c
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

;-| Hold Button |-----------------------------------------------------------

[command]
name = "holdy"
command = /y
time = 1

[command]
name = "holdx"
command = /x
time = 1

[command]
name = "holda"
command = /a
time = 1

[command]
name = "holdb"
command = /b
time = 1

[command]
name = "holdc"
command = /c
time = 1

[command]
name = "holdc"
command = /a+b
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

[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Super Combo condition Reset]
type = VarSet
trigger1 = 1
var(4) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = (stateno != 219)
trigger2 = (stateno != 430)
trigger2 = (stateno != 410)
trigger2 = (stateno != [440,449]) ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 219
trigger3 = movehit
var(1) = 1

[state -1, Super Combo condition Check]
type = varset
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [1070,1099])
trigger2 = movecontact
var(4) = 1
;==========================================================================
;--------------------------AI Activate-------------------------------------
;==========================================================================

;--------------------------Activation----------------------------------
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
Trigger1 = AILevel>0 
v = 30
value= 59 
Ignorehitpause=1

[State -1, AI OFF]
Type=VarSet
Trigger1=var(30)>0 
Trigger1=RoundState!=2 
Trigger2=!IsHelper 
Trigger2=AILevel=0 
var(30) = 0 
Ignorehitpause=1

;------------------------Blocking------------------------------
;[State -1, AI guarding - Stand]
;Type=Changestate
;Triggerall=Inguarddist
;Triggerall=var(30)=59
;Triggerall=ctrl
;triggerall = enemy,hitdefattr != S, AT
;trigger1 = enemy,movetype = A
;Trigger1 = Random < Ailevel * 31
;value = 120

[State -1, AI guarding - Stand]
Type=Changestate
Triggerall=var(30)=59
triggerall = ailevel > 0
triggerall = roundstate = 2
triggerall = stateno != 100
triggerall =! (Stateno=[120,159])
triggerall = ctrl
Triggerall= Inguarddist && enemynear,hitdefattr != SCA,AT 
Trigger1 = random < (Ailevel*128)
trigger1 = ailevel > 6
trigger2 = ailevel = [3,6]
trigger2 = random < ailevel * 64
trigger3 = ailevel < 3
trigger3 = random < ailevel * 32
value = 120

;[state -1, AI guard - Low]
;type = changestate
;triggerall = inguarddist
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall =! (Stateno=[120,155])
;triggerall = statetype = A
;trigger1 = random > (ailevel * 60)
;value = 132

;[State -1]; The engine will still guard by through pressing the back button, we need to disable that.
;Type=Assertspecial
;Triggerall=StateNo!=[120,160]
;Trigger1=var(30) = 59
;flag=noairguard
;flag2=nocrouchguard
;flag3=nostandguard

;----|Movement|------------------------------------------
[State -1, jump]
type = changestate
triggerall = statetype = S || statetype = C 
triggerall = var(30) = 59
triggerall = stateno != [40,49]
triggerall = stateno != [120, 159]
triggerall = ctrl
trigger1 = ctrl
trigger1 = enemynear,hitdefattr = S,AT
trigger1 = Random < Ailevel * 16
trigger2 = p2bodydist x = [200, 550]
trigger2 = random < ailevel * 2
trigger2 = enemynear,statetype = S || enemy,statetype = C
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
trigger6 = enemy,name = "Julian Hippo"
trigger6 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger6 = ctrl && random < (ailevel*6)
trigger7 = enemy,name = "Julian Hippo"
trigger7 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger7 = ctrl && random < (ailevel*6)
trigger8 = enemy,name = "Pastilla Skunk"
trigger8 = enemy,stateno = 1300  || enemy,stateno = 1310 || enemy,stateno = 1320 || enemy,stateno = 3080
trigger8 = ctrl && random < (ailevel*6)
trigger10 = enemy,name = "Jumbo Elephant"
trigger10 = enemy,stateno = 1250 || enemy,stateno = 1260 || enemy,stateno = 1270
trigger10 = ctrl && random < ailevel * 6
trigger9 = p2bodydist x = [0,250]
trigger9 = random < ailevel * 8
trigger9 = enemynear,stateno = 5120
trigger9 = enemynear,animtime > -4
trigger11 = enemy,name = "Violet Bunny"
trigger11 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger11 = ctrl && random < ailevel * 6
trigger12 = enemy,name = "Bertha Hippo"
trigger12 = enemy,stateno = 1100 || enemy,stateno = 1110 || enemy,stateno = 1120
trigger12 = ctrl && random < ailevel * 18
value = 40

[state -1, Duck]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = stateno != [10,11]
triggerall = Statetype != A
triggerall = Random < Ailevel * 16
triggerall = inguarddist 
trigger1 = enemy, name = "Jumbo Elephant"
trigger1 = enemy, stateno = [210,212]
trigger2 = enemy, name = "Bertha Hippo"
trigger2 = enemy, stateno = [1035,1040]
trigger3 = enemy, name = "Ana 'Jiggly' Bunny"
trigger3 = enemy, stateno != [1100, 1129]
trigger4 = enemy, name = "Enorma Pig"
trigger4 = enemy, stateno = [1000,1009]
value = 10

;--------------------------------------------------------

[state -1, backdash]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = Statetype != A
triggerall = backedgebodydist > 80
trigger1 = p2bodydist x = [-10,200]
trigger1 = p2stateno = [5110,5120]
trigger1 = random < floor(ailevel * 0.25)
trigger1 = enemynear,animtime > -16
trigger2 = prevstateno = 5120
trigger2 = p2movetype = A
trigger2 = p2statetype != A
trigger2 = random < ailevel * 8
value = 105

[state -1, super jump]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = power > 249
triggerall = p2bodydist x = [-200,300]
triggerall = statetype != A
trigger1 = p2statetype = L 
trigger1 = Random < Ailevel * 2
trigger2 = random < ailevel * 2
trigger2 = backedgebodydist <= 80
trigger2 = p2stateno = 5120
trigger2 = enemynear,animtime > -4
trigger2 = p2bodydist x = [0,200]
value = 41

[state -1, super jump]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = power > 249
triggerall = statetype != A
triggerall = p2bodydist x = [-200, 300]
trigger1 = random < ailevel * 4
trigger1 = backedgebodydist <= 80
trigger1 = p2stateno = [5110,5120]
trigger1 = enemynear,animtime > -4
trigger1 = p2bodydist x = [0,200]
value = 40

[state -1, defensive Shove]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = ailevel > 5
triggerall = stateno = [150,153]
triggerall = power > 999
triggerall = time%4
trigger1 = random < floor(ailevel*0.25) && (enemy,hitdefattr = SCA,NA,NP)
trigger2 = random < (ailevel*8) && (enemy,hitdefattr = SCA,HA,HP)
trigger3 = random < (ailevel*2) && (enemy,hitdefattr = SCA,SA,SP)
value = 1400

[state -1, Super Command Grab]
type = changestate;changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = p2movetype != H
triggerall = !numexplod(9997)
triggerall = ailevel > 3
triggerall = p2stateno != 5120
triggerall = (p2statetype = S) || (p2statetype = C)
triggerall = p2bodydist x = [-30,180]
triggerall = ctrl 
triggerall = power > 2999
triggerall = p2statetype != L
triggerall = p2statetype != A
;triggerall =! enemy,prevstateno = 5120
;triggerall = enemy,stateno != [5100,5120]
trigger1 = Random < (Ailevel*18)
trigger2 = enemy, pos y < 0 && enemy,pos y > -150 ;Intentional mistakes
trigger2 = random%40 < floor(40/ailevel)-7
trigger3 = p2stateno = [700,799]
trigger3 = random < ailevel * 24
trigger4 = enemynear,animtime > -2
trigger4 = random < ailevel * 12
trigger5 = enemynear,animtime > -2
trigger5 = (prevstateno = [150,155])
trigger5 = random < ailevel * 48
trigger6 = prevstateno = 5120
trigger6 = ctrl
trigger6 = p2statetype != A
value = 3000


[state -1, Super Air Command Grab]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = p2bodydist x = [0,560]
triggerall = p2bodydist y = [-500, -200]
triggerall = power > 999
triggerall = p2statetype != L
triggerall = stateno != 3040
triggerall = p2statetype = A
trigger1 = Random < floor(Ailevel* 12)
trigger1 = ctrl 
trigger1 = enemynear,ctrl = 0
trigger2 = stateno = 230 && movehit
trigger2 = random < (ailevel*4)
trigger3 = p2stateno = 673 || p2stateno = 678  || p2stateno = 247
trigger3 = random < (ailevel*18)
trigger3 = ctrl  
value = 3040

[State -1, AI Butt Drop reaction to projectile] ;by Inktrebuchet
type = ChangeState
value = 3080
triggerall = var(30) = 59 
triggerall = ailevel > 3
triggerall = power > 999
triggerall = p2bodydist x = [0, 600]
triggerall = p2stateno != [660,669]
triggerall = statetype != A
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;triggerall = PlayerID(helper(33333333),var(3)), pos y > -60 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 12 ;5= startup time
trigger1 = ctrl
trigger1 = random < ailevel * 36
trigger1 = enemy,animtime < -24

[State -1, AI Butt Drop reaction to projectile] ;by Inktrebuchet
type = ChangeState
value = 3080
triggerall = var(30) = 59 
triggerall = ailevel > 3
triggerall = power > 999
triggerall = p2bodydist x = [61, 250]
triggerall = p2stateno != [660,669]
triggerall = statetype != A
trigger1 = (stateno = 230) ||(stateno = 240)
trigger1 = random < ailevel * 12
trigger1 = movehit
trigger2 = stateno = 230
trigger2 = movehit
trigger2 = random < ailevel * 4


;-------------------------Organize---------------------------



;[state -1, taunt]
;type = changestate
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall = statetype != A
;triggerall = p2bodydist x > 115
;triggerall = Ailevel > 4
;trigger1 = life > 700 && p2life < 300
;trigger1 = random < 10
;trigger1 = p2statetype = L
;trigger2 = life > 1000
;trigger2 = p2life < 200 
;trigger2 = Random < Ailevel 
;value = 195

[state -1, Armor command grab]
type = changestate
triggerall = var(30) = 59
triggerall = enemy,statetype != L
triggerall = statetype != A
triggerall = !numexplod(9997)
triggerall = p2bodydist x =[0, 270]
triggerall = ailevel > 4
triggerall = power > 499 ;&& power < 2500
triggerall = enemy,time > 3
triggerall = enemy,backedgebodydist > 20
trigger1 = p2movetype = A
trigger1 = Random < (Ailevel*12)
trigger1 = enemy,statetype != A
trigger1 = ctrl
;trigger2 = enemy, pos y < 0 && enemy,pos y > -50
;trigger2 = random < floor(60/ailevel)
trigger2 = prevstateno = 5120
trigger2 = p2statetype != A
trigger2 = random < ailevel * 32
trigger2 = ctrl
trigger3 = (stateno = 200) || (stateno = 400) || (stateno = 218)
trigger3 = p2statetype != A
trigger3 = movehit
trigger3 = random < ailevel * 4
trigger4 = (prevstateno = [150,155])
trigger4 = ctrl
trigger4 = random < ailevel * 18
trigger4 = enemynear,animtime < -4
value = 1120

[state -1, Butt In]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = p2statetype = A
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 470]
trigger1 = (stateno = 240) || (stateno = 218)
trigger1 = movehit
trigger1 = Random < Ailevel * 4
trigger1 = var(12) > 0
trigger2 = !inguarddist
trigger2 = ctrl
trigger2 = enemy,ctrl = 0
trigger2 = random < floor(ailevel*0.5)
value = 1070

[state -1, Lunge Grab]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ctrl
triggerall = power > 499
triggerall = p2statetype != L
triggerall = p2statetype != A
triggerall = p2movetype != H
triggerall = ailevel > 4
triggerall = p2bodydist x = [150,700]
trigger1 = enemynear,backedgebodydist = [0, 200]
trigger1 = random < ailevel * 6
trigger1 = p2statetype != A
trigger1 = inguarddist
trigger1 = enemynear,hitdefattr = S,NA,SA
value = 1270



[state -1, Command Grab hard]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59 
;triggerall = !numexplod(9997)
triggerall = ailevel > 3
triggerall = p2bodydist x = [0,130]
triggerall = p2statetype != L
triggerall = p2statetype != A
trigger1 = Random < Ailevel * 27
trigger1 = ctrl
trigger1 = enemy,stateno != [150,155] 
trigger2 = enemy,stateno = [700,799]
trigger2 = random < ailevel * 24
trigger2 = ctrl || var(1)
trigger3 = p2stateno = 5120
trigger3 = enemynear,animtime > -4
trigger3 = ctrl
trigger3 = random < ailevel * 36
value = 1110

[state -1, Command Grab Light]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
;triggerall = !numexplod(9997)
triggerall = ailevel > 3
triggerall = p2bodydist x = [140,200]
triggerall = p2statetype != L
triggerall = p2statetype != A
trigger1 = Random < Ailevel * 18
trigger1 = ctrl
trigger2 = prevstateno = [150,155] 
trigger2 = Random < Ailevel * 18
trigger2 = ctrl
trigger3 = enemy,animtime < -4  && !enemy,ctrl 
trigger3 = random < ailevel * 36
trigger3 = !inguarddist
trigger3 = ctrl
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel * 24
trigger4 = ctrl || var(1)
trigger5 = p2movetype = I
trigger5 = enemy,ctrl = 0
trigger5 = random < ailevel * 36
trigger5 = ctrl
value = 1100

[state -1, Lunge Grab Quick]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ctrl
triggerall = p2statetype != L
triggerall = p2statetype != A
triggerall = p2movetype != H
triggerall = ailevel > 3
triggerall = p2bodydist x = [150,475]
trigger1 = random < ailevel * 2
trigger1 = p2statetype != A
trigger1 = !inguarddist
trigger2 = enemynear,backedgebodydist = [0, 200]
trigger2 = random < ailevel * 12
trigger2 = p2statetype != A
trigger2 = !inguarddist
trigger3 = enemynear,stateno = 105
trigger3 = random < ailevel * 18
trigger4 = (enemynear,stateno = [700,799])
trigger4 = random < ailevel * 32
trigger4 = !inguarddist
value = 1250

[state -1, Lunge Grab Armored]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ctrl
triggerall = p2statetype != L
triggerall = p2statetype != A
triggerall = p2movetype != H
triggerall = ailevel > 3
triggerall = p2bodydist x = [150,650]
trigger1 = enemynear,backedgebodydist = [0,200]
trigger1 = random < ailevel * 12
trigger1 = inguarddist
trigger2 = enemynear,backedgebodydist < 200
trigger2 = random < ailevel * 24
trigger2 = p2movetype = A
trigger3 = enemynear,backedgebodydist < 200
trigger3 = random < ailevel * 8
trigger3 = enemynear,stateno = 5120
trigger3 = enemynear,animtime = -2
value = 1260

[state -1, butt drop anti projectile]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ctrl
triggerall = power > 499
triggerall = ailevel > 4
triggerall = p2bodydist x < 250
trigger1 = enemynear,hitdefattr = SCA,AP  || enemynear,numproj > 0
trigger1 = random < (ailevel*12)
trigger1 = enemy,animtime < -16
value = 1020

[State -1, AI Butt Drop reaction to projectile] ;by Inktrebuchet
type = ChangeState
value = 1020
triggerall = var(30) = 59 
triggerall = ailevel > 4
triggerall = power > 499
triggerall = p2bodydist x = [0, 800]
triggerall = p2stateno != [660,669]
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
;triggerall = PlayerID(helper(33333333),var(3)), pos y > -60 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 12 ;5= startup time
trigger1 = ctrl
trigger1 = random < ailevel * 36
trigger1 = enemy,animtime < -12



;-------------------------------
; Projectile dodge 1
;-------------------------------

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1000
triggerall = var(30) = 59 
triggerall = ailevel > 3
triggerall = statetype != A 
triggerall = p2stateno != [660,669]
triggerall = p2statetype != L
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
triggerall = PlayerID(helper(33333333),var(3)), pos y > -640 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 12 ;5= startup time
trigger1 = ctrl
trigger1 = random < ailevel * 36
trigger1 = enemy,animtime < -18


[state -1, butt drop - anti projectile]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = p2bodydist x = [0, 700]
triggerall = p2stateno != [660, 669]
trigger1 = ctrl
trigger1 = enemy,numproj > 0 || enemy,hitdefattr = SCA, NP, SP
trigger1 = Random < (Ailevel*24)
trigger1 = enemy,animtime < -24
trigger2 = (stateno = 240)
trigger2 = movehit
trigger2 = random < ailevel * 8
value = 1010

[state -1, butt drop - anti projectile]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = p2bodydist x = [0, 400]
triggerall = p2stateno != [660, 669]
trigger1 = ctrl
trigger1 = enemy,numproj > 0 || enemy,hitdefattr = SCA, NP, SP
trigger1 = Random < (Ailevel*12)
trigger1 = enemy,animtime < -12
trigger2 = stateno = 240
trigger2 = movehit
trigger2 = random < ailevel * 4
value = 1000

[State -1, AI projectile against enemy projectile] ;by Inktrebuchet
type = ChangeState
value = 1010
triggerall = var(30) = 59 
triggerall = ailevel > 3
triggerall = statetype != A 
triggerall = p2stateno != [660,669]
triggerall = p2bodydist x =[0,700]
triggerall = p2statetype != L
triggerall = PlayerIdExist(helper(33333333),var(3)) ;enemy projectile exists
triggerall = PlayerID(helper(33333333),var(3)), pos y > -640 ; Avoid attempt to counter projectiles that are to high. 100 = char height
triggerall = PlayerID(helper(33333333),var(3)), vel x != 0 ; Avoid "Division by Zero" debug overflow
;distance / velocity = time >= startup time
;trigger1 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) >= 12 ;5= startup time
trigger1 = ctrl
trigger1 = random < ailevel * 24
trigger1 = enemy,animtime < -24


[state -1, regular throw]
type = changestate
triggerall = ailevel > 1
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ctrl
triggerall = !numexplod(9997)
triggerall = p2bodydist X = [0, 250]
triggerall = p2statetype != A
triggerall = p2statetype != L
triggerall = p2movetype != H 
trigger1 = Random < (Ailevel*16)
trigger2 = enemy,name = "Lardo Rat"
trigger2 = enemy,stateno = [1000,1004]
trigger2 = random < (ailevel*16) 
trigger3 = enemy,authorname = "Kazecat"
trigger3 = enemy,stateno = 1400
trigger3 = random < (ailevel*8)
trigger4 = p2stateno = [700,799]
trigger4 = random < ailevel*48
trigger5 = enemy,prevstateno = [700,799]
trigger5 = random < ailevel * 48
trigger6 = p2stateno = 800
trigger6 = random < ailevel * 48
trigger7 = backedgebodydist < 50
trigger7 = ctrl
trigger7 = random < ailevel * 48
trigger8 = enemy,name = "Frank West Arr"
trigger8 = enemy,stateno = 900
trigger8 = random < ailevel * 24
value = 800

;[state -1, Lunge Grab]
;type = changestate
;triggerall = statetype != A
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall = ailevel > 2
;triggerall = p2statetype != L
;triggerall = p2movetype != H
;triggerall = p2bodydist x = [56,130]
;trigger1 = random < ailevel * 4
;trigger1 = p2statetype != A
;trigger2 = enemy,backedgebodydist = [0,20]
;trigger2 = random < ailevel * 24
;trigger2 = p2statetype != A
;value = 1230

;[state -1, Lunge Grab]
;type = changestate
;triggerall = statetype != A
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall = ailevel > 2
;triggerall = p2statetype != L
;triggerall = p2movetype != H
;triggerall = p2bodydist x = [56,130]
;trigger1 = random < ailevel * 2
;trigger1 = p2statetype != A
;trigger2 = enemy,backedgebodydist = [0,20]
;trigger2 = random < ailevel * 24
;trigger2 = p2statetype != A
;value = 1240



;2 hit combo
[state -1, S. Jab]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ctrl
triggerall = !inguarddist
triggerall =! enemynear,movetype = A
triggerall = p2statetype != L
triggerall = p2stateno != [700,799]
triggerall = p2bodydist X = [0, 350]
trigger1 = Random < (Ailevel*8)
trigger2 = p2movetype = H && p2statetype = S
trigger2 = random < ailevel*12
trigger3 = random < ailevel * 2
trigger3 = !inguarddist
trigger3 = p2bodydist x = [300,370]
value = 200

[state -1, S. Short]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = p2bodydist x = [0, 410]
triggerall = p2bodydist y = [-120, 0]
triggerall = p2stateno != [700,799]
trigger1 = stateno = 200 && movehit
trigger1 = random < (ailevel*32)
trigger2 = enemy,hitfall = 1
trigger2 = ctrl
trigger2 = p2bodydist y = [20,80]
trigger3 = p2stateno = 673
trigger3 = ctrl 
trigger3 = random < ailevel * 36
trigger4 = stateno = 200 && moveguarded
trigger4 = random < (ailevel * 4)
value = 230

[state -1, S. Fierce]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = p2bodydist x = [0,730]
triggerall = p2statetype != L
triggerall = p2statetype != C
triggerall = p2stateno != [700,799]
trigger1 = stateno = 200 && movehit
trigger1 = random < (ailevel * 8)
trigger2 = ctrl
trigger2 = Random < Ailevel * 2
trigger2 = p2bodydist x = [130, 730]
trigger3 = enemy, numproj >= 1
trigger3 = ctrl
trigger3 = life > 700
trigger3 = random < (ailevel*4)
trigger4 = life <= 700 && life > 300
trigger4 = ctrl 
trigger4 = enemy, numproj > 0
trigger4 = random < ailevel
value = 210

[state -1, Headbutt]
type = changestate
triggerall = Statetype != A
Triggerall = var(30) = 59
triggerall = enemy,statetype != L
triggerall = enemy, stateno != [660, 669]
triggerall = p2stateno != [700,799]
triggerall = p2bodydist x = [0, 390]
trigger1 = stateno = 200 && movecontact
trigger1 = Random < Ailevel * 8
trigger2 = ctrl
trigger2 = life > 700
trigger2 = Random < Ailevel * 2
trigger3 = life < 700 && life > 200
trigger3 = Random < Ailevel 
trigger3 = ctrl
trigger4 = stateno = 230
trigger4 = movehit
trigger4 = random < ailevel * 24
trigger5 = p2stateno = 5120
trigger5 = p2bodydist x = [120, 390]
trigger5 = ctrl
trigger5 = random < ailevel * 4
value = 215

[state -1, S. Roundhouse]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = enemy,stateno != [660,669]
triggerall = p2bodydist x = [0, 910]
triggerall = p2stateno != [700,799]
triggerall = !numtarget(1400)
trigger1 = stateno = 230 && movehit
trigger1 = random < ailevel * 48
trigger1 = enemy,hitfall
trigger2 = Random < Ailevel * 2
trigger2 = life > 700
trigger2 = ctrl
trigger2 = enemy,statetype = A
trigger3 = ctrl
trigger3 = random < (ailevel*8)
trigger3 = p2stateno = 5120
trigger3 = enemy,animtime > -2
trigger3 = ctrl
trigger4 = p2stateno = 105
trigger4 = ctrl
trigger4 = random < ailevel * 12
trigger5 = p2statetype = C
trigger5 = ctrl
trigger5 = random < ailevel * 2
trigger5 = !inguarddist
value = 240

[state -1, C. Jab]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = p2statetype != A
triggerall = p2statetype != L
triggerall = p2bodydist x =[0, 420]
triggerall = p2bodydist y = [-320,0]
triggerall = !inguarddist
trigger1 = ctrl
trigger1 = Random < (Ailevel*6)
value = 400

[state -1, C. Fierce]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ailevel > 2
triggerall = p2bodydist x =[0, 530]
triggerall = p2bodydist y =[-500, 0]
trigger1 = Random < Ailevel * 2
trigger1 = ctrl
trigger1 = p2statetype = A
trigger2 = (stateno = 400) || (stateno = 200)  
trigger2 = random < (ailevel*24) 
trigger2 = movehit
trigger3 = stateno = 230
trigger3 = movehit
trigger3 = random < ailevel * 18
trigger4 = (stateno = 200) || (stateno = 400) || (stateno = 230)
trigger4 = movehit
trigger4 = enemy,movetype = A
trigger4 = random < ailevel * 36
trigger5 = prevstateno = 811
trigger5 = ctrl
trigger5 = random < ailevel * 36
value = 410

[state -1, C. Short]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = p2bodydist x = [0, 350]
trigger1 = stateno = 400 && movehit
trigger1 = random < ailevel * 24
trigger2 = enemy,statetype = S
trigger2 = ctrl
trigger2 = random < ailevel * 4
trigger3 = enemy,statetype = S
trigger3 = stateno = 200
trigger3 = movecontact
trigger3 = random < ailevel * 4
trigger4 = p2stateno = 5120
trigger4 = enemynear,animtime > -4
trigger4 = ctrl
trigger4 = random < ailevel * 12
value = 430


[state -1, C. Roundhouse]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ctrl
triggerall = !var(5)
triggerall = p2stateno != 5120
triggerall = !inguarddist
triggerall = p2stateno != [700,799]
triggerall = p2statetype != A
triggerall = p2statetype != L
trigger1 = p2bodydist x > 400
trigger1 = Random < (Ailevel*4)
trigger2 = enemy,stateno = [105,106]
trigger2 = ctrl
trigger2 = random < (ailevel*16)
value = 440

[state -1, J. Jab]
type = changestate
triggerall = var(30) = 59
triggerall = !inguarddist
triggerall = statetype = A
triggerall = p2bodydist x = [0,650] 
trigger1 = Random < (Ailevel*24)
trigger1 = prevstateno = 42
trigger1 = ctrl
trigger2 = p2statetype = A
trigger2 = random < ailevel * 4
trigger2 = ctrl
value = 600

[state -1, J. Leg Drop]
type = changestate
triggerall = var(30) = 59
triggerall =! enemy,movetype = A  || !inguarddist
triggerall = statetype = A
triggerall = p2bodydist x = [0, 450] 
triggerall = p2bodydist y = [-300, 200]
trigger1 = Random < Ailevel * 4
trigger1 = ctrl
trigger2 = stateno = 600 && movehit
trigger2 = random < (ailevel*48)
value = 630

[state -1, J. Fierce]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0, 750] 
triggerall = p2bodydist y = [-400,-10]
triggerall = pos y < -88
trigger1 = Random < Ailevel * 2
trigger1 = p2statetype = A
trigger1 = ctrl
trigger2 = (stateno = 630) 
trigger2 = movehit 
trigger2 = random < (ailevel*48)
trigger3 = stateno = 600
trigger3 = movehit
trigger3 = random < ailevel * 24
value = 610

;[state -1, Belly Flop]
;type = changestate
;triggerall = var(30) = 59
;triggerall = ctrl
;triggerall = enemy,stateno != [660, 669]
;triggerall = statetype = A
;triggerall = p2bodydist x = [-30, 60]
;triggerall = vel x > 0
;trigger1 = p2statetype = C
;trigger2 = p2life < 80
;trigger2 = random < ailevel * 8
;value = 611



[state -1, J. Roundhouse]
type = changestate
triggerall = var(30) = 59
triggerall = statetype = A
triggerall = p2bodydist x = [0, 280]
triggerall = p2bodydist y = [-100,350]
trigger1 = prevstateno = [120,155]
trigger1 = random < ailevel * 12
trigger1 = ctrl
trigger2 = (stateno = 600)
trigger2 = movehit
trigger2 = random < ailevel * 48
trigger3 = stateno = 630
trigger3 = movehit
trigger3 = random < ailevel * 24
trigger4 = ctrl
trigger4 = stateno = 50
trigger4 = time = ifelse(prevstateno = 41,24, 18)
trigger4 = enemynear,statetype != A
value = 640

[state -1, Butt drop]
type = changestate
triggerall = var(30) = 59
triggerall = ctrl
triggerall = ailevel > 1
triggerall = statetype = A
triggerall = enemy,stateno != [660, 669]
triggerall = p2bodydist x = [-100, 350]
triggerall = p2bodydist y > 160
triggerall = pos y <-200
trigger1 = p2statetype = L
trigger1 = Random < Ailevel * 16
trigger2 = Random < Ailevel * 32
trigger2 = p2statetype = C
trigger3 = p2life < 100
trigger3 = random < ailevel * 32
trigger4 = pos y < - 460
trigger4 = random < ailevel * 48
value = 641

[state -1, Light Butt In]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = ailevel > 3
triggerall = statetype != A
triggerall = p2bodydist x = [0, 470]
triggerall = p2statetype != L
trigger1 = stateno = 218 && movehit
trigger1 = random < ailevel * 12
trigger1 = p2statetype != A
trigger2 = ctrl
trigger2 = life > floor(lifemax*0.25) || !inguarddist
trigger2 = random < ailevel * 2
trigger2 = p2bodydist x > 300
value = 1050

[state -1, Butt In]
type = changestate
triggerall = statetype != A
triggerall = var(30) = 59
triggerall = p2statetype = A
triggerall = ailevel > 3
triggerall = p2statetype != L
triggerall = p2bodydist x = [0, 470]
trigger1 = stateno = 240 && movehit
trigger1 = Random < Ailevel * 12
trigger1 = var(12) > 0
trigger2 = ctrl
trigger2 = life > floor(lifemax*0.25)  || !inguarddist
trigger2 = random < ailevel * 2
trigger2 = p2bodydist x > 200
value = 1060


;[state -1, EX butt in]
;type = changestate
;value = 1090
;triggerall = var(30) = 59
;triggerall = statetype != A
;triggerall = ailevel > 2
;triggerall = p2statetype != L
;triggerall = power > 499
;triggerall = p2bodydist x < 90
;trigger1 = p2movetype = A
;trigger1 = Random < Ailevel * 2
;trigger1 = ctrl
;trigger2 = stateno = 240 && movehit
;trigger2 = Random < Ailevel * 6
;trigger2 = var(12) > 0

[state -1, Trunk grab Light (comboable)]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype = A
triggerall = ailevel > 3
triggerall = p2bodydist x = [0, 350]
triggerall = p2bodydist y = [-450, -200]
trigger1 = stateno = 230 && movehit
trigger1 = Random < (Ailevel *8)
trigger2 = stateno = 212 && movehit
trigger2 = Random < Ailevel * 16
trigger3 = random < ailevel * 4
trigger3 = ctrl
trigger3 = enemy,ctrl = 0
value = 1200

[state -1, Trunk grab Hard]
type = changestate
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = p2statetype = A
triggerall = ailevel > 3
triggerall = p2movetype != H
triggerall = enemy,hitfall = 0
triggerall = p2bodydist y = [-450, -200]
triggerall = p2bodydist x = [0,350]
trigger1 = Random < (Ailevel*16)
trigger1 = ctrl
value = 1210

[state -1, Amble - Jumbo's run]
type = changestate
value = 100
triggerall = var(30) = 59
triggerall = statetype != A
triggerall = stateno != 100
triggerall = ailevel > 1
triggerall = ctrl
trigger1 = p2bodydist x > 300
trigger1 = Random < Ailevel * 4
trigger1 = !inguarddist
trigger1 = p2movetype != A
trigger2 = p2statetype = L
trigger2 = p2bodydist x > 300
trigger2 = random < ailevel * 16





;-----------------------------Close AI--------------------------------------




;[state -1, Butt bump]
;type = changestate
;triggerall = statetype != A
;triggerall = var(30) = 59
;triggerall = p2statetype = A
;triggerall = p2movetype = H
;triggerall = p2bodydist x = [0,170]
;trigger1 = stateno = 240 && movehit
;trigger1 = random < 90
;value = 1050






;-----------------------Close low combo----------------------------------







;----------------------------Armor options - Defensive---------------------






;----------------------if airborn------------------------------------------



;===========================================================================
;------------------------------A.I. End-------------------------------------
;===========================================================================

;===========================================================================

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.



;Ai adjustments for my own characters
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
trigger11 = enemy,stateno = 1120 
trigger11 = enemy,name = "Violet 'Tyla' Bunny"
trigger12 = enemy,name = "Julian Hippo"
trigger12 = enemy,stateno = 1200
var(5) = 1


[state -1, free to shoot again]
type = varset
triggerall = ailevel > 0
trigger1 = p2movetype = H
var(5) = 0
;=============================================================================
;-----------------------------------Supers------------------------------------
;=============================================================================
;
;Super Grab
[State -1, Jumbo Heavy Buster]
type = ChangeState
value = 3000
triggerall = power > 2999
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
triggerall = command = "supercombo" 
trigger1 = var(1)
trigger2 = ctrl || stateno = 40
trigger3 = (stateno = 52 && time > 2) 

;Super Anti Air Grab
[State -1, Tremendous Trunk Throw down]
type = changestate
value = 3040
triggerall = power > 999
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
triggerall = command = "Super2" 
trigger1 = var(1)
trigger2 = ctrl 
trigger3 = var(4)

;Super Anti Air Grab
[State -1, Tremendous Trunk(other) Sit down]
type = ChangeState
value = 3080
triggerall = power > 999
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
triggerall = command = "Super3" 
trigger1 = var(1)
trigger2 = ctrl
trigger3 = var(4)
trigger4 = stateno = 430
trigger4 = movecontact


;=============================================================================
;----------------------------------Special moves------------------------------
;=============================================================================
;Vicious Butt Drops Alt "Booty Loops"
;[State -1, Bouncing Butt EX]
;type = ChangeState
;value = 1025
;triggerall = command = "QCB_a+b" || command = "QCB_c"
;triggerall = var(30) != 59
;triggerall = power >= 1500
;triggerall = statetype = S || Statetype = C
;trigger1 = stateno = 644 || stateno = 1005
;---------------------------------------------------------------------------
;Senton Grab EX
[State -1, Senton Grab]
type = changestate
value = 1120
triggerall = command = "HCB_z"
triggerall = var(30) != 59
triggerall = power >= 500
triggerall = statetype = S || Statetype = C
trigger1 = ctrl || stateno = 40
trigger2 = var(1)

;---------------------------------------------------------------------------
;Senton Grab Hard
[State -1, Senton Grab]
type = changestate
value = 1110
triggerall = command = "HCB_y"
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
trigger1 = ctrl || stateno = 40
trigger2 = var(1)

;---------------------------------------------------------------------------
;Senton Grab Light
[State -1, Senton Grab]
type = changestate
value = 1100
triggerall = command = "HCB_x"
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
trigger1 = ctrl || stateno = 40
trigger2 = var(1)
;---------------------------------------------------------------------------
;Wall Crush grab EX
[State -1, Senton Grab]
type = changestate
value = 1270
triggerall = command = "HCB_c"
triggerall = var(30) != 59
triggerall = power > 499
triggerall = statetype = S || Statetype = C
trigger1 = ctrl || stateno = 40
trigger2 = var(1)


;---------------------------------------------------------------------------
;Wall Crush grab Heavy
[State -1, Senton Grab]
type = changestate
value = 1260
triggerall = command = "HCB_b"
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
trigger1 = ctrl || stateno = 40
trigger2 = var(1)


;---------------------------------------------------------------------------
;Wall Crush grab
[State -1, Senton Grab]
type = changestate
value = 1250
triggerall = command = "HCB_a"
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Vicious Butt Drops EX
[State -1, Bouncing Butt EX]
type = ChangeState
value = 1020
triggerall = command = "DD_c"
triggerall = var(30) != 59
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = 40
trigger4 = stateno = 430
trigger4 = movecontact

;---------------------------------------------------------------------------
;Vicious Butt Drops Light
[State -1, Bouncing Butt L]
type = ChangeState
value = 1000
triggerall = command = "DD_a"
triggerall = var(30) != 59
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = 40
trigger4 = stateno = 430
trigger4 = movecontact
;---------------------------------------------------------------------------
;Vicious Butt Drops Hard
[State -1, Bouncing Butt H]
type = ChangeState
value = 1010
triggerall = command = "DD_b"
triggerall = var(30) != 59
triggerall = Statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = 40
trigger4 = stateno = 430
trigger4 = movecontact
;---------------------------------------------------------------------------
;Butt Bump EX
;[State -1, Butt Bump light]
;type = ChangeState
;value = 1060
;triggerall = command = "DP_c" 
;triggerall = var(30) != 59
;triggerall = statetype = S || Statetype = C
;triggerall = power >= 1000
;trigger1 = var(1) ;Use combo condition (above)
;trigger2 = ctrl


;---------------------------------------------------------------------------
;Butt Bump L
;[State -1, Butt Bump light]
;type = ChangeState
;value = 1040
;triggerall = command = "DP_a"
;triggerall = var(30) != 59
;triggerall = statetype = S || Statetype = C
;trigger1 = var(1) ;Use combo condition (above)
;trigger2 = ctrl


;--------------------------------------------------------------------------
;Butt Bump H
;[State -1, Butt Bump light]
;type = ChangeState
;value = 1050
;triggerall = command = "DP_b"
;triggerall = var(30) != 59
;triggerall = statetype = S || Statetype = C
;trigger1 = var(1) ;Use combo condition (above)
;trigger2 = ctrl
;trigger3 = (stateno = [200, 499]) && movecontact 
;--------------------------------------------------------------------------
;Butt Thrust alt EX
[State -1, Butt Bump light]
type = ChangeState
value = 1070
triggerall = var(30) != 59
triggerall = power > 499
triggerall = command = "QCF_ab" 
triggerall = statetype = S || Statetype = C
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
;--------------------------------------------------------------------------
;Butt Thrust alt H
[State -1, Butt Bump light]
type = ChangeState
value = 1060
triggerall = var(30) != 59
triggerall = command = "QCF_b"
triggerall = statetype = S || Statetype = C
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
;--------------------------------------------------------------------------

;Butt Thrust alt L
[State -1, Butt Bump light]
type = ChangeState
value = 1050
triggerall = var(30) != 59
triggerall = command = "QCF_a"
triggerall = statetype = S || Statetype = C
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

;---------------------------------------------------------------------------
;Trunk Throw EX
[State -1, Trunk Throw Heavy]
type = ChangeState
value = 1220
triggerall = command = "QCF_z"
triggerall = var(30) != 59
Triggerall = power > 499
triggerall = statetype = S || Statetype = C
trigger1 = var(1)
trigger2 = Ctrl
;trigger3 = (stateno = [200, 499]) && movecontact

;--------------------------------------------------------------------------
;Trunk Throw L
[State -1, Trunk Throw light]
type = ChangeState
value = 1200
triggerall = command = "QCF_x"
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
trigger1 = var(1)
trigger2 = Ctrl
;trigger3 = (stateno = [200, 499]) && movecontact
;---------------------------------------------------------------------------
;Trunk Throw H
[State -1, Trunk Throw Heavy]
type = ChangeState
value = 1210
triggerall = command = "QCF_y"
triggerall = var(30) != 59
triggerall = statetype = S || Statetype = C
trigger1 = var(1)
trigger2 = Ctrl
;trigger3 = (stateno = [200, 499]) && movecontact
;---------------------------------------------------------------------------



;===========================================================================
;;Push Block Standing
;[state -1, Push Block]
;type = changestate
;value = 6300
;trigger1 = stateno = [120, 155]
;trigger1 = command = "recovery"
;trigger1 = statetype = S

;;Push Block Standing
;[state -1, Push Block]
;type = changestate
;value = 6310
;trigger1 = stateno = [120, 155]
;trigger1 = command = "recovery"
;trigger1 = statetype = C

;Push Block Standing
;[state -1, Push Block]
;type = changestate
;value = 6320
;trigger1 = stateno = [120, 155]
;trigger1 = command = "recovery"
;trigger1 = statetype = A

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF" 
trigger2 = command = "recovery" && command != "holdback"
triggerall = var(30) != 59
triggerall = statetype = S
triggerall = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger2 = command = "recovery"  && command = "holdback"
triggerall = var(30) != 59
triggerall = statetype = S
triggerall = ctrl
;---------------------------------------------------------------------------
;Super Jump
[state -1, super Jump]
type = changestate
value = 41
triggerall = var(30) != 59
trigger1 = command ="superjump"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "throw"
triggerall = var(30) != 59
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = ctrl
;----------------------------------------------------------------------------
;push block
[state -1, Pushblock]
type = changestate
value = 1400
triggerall = stateno = [150,153]
triggerall = statetype != A
trigger1 = command = "recovery"
trigger1 = power > 999


;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = var(30) != 59
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;trigger2 = stateno = 200 && time > 14
;trigger2 = movecontact
;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = var(30) != 59
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 400) && movecontact

;---------------------------------------------------------------------------
;Headbutt
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = command = "y"
triggerall = var(30) != 59
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 400) && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = var(30) != 59
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
triggerall = var(30) != 59
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 400) && movecontact 


;---------------------------------------------------------------------------
;Taunt
;[State -1, Taunt]
;type = ChangeState
;value = 195
;triggerall = command = "start"
;triggerall = var(30) != 59
;trigger1 = statetype != A
;trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = var(30) != 59
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && animelemtime(4) > 2

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = var(30) != 59
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400)  || stateno = 200 || stateno = 230 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = var(30) != 59
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = 200) && movecontact

;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = var(30) != 59
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200) || (stateno = 230)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = var(30) != 59
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact


;---------------------------------------------------------------------------
;Jump Body Splash
;[State -1, Jump Strong Punch]
;type = ChangeState
;value = 611
;triggerall = command = "y"
;triggerall = var(30) != 59
;triggerall = command = "holddown"
;trigger1 = statetype = A
;trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = var(30) != 59
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 630)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = var(30) != 59
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact


;---------------------------------------------------------------------------
;Butt Drop
[State -1, Jump Strong Kick]
type = ChangeState
value = 641
triggerall = command = "b"
triggerall = var(30) != 59
triggerall = command = "holddown"
triggerall = stateno != 105
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = var(30) != 59
triggerall = stateno != 105
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 630)
trigger2 = movecontact


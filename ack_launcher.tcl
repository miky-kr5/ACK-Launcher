#! /usr/bin/env wish

# Copyright (c) 2015, Miguel Angel Astor Romero
# All rights reserved.
# See the enclosed LICENSE file for more information.

frame .banner -relief flat
frame .info_f -relief flat
frame .buttons -relief flat -pady 5
frame .bottom -relief flat -pady 5
pack .banner -fill both -expand 1
pack .info_f -fill both -expand 1
pack .buttons -fill both -expand 1
pack .bottom -fill both -expand 1

image create photo bar1 -format GIF -file "launcher_icons/banner1.gif"
image create photo bar2 -format GIF -file "launcher_icons/banner2.gif"
image create photo con -format GIF -file "launcher_icons/configure.gif"
image create photo cre -format GIF -file "launcher_icons/create.gif"
image create photo fon -format GIF -file "launcher_icons/font.gif"
image create photo imp -format GIF -file "launcher_icons/import.gif"
image create photo mac -format GIF -file "launcher_icons/macros.gif"
image create photo map -format GIF -file "launcher_icons/map.gif"
image create photo mes -format GIF -file "launcher_icons/messages.gif"
image create photo obj -format GIF -file "launcher_icons/object.gif"
image create photo pep -format GIF -file "launcher_icons/people.gif"
image create photo run -format GIF -file "launcher_icons/run.gif"
image create photo til -format GIF -file "launcher_icons/tile.gif"

label .banner.bimg1 -image bar1
label .banner.bimg2 -image bar2
label .banner.just -font {-size 9 -weight bold} \
  -text "            Just launch ACK:            "
checkbutton .banner.mouse_c -text "Enable mouse (experimental)" -onvalue 1 \
  -offvalue 0 -variable mouse_var
label .banner.sclabel -text "Graphic Scaler: "
ttk::combobox .banner.scaler -width 10
.banner.scaler configure -values [ list none normal2x normal3x advmame2x \
  advmame3x hq2x hq3x 2xsai super2xsai supereagle advinterp2x \
  advinterp3x tv2x tv3x rgb2x rgb3x scan2x scan3x ]
.banner.scaler configure -state readonly
.banner.scaler set "hq3x"
label .banner.fslabel -text "ALT + ENTER toggles fullscreen while running ACK"

label .sep1 \
-text "------------------------------------------------------------------------"
label .sep2 \
-text "------------------------------------------------------------------------"

label .info1 -font {-size 9 -weight bold} \
  -text "... or launch multiple ACK editors"
label .info2 -font {-size 9 -weight bold} \
  -text "in separate windows:"
label .info3 -text "- Pick adventure with \"Select Adventure\" dropdown"
label .info4 -text "- Click buttons below to launch editors"
label .info5 -text "- Press TAB to save changes in current editor. Then"
label .info6 -text "switch to another editor window and press TAB to"
label .info7 -text "update it with the changes made in the previous"
label .info8 -text "editor. (You may need to use a selection menu"
label .info9 -text "before changes will appear.)"

label .buttons.butimg1 -image cre
label .buttons.butimg2 -image con
label .buttons.butimg3 -image til
label .buttons.butimg4 -image map
label .buttons.butimg5 -image imp
label .buttons.butimg6 -image fon
label .buttons.butimg7 -image obj
label .buttons.butimg8 -image pep
label .buttons.butimg9 -image mes
label .buttons.butimg10 -image mac
label .buttons.butimg11 -image run

button .banner.b01 -text "Go!" -command "ack_base" -width 10
button .buttons.b02 -text "Create Adventure" -command "ackmod -n" -width 15
button .buttons.b03 -text "Configure Adventure" \
  -command "ackmod -c" -width 15
button .buttons.b04 -text "Edit Objects" -command "ackmod -o" -width 15
button .buttons.b05 -text "Tile Editor" -command "ackmod -g" -width 15
button .buttons.b06 -text "Edit People" -command "ackmod -p" -width 15
button .buttons.b07 -text "Map Editor" -command "ackmod -m" -width 15
button .buttons.b08 -text "Edit Messages" -command "ackmod -t" -width 15
button .buttons.b09 -text "Import / Export" -command "ackmod -i" -width 15
button .buttons.b10 -text "Edit Macros" -command "ackmod -x" -width 15
button .buttons.b11 -text "Edit Font" -command "ackmod -f" -width 15
button .buttons.b12 -text "Run Adventure" -command "ackmod -r" -width 15
button .bottom.b13 -text "ACK Manual" -command "game_manual" -width 10
button .bottom.b14 -text "Open Game Folder" -command "game_dir" -width 15
button .bottom.b15 -text "Visit ACK Site" -command "home_page" -width 10
button .buttons.b89 -text "Refresh Adventures" -command "refresh" -width 15

label .buttons.advlbl -text "Select Adventure:"
ttk::combobox .buttons.advents
.buttons.advents configure -values [ concat ".. " [ exec ls -1 "ACK/GAMES/" ] ]
.buttons.advents configure -state readonly
.buttons.advents set ".."
bind .buttons.advents <<ComboboxSelected>> {
  if { [.buttons.advents get] == ".." } {
    disable_buttons
  } else {
    enable_buttons
  }
}

grid .banner -row 0 -column 0
grid .banner.bimg1 -row 0 -column 0 -rowspan 5
grid .banner.just -row 0 -column 1 -columnspan 2
grid .banner.b01 -row 1 -column 1 -columnspan 2
grid .banner.bimg2 -row 0 -column 3 -rowspan 5
grid .banner.mouse_c -row 3 -column 1 -columnspan 2
grid .banner.sclabel -row 5 -column 1
grid .banner.scaler -row 5 -column 2
grid .banner.fslabel -row 6 -column 0 -columnspan 4

grid .sep1 -row 1 -column 0
grid .info_f -row 2 -column 0
pack .info1 -in .info_f
pack .info2 -in .info_f
pack .info3 -in .info_f -anchor w
pack .info4 -in .info_f -anchor w
pack .info5 -in .info_f -anchor w
pack .info6 -in .info_f -anchor w
pack .info7 -in .info_f -anchor w
pack .info8 -in .info_f -anchor w
pack .info9 -in .info_f -anchor w

grid .buttons -row 3 -column 0
grid .buttons.advlbl -row 0 -column 1 -columnspan 2
grid .buttons.advents -row 1 -column 1 -columnspan 2
grid .buttons.butimg1 -row 2 -column 0
grid .buttons.butimg2 -row 3 -column 0
grid .buttons.butimg3 -row 4 -column 0
grid .buttons.butimg4 -row 5 -column 0
grid .buttons.butimg5 -row 6 -column 0
grid .buttons.butimg6 -row 7 -column 0
grid .buttons.b02 -row 2 -column 1
grid .buttons.b03 -row 3 -column 1
grid .buttons.b05 -row 4 -column 1
grid .buttons.b07 -row 5 -column 1
grid .buttons.b09 -row 6 -column 1
grid .buttons.b11 -row 7 -column 1
grid .buttons.b89 -row 2 -column 2
grid .buttons.b04 -row 3 -column 2
grid .buttons.b06 -row 4 -column 2
grid .buttons.b08 -row 5 -column 2
grid .buttons.b10 -row 6 -column 2
grid .buttons.b12 -row 7 -column 2
grid .buttons.butimg7 -row 3 -column 3
grid .buttons.butimg8 -row 4 -column 3
grid .buttons.butimg9 -row 5 -column 3
grid .buttons.butimg10 -row 6 -column 3
grid .buttons.butimg11 -row 7 -column 3

grid .sep2 -row 4 -column 0
grid .bottom -row 5 -column 0
grid .bottom.b13 -row 0 -column 0
grid .bottom.b14 -row 0 -column 1
grid .bottom.b15 -row 0 -column 2

proc refresh {} {
  .buttons.advents configure -values [ concat ".. " [ exec ls -1 "GAMES/" ] ]
}

proc ack_base {} {
  set scaler [ .banner.scaler get ]
  exec dosbox -scaler $scaler -conf dosbox.conf -noconsole -c "ack.bat -exit" &
}

proc ackmod module {
  global mouse_var
  if { $module == "-r" } then {
		set scaler [ .banner.scaler get ]
	} else {
		set scaler "hq2x"
	}
  if { $mouse_var == 1 && $module == "-r" } then {
    set use_mouse "-mouse"
  } else {
    set use_mouse ""
  }
  set command [ concat "ackmod $module" [ \
                concat [ .buttons.advents get ] "$use_mouse" ] ]
  exec dosbox -scaler $scaler -conf dosbox.conf -noconsole -c $command &
}

proc game_dir {} {
  if { [.buttons.advents get] != ".." } then {
    set game [ .buttons.advents get ]
    exec nautilus "GAMES/$game" &
  }
}

proc game_manual {} { exec evince "MANUAL.PDF" & }

proc home_page {} { exec firefox "http://mozomedia.com/ack/" & }

proc disable_buttons {} {
  .buttons.b03 configure -state disabled
  .buttons.b04 configure -state disabled
  .buttons.b05 configure -state disabled
  .buttons.b06 configure -state disabled
  .buttons.b07 configure -state disabled
  .buttons.b08 configure -state disabled
  .buttons.b09 configure -state disabled
  .buttons.b10 configure -state disabled
  .buttons.b11 configure -state disabled
  .buttons.b12 configure -state disabled
  .bottom.b14 configure -state disabled
}

proc enable_buttons {} {
  .buttons.b03 configure -state normal
  .buttons.b04 configure -state normal
  .buttons.b05 configure -state normal
  .buttons.b06 configure -state normal
  .buttons.b07 configure -state normal
  .buttons.b08 configure -state normal
  .buttons.b09 configure -state normal
  .buttons.b10 configure -state normal
  .buttons.b11 configure -state normal
  .buttons.b12 configure -state normal
  .bottom.b14 configure -state normal
}

wm resizable . false false
wm title . "ACK Launcher"
disable_buttons
set mouse_var 0
cd "ACK"

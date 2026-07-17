set_ignore_applications() {
    ; Ignore applications can be defined here if necessary
}

main() {
    ListLines 0
    SetControlDelay 0
    SetKeyDelay -1
    SetWinDelay 0
    SendMode "Input"
    set_ignore_applications()
}

main()
#UseHook

;; Set suspend toggle key "<F1>"
#SuspendExempt
F13 & F1::Suspend
#SuspendExempt False

#HotIf not WinActive("ahk_group IgnoreApplications")

; Shift + F13 Key Combinations (for selecting text)
#HotIf GetKeyState("Shift", "P")

; Define common arrow key movements with Shift for selection
F13 & b::Send "+{Left}"  ; Shift + Left
F13 & f::Send "+{Right}" ; Shift + Right
F13 & p::Send "+{Up}"    ; Shift + Up
F13 & n::Send "+{Down}"  ; Shift + Down
F13 & a::Send "+{Home}"  ; Shift + Home (select to line start)
F13 & e::Send "+{End}"   ; Shift + End (select to line end)

#HotIf  ; Reset HotIf condition

; F13 Key Combinations (for normal movements and actions)
F13 & b::Send "{Left}"  ; Move cursor left
F13 & f::Send "{Right}" ; Move cursor right
F13 & p::Send "{Up}"    ; Move cursor up
F13 & n::Send "{Down}"  ; Move cursor down

F13 & d::Send "{Del}"   ; Delete next character
F13 & h::Send "{BS}"    ; Delete previous character (Backspace)
F13 & a::Send "{Home}"  ; Move to line start
F13 & e::Send "{End}"   ; Move to line end
F13 & v::Send "{PgDn}"  ; Page down
F13 & m::Send "{Enter}" ; Enter (newline)

; Delete and Copy from cursor to end of line
F13 & k::
{
    Send "{Shift Down}{End}{Shift Up}"  ; Select to end of line
    Sleep 50
    Send "^x"
    Return
}

; Delete and Copy from cursor to start of line
F13 & u::   
{
    Send "{Shift Down}{Home}{Shift Up}"  ; Select to start of line
    Sleep 50
    Send "^x"
    Return
}

; Copy selected text (Ctrl + c)
F13 & c::Send "^c"

; 切り取り (C-w)
F13 & w::Send "^x"

; ペースト (C-y)
F13 & y::Send "^v"

; アンドゥ (C-/)
F13 & /::Send "^z"  ; C-/ (アンドゥ)

; F13 + Space -> Ctrl + Space
F13 & Space::Send "^{Space}"

#HotIf ; Reset conditions to allow normal operation outside conditions

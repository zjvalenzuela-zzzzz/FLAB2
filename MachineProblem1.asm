%macro PRINT 1
    mov ecx, %1
    call print_string
%endmacro

section .data
    welcome db "=======================================", 10
            db "       THE MYSTIC ZODIAC ORACLE", 10
            db "=======================================", 10
            db "             *       *", 10
            db "          *     /\      *", 10
            db "               /  \", 10
            db "         *    /____\    *", 10
            db "               |  |", 10
            db "           *   |__|   *", 10
            db "       DISCOVER YOUR DESTINY!", 10
            db "=======================================", 10
            db "All fortunes are fictional and for fun.", 10, 0

    name_prompt db "Enter your name (1-63 characters): ", 0
    month_prompt db "Enter birth month (1-12): ", 0
    day_prompt db "Enter birth day (1-31): ", 0

    name_error db "Invalid name. Please enter 1-63 characters.", 10, 0
    month_error db "Invalid month. Enter a number from 1 to 12.", 10, 0
    date_error db "Invalid date. Enter the month and day again.", 10
               db "February has 28 days in this program.", 10, 0

    hello db 10, "Welcome, ", 0
    exclamation db "!", 10, 0

    info_title db 10, "=======================================", 10
               db "           YOUR ZODIAC SIGN", 10
               db "=======================================", 10, 0

    sign_label db "Zodiac Sign: ", 0
    element_label db "Element: ", 0
    symbol_label db "Symbol: ", 0
    personality_label db "Personality: ", 0

    menu db 10, "[1] Love and Relationships", 10
         db "[2] Career and Studies", 10
         db "[3] Health and Wellness", 10
         db "[4] Lucky Number and Color", 10
         db "[5] View Zodiac Information", 10
         db "[6] Exit", 10
         db "Enter your choice: ", 0

    menu_error db "Invalid selection. Enter 1 to 6.", 10, 0

    love_title db 10, "LOVE AND RELATIONSHIPS", 10, 0
    career_title db 10, "CAREER AND STUDIES", 10, 0
    health_title db 10, "HEALTH AND WELLNESS", 10, 0
    lucky_title db 10, "LUCKY NUMBER AND COLOR", 10, 0

    number_label db "Lucky Number: ", 0
    color_label db "Lucky Color: ", 0
    colon_space db ": ", 0

    again_prompt db "Return to menu? (Y/N): ", 0
    again_error db "Invalid answer. Enter Y or N.", 10, 0

    month_days dd 31,28,31,30,31,30,31,31,30,31,30,31
    cutoffs dd 20,19,21,20,21,21,23,23,23,23,22,22

    z0_name db "CAPRICORN", 0
    z0_element db "Earth", 0
    z0_symbol db "Sea Goat", 0
    z0_personality db "Patient, practical, responsible.", 0
    z0_art db "     /\  /\ ", 10
           db "    (  --  )", 10
           db "     \_==_/  Sea Goat", 10, 0
    z0_love db "A kind conversation may bring you closer to someone.", 10, 0
    z0_career db "Your patience may help you finish a difficult task.", 10, 0
    z0_health db "Make time to rest after your daily responsibilities.", 10, 0
    z0_color db "Brown", 0

    z1_name db "AQUARIUS", 0
    z1_element db "Air", 0
    z1_symbol db "Water Bearer", 0
    z1_personality db "Independent, friendly, inventive.", 0
    z1_art db "     ~~~  ~~~", 10
           db "      ~~~  ~~~", 10
           db "     Water Bearer", 10, 0
    z1_love db "Sharing your ideas may start a new friendship.", 10, 0
    z1_career db "A fresh idea may help you solve a problem today.", 10, 0
    z1_health db "Take a short break and give your mind time to rest.", 10, 0
    z1_color db "Blue", 0

    z2_name db "PISCES", 0
    z2_element db "Water", 0
    z2_symbol db "Fish", 0
    z2_personality db "Caring, imaginative, gentle.", 0
    z2_art db '     ><(((">', 10
           db '     <"))朝><', 10
           db "        Fish", 10, 0
    z2_love db "Listening carefully may help someone feel understood.", 10, 0
    z2_career db "Your imagination may help with a creative activity.", 10, 0
    z2_health db "A peaceful activity may help you relax today.", 10, 0
    z2_color db "Sea Green", 0

    z3_name db "ARIES", 0
    z3_element db "Fire", 0
    z3_symbol db "Ram", 0
    z3_personality db "Brave, energetic, determined.", 0
    z3_art db "     /\   /\ ", 10
           db "    (  o o  )", 10
           db "     \__v__/  Ram", 10, 0
    z3_love db "A friendly first step may lead to a good conversation.", 10, 0
    z3_career db "Your energy may help you begin a new project.", 10, 0
    z3_health db "Balance physical activity with enough rest.", 10, 0
    z3_color db "Red", 0

    z4_name db "TAURUS", 0
    z4_element db "Earth", 0
    z4_symbol db "Bull", 0
    z4_personality db "Reliable, patient, loyal.", 0
    z4_art db "     \     /", 10
           db "      (o o)", 10
           db "       \_/  Bull", 10, 0
    z4_love db "A simple act of kindness may strengthen a friendship.", 10, 0
    z4_career db "Steady effort may help you finish your schoolwork.", 10, 0
    z4_health db "A calm routine may help you feel refreshed.", 10, 0
    z4_color db "Green", 0

    z5_name db "GEMINI", 0
    z5_element db "Air", 0
    z5_symbol db "Twins", 0
    z5_personality db "Curious, lively, adaptable.", 0
    z5_art db "      O   O", 10
           db "     /|\ /|\ ", 10
           db "     / \ / \  Twins", 10, 0
    z5_love db "An honest conversation may clear up a misunderstanding.", 10, 0
    z5_career db "Asking questions may help you learn something useful.", 10, 0
    z5_health db "A short walk may give you a welcome break.", 10, 0
    z5_color db "Yellow", 0

    z6_name db "CANCER", 0
    z6_element db "Water", 0
    z6_symbol db "Crab", 0
    z6_personality db "Caring, loyal, sensitive.", 0
    z6_art db "     \  / \  /", 10
           db "      (o___o)", 10
           db "     /|     |\  Crab", 10, 0
    z6_love db "Spending time with loved ones may brighten your day.", 10, 0
    z6_career db "A comfortable study space may help you concentrate.", 10, 0
    z6_health db "Give yourself time to relax after a busy day.", 10, 0
    z6_color db "Silver", 0

    z7_name db "LEO", 0
    z7_element db "Fire", 0
    z7_symbol db "Lion", 0
    z7_personality db "Confident, creative, courageous.", 0
    z7_art db "       /\_/\ ", 10
           db "      ( o.o )", 10
           db "       > ^ <  Lion", 10, 0
    z7_love db "Your warm attitude may make someone smile today.", 10, 0
    z7_career db "Your creativity may help you solve a difficult problem.", 10, 0
    z7_health db "Save some time for rest after your activities.", 10, 0
    z7_color db "Gold", 0

    z8_name db "VIRGO", 0
    z8_element db "Earth", 0
    z8_symbol db "Maiden", 0
    z8_personality db "Careful, helpful, organized.", 0
    z8_art db "        O", 10
           db "       /|\ ", 10
           db "       /_\  Maiden", 10, 0
    z8_love db "A small helpful gesture may show someone you care.", 10, 0
    z8_career db "Checking your work may help you notice a small mistake.", 10, 0
    z8_health db "A simple daily routine may help you feel balanced.", 10, 0
    z8_color db "Navy Blue", 0

    z9_name db "LIBRA", 0
    z9_element db "Air", 0
    z9_symbol db "Scales", 0
    z9_personality db "Fair, friendly, peaceful.", 0
    z9_art db "      ___|___", 10
           db "     /\  |  /\ ", 10
           db "    (__) | (__)  Scales", 10, 0
    z9_love db "A fair and calm discussion may bring people together.", 10, 0
    z9_career db "Working with a classmate may help you understand a task.", 10, 0
    z9_health db "Balance study time with time to relax.", 10, 0
    z9_color db "Pink", 0

    z10_name db "SCORPIO", 0
    z10_element db "Water", 0
    z10_symbol db "Scorpion", 0
    z10_personality db "Focused, brave, passionate.", 0
    z10_art db "       __    /\ ", 10
            db "     _/oo\__/ /", 10
            db "    /_||||__\/  Scorpion", 10, 0
    z10_love db "Sharing your feelings kindly may build trust.", 10, 0
    z10_career db "Your focus may help you complete a challenging task.", 10, 0
    z10_health db "Pause and take a few slow breaths when you feel tense.", 10, 0
    z10_color db "Maroon", 0

    z11_name db "SAGITTARIUS", 0
    z11_element db "Fire", 0
    z11_symbol db "Archer", 0
    z11_personality db "Hopeful, honest, adventurous.", 0
    z11_art db "         /| ", 10
            db "     ---/-->", 10
            db "       /  |  Archer", 10, 0
    z11_love db "A new shared activity may help you make a friend.", 10, 0
    z11_career db "Trying a different study method may help you learn.", 10, 0
    z11_health db "Enjoy a little outdoor time when you can.", 10, 0
    z11_color db "Purple", 0

zodiac_table:
    dd z0_name, z0_element, z0_symbol, z0_personality, z0_art
    dd z0_love, z0_career, z0_health, 8, z0_color

    dd z1_name, z1_element, z1_symbol, z1_personality, z1_art
    dd z1_love, z1_career, z1_health, 7, z1_color

    dd z2_name, z2_element, z2_symbol, z2_personality, z2_art
    dd z2_love, z2_career, z2_health, 3, z2_color

    dd z3_name, z3_element, z3_symbol, z3_personality, z3_art
    dd z3_love, z3_career, z3_health, 9, z3_color

    dd z4_name, z4_element, z4_symbol, z4_personality, z4_art
    dd z4_love, z4_career, z4_health, 6, z4_color

    dd z5_name, z5_element, z5_symbol, z5_personality, z5_art
    dd z5_love, z5_career, z5_health, 5, z5_color

    dd z6_name, z6_element, z6_symbol, z6_personality, z6_art
    dd z6_love, z6_career, z6_health, 2, z6_color

    dd z7_name, z7_element, z7_symbol, z7_personality, z7_art
    dd z7_love, z7_career, z7_health, 1, z7_color

    dd z8_name, z8_element, z8_symbol, z8_personality, z8_art
    dd z8_love, z8_career, z8_health, 4, z8_color

    dd z9_name, z9_element, z9_symbol, z9_personality, z9_art
    dd z9_love, z9_career, z9_health, 6, z9_color

    dd z10_name, z10_element, z10_symbol, z10_personality, z10_art
    dd z10_love, z10_career, z10_health, 9, z10_color

    dd z11_name, z11_element, z11_symbol, z11_personality, z11_art
    dd z11_love, z11_career, z11_health, 3, z11_color

    newline db 10, 0
    goodbye db 10, "Goodbye!", 10, 0

section .bss
    user_name resb 64
    birth_month resd 1
    birth_day resd 1
    sign_record resd 1

    input_buffer resb 64
    input_char resb 1
    number_buffer resb 12

section .text
global _start

_start:
    call display_welcome
    call get_user_info
    call determine_zodiac
    call display_zodiac_info

.menu:
    call display_menu
    call read_integer
    jc .invalid

    cmp eax, 1
    jl .invalid
    cmp eax, 6
    jg .invalid
    je exit_program

    cmp eax, 5
    je .information

    call show_horoscope
    jmp .again

.information:
    call display_zodiac_info

.again:
    call ask_return
    jmp .menu

.invalid:
    PRINT menu_error
    jmp .menu

display_welcome:
    PRINT welcome
    ret

get_user_info:
.name:
    PRINT name_prompt
    mov ecx, user_name
    mov edx, 63
    call read_line

    cmp eax, 1
    jl .bad_name

.date:
    PRINT month_prompt
    call read_integer
    jc .bad_month

    cmp eax, 1
    jl .bad_month
    cmp eax, 12
    jg .bad_month

    mov [birth_month], eax

    PRINT day_prompt
    call read_integer
    jc .bad_date

    mov [birth_day], eax
    call validate_birthdate
    jc .bad_date

    PRINT hello
    PRINT user_name
    PRINT exclamation
    ret

.bad_name:
    PRINT name_error
    jmp .name

.bad_month:
    PRINT month_error
    jmp .date

.bad_date:
    PRINT date_error
    jmp .date
    
validate_birthdate:
    mov eax, [birth_month]
    cmp eax, 1
    jl .invalid
    cmp eax, 12
    jg .invalid

    dec eax
    mov edx, [month_days+eax*4]

    mov eax, [birth_day]
    cmp eax, 1
    jl .invalid
    cmp eax, edx
    jle .valid

.invalid:
    stc
    ret

.valid:
    clc
    ret

determine_zodiac:
    mov ebx, [birth_month]
    dec ebx

    mov eax, [birth_day]
    cmp eax, [cutoffs+ebx*4]
    jge .next_sign
    jmp .selected

.next_sign:
    inc ebx
    cmp ebx, 12
    jne .selected

    xor ebx, ebx

.selected:
    imul ebx, ebx, 40
    add ebx, zodiac_table
    mov [sign_record], ebx
    ret

display_zodiac_info:
    pushad

    PRINT info_title
    call display_zodiac_art

    mov esi, [sign_record]

    PRINT sign_label
    mov ecx, [esi]
    call print_string
    PRINT newline

    PRINT element_label
    mov ecx, [esi+4]
    call print_string
    PRINT newline

    PRINT symbol_label
    mov ecx, [esi+8]
    call print_string
    PRINT newline

    PRINT personality_label
    mov ecx, [esi+12]
    call print_string
    PRINT newline

    popad
    ret

display_zodiac_art:
    pushad
    mov esi, [sign_record]
    mov ecx, [esi+16]
    call print_string
    popad
    ret

display_menu:
    PRINT menu
    ret

show_horoscope:
    pushad
    mov esi, [sign_record]

    cmp eax, 1
    je .love
    cmp eax, 2
    je .career
    cmp eax, 3
    je .health

    PRINT lucky_title
    PRINT number_label
    mov eax, [esi+32]
    call print_number
    PRINT newline

    PRINT color_label
    mov ecx, [esi+36]
    call print_string
    PRINT newline
    jmp .done

.love:
    PRINT love_title
    mov edi, [esi+20]
    jmp .prediction

.career:
    PRINT career_title
    mov edi, [esi+24]
    jmp .prediction

.health:
    PRINT health_title
    mov edi, [esi+28]

.prediction:
    mov ecx, [esi]
    call print_string

    PRINT colon_space

    mov ecx, edi
    call print_string

.done:
    popad
    ret

ask_return:
.ask:
    PRINT again_prompt
    mov ecx, input_buffer
    mov edx, 63
    call read_line

    cmp eax, 1
    jne .invalid

    mov al, [input_buffer]

    cmp al, 'Y'
    je .yes
    cmp al, 'y'
    je .yes
    cmp al, 'N'
    je exit_program
    cmp al, 'n'
    je exit_program

.invalid:
    PRINT again_error
    jmp .ask

.yes:
    ret

print_string:
    pushad
    mov edx, ecx

.length:
    cmp byte [edx], 0
    je .write
    inc edx
    jmp .length

.write:
    sub edx, ecx
    mov eax, 4
    mov ebx, 1
    int 0x80

    popad
    ret

read_line:
    pushad
    mov edi, ecx
    mov esi, edx
    xor ebp, ebp

.read:
    mov eax, 3
    xor ebx, ebx
    mov ecx, input_char
    mov edx, 1
    int 0x80

    cmp eax, 0
    jle exit_program

    mov al, [input_char]
    cmp al, 10
    je .done
    cmp al, 13
    je .read

    cmp ebp, esi
    jae .overflow

    mov [edi], al
    inc edi
    inc ebp
    jmp .read

.overflow:
    mov ebp, esi
    inc ebp
    jmp .read

.done:
    mov byte [edi], 0
    mov eax, ebp

    cmp ebp, esi
    jbe .save
    mov eax, -1

.save:
    mov [esp+28], eax
    popad
    ret

read_integer:
    push ebx
    push ecx
    push edx
    push esi

    mov ecx, input_buffer
    mov edx, 63
    call read_line

    cmp eax, 0
    jle .invalid

    mov ecx, eax
    mov esi, input_buffer
    xor eax, eax

.digit:
    movzx edx, byte [esi]
    cmp edx, '0'
    jb .invalid
    cmp edx, '9'
    ja .invalid

    sub edx, '0'

    cmp eax, 214748364
    ja .invalid
    jne .append
    cmp edx, 7
    ja .invalid

.append:
    imul eax, eax, 10
    add eax, edx

    inc esi
    loop .digit

    clc
    jmp .return

.invalid:
    stc

.return:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret

print_number:
    pushad
    mov edi, number_buffer+11
    mov byte [edi], 0
    mov ebx, 10

.convert:
    xor edx, edx
    div ebx
    add dl, '0'

    dec edi
    mov [edi], dl

    test eax, eax
    jnz .convert

    mov ecx, edi
    call print_string

    popad
    ret

exit_program:
    PRINT goodbye
    mov eax, 1
    xor ebx, ebx
    int 0x80
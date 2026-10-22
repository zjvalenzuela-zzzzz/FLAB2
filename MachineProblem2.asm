;machine problem 2 
;Dungeon and Survival Game
;Zack Gabriel J. Valenzuela

section .data
; ---Title---

welcome_banner db "=======================================", 0Ah
               db "     DUNGEON OF THE LOST KING", 0Ah
               db "=======================================", 0Ah
               db"                  |>>>>", 0Ah
               db"                  |", 0Ah
               db"              _  _|_  _", 0Ah
               db "             |;|_|;|_|;|", 0Ah
               db "             \.    .  /", 0Ah
               db "              \:  .  /", 0Ah
               db "               ||:   |", 0Ah
               db "               ||:.  |", 0Ah
               db "               ||:  .|", 0Ah
               db "       ENTER IF YOU DARE!", 0Ah
               db "=======================================", 0Ah, 0Ah, 0
welcome_len equ $ - welcome_banner

;---Main Menu---
menu_banner db 0Ah," =====================================", 0Ah
            db "                    MAIN MENU", 0Ah
            db     " =====================================", 0Ah
            db     " [1] Explore Dungeon", 0Ah
            db     " [2] View Character Status", 0Ah
            db     " [3] Use health Potion", 0Ah
            db     " [4] View Inventory",0Ah
            db     " [5] Exit Game", 0Ah
            db     " Enter Choice: ", 0 
menu_len    equ $ - menu_banner

;---Enemy ASCII art---   
goblin_art db 0Ah,"         ,      ,",0Ah
           db     "        /(.-", 22h, 22h, "-.)\", 0Ah
           db     "    |\  \/      \/  /|",0Ah
           db     "    | \ / =.  .= \ / |",0Ah
           db     "     \  \   ^    /  /",0Ah
           db     "      \  '-----'   /",0Ah
           db     "A GOBLIN APPEARS!", 0Ah, 0
goblin_len     equ $ - goblin_art

chest_art db 0Ah,"        __________",0Ah
          db     "       /_________/|",0Ah
          db     "      |  _____  | |",0Ah
          db     "      | |  ?  | | |",0Ah
          db     "      | |_____| | /",0Ah
          db     "      |_________|/",0Ah
          db     "YOU FOUND A TREASURE CHEST!",0Ah, 0
chest_len equ $ - chest_art

dragon_art db 0Ah, "               / \  //\",0Ah
           db      "     |\___/|      \",0Ah
           db      "     /0  0  \      |",0Ah
           db      "    /   ^    \    /",0Ah
           db      "   /  \___/   \  /",0Ah
           db      "   \___________\/",0Ah
           db      " THE DRAGON AWAKENS!",0Ah
dragon_len equ $ - dragon_art

; --- Room & Action Prompts ---
    combat_menu    db 0Ah, "[1] Attack  [2] Defend", 0Ah
                   db "[3] Use Potion  [4] Run", 0Ah
                   db "Action: ", 0
    combat_menu_len equ $ - combat_menu

    chest_menu     db 0Ah, "[1] Open Chest  [2] Leave Chest", 0Ah
                   db "Choice: ", 0
    chest_menu_len equ $ - chest_menu

    ; --- General Prompts & Status Messages ---
    prompt_name    db "Enter your hero name: ", 0
    prompt_name_l  equ $ - prompt_name

    prompt_class   db "Choose your character:", 0Ah
                   db "[1] Warrior", 0Ah
                   db "[2] Mage", 0Ah
                   db "[3] Archer", 0Ah
                   db "Enter choice: ", 0
    prompt_class_l equ $ - prompt_class

    msg_welcome    db "Welcome, ", 0
    msg_space      db " ", 0
    msg_excl       db "!", 0Ah, 0

    msg_invalid    db 0Ah, "Invalid selection! Please try again.", 0Ah, 0
    msg_invalid_l  equ $ - msg_invalid

    msg_potion_full db 0Ah, "Health already at maximum! Potion retained.", 0Ah, 0
    msg_potion_empty db 0Ah, "No health potions remaining!", 0Ah, 0
    msg_potion_used db 0Ah, "You used a health potion and restored up to 20 HP!", 0Ah, 0

    msg_status_head db 0Ah, "=== CHARACTER STATUS ===", 0Ah, 0
    msg_status_name db "Hero Name: ", 0
    msg_status_cls  db "Class: ", 0
    msg_status_hp   db "Health: ", 0
    msg_status_max  db " / ", 0
    msg_status_atk  db "Attack Power: ", 0

    msg_inv_head    db 0Ah, "=== INVENTORY ===", 0Ah, 0
    msg_inv_gold    db "Gold: ", 0
    msg_inv_pot     db "Potions: ", 0

    str_warrior     db "Warrior", 0
    str_mage        db "Mage", 0
    str_archer      db "Archer", 0

    msg_chest_open  db 0Ah, "You opened the chest and found 50 Gold!", 0Ah, 0
    msg_chest_leave db 0Ah, "You left the chest behind.", 0Ah, 0

    msg_hit_enemy   db "You hit the enemy for ", 0
    msg_damage      db " damage!", 0Ah, 0
    msg_def_prep    db "You prepare to defend! Incoming damage reduced.", 0Ah, 0
    msg_enemy_hit   db "The enemy attacks you for ", 0
    msg_goblin_def  db "Goblin defeated!", 0Ah, 0
    msg_dragon_def  db "Dragon defeated!", 0Ah, 0
    msg_run_away    db "You fled back to the safety of the main menu!", 0Ah, 0

    msg_victory     db 0Ah, "=======================================", 0Ah
                    db "               VICTORY!", 0Ah
                    db "=======================================", 0Ah
                    db "CONGRATULATIONS, ", 0
    msg_victory_2   db "!" , 0Ah
                    db "You defeated the dragon and escaped!", 0Ah, 0
    msg_vic_gold    db "Final Gold: ", 0
    msg_vic_hp      db "Remaining Health: ", 0
    msg_vic_tail    db "YOU ARE A HERO!", 0Ah
                    db "=======================================", 0Ah, 0

    msg_gameover    db 0Ah, "=======================================", 0Ah
                    db "              GAME OVER", 0Ah
                    db "=======================================", 0Ah
                    db "Your hero has fallen.", 0Ah
                    db "The dungeon remains undefeated.", 0Ah
                    db "BETTER LUCK NEXT TIME!", 0Ah
                    db "=======================================", 0Ah, 0

    msg_newline     db 0Ah, 0

section .bss
    ; --- Player Attributes ---
    player_name     resb 32
    class_choice    resb 4
    class_id        resd 1       ; 1 = Warrior, 2 = Mage, 3 = Archer
    curr_hp         resd 1
    max_hp          resd 1
    attack_power    resd 1
    potions         resd 1
    gold            resd 1

    ; --- Game Progress ---
    current_room    resd 1       ; 1 = Goblin, 2 = Treasure, 3 = Dragon
    defend_flag     resd 1       ; 1 if player defensive turn

    ; --- Enemy Attributes ---
    enemy_hp        resd 1
    enemy_atk       resd 1

    ; --- Input & String Buffers ---
    input_buf       resb 16
    num_str         resb 16

section .text
    global _start

_start:
    call display_welcome
    call get_player_info
    call initialize_character

game_loop:
    call display_main_menu
    call read_input
    
    mov al, [input_buf]
    cmp al, '1'
    je .do_explore
    cmp al, '2'
    je .do_status
    cmp al, '3'
    je .do_potion
    cmp al, '4'
    je .do_inventory
    cmp al, '5'
    je .do_exit

    ; Invalid option
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_invalid
    mov edx, msg_invalid_l
    int 0x80
    jmp game_loop

.do_explore:
    call explore_dungeon
    jmp game_loop

.do_status:
    call display_status
    jmp game_loop

.do_potion:
    call use_potion
    jmp game_loop

.do_inventory:
    call display_inventory
    jmp game_loop

.do_exit:
; ---Procedure: display_game_result---
; Input: EAX = 1 for Victory, 0 for Defeat
display_game_result:
    cmp eax, 1
    je .victory
    call display_gameover
    ret
.victory:
    call display_victory
    ret
    call exit_program


; ---Procedure: display_welcome---
display_welcome:
    push eax
    push ebx
    push ecx
    push edx

    mov eax, 4
    mov ebx, 1
    mov ecx, welcome_banner
    mov edx, welcome_len
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

; ---Procedure: get_player_info---
get_player_info:
    push eax
    push ebx
    push ecx
    push edx

.get_name:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_name
    mov edx, prompt_name_l
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, player_name
    mov edx, 31
    int 0x80

    ; Strip trailing newline from name
    mov ecx, eax
    dec ecx
    mov byte [player_name + ecx], 0

.get_class:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_class
    mov edx, prompt_class_l
    int 0x80

    call read_input
    mov al, [input_buf]
    cmp al, '1'
    je .valid_class
    cmp al, '2'
    je .valid_class
    cmp al, '3'
    je .valid_class

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_invalid
    mov edx, msg_invalid_l
    int 0x80
    jmp .get_class

.valid_class:
    sub al, '0'
    movzx eax, al
    mov [class_id], eax

    ; Welcome message: "Welcome, <Class> <Name>!"
    mov ecx, msg_welcome
    call print_str

    call print_class_name

    mov ecx, msg_space
    call print_str

    mov ecx, player_name
    call print_str

    mov ecx, msg_excl
    call print_str

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

; ---Procedure: initialize_character---
initialize_character:
    push eax

    mov dword [gold], 0
    mov dword [current_room], 1

    mov eax, [class_id]
    cmp eax, 1
    je .init_warrior
    cmp eax, 2
    je .init_mage
    jmp .init_archer

.init_warrior:
    mov dword [curr_hp], 100
    mov dword [max_hp], 100
    mov dword [attack_power], 20
    mov dword [potions], 2
    jmp .done

.init_mage:
    mov dword [curr_hp], 70
    mov dword [max_hp], 70
    mov dword [attack_power], 30
    mov dword [potions], 3
    jmp .done

.init_archer:
    mov dword [curr_hp], 85
    mov dword [max_hp], 85
    mov dword [attack_power], 25
    mov dword [potions], 2

.done:
    pop eax
    ret

; ---Procedure: display_main_menu---
display_main_menu:
    push eax
    push ebx
    push ecx
    push edx

    mov eax, 4
    mov ebx, 1
    mov ecx, menu_banner
    mov edx, menu_len
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

; ---Procedure: explore_dungeon---
explore_dungeon:
    push eax

    mov eax, [current_room]
    cmp eax, 1
    je .room_1
    cmp eax, 2
    je .room_2
    cmp eax, 3
    je .room_3
    jmp .done

.room_1:
    ; Room 1: Goblin Chamber
    mov eax, 4
    mov ebx, 1
    mov ecx, goblin_art
    mov edx, goblin_len
    int 0x80

    mov dword [enemy_hp], 30
    mov dword [enemy_atk], 10

    call battle_enemy
    cmp eax, 1
    jne .done
    
    mov ecx, msg_goblin_def
    call print_str
    mov dword [current_room], 2
    jmp .done

.room_2:
    ; Room 2: Treasure Chamber
    mov eax, 4
    mov ebx, 1
    mov ecx, chest_art
    mov edx, chest_len
    int 0x80

.chest_choice:
    mov eax, 4
    mov ebx, 1
    mov ecx, chest_menu
    mov edx, chest_menu_len
    int 0x80

    call read_input
    mov al, [input_buf]
    cmp al, '1'
    je .open_chest
    cmp al, '2'
    je .leave_chest

    mov ecx, msg_invalid
    call print_str
    jmp .chest_choice

.open_chest:
    mov eax, [gold]
    add eax, 50
    mov [gold], eax
    mov ecx, msg_chest_open
    call print_str
    mov dword [current_room], 3
    jmp .done

.leave_chest:
    mov ecx, msg_chest_leave
    call print_str
    mov dword [current_room], 3
    jmp .done

.room_3:
    ; Room 3: Dragon's Lair
    mov eax, 4
    mov ebx, 1
    mov ecx, dragon_art
    mov edx, dragon_len
    int 0x80

    mov dword [enemy_hp], 60
    mov dword [enemy_atk], 15

    call battle_enemy
    cmp eax, 1
    jne .done

    mov ecx, msg_dragon_def
    call print_str
    mov eax, 1                  ; 1 = Victory
    call display_game_result
    call exit_program

.done:
    pop eax
    ret

; ---Procedure: battle_enemy---
battle_enemy:
    push ebx
    push ecx
    push edx

.combat_loop:
    mov eax, [curr_hp]
    cmp eax, 0
    jle .player_defeated

    mov eax, [enemy_hp]
    cmp eax, 0
    jle .enemy_defeated

    mov dword [defend_flag], 0

    mov eax, 4
    mov ebx, 1
    mov ecx, combat_menu
    mov edx, combat_menu_len
    int 0x80

    call read_input
    mov al, [input_buf]

    cmp al, '1'
    je .action_attack
    cmp al, '2'
    je .action_defend
    cmp al, '3'
    je .action_potion
    cmp al, '4'
    je .action_run

    mov ecx, msg_invalid
    call print_str
    jmp .combat_loop

.action_attack:
    mov eax, [enemy_hp]
    sub eax, [attack_power]
    cmp eax, 0
    jge .set_ehp
    xor eax, eax
.set_ehp:
    mov [enemy_hp], eax

    mov ecx, msg_hit_enemy
    call print_str
    mov eax, [attack_power]
    call print_num
    mov ecx, msg_damage
    call print_str

    cmp dword [enemy_hp], 0
    jle .enemy_defeated

    call enemy_retaliate
    jmp .combat_loop

.action_defend:
    mov dword [defend_flag], 1
    mov ecx, msg_def_prep
    call print_str
    call enemy_retaliate
    jmp .combat_loop

.action_potion:
    call use_potion
    call enemy_retaliate
    jmp .combat_loop

.action_run:
    mov ecx, msg_run_away
    call print_str
    mov eax, 0
    jmp .exit_battle

.enemy_defeated:
    mov eax, 1
    jmp .exit_battle

.player_defeated:
    call display_gameover
    call exit_program

.exit_battle:
    pop edx
    pop ecx
    pop ebx
    ret

; Enemy retaliate sub-routine
enemy_retaliate:
    push eax
    push ebx
    push ecx

    mov eax, [enemy_atk]
    cmp dword [defend_flag], 1
    jne .apply_dmg
    
    sub eax, 5
    cmp eax, 0
    jge .apply_dmg
    xor eax, eax

.apply_dmg:
    mov ebx, eax
    mov eax, [curr_hp]
    sub eax, ebx
    cmp eax, 0
    jge .store_hp
    xor eax, eax
.store_hp:
    mov [curr_hp], eax

    mov ecx, msg_enemy_hit
    call print_str
    mov eax, ebx
    call print_num
    mov ecx, msg_damage
    call print_str

    cmp dword [curr_hp], 0
    jle .dead
    pop ecx
    pop ebx
    pop eax
    ret

.dead:
    call display_gameover
    call exit_program

; ---Procedure: use_potion---
use_potion:
    push eax
    push ebx

    mov eax, [potions]
    cmp eax, 0
    jle .no_potions

    mov eax, [curr_hp]
    cmp eax, [max_hp]
    jge .at_full_hp

    dec dword [potions]
    add eax, 20
    cmp eax, [max_hp]
    jle .save_hp
    mov eax, [max_hp]

.save_hp:
    mov [curr_hp], eax
    mov ecx, msg_potion_used
    call print_str
    jmp .done

.at_full_hp:
    mov ecx, msg_potion_full
    call print_str
    jmp .done

.no_potions:
    mov ecx, msg_potion_empty
    call print_str

.done:
    pop ebx
    pop eax
    ret

; ---Procedure: display_status---
display_status:
    push eax
    push ecx

    mov ecx, msg_status_head
    call print_str

    mov ecx, msg_status_name
    call print_str
    mov ecx, player_name
    call print_str
    mov ecx, msg_newline
    call print_str

    mov ecx, msg_status_cls
    call print_str
    call print_class_name
    mov ecx, msg_newline
    call print_str

    mov ecx, msg_status_hp
    call print_str
    mov eax, [curr_hp]
    call print_num
    mov ecx, msg_status_max
    call print_str
    mov eax, [max_hp]
    call print_num
    mov ecx, msg_newline
    call print_str

    mov ecx, msg_status_atk
    call print_str
    mov eax, [attack_power]
    call print_num
    mov ecx, msg_newline
    call print_str

    pop ecx
    pop eax
    ret

; ---Procedure: display_inventory---
display_inventory:
    push eax
    push ecx

    mov ecx, msg_inv_head
    call print_str

    mov ecx, msg_inv_gold
    call print_str
    mov eax, [gold]
    call print_num
    mov ecx, msg_newline
    call print_str

    mov ecx, msg_inv_pot
    call print_str
    mov eax, [potions]
    call print_num
    mov ecx, msg_newline
    call print_str

    pop ecx
    pop eax
    ret


; ---Procedure: display_victory---
display_victory:
    push eax
    push ecx

    mov ecx, msg_victory
    call print_str

    mov ecx, player_name
    call print_str

    mov ecx, msg_victory_2
    call print_str

    mov ecx, msg_vic_gold
    call print_str
    mov eax, [gold]
    call print_num
    mov ecx, msg_newline
    call print_str

    mov ecx, msg_vic_hp
    call print_str
    mov eax, [curr_hp]
    call print_num
    mov ecx, msg_newline
    call print_str

    mov ecx, msg_vic_tail
    call print_str

    pop ecx
    pop eax
    ret

;---Procedure: display_gameover---

display_gameover:
    push ecx
    mov ecx, msg_gameover
    call print_str
    pop ecx
    ret

; ---Procedure: exit_program---
exit_program:
    mov eax, 1             ; sys_exit
    mov ebx, 0             ; exit status 0
    int 0x80

; Utility Helper Functions
read_input:
    push eax
    push ebx
    push ecx
    push edx

    mov eax, 3             ; sys_read
    mov ebx, 0             ; stdin
    mov ecx, input_buf
    mov edx, 15
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

print_str:
    push eax
    push ebx
    push ecx
    push edx

    mov eax, ecx
    call strlen
    mov edx, eax
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, [esp + 4]      ; retrieve string pointer saved on stack
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

print_num:
    push eax
    push ebx
    push ecx
    push edx

    mov ecx, num_str + 15
    mov byte [ecx], 0
    mov ebx, 10

.convert_loop:
    xor edx, edx
    div ebx
    add dl, '0'
    dec ecx
    mov [ecx], dl
    test eax, eax
    jnz .convert_loop

    call print_str

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

strlen:
    push ebx
    mov ebx, eax
.loop:
    cmp byte [ebx], 0
    je .done
    inc ebx
    jmp .loop
.done:
    sub ebx, eax
    mov eax, ebx
    pop ebx
    ret

print_class_name:
    push ecx
    mov ecx, [class_id]
    cmp ecx, 1
    je .p_warrior
    cmp ecx, 2
    je .p_mage
    mov ecx, str_archer
    jmp .do_p
.p_warrior:
    mov ecx, str_warrior
    jmp .do_p
.p_mage:
    mov ecx, str_mage
.do_p:
    call print_str
    pop ecx
    ret
         

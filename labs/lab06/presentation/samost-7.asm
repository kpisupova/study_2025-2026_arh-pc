%include 'in_out.asm'
SECTION .data
    div: DB 'Выражение для вычисления: y = 5*(x-1)^2', 0
    msg: DB 'Введите x: ', 0
    rem: DB 'Результат вычисления равен: ', 0
    
SECTION .bss
    x resb 10           ; буфер для ввода x
    result resd 1       ; место для хранения результата
 
SECTION .text
GLOBAL _start
_start:
    ; Выводим выражение для вычисления
    mov eax, div
    call sprintLF
    
    ; Выводим запрос на ввод x
    mov eax, msg
    call sprint
    
    ; Читаем значение x
    mov ecx, x
    mov edx, 10
    call sread
    
    ; Преобразуем строку в число
    mov eax, x
    call atoi
    mov [x], eax
    
    ; Вычисляем x - 1
    mov eax, [x]        ; загружаем x в eax
    sub eax, 1          ; eax = x - 1
    
    ; Возводим в квадрат: (x - 1)^2
    imul eax, eax       ; eax = (x - 1) * (x - 1)
    
    ; Умножаем на 5: 5 * (x - 1)^2
    mov ebx, 5          ; ebx = 5
    imul ebx            ; eax = 5 * (x - 1)^2
    
    ; Сохраняем результат
    mov [result], eax
    
    ; Выводим сообщение о результате
    mov eax, rem
    call sprint
    
    ; Выводим сам результат
    mov eax, [result]
    call iprintLF
    
    ; Завершаем программу
    call quit

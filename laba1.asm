
.586;  модель процессора
.model flat, stdcall; плоска€ модель пам€ти

; объ€вление внешних функций
extern ExitProcess@4:near; завершение процесса Ц выход из программы

; присоединение внешних библиотек
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment;  сегмент данных

N DW 3
SUM DW ?

;описание переменных

data ends

text segment;  сегмент кода
start:
MOV DX, 0
MOV CX, N
JCXZ M1
MOV BH, 1
L: 

MOV AL,BH
MUL BH
ADD DX, AX; 
ADD BH, 2; часть цикла
LOOP L
M1:
NEG DX
MOV SUM, DX

       ;  выход из программы, завершить процесс
	push 0
	call ExitProcess@4
text ends
end start

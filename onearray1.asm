.586;  модель процессора
.model flat, stdcall; плоска€ модель пам€ти

; объ€вление внешних функций
extern ExitProcess@4:near; завершение процесса Ц выход из программы

; присоединение внешних библиотек
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment;  сегмент данных

N EQU 9
X DW 1,3,6,9,10,12,3,6,6
KOL DW ?
;описание переменных

data ends

text segment;  сегмент кода
start:

MOV BX,0 ;счетчик
MOV ECX,N 
MOV ESI,0
MOV DL,3 ;знаменатель дл€ проверки

M2:
MOV AX,X[ESI]
DIV DL
CMP AH,0 ;сравнение остатка
JNE M3
ADD BX, X[ESI] ;—ложение кратных 3

M3:
INC ESI
INC ESI
LOOP M2
MOV KOL,BX

       ;  выход из программы, завершить процесс
	push 0
	call ExitProcess@4
text ends
end start

.586;  модель процессора
.model flat, stdcall; плоска€ модель пам€ти

; объ€вление внешних функций
extern ExitProcess@4:near; завершение процесса Ц выход из программы

; присоединение внешних библиотек
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib
data segment

X DB 2
Y DB 0
Z DB 4
T DB 3
U DB ?
data ends

text segment

	SUBB PROC
		SHL AL, 1
		SHL BL, 1
		SUB AL, BL
		RET
	SUBB ENDP

start:
	MOV AL, X
	MOV BL, Y

	CALL SUBB

    MOV DL, AL

      MOV AL, Z
      MOV BL, T      
       CALL SUBB

      ADD DL, AL
      
	MOV U, DL
      

      

push 0
call ExitProcess@4
text ends
end start
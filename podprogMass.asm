.586;  ������ ����������
.model flat, stdcall; ������� ������ ������

; ���������� ������� �������
extern ExitProcess@4:near; ���������� �������� � ����� �� ���������

; ������������� ������� ���������
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib
data segment

N EQU 4 ;����� ���������
M EQU 3 
A DW 4, -3, 7, 8
    ;6,-1,9,10

B DW 4, -1, 6, 5

data ends


text segment
RAZDEL PROC

PUSH ESI
PUSH AX
PUSH BX
PUSH ECX


MOV BL, 2
L:



    
 ADD WORD PTR[ESI], 2 ;������ �� ��� �� ����
   
              ADD ESI, 2
                       
LOOP L
ADD WORD PTR[ESI], 2 ;������ �� ��� �� ����
POP ECX
POP BX
POP AX
POP ESI

RET
RAZDEL ENDP

start:

MOV ECX, N
LEA ESI, A
CALL RAZDEL

MOV ECX, M
LEA ESI, B
CALL RAZDEL

push 0
call ExitProcess@4
text ends
end start
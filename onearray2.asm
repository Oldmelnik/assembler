.586;  ������ ����������
.model flat, stdcall; ������� ������ ������

; ���������� ������� �������
extern ExitProcess@4:near; ���������� �������� � ����� �� ���������

; ������������� ������� ���������
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment;  ������� ������

N EQU 9
X DB 1,2,3,4,-5,-6,-7,-8,-9
;11,11,11,11,11,10,10,10,10

;�������� ����������
data ends
text segment;  ������� ����
start:

MOV ECX,N
MOV ESI,0
M2:
MOV AL,X[ESI]
CMP AL,-5
JGE M1
MOV AL,10
JMP M3
M1:
MOV AL,11
M3:
MOV X[ESI],AL
INC ESI
LOOP M2

       ;  ����� �� ���������, ��������� �������
	push 0
	call ExitProcess@4
text ends
end start



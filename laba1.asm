
.586;  ������ ����������
.model flat, stdcall; ������� ������ ������

; ���������� ������� �������
extern ExitProcess@4:near; ���������� �������� � ����� �� ���������

; ������������� ������� ���������
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment;  ������� ������

N DW 3
SUM DW ?

;�������� ����������

data ends

text segment;  ������� ����
start:
MOV DX, 0
MOV CX, N
JCXZ M1
MOV BH, 1
L: 

MOV AL,BH
MUL BH
ADD DX, AX; 
ADD BH, 2; ����� �����
LOOP L
M1:
NEG DX
MOV SUM, DX

       ;  ����� �� ���������, ��������� �������
	push 0
	call ExitProcess@4
text ends
end start

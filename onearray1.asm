.586;  ������ ����������
.model flat, stdcall; ������� ������ ������

; ���������� ������� �������
extern ExitProcess@4:near; ���������� �������� � ����� �� ���������

; ������������� ������� ���������
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

data segment;  ������� ������

N EQU 9
X DW 1,3,6,9,10,12,3,6,6
KOL DW ?
;�������� ����������

data ends

text segment;  ������� ����
start:

MOV BX,0 ;�������
MOV ECX,N 
MOV ESI,0
MOV DL,3 ;����������� ��� ��������

M2:
MOV AX,X[ESI]
DIV DL
CMP AH,0 ;��������� �������
JNE M3
ADD BX, X[ESI] ;�������� ������� 3

M3:
INC ESI
INC ESI
LOOP M2
MOV KOL,BX

       ;  ����� �� ���������, ��������� �������
	push 0
	call ExitProcess@4
text ends
end start

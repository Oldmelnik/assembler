.586;  ������ ����������
.model flat, stdcall; ������� ������ ������

; ���������� ������� �������
extern ExitProcess@4:near; ���������� �������� � ����� �� ���������

; ������������� ������� ���������
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

;��� ��������� ������ ����. ������������ ���������� ������, ������ ������� ��������
;����� ������������ ��������� ��������������� ������.
                                                   
data segment
M EQU 3; ������
N EQU 4; �������
A DW 1, 2, 3, 4,
     2, 2, 2, 3,
     5, 4, 1, 2
B DW M DUP(?)
data ends


text segment

start:
MOV ECX, M
MOV ESI, 0
MOV EBX, 0
L2:
MOV EDX, ECX
MOV AX, 1
MOV EDI, 0
MOV ECX, N
L:
MUL A[ESI][EDI]
ADD EDI, 2
LOOP L
MOV B[EBX], AX
ADD ESI, 2*N
ADD EBX, 2
MOV ECX, EDX
LOOP L2

push 0
call ExitProcess@4
text ends
end start
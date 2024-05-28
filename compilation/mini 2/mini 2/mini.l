%{
#include<stdio.h>
#include<math.h>
#include"mini.tab.h"
#include <stdarg.h>
#include <string.h>
int yyerror(char *s);
int oldstate;
int numTOK=0; int numID=0; int numNUM=0; int numOP=0; int numCAR=0;
int errlx=0;
%}
%option yylineno  


LETTRE [a-zA-Z]
QUIT [Qq][Uu][Ii][Tt] 
%%
{QUIT}	{printf("\nStatistiques : \nMots cle: %d\nIDs: %d\nNumeros: %d\nOperateurs: %d\nCaracteres speciaux(*,;): %d\nCaracteres inconnus : %d\n", numTOK,numID,numNUM,numOP, numCAR,errlx); return 0;}
(c|C)(r|R)(e|E)(a|A)(t|T)(e|E) {++numTOK;  return CREATE;}
(t|T)(a|A)(b|B)(l|L)(e|E) {++numTOK;  return TABLE;}
(i|I)(n|N)(s|S)(e|E)(r|R)(t|T) {++numTOK;  return INSERT;}
(d|D)(r|R)(o|O)(p|P) {++numTOK; return DROP;}
(i|I)(n|N)(t|T)(o|O) {++numTOK; return INTO;} 
(v|V)(a|A)(l|L)(u|U)(e|E)(s|S) {++numTOK; return VALUES;}
(d|D)(e|E)(l|L)(e|E)(t|T)(e|E) {++numTOK; return DELETE;}
(u|U)(p|D)(d|D)(a|A)(t|T)(e|E) {++numTOK; return UPDATE;}
(f|F)(r|R)(o|O)(m|M) {++numTOK; return FROM;}
(s|S)(e|E)(l|L)(e|E)(c|C)(t|T) {++numTOK; return SELECT;}
(d|D)(a|A)(t|T)(a|A)(b|B)(a|A)(s|S)(e|E) {++numTOK;  return DATABASE; }
(v|V)(a|A)(r|R)(c|C)(h|H)(a|A)(r|R) {yylval.subtok=10; return  TP; }
(n|N)(u|U)(m|M)(b|B)(e|E)(r|R) {yylval.subtok=11; return  TP; }
(r|R)(e|E)(a|A)(l|L) { yylval.subtok=12; return TP; }
(i|I)(n|N)(t|T) { yylval.subtok=13; return TP; }
(d|D)(a|A)(t|T)(e|E) { yylval.subtok=14; return  TP;}
(p|P)(r|R)(i|I)(m|M)(a|A)(r|R)(y|Y)" "(k|K)(e|E)(y|Y) { yylval.subtok=21; return CONDITION;}
(u|U)(n|N)(i|I)(q|Q)(u|U)(e|E) { yylval.subtok=22; return CONDITION;}
(f|F)(o|O)(r|R)(i|I)(e|E)(g|G)(n|N)" "(k|K)(e|E)(y|Y) { yylval.subtok=23; return CONDITION;}
(a|A)(u|U)(t|T)(o|O)" "(i|I)(n|N)(c|C)(r|R)(e|E)(m|M)(e|E)(n|N)(t|T)(e|E)(d|D) { yylval.subtok=24; return CONDITION;}
(w|W)(h|H)(e|E)(r|R)(e|E) {++numTOK; return WHERE;}
(s|S)(e|E)(t|T) {++numTOK; return SET;}
(o|O)(r|R)(d|D)(e|E)(r|R) {++numTOK; return ORDER;}
(g|G)(r|R)(o|O)(u|U)(p|P) {++numTOK; return GROUP;}
(b|B)(y|Y) {++numTOK; return BY;}
"(" {numCAR++; return PARAO;}
")" { numCAR++; return PARAF;}
(a|A)(v|V)(g|G) {++numTOK;return AVG;}
(s|S)(u|U)(m|M) {++numTOK;return SUM;}
(c|C)(o|O)(u|U)(n|N)(t|T) {++numTOK;return COUNT;}
(l|L)(i|I)(m|M)(i|I)(t|T) {++numTOK;return LIMIT;}
(a|A)(n|N)(d|D) {++numTOK;return ANDOP;}
(o|O)(r|R) {++numTOK;return OR;}
"*" {++numCAR; return ETOILE;}
"'" {++numCAR; return POSTROFE;}
"=" {numOP++;return EQUALS;}
"<=>" {yylval.subtok = 2; return COMPARISON;}
">=" {yylval.subtok = 3; return COMPARISON;}
">" {yylval.subtok = 4; return COMPARISON;}
"<=" {yylval.subtok = 5; return COMPARISON;}
"<" {yylval.subtok = 6; return COMPARISON;}
"!=" {yylval.subtok = 7; return COMPARISON;}
"." {++numCAR;return POINT;}
-?[0-9]+ { ++numNUM; yylval.intval = atoi(yytext); return INTNUM; }
({LETTRE})({LETTRE}|\_)* {++numID;return ID;return numID;}
";" {numCAR++;return FIN;}
[ \t\n] {}
"," {numCAR++;return SEP;}
. {printf("Erreur lexicale %s a la ligne %d\n", yytext, yylineno);++errlx;}
%%
int yywrap()
{return 1;}










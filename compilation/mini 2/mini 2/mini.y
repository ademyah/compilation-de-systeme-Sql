%{
#include<stdio.h>
int yylex(void);
int yyerror(char *s);
%}
%union {
 int intval;
 int subtok;
}
%token QUIT; 
%token ID;
%token DELETE;
%token UPDATE;
%token LIMIT;
%token FROM;
%token ORDER;
%token BY;
%token USING;
%token WHERE;
%token FIN;
%token ANDOP;
%token OR;
%token SET;
%left <subtok> COMPARISON /* != < > <= >= <=> */;
%token POINT;
%token INT;
%token SEP;
%token GROUP;
%token INTNUM;
%token EQUALS;
%token POSTROFE;
%token ETOILE;
%token SELECT;
%token AVG;
%token SUM;
%token COUNT;
%token INSERT;
%token INTO;
%token CREATE;
%token TABLE;
%token DATABASE;
%token PARAO;
%token PARAF;
%token VALUES;
%token DROP;
%left <subtok> TP ;
%left <subtok> CONDITION ;

%%
D :   DELETE FROM S1 FIN { printf("Suppression de toutes les lignes de la table \n");};
    | DELETE FROM S1 WHERE C {printf("Suppression d'une ligne de la table \n");};
    | UPDATE S1 SET S WHERE C {printf("Mise a jour avec succes dune ligne \n");};
    | SELECT ETOILE FROM S1 FIN {printf("Affichage de toutes les lignes de la table \n");};
    | SELECT COL FROM S1 FIN {printf("Affichage des lignes choisi de la table \n");};
    | SELECT COL FROM S1 WHERE C {printf("Affichage des lignes choisi de la table avec Conditions\n");};
    | SELECT AVG PARAO S1 PARAF FROM S1 WHERE C {printf("AVG\n");};
    | SELECT SUM PARAO S1 PARAF FROM S1 WHERE C {printf("SUM\n");};
    | SELECT COUNT PARAO S1 PARAF FROM S1 WHERE C {printf("COUNT\n");};
    | CREATE TABLE S1 PARAO T {printf("TABLE EST CREER \n");};
    | CREATE DATABASE S1 FIN{printf("BASE DE DONNES EST CREER \n");};
    | INSERT INTO S1 VALUES PARAO K {printf("Insertion d'une ligne dans la table \n");};
    | DROP DATABASE S1 FIN {printf("Suppression de la Base de donnee \n");};
    | DROP TABLE S1 FIN {printf("Suppression de la Table \n");};

    | DELETE FROM S1 FIN D {printf("Suppression de toutes les lignes de la table \n");};
    | DELETE FROM S1 WHERE C D {printf("Suppression d'une ligne de la table \n");};
    | UPDATE S1 SET S WHERE C D {printf("Mise a jour avec succes dune ligne \n");};
    | SELECT ETOILE FROM S1 FIN D {printf("Affichage de toutes les lignes de la table \n");};
    | SELECT COL FROM S1 FIN D {printf("Affichage des lignes choisi de la table \n");};
    | SELECT COL FROM S1 WHERE C D{printf("Affichage des lignes choisi de la table avec Conditions\n");};
    | SELECT AVG PARAO S1 PARAF FROM S1 WHERE C D{printf("AVG\n");};
    | SELECT SUM PARAO S1 PARAF FROM S1 WHERE C D {printf("SUM\n");};
    | SELECT COUNT PARAO S1 PARAF FROM S1 WHERE C D {printf("COUNT\n");};
    | CREATE TABLE S1 PARAO T D {printf("TABLE EST CREER \n");};
    | CREATE DATABASE S1 D {printf("BASE DE DONNES EST CREER \n");};
    | INSERT INTO S1 VALUES PARAO K D {printf("Insertion d'une ligne dans la table \n");};
    | DROP DATABASE S1 FIN D {printf("Suppression de la Base de donnee \n");};
    | DROP TABLE S1 FIN D {printf("Suppression de la Table \n");};

   
K :  S1 PARAF FIN
    |S1 SEP K
    |SEP S1 SEP K
    |INTNUM PARAF FIN
    |SEP INTNUM SEP K
    |INTNUM SEP K
;

T :   S1 TP PARAF FIN
    | S1 TP SEP T
    | SEP S1 TP COND SEP T
    | S1 TP COND SEP T
;
COND : CONDITION | CONDITION COND;   

S1 : ID | ID S1 ; 

COL : S1 SEP COL
     |S1 
;

S :   S1 EQUALS S1 
    | S1 EQUALS INTNUM 
    | S1 EQUALS INTNUM SEP S
    | S1 EQUALS S1 SEP S
    | SEP S1 EQUALS INTNUM
    | SEP S1 EQUALS S1
;
C :   S1 COMPARISON INTNUM FIN
    | S1 COMPARISON S1 FIN
    | S1 COMPARISON S1 ANDOP C 
    | S1 COMPARISON S1 OR C
    | S1 COMPARISON INTNUM ANDOP C 
    | S1 COMPARISON INTNUM OR C
    | S1 EQUALS INTNUM FIN
    | S1 EQUALS S1 FIN
    | S1 EQUALS S1 ANDOP C 
    | S1 EQUALS S1 OR C
    | S1 EQUALS INTNUM ANDOP C 
    | S1 EQUALS INTNUM OR C
;
%%
#include "lex.yy.c"
int yyerror(char *s){printf (" ERREUR syntaxique a la ligne  %d \n  ", yylineno  );return (0);}
void main(){
    printf(" debut de l'analye lexicale \n ");
    if(!yyparse()) // lance l'analyse syntaxique 
    printf("FIN de L'analyse synaxique");getchar();
    }



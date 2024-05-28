/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_MINI_TAB_H_INCLUDED
# define YY_YY_MINI_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    QUIT = 258,                    /* QUIT  */
    ID = 259,                      /* ID  */
    DELETE = 260,                  /* DELETE  */
    UPDATE = 261,                  /* UPDATE  */
    LIMIT = 262,                   /* LIMIT  */
    FROM = 263,                    /* FROM  */
    ORDER = 264,                   /* ORDER  */
    BY = 265,                      /* BY  */
    USING = 266,                   /* USING  */
    WHERE = 267,                   /* WHERE  */
    FIN = 268,                     /* FIN  */
    ANDOP = 269,                   /* ANDOP  */
    OR = 270,                      /* OR  */
    SET = 271,                     /* SET  */
    COMPARISON = 272,              /* COMPARISON  */
    POINT = 273,                   /* POINT  */
    INT = 274,                     /* INT  */
    SEP = 275,                     /* SEP  */
    GROUP = 276,                   /* GROUP  */
    INTNUM = 277,                  /* INTNUM  */
    EQUALS = 278,                  /* EQUALS  */
    POSTROFE = 279,                /* POSTROFE  */
    ETOILE = 280,                  /* ETOILE  */
    SELECT = 281,                  /* SELECT  */
    AVG = 282,                     /* AVG  */
    SUM = 283,                     /* SUM  */
    COUNT = 284,                   /* COUNT  */
    INSERT = 285,                  /* INSERT  */
    INTO = 286,                    /* INTO  */
    CREATE = 287,                  /* CREATE  */
    TABLE = 288,                   /* TABLE  */
    DATABASE = 289,                /* DATABASE  */
    PARAO = 290,                   /* PARAO  */
    PARAF = 291,                   /* PARAF  */
    VALUES = 292,                  /* VALUES  */
    DROP = 293,                    /* DROP  */
    TP = 294,                      /* TP  */
    CONDITION = 295                /* CONDITION  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 6 "mini.y"

 int intval;
 int subtok;

#line 109 "mini.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MINI_TAB_H_INCLUDED  */

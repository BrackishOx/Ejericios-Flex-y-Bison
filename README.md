# Flex & Bison - Capítulo 1

Desarrollo de los ejemplos y ejercicios del capítulo 1
del libro "Flex & Bison" de John Levine.

##  Estructura

- ejemplos -> Ejemplos del libro
- ejercicios -> Ejercicios resueltos

## Requisitos

- flex
- bison
- gcc
- Linux / WSL

##  Compilación general

```bash
bison -d archivo.y
flex archivo.l
gcc archivo.tab.c lex.yy.c -o programa -lfl
ejemplo -
 bison -d ej6.y
flex ej6.l
gcc ej6.tab.c lex.yy.c -o ej6 -lfl

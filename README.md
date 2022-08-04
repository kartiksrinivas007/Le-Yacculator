### Parser
This uses a simple non-Ambiguous CFG for Mathematical Expressions, using exponential notation is also supported.
### Execution

```terminal
yacc -d grammar.y
lex lexical.l
gcc lex.yy.c y.tab.c -o calc
./calc
<input expression>
<Ctrl + D>
```
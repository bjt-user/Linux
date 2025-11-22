## general info

Function in `eval.c`.

```
/*
* Handle top level expression:
*      expr2 ? expr1 : expr1
*      expr2 ?? expr1
*
* "arg" must point to the first non-white of the expression.
* "arg" is advanced to just after the recognized expression.
*
* Return OK or FAIL.
*/
    int
eval1(char_u **arg, typval_T *rettv, evalarg_T *evalarg)
```

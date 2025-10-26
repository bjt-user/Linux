#### general info

```
File eval.c:
7643:	void echo_one(typval_T *, int, int *, int *);
```

It makes repeated calls to `msg_outtrans_len_attr` in a for loop.

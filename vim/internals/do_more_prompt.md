## general info

Function in `message.c`.

```
/*
 * Show the more-prompt and handle the user response.
 * This takes care of scrolling back and displaying previously displayed text.
 * When at hit-enter prompt "typed_char" is the already typed character,
 * otherwise it's NUL.
 * Returns TRUE when jumping ahead to "confirm_msg_tail".
 */
    static int
do_more_prompt(int typed_char)
```

#### directly called by

```
0 message.c wait_return      1364 do_more_prompt(c);
1 message.c msg_puts_display 2590 if (do_more_prompt(NUL))
2 message.c msg_puts_display 2593 (void )do_more_prompt(NUL);
3 message.c show_sb_text     3021 do_more_prompt('G');
```

Good article with some interesting commands:\
https://www.linusakesson.net/programming/tty/

#### minimal version of the tty command

A minimal version of David MacKenzie's `tty` program.\
(Part of coreutils and prints the terminal name.)
```
#include <stdio.h>
#include <unistd.h>

	int
main (int argc, char **argv)
{
	char const *tty = ttyname (STDIN_FILENO);

	if (!tty)
	{
		printf("not a tty\n");
	}

	puts (tty);

	return 0;
}
```

Example output:
```
/dev/pts/0
```

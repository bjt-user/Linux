## general info

The version for `vim --version` is printed after:
```
command_line_scan(&params);
```

## global vars

- `longVersion`

## file scoped vars

`included_patches` in `version.c`

```
static int included_patches[] =
 736 {   /* Add new patch number below this line */
 737 /**/
 738     2125,
 739 /**/
 740     2124,
```

## macros

In `version.h` are many macros.

```
// Values that change for a new release.
#define VIM_VERSION_MAJOR               9
#define VIM_VERSION_MINOR               1
#define VIM_VERSION_BUILD               285
#define VIM_VERSION_BUILD_BCD           0x11d
#define VIM_VERSION_DATE_ONLY           "2024 Jan 02"
```

## call graph

command_line_scan -> list_version -> init_longVersion

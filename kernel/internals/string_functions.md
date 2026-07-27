## interesting files

`include/linux/string.h`

The function comments look nice.

## interesting functions

```
static __always_inline size_t str_has_prefix(const char *str, const char *prefix)
{                                                                               
        size_t len = strlen(prefix);                                            
        return strncmp(str, prefix, len) == 0 ? len : 0;                        
}
```

```
static inline bool strstarts(const char *str, const char *prefix)
{
        return strncmp(str, prefix, strlen(prefix)) == 0;
}
```

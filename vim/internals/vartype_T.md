## general info

Type of vim variables.

Contained in `typval_S`.

```
typedef enum
{
    VAR_UNKNOWN = 0,    // not set, any type or "void" allowed
    VAR_ANY,            // used for "any" type
    VAR_VOID,           // no value (function not returning anything)
    VAR_BOOL,           // "v_number" is used: VVAL_TRUE or VVAL_FALSE
    VAR_SPECIAL,        // "v_number" is used: VVAL_NULL or VVAL_NONE
    VAR_NUMBER,         // "v_number" is used
    VAR_FLOAT,          // "v_float" is used
    VAR_STRING,         // "v_string" is used
    VAR_BLOB,           // "v_blob" is used
    VAR_FUNC,           // "v_string" is function name
    VAR_PARTIAL,        // "v_partial" is used
    VAR_LIST,           // "v_list" is used
    VAR_DICT,           // "v_dict" is used
    VAR_JOB,            // "v_job" is used
    VAR_CHANNEL,        // "v_channel" is used
    VAR_INSTR,          // "v_instr" is used
    VAR_CLASS,          // "v_class" is used (also used for interface)
    VAR_OBJECT,         // "v_object" is used
    VAR_TYPEALIAS,      // "v_typealias" is used
    VAR_TUPLE           // "v_tuple" is used
} vartype_T;
```

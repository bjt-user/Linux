```
iconv({string}, {from}, {to})                           iconv()
                The result is a String, which is the text {string} converted
                from encoding {from} to encoding {to}.
                When the conversion completely fails an empty string is               
                returned.  When some characters could not be converted they 
                are replaced with "?".
                The encoding names are whatever the iconv() library function
                can accept, see ":!man 3 iconv".
                Most conversions require Vim to be compiled with the +iconv
                feature.  Otherwise only UTF-8 to latin1 conversion and back
                can be done.
                This can be used to display messages with special characters,
                no matter what 'encoding' is set to.  Write the message in
                UTF-8 and use:
                        echo iconv(utf8_str, "utf-8", &enc)
                Note that Vim uses UTF-8 for all Unicode encodings, conversion
                from/to UCS-2 is automatically changed to use UTF-8.  You
                cannot use UCS-2 in a string anyway, because of the NUL bytes.

                Can also be used as a method:
                        GetText()->iconv('latin1', 'utf-8')

                Return type: String
```

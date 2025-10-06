#### json_decode

Input: string \
Ouput: any (depending on the input)

You need to use doublequotes for strings inside json:
```
vim9script

var my_json_str = "{\"foo\":\"bar\"}"

echo my_json_str

var my_json_dict = json_decode(my_json_str)

echo my_json_dict
echo typename(my_json_dict)
```
Output:
```
{"foo":"bar"}
{'foo': 'bar'}
dict<string>
```

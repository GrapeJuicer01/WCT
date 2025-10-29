编码或者开发约定（临时稿）
---
last update：20190315 13:14


一般约定
====
1. 公共目录(src/comm/)删除和修改文件名一定要在群里周知；
2. 每次提交文件，一定要提供修改说明，尽量少的小的提交，这样说明会更准确。
3. 尽量每天提交文件，暂时这么约定吧？

编码约定
====
1. 要求"=","+","=="等操作符号的两边必须要各加空一格， 比如 "a=b" 要写成 "a = b"
2. '#'号后面需要增加一个空格.
3. 推荐使用 "with"语句以管理文件,或者在文件和sockets结束时, 显式的关闭它.
4. 变量尽量都进行初始化，初始化统一放在函数或者类的开始.
5. 每个库导入应该独占一行, 不要一行导入多个库.   
推荐：

```angular2html
import re
import os
```
反例：

```
import re,os
```
但是可以这样：

```angularjs
from subprocess import Popen, PIPE
```


命名约定（参考PyCharm）
====
1. Class的命名需要遵循搜首字母大写的风格
2. 尽量少使用Python关键字作为变量名，比如str
推荐：
```angular2html
def judgeExistOperator(in_str, operator):
```
反例：

```
def judgeExistOperator(str, operator):
```
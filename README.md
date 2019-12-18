
# Shell 脚本的入门学习

## 一、基本介绍：

Shell Script是利用shell的功能所写的一个程序，这个程序是使用纯文本文件，将一些shell的语法与指令写在里面，然后用正规表示法，管道命令以及数据流重导向等功能，以达到我们所想要的处理目的。

## 二、shell脚本的创建：

打开文本编辑器(可以使用 vi/vim 命令来创建文件)，新建一个文件 first.sh，扩展名为 sh（sh代表shell），扩展名并不影响脚本执行，见名知意就好，如果你用 php 写 shell 脚本，扩展名就用 php 好了。
创建方法：终端输入 touch first.sh   或  vim first.sh 即可创建。

```
#!/bin/bash
echo "Hello World !"
```
## 三、运行 Shell 脚本的两种方法：

### 1、作为可执行程序

将上面的代码保存为 first.sh，并 cd 到相应目录：
```
chmod +x ./first.sh  #使脚本具有执行权限
./first.sh  #执行脚本
```
### 2、作为解释器参数

这种运行方式是，直接运行解释器，其参数就是 shell 脚本的文件名，如：
```
sh first.sh
```
##  四、详细介绍

### Shell 变量

#### 1、变量名的命名须遵循如下规则：

- 命名只能使用英文字母，数字和下划线，首个字符不能以数字开头。
- 中间不能有空格，可以使用下划线（_）。
- 不能使用标点符号。
- 不能使用bash里的关键字（可用help命令查看保留关键字）。

#### 2、变量的使用：

使用一个定义过的变量，只要在变量名前面加美元符号即可，而且已定义的变量，可以被重新定义，例如：
```
your_name="tom"
echo $your_name
your_name="alibaba"
echo $your_name
```

#### 3、变量类型：
运行shell时，会同时存在三种变量：
##### 1） 局部变量
局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
##### 2） 环境变量
所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
##### 3） shell变量
shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行。

### Shell 字符串

字符串是shell编程中最常用最有用的数据类型（除了数字和字符串，也没啥其它类型好用了），字符串可以用单引号，也可以用双引号，也可以不用引号。单双引号的区别跟PHP类似。

#### 1、单引号
```
str='this is a shell script'
```
##### 单引号字符串的限制：
- 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
- 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

#### 2、双引号
```
your_name='tom'
str="Hello, I know you are \"$your_name\"! \n"
echo -e $str
```
输出结果为：
```
Hello, I know you are "tom"! 
```
##### 双引号的优点：
- 双引号里可以有变量；
- 双引号里可以出现转义字符。

#### 3、拼接字符串
```
your_name="tom"
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1
```
输出结果为：
```
hello, tom ! hello, tom ! 
```
#### 4、获取字符串长度
```
string="nihao"
echo "nihao的长度为：${#string}"
```
输出结果为：
```
nihao的长度为：5 
```
#### 5、提取子字符串
以下实例从字符串第 2 个字符开始截取 6 个字符：
```
string="this is a shell script"
echo ${string:1:6}
```
输出结果为：
```
his is
```

### Shell 数组

#### 1、定义数组
数组中可以存放多个值。Bash Shell 只支持一维数组（不支持多维数组），初始化时不需要定义数组大小（与 PHP 类似）。与大部分编程语言类似，数组元素的下标由0开始。

Shell 数组用括号来表示，元素用"空格"符号分割开，语法格式如下：
```
array_name=(value0 value1 value2 value3)
```
或者
```
array_name=(
value0
value1
value2
value3
)
```
还可以单独定义数组的各个分量：
```
array_name[0]=value0
array_name[1]=value1
array_name[n]=valuen
```

#### 2、读取数组
读取数组元素值的一般格式是：
```
value=${array_name[n]}
```
例如：
```
my_array=(A B "C" D)

echo "第一个元素为: ${my_array[0]}"
echo "第二个元素为: ${my_array[1]}"
echo "第三个元素为: ${my_array[2]}"
echo "第四个元素为: ${my_array[3]}"
```
输出结果为：
```
第一个元素为: A
第二个元素为: B
第三个元素为: C
第四个元素为: D
```
#### 3、获取数组中的所有元素

使用 @ 符号可以获取数组中的所有元素，例如：
```
my_array=(A B "C" D)

echo "元素总数为: ${my_array[@]}"
echo "元素总数为: ${my_array[*]}"
```
输出结果为：
```
元素总数为: A B C D
元素总数为: A B C D
```
#### 4、获取数组的长度

获取数组长度的方法与获取字符串长度的方法相同：
```
# 取得数组元素的个数
length=${#array_name[@]}
# 或者
length=${#array_name[*]}
# 取得数组单个元素的长度
lengthn=${#array_name[n]}
```
例如：
```
my_array=(A B "C" D)

echo "元素个数为: ${#my_array[@]}"
echo "元素个数为: ${#my_array[*]}"
echo "第三个元素长度为: ${#my_array[2]}"
```
输出结果为：
```
元素个数为: 4
元素个数为: 4
第三个元素长度为: 1
```

### Shell 注释

#### 1、单行注释
以 # 开头的行就是注释，会被解释器忽略。
```
#echo "nihao"
```
#### 2、多行注释
```
:<<EOF
echo "nihao"
echo "nihao"
echo "nihao""
EOF
```
EOF 也可以使用其他符号:
```
:<<!
echo "nihao"
echo "nihao"
echo "nihao""
!
```

### Shell 传递参数

我们可以在执行 Shell 脚本时，向脚本传递参数，脚本内获取参数的格式为：$n。n 代表一个数字，1 为执行脚本的第一个参数，2 为执行脚本的第二个参数，以此类推。注意：$0 为执行的文件名。例如：
```
function passparam()
{
    echo "Shell 传递参数实例！";
    echo "执行的文件名：$0";
    echo "第一个参数为：$1";
    echo "第二个参数为：$2";
    echo "第三个参数为：$3";
}

passparam a b c
```
输出结果为：
```
Shell 传递参数实例！
执行的文件名：first.sh
第一个参数为：a
第二个参数为：b
第三个参数为：c
```

#### 备注：几个用来处理参数的特殊字符：

1）$#：传递到脚本的参数个数。

2）$*：以一个单字符串显示所有向脚本传递的参数。
如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。

3）$$：脚本运行的当前进程ID号。

4）$!：后台运行的最后一个进程的ID号。

5）$@：	与$*相同，但是使用时加引号，并在引号中返回每个参数。
如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。

6）$-：	显示Shell使用的当前选项，与set命令功能相同。

7）$?：显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。

### Shell echo命令

#### 1、显示变量

read 命令从标准输入中读取一行,并把输入行的每个字段的值指定给 shell 变量。例如：
```
echo "输入你的姓名："
read name
echo "my name is $name"
```
运行得到：
```
输入你的姓名：
```
输入内容：
```
输入你的姓名：
tom
```
得到结果：
```
输入你的姓名：
tom
my name is tom
```


### Shell 基本运算符

Shell 和其他编程语言一样，支持多种运算符，包括：算数运算符、关系运算符、布尔运算符、字符串运算符和文件测试运算符。

#### 注意：

1）表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2。

2）完整的表达式要被 ``` ` ` ``` 包含，注意这个字符不是常用的单引号，在 Esc 键下边。

#### 1、算术运算符

1)+ 加法

2)- 减法

3)* 乘法（乘号前边必须加反斜杠才能实现乘法运算）

4)/ 除法

5)% 取余

6)= 赋值

7)== 相等。用于比较两个数字，相同则返回 true。

8)!= 不相等。用于比较两个数字，不相同则返回 true。

##### 注意：条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]。

举例：
```
a=2
b=4
echo "a=2 b=4"

#加法
val=`expr $a + $b`
echo "a + b = $val"

val=`expr $a - $b`
echo "a - b = $val"

val=`expr $a \* $b`
echo "a * b = $val"

val=`expr $a / $b`
echo "a / b = $val"

val=`expr $b % $a`
echo "b % a = $val"

if [ $a == $b ]
then
   echo "a 等于 b"
else
   echo "a 不等于 b"
fi
if [ $a != $b ]
then
   echo "a_ 不等于 b_"
else
   echo "a_ 等于 b_"
fi
```
输出结果为：
```
a=2 b=4
a + b = 6
a - b = -2
a * b = 8
a / b = 0
b % a = 0
a 不等于 b
a_ 不等于 b_
```

#### 2、关系运算符

关系运算符只支持数字，不支持字符串，除非字符串的值是数字。

1)-eq 检测两个数是否相等，相等返回 true。

2)-ne 检测两个数是否不相等，不相等返回 true。

3)-gt 检测左边的数是否大于右边的，如果是，则返回 true。

4)-lt 检测左边的数是否小于右边的，如果是，则返回 true。

5)-ge 检测左边的数是否大于等于右边的，如果是，则返回 true。

6)-le 检测左边的数是否小于等于右边的，如果是，则返回 true。

举例：
```
a=10
b=20

if [ $a -eq $b ]
then
echo "$a -eq $b : a 等于 b"
else
echo "$a -eq $b: a 不等于 b"
fi
if [ $a -ne $b ]
then
echo "$a -ne $b: a 不等于 b"
else
echo "$a -ne $b : a 等于 b"
fi
if [ $a -gt $b ]
then
echo "$a -gt $b: a 大于 b"
else
echo "$a -gt $b: a 不大于 b"
fi
if [ $a -lt $b ]
then
echo "$a -lt $b: a 小于 b"
else
echo "$a -lt $b: a 不小于 b"
fi
if [ $a -ge $b ]
then
echo "$a -ge $b: a 大于或等于 b"
else
echo "$a -ge $b: a 小于 b"
fi
if [ $a -le $b ]
then
echo "$a -le $b: a 小于或等于 b"
else
echo "$a -le $b: a 大于 b"
fi
```
输出结果为：
```
10 -eq 20: a 不等于 b
10 -ne 20: a 不等于 b
10 -gt 20: a 不大于 b
10 -lt 20: a 小于 b
10 -ge 20: a 小于 b
10 -le 20: a 小于或等于 b
```

#### 3、布尔运算符

1)! 非运算，表达式为 true 则返回 false，否则返回 true。

2)-o 或运算，有一个表达式为 true 则返回 true。

3)-a 与运算，两个表达式都为 true 才返回 true。

举例：
```
a=10
b=20

if [ $a != $b ]
then
echo "$a != $b : a 不等于 b"
else
echo "$a == $b: a 等于 b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi
```
输出结果为：
```
10 != 20 : a 不等于 b
10 小于 100 且 20 大于 15 : 返回 true
10 小于 100 或 20 大于 100 : 返回 true
10 小于 5 或 20 大于 100 : 返回 false
```

#### 4、逻辑运算符

1)&& 逻辑的AND

2)|| 逻辑的OR

举例：
```
a=10
b=20

if [[ $a -lt 100 && $b -gt 100 ]]
then
echo "返回 true"
else
echo "返回 false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
echo "返回 true"
else
echo "返回 false"
fi
```

输出结果为：
```
返回 false
返回 true
```

#### 5、字符串运算符

1)= 检测两个字符串是否相等，相等返回 true。

2)!= 检测两个字符串是否相等，不相等返回 true。

3)-z 检测字符串长度是否为0，为0返回 true。

4)-n 检测字符串长度是否为0，不为0返回 true。

5)$ 检测字符串是否为空，不为空返回 true。

举例：
```
a="abc"
b="efg"

if [ $a = $b ]
then
echo "$a = $b : a 等于 b"
else
echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
echo "$a != $b : a 不等于 b"
else
echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
echo "-z $a : 字符串长度为 0"
else
echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
echo "-n $a : 字符串长度不为 0"
else
echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
echo "$a : 字符串不为空"
else
echo "$a : 字符串为空"
fi
```

输出结果为：
```
abc = efg: a 不等于 b
abc != efg : a 不等于 b
-z abc : 字符串长度不为 0
-n abc : 字符串长度不为 0
abc : 字符串不为空
```

#### 6、文件测试运算符

文件测试运算符用于检测 Unix 文件的各种属性。
属性检测描述如下：

1)-b file 检测文件是否是块设备文件，如果是，则返回 true。

2)-c file 检测文件是否是字符设备文件，如果是，则返回 true。

3)-d file 检测文件是否是目录，如果是，则返回 true。

4)-f file 检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。

5)-g file 检测文件是否设置了 SGID 位，如果是，则返回 true

6)-k file 检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。

7)-p file 检测文件是否是有名管道，如果是，则返回 true。

8)-u file 检测文件是否设置了 SUID 位，如果是，则返回 true。

9)-r file 检测文件是否可读，如果是，则返回 true。

10)-w file 检测文件是否可写，如果是，则返回 true。

11)-x file 检测文件是否可执行，如果是，则返回 true。

12)-s file 检测文件是否为空（文件大小是否大于0），不为空返回 true。

13)-e file 检测文件（包括目录）是否存在，如果是，则返回 true。

举例：

##### 备注：file="/Users/wangxueqi/Desktop/first.sh"为存放在桌面的当前脚本。
```
file="/Users/wangxueqi/Desktop/first.sh"
if [ -r $file ]
then
echo "文件可读"
else
echo "文件不可读"
fi
if [ -w $file ]
then
echo "文件可写"
else
echo "文件不可写"
fi
if [ -x $file ]
then
echo "文件可执行"
else
echo "文件不可执行"
fi
if [ -f $file ]
then
echo "文件为普通文件"
else
echo "文件为特殊文件"
fi
if [ -d $file ]
then
echo "文件是个目录"
else
echo "文件不是个目录"
fi
if [ -s $file ]
then
echo "文件不为空"
else
echo "文件为空"
fi
if [ -e $file ]
then
echo "文件存在"
else
echo "文件不存在"
fi
```

输出结果为：
```
文件可读
文件可写
文件可执行
文件为普通文件
文件不是个目录
文件不为空
文件存
```

### Shell 流程控制

和Java、PHP等语言不一样，sh的流程控制不可为空

#### 1、if 语句语法格式：
```
if condition
then
    command1 
    command2
    ...
    commandN 
fi
```
例如：
```
a=10
b=20
if [ $a == $b ]
then
echo "a 不等于 b"
fi
```
#### 2、if else 语法格式：
```
if condition
then
    command1 
    command2
    ...
    commandN
else
    command
fi
```
例如：
```
a=10
b=20
if [ $a == $b ]
then
echo "a 等于 b"
else
echo "a 不等于 b"
fi
```
#### 3、if else-if else 语法格式：
```
if condition1
then
    command1
elif condition2 
then 
    command2
else
    commandN
fi
```
例如：
```
a=10
b=20
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi
```
#### 4、for 循环一般格式为：
```
for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done
```
写成一行：
```
for var in item1 item2 ... itemN; do command1; command2… done;
```
例如：
```
for value in 1 2 3 4 5
do
    echo "The value is: $value"
done
```
输出结果为：
```
The value is: 1
The value is: 2
The value is: 3
The value is: 4
The value is: 5
```
#### 5、while 语句格式为：
```
while condition
do
    command
done
```
例如：
```
int=1
while(( $int<=5 ))
do
    echo "while 语句输出：$int"
    let "int++"
done
```
输出结果为：
```
while 语句输出：1
while 语句输出：2
while 语句输出：3
while 语句输出：4
while 语句输出：5
```
#### 6、case语句格式：
```
case 值 in
模式1)
    command1
    command2
    ...
    commandN
    ;;
模式2）
    command1
    command2
    ...
    commandN
    ;;
esac
```
case工作方式如上所示。取值后面必须为单词in，每一模式必须以右括号结束。取值可以为变量或常数。匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。

取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。

例如：
```
echo '输入 1 到 4 之间的数字:'
echo '你输入的数字为:'
read aNum
case $aNum in
    1)  echo '你选择了 1'
    ;;
    2)  echo '你选择了 2'
    ;;
    3)  echo '你选择了 3'
    ;;
    4)  echo '你选择了 4'
    ;;
    *)  echo '你没有输入 1 到 4 之间的数字'
    ;;
esac
```
输出结果为：
```
输入 1 到 4 之间的数字:
你输入的数字为:
3
你选择了 3
```
#### 7、跳出循环-break命令：

break命令允许跳出所有循环（终止执行后面的所有循环）。

下面的例子中，脚本进入死循环直至用户输入数字大于5。要跳出这个循环，返回到shell提示符下，需要使用break命令。

例如：
```
while :
do
    echo -n "输入 1 到 5 之间的数字:"
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
            break
        ;;
    esac
done
```
输出结果为：
```
输入 1 到 5 之间的数字:3
你输入的数字为 3!
输入 1 到 5 之间的数字:7
你输入的数字不是 1 到 5 之间的! 游戏结束
```
#### 8、跳出循环-continue命令：

continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。

对上面的例子进行修改：
```
while :
do
    echo -n "输入 1 到 5 之间的数字: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的!"
            continue
            echo "游戏结束"
        ;;
    esac
done
```
运行代码发现，当输入大于5的数字时，该例中的循环不会结束，语句 echo "游戏结束" 永远不会被执行。

#### 9、esac

case的语法和C family语言差别很大，它需要一个esac（就是case反过来）作为结束标记，每个case分支用右圆括号，用两个分号表示break。

### Shell 函数

shell中函数的定义格式如下：
```
[ function ] funname [()]
{
    action;
    [return int;]
}
```
#### 注意：

1、可以带function fun() 定义，也可以直接fun() 定义,不带任何参数。

2、参数返回，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n(0-255）。

例如：
```
demoFun(){
    echo "这是我的第一个 shell 函数!"
}
echo "-----函数开始执行-----"
demoFun
echo "-----函数执行完毕-----"
```
输出结果为：
```
-----函数开始执行-----
这是我的第一个 shell 函数!
-----函数执行完毕-----
```
下面定义一个带有return语句的函数：
```
funWithReturn(){
    echo "这个函数会对输入的两个数字进行相加运算..."
    echo "输入第一个数字: "
    read aNum
    echo "输入第二个数字: "
    read anotherNum
    echo "两个数字分别为 $aNum 和 $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn
echo "输入的两个数字之和为 $? !"
```
输出结果为：
```
这个函数会对输入的两个数字进行相加运算...
输入第一个数字: 
1
输入第二个数字: 
2
两个数字分别为 1 和 2 !
输入的两个数字之和为 3 !
```
函数返回值在调用该函数后通过 $? 来获得。

##### 注意：所有函数在使用前必须定义。这意味着必须将函数放在脚本开始部分，直至shell解释器首次发现它时，才可以使用。调用函数仅使用其函数名即可。

### 函数参数

在Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数，$2表示第二个参数...

带参数的函数示例：
```
funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73
```
输出结果为：
```
第一个参数为 1 !
第二个参数为 2 !
第十个参数为 10 !
第十个参数为 34 !
第十一个参数为 73 !
参数总数有 11 个!
作为一个字符串输出所有参数 1 2 3 4 5 6 7 8 9 34 73 !
```
注意：$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。

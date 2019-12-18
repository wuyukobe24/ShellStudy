#!/bin/bash
#简单输出
echo "***********简单输出***********"
echo "Hello World !"

your_name="tom"
echo $your_name
your_name="alibaba"
echo $your_name

#字符串
echo "***********字符串***********"
your_name='tom'
str="Hello, I know you are \"$your_name\"! \n"
echo $str

#拼接字符串
echo "***********拼接字符串***********"
your_name="tom"
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1

#获取字符串长度
echo "***********获取字符串长度***********"
string="nihao"
echo "nihao的长度为：${#string}"

#提取子字符串
echo "***********提取子字符串***********"
string="this is a shell script"
echo ${string:1:6}

#数组
echo "***********数组***********"
my_array=(A B "C" D)

echo "第一个元素为: ${my_array[0]}"
echo "第二个元素为: ${my_array[1]}"
echo "第三个元素为: ${my_array[2]}"
echo "第四个元素为: ${my_array[3]}"
echo "元素总数为: ${my_array[@]}"
echo "元素总数为: ${my_array[*]}"
echo "元素个数为: ${#my_array[@]}"
echo "元素个数为: ${#my_array[*]}"
echo "第三个元素长度为: ${#my_array[2]}"


#注释
echo "***********单行注释***********"
#echo "nihao"
echo "***********多行注释***********"
:<<EOF
echo "nihao"
echo "nihao"
echo "nihao""
EOF
#或者
:<<!
echo "nihao"
echo "nihao"
echo "nihao""
!

#传递参数
echo "***********传递参数***********"
function passparam()
{
    echo "Shell 传递参数实例！";
    echo "执行的文件名：$0";
    echo "第一个参数为：$1";
    echo "第二个参数为：$2";
    echo "第三个参数为：$3";
}

passparam a b c

#获取两数之和
echo "***********获取两数之和***********"
val=`expr 2 + 2`
echo "2 + 2 两数之和为 : $val"

#算术运算符
echo "***********算术运算符***********"
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

#关系运算符
echo "***********关系运算符***********"
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

#布尔运算符
echo "***********布尔运算符***********"
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

#逻辑运算符
echo "***********逻辑运算符***********"
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

#字符串运算符
echo "***********字符串运算符***********"
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

#文件测试运算符
echo "***********文件测试运算符***********"

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

#echo '按下 <CTRL-D> 退出'
#echo -n '输入你最喜欢的网站名: '
#while read FILM
#do
#echo "是的！$FILM 是一个好网站"
#done

#if else-if else 语句
echo "***********if else-if else 语句***********"
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

#for 循环
echo "***********for 循环***********"
for value in 1 2 3 4 5
do
    echo "The value is: $value"
done

#while 语句
echo "***********while 语句***********"
int=1
while(( $int<=5 ))
do
    echo "while 语句输出：$int"
    let "int++"
done

#read 命令
echo "***********read命令***********"
echo "输入你的姓名："
read name
echo "my name is $name"

#函数
echo "***********函数***********"
demoFun(){
    echo "这是我的第一个 shell 函数!"
}
echo "-----函数开始执行-----"
demoFun
echo "-----函数执行完毕-----"

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

#传参函数
echo "***********传参函数***********"
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

#当前时间
echo "***********当前时间***********"
echo `date`



---
title: Lua Quick Guide - tutorialspoint
date: 2022-09-09T23:38:38+09:00
lastmod: 2022-09-09T23:39:19+09:00
tags: ["lua", "guide"]
categories: ["programming"]
---

## Basic

* Tokens in Lua
```lua
io.write("Hello world, from ",_VERSION,"!\n")
```

* Comments
```
-- simple comment
--[[ 
block comments
--]]
```

* identifiers - 변수명, 함수명 등 규칙
```lua
mohd zera abc move_name a_123 myname50 _temp a23b9 retVal
```

* Keywords - 예약어
```lua
and break do else elseif end false for function if in local
nil not or repeat return then true until while
```

## Lua - Variables

* Global variables, Local bariables, Table fields
* Variable Example
```lua
-- Variable definition:
local a, b  --local
g,l = 20,30 --global

-- Initialization
a = 10
b = 30

print("value of a:", a)
print("value of b:", b)

-- Swapping of variables
b, a = a, b

print("value of a:", a)
print("value of b:", b)

f = 70.0/3.0
print("value of f", f)
```

* Data Types
`nil` - no data
`boolean` - ture, false
`number` - read numbers
`string` - array of characters
`function` - method that is written in C or Lua
`userdata` - C data
`thread` - independent threads of execution
`table` - arrays, symbol tables, sets, records, graphs, trees, etc

* Type Function
```lua
print(type("What is my type"))  -- string
t = 10
print(type(5.8*t))              -- number
print(type(print))              -- function
print(type(nill))               -- nil
print(type(type(ABC)))          -- string   
```

## Lua - Operators

* Arithmetic Operators (^는 A^2를 의미)
```lua
+ - * / % ^ -
```

* Relational Operators (`~=`은 `!=`을 의미)
```lua
== ~= > < >= <=
```

* Logical Operators
```lua
and or not
```
* Misc Operators
    - `..` - a="Hello", b="World"일때 a..b --> "Hello World"
    - `#` - string, table의 요소개수를 반환: #"Hello" --> 5

## Lua - Loop

* `while loop` - wile문
* `for loop` - for문
* `repeat...until loop` - repeat문
* `nested loops` - 중첩된 반복문 
* Loop Control
* `break` - 빠져 나오기 : `continue`,`goto`가 5.1버전에는 없다.
  
* The Infinite Loop
```lua
while(true)
do
    print("This loop will run forever.")
end 
```

## Lua - Decision Making

* `if statement`
* `if...else statement`
* `nested if...else statement`

## Lua - Function

* function example
```lua
--[[ function returning the max between two numbers --]]
function max(num1, num2)

   if (num1 > num2) then
      result = num1;
   else
      result = num2;
   end

   return result; 
end
-- calling a function
print("The maximum of the two numbers is ",max(10,4))  --> 10
print("The maximum of the two numbers is ",max(5,6))   --> 6
```

* Assigning and Passing functions
```lua
myprint = function(param)
   print("This is my print function -   ##",param,"##")
end

function add(num1,num2,functionPrint) --number,number,function
   result = num1 + num2
   functionPrint(result)
end

myprint(10)
add(2,5,myprint)
```

* Function with Variable Argument
```lua
function average(...)  -- Argument수를 정해 놓지 않고 정의
   result = 0
   local arg = {...}
   for i,v in ipairs(arg) do  -- ipairs는 arg의 Index와 value를 넘김
      result = result + v
   end
   return result/#arg  -- result 나누기 #arg(arg수)
end

print("The average is",average(10,5,3,4,5,6)) -- 필요한 만큼 넣어 줌
```

## Lua - Strings

* example
```lua
string1 = "Lua" --single quotes
print("\"String 1 is\"", string1)

string2 = 'Tutorial' --double quotes
print("String 2 is", string2)

string3 = [["Lua Tutorial"]] --[[and]] : 여러 줄의 문자열을 사용할 때
print("String 3 is", string3)
```

* Escape Sequence
```
\a \b \f \n \r \t \v \\ \" \' \[ \]
```

* String Manipulation
    - `string.upper(arg)` - 대문자로
    - `string.lower(arg)` - 소문자로
    - `string.gsub(mainstring,findstring,replacestring)` - 문자열 대체
    - `string.find(mainstring,findstring,optStartIndex,optEndIndex)` - 문자열 찾기
    - `string.reverse(arg)` - 문자열 역순으로
    - `string.format(...)` - 문자열 포멧 설정
    - `string.len(arg)` - 문자열 길이
    - `string.rep(string,n)` - 문자열 N번 반복 출력

* Case Manipulation - 대소문자 변환
```lua
string1 = "Lua";
print(string.upper(string1))    -- LUA
print(string.lower(string1))    -- lua
```

* Replacing strings
```lua
string = "Lua Tutorial"
-- replacing strings
newstring = string.gsub(string, "Tutorial","Language")
print("The new string is "..newstring)  -- The new string is Lua Language
* Finding and Reversing
```lua
string = "Lua Tutorial"

-- find strings
print(string.find(string,"Tutorial"))       -- 5 12 (start end)
reversedString = string.reverse(string)     
print("The new string is", reversedString)  -- The new string is    lairotuT auL    
```

* Formatting Strings
```lua
string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20

-- Basic string formatting
print(string.format("Basic formatting %s %s", string1, string2))

-- Date formatting
date = 2; month = 1; year = 2022
print(string.format("Date formatting %02d/%02d/%03d %s", date, month, year))

-- Decimal formatting
print(string.format("%.4f", 1/3))
```
* Character and Byte Representations
```lua
-- Byte conversion

-- First character
print(string.byte("Lua"))       -- 76

-- Third character
print(string.byte("Lua",3))     -- 97

-- First character from last
print(string.byte("Lua",-1))    -- 97

-- Second character
print(string.byte("Lua",2))     -- 117

-- Second character from last
print(string.byte("Lua",-2))    -- 117

-- Internal Numeric ASCII Conversion
print(string.char(97))          -- a

```

* Other Common Functions
```lua
string1 = "Lua"
string2 = "Tutorial"

-- String Concatenations using ..
print("Concatenated string", string1..string2)      -- LuaTutorial

-- Length of string
print("Length of string1 is ", string.len(string1)) -- 3

-- Repeating strings
repeatedString = string.rep(string1,3)
print(repeatedString)                               -- LuaLuaLua
```

## Lua - Arrays

* One-Dimensional Array
```lua
array = {"Lua", "Tutorial"}

-- lua에서는 array[0]은 nil이다. array[1]부터 시작한다.
for i = 0, 2 do
    print(array[i])
end
```

* Multi-Dimensional Array
```lua
-- Initializing the array
array = {}

for i=1,3 do
    array[i] = {}
    for j=1,3 do
        array[i][j] = i*j
    end
end

-- Accessing the array
for i=1,3 do
    for j=1,3 do
        print(array[i][j])
    end
end
```

## Lua - Iterators

* Generic For Iterator
```lua
array = {"Lua", "Tutorial"}
-- ipairs를 사용하면 key는 1부터 index이고value는 배열요소를 사용할 수 있다.
for key, value in ipairs(array)
do
    print(key, value)
end
```

* Stateless Iterators
```lua
function square(iteratorMaxCount, currentNumber)
    if currentNumber < iteratorMaxCount
    then
        currentNumber = currentNumber + 1
        return currentNumber, currentNumber*currentNumber
    end
end

for i,n in square,3,0
do
    print(i,n)
end
```

* Stateful Iterators
```lua
array = {"Lua", "Tutorial"}
function elementIterator(collection)
    local index = 0
    local count = #collection
    
    -- The closure function is returned
    return function()
        index = index + 1
        if index <= count
        then
            --return the current element of the iterator
            return collection[index]
        end
    end
end

for element in elementIterator(array)
do
    print(element)
end
```

* 그냥 generic 방식 쓰자.

## Lua - Tables

* table은 array, dictionary, 함수, 기타 자료형의 모든 묶음이다.

* example
```lua
-- Simple empty table
mytable = {}
print("Type of mytable is ", type(mytable))

mytable[1] = "Lua"
mytable["wow"] = "Tutorial"

print("mytable Element at index 1 is ", mytable [1])
print("mytable Element at index wow is ", mytable ["wow"])

-- alternatetable and mytable refers to same table
alternatetable = mytable

print("alternatetable Element at index 1 is ", alternatetable[1])
print("alternatetable Element at index wow is ", alternatetable["wow"])

alternatetable["wow"] = "I changed it"

print("mytable Element at index wow is ", mytable["wow"])

-- only variable released and and not table 
alternatetable = nil
print("alternatetable is ", alternatetable) --> alternatetable is nil

-- mytable is still accessible
print("mytable Element at index wow is ", mytable["wow"])

mytable = nil
print("mytable is ", mytable) --> mytable is nil
```

* Table Concatenation (요소 결합)
```lua
fruits = {"banana", "orange", "apple"}
print(table.concat(fruits)) --> bananaorangeapple
print(table.concat(fruits, ", ")) --> banana, orange, apple
print(table.concat(fruits, ", ", 2,3)) --> orange, apple
```

* Table Insert and Remove
```lua
fruits = {"banana", "orange", "apple"}
table.insert(fruits, "mango") -- 맨 뒤에 붙임
print(fruits[4]) --> mango
table.insert(fruits, 2, "grapes") -- index 2에 붙임
print(fruits[2]) --> grape
print(table.maxn(fruits))   --> 5
print(fruits[5]) --> mango
table.remove(fruits)    -- 모든 요소 제거
print(fruits[5]) --> nil
```

* Sorting Tables
```lua
fruits = {"banana", "orange", "apple", "grapes"}
for k,v in ipairs(fruits) do
    print(k,v)
end

table.sort(fruits)
print("sorted table")

for k,v in ipairs(fruits) do
    print(k,v)
end
```

## Lua - Modules

* 외부 모듈을 사용하는 방법
```lua
-- Method 1 (매우 정직한, 그대로의)
require "printFormatter"
printFormatter.simpleFormat("test")

-- Method 2 (난 이 방법이 마음에 든다)
local formatter = require "printFormatter"
formatter.simpleFormat("test")

-- Method 3 (함수 하나만 뽑아 쓸 때)
require "printFormatter"
local formatterFunction = printFormatter.simpleFormat
formatterFunction("test")
```

* 모듈 작성하기
```lua
-- mymath.lua
local mymath = {}
function mymath.add(a,b)
    print(a+b)
end

function mymath.sub(a,b)
    print(a-b)
end

function mymath.mul(a,b)
    print(a*b)
end

function mymath.div(a,b)
    print(a/b)
end

return mymath
```

* 모듈 사용하기

```lua
-- main.lua
mymath = require("mymath")
mymath.add(10,20)
mymath.sub(30,20)
mymath.mul(10,20)
mymath.div(30,20)
```

* 주의 사항
    * `mymath.lua` 모듈파일과 `main.lua`는 같은 디렉토리에 있어야 한다.
    * 모듈의 이름과 모듈파일의 이름은 같아야 한다.

## Lua - Metatables

* `__index`
```lua
mytable = setmetatable({key1 = "value1"}, {
    __index = function(mytable, key)
        if key == "key2" then
            return "metatablevalue"
        else
            return mytable[key]
        end
    end
})

-- simple version
newtable = setmetatable({key1 = "value1"},
    { __index = {key2 = "metatablevalue"}} )

print(mytable.key1, mytable.key2)   --> value1 metatablevalue
print(newtable.key1, newtable.key2)   --> value1 metatablevalue
```

* `__newindex`
```lua
mymetatable = {}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable})

print(mytable.key1)

mytable.newkey = "new value 2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "new  value 1"
print(mytable.key1,mymetatable.newkey1)
```

* `__newindex` another example
```lua
mytable = setmetatable({key1 = "value1"}, {

   __newindex = function(mytable, key, value)
      rawset(mytable, key, "\""..value.."\"")
   end
})

mytable.key1 = "new value"
mytable.key2 = 4

print(mytable.key1,mytable.key2)
```

* Adding Operator Behavior to Tables - 테이블끼리 더하기
```lua
mytable = setmetatable({ 1, 2, 3 }, {
   __add = function(mytable, newtable)
	
      for i = 1, table.maxn(newtable) do
         table.insert(mytable, table.maxn(mytable)+1,newtable[i])
      end
      return mytable
   end
})

secondtable = {4,5,6}

mytable = mytable + secondtable

for k,v in ipairs(mytable) do
   print(k,v)
end
```

* Table operators
    * `__add` - `+`
    * `__sub` - `-`
    * `__mul` - `*`
    * `__div` - `/`
    * `__mod` - `%`
    * `__unm` - `-`
    * `__concat` - `..`
    * `__eq` - `==`
    * `__lt` - `<`
    * `__le` - `<=`

* `__call`
```lua
mytable = setmetatable({10}, {
   __call = function(mytable, newtable)
   sum = 0
	
      for i = 1, table.maxn(mytable) do
         sum = sum + mytable[i]
      end
	
      for i = 1, table.maxn(newtable) do
         sum = sum + newtable[i]
      end
	
      return sum
   end
})

newtable = {10,20,30}
print(mytable(newtable))    --> 70
```

* `__tostring`
```lua
mytable = setmetatable({ 10, 20, 30 }, {
   __tostring = function(mytable)
   sum = 0
	
      for k, v in pairs(mytable) do
         sum = sum + v
      end
		
      return "The sum of values in the table is " .. sum
   end
})
print(mytable)  --> The sum of values in the table is 60
```

## Lua - Coroutines

* 코루틴 정의: 이해 못해서 넘어감
> Coroutines are collaborative in nature, which allows two or more methods to execute in a controlled manner. With coroutines, at any given time, only one coroutine runs and this running coroutine only suspends its execution when it explicitly requests to be suspended.

* Example
```lua
co = coroutine.create(
    function (value1, value2)
        local tempvar3 = 10
        print("coroutine section 1", value1, value2, tempvar3)
        
        local tempvar1 = coroutine.yield(value1+1, value2+1)
        tempvar3 = tempvar3 + value1
        print("coroutine section 2", tempvar1, tempvar2, tempvar3)
        
        local tempvar1, tempvar2 = coroutine.yield(value1+value2, value1-value2)
        tempvar3 = tempvar3 + value1
        print("coroutine section 3", tempvar1, tempvar2, tempvar3)
        return value2, "end"
    end
)

print("main", coroutine.resume(co, 3, 2) )
print("main", coroutine.resume(co, 12, 14) )
print("main", coroutine.resume(co, 5, 6) )
print("main", coroutine.resume(co, 10, 20) )
    
```

* Example2 
```lua
function getNumber()
   local function getNumberHelper()
      co = coroutine.create(function ()
      coroutine.yield(1)
      coroutine.yield(2)
      coroutine.yield(3)
      coroutine.yield(4)
      coroutine.yield(5)
      end)
      return co
   end
	
   if(numberHelper) then
      status, number = coroutine.resume(numberHelper);
		
      if coroutine.status(numberHelper) == "dead" then
         numberHelper = getNumberHelper()
         status, number = coroutine.resume(numberHelper);
      end
		
      return number
   else
      numberHelper = getNumberHelper()
      status, number = coroutine.resume(numberHelper);
      return number
   end
	
end

for index = 1, 10 do
   print(index, getNumber())
end
```
## Lua - File I/O 

* Implicit File Descriptors
```lua
-- opens a file in read
file = io.open('test.lua', 'r')
-- sets the default input file as test.lua
io.input(file)
-- prints the first line of the file
print(io.read())
-- closes the open File
io.close(fiel)
-- Opens a file in append Modules
file = io.open('test.lua','a')
-- sets the default output file as test.lua
io.output(file)
-- appends a word test to the last line of the file
io.write('-- End of the test.lua file')
-- closes the open file
io.close(file)
```

* Explicit File Descriptors
```lua
-- Opens a file in read mode 
file = io.open('test.lua', 'r')
-- prints the first line of the file 
print(file:read())
-- closes the opended file
file:colse()
-- Opens a file in append mode
file = io.open('test.lua','a')
-- appends a word test to the last line of the file
file:write('--test')
-- closes the open file
file:colse()
```

* File Seek and read
```lua
-- Opens a file in read
file = io.open('test.lua', 'r')
file:seek('end',-25)
print(file:read('*a'))
-- closes the opened file
file:close()
```

## Lua - Error Handling

* Syntax Errors
```lua
for a = 1,10 
  print(a)
end
```
```console
lua: test2.lua:2: 'do' expected near 'print'
```

* Run Time Errors
```lua
function add(a,b)
  return a_b
end

add(10)
```

```console
lua: test2.lua:2: attempt to perform arithmetic on local 'b' (a nil value)
stack traceback:
	test2.lua:2: in function 'add'
	test2.lua:5: in main chunk
	[C]: ?
```

* Assert and Error Functions
```lua
local function add(a,b)
  assert(type(a) == 'number', 'a is not a number')
  assert(type(b) == 'number', 'b is not a number')
  return a+b 
end

add(10)
```

```console
lua: test2.lua:3: b is not a number
stack traceback:
	[C]: in function 'assert'
	test2.lua:3: in function 'add'
	test2.lua:6: in main chunk
	[C]: ?
```

* pcall
```lua
function myfunction ()
  n = n/nil
end

if pcall(myfunction) then
  print("Success")
else 
  print('failure')
end
```
```console
failure
```

* xpcall
```lua
function myfunction ()
  n = n/nil
end

function myerrorhandler(err)
  print('Error:',err)
end
stutus = xpcall(myfunction, myerrorhandler)
print(status)
```
```console
ERROR:	test2.lua:2: attempt to perform arithmetic on global 'n' (a nil value)
false
```

## Lua - Debugging

* Debugging Example
```lua
function myfunction()
  print(debug.traceback("Stack trace"))
  print(debug.getinfo(1))
  print("Stack trace end")
  
  return 10
end

myfunction()
print(debug.getinfo(1))
```

* Debugging Result
```
Stack trace
stack traceback:
	test2.lua:2: in function 'myfunction'
	test2.lua:8: in main chunk
	[C]: ?
table: 0054C6C8
Stack trace end`
```

* Debugging Example2
```lua
function newCounter ()
   local n = 0
   local k = 0
	
   return function ()
      k = n
      n = n + 1
      return n
   end
	
end

counter = newCounter ()

print(counter())
print(counter())

local i = 1

repeat
   name, val = debug.getupvalue(counter, i)
	
   if name then
      print ("index", i, name, "=", val)
		
      if(name == "n") then
         debug.setupvalue (counter,2,10)
      end
		
      i = i + 1
   end -- if
	
until not name

print(counter())
```

* Debugging Result2
```
1
2
index	1	k	=	1
index	2	n	=	2
11
```

## Lua - Garbage Collection

* Example
```lua
mytable = {"apple", "orange", "banana"}
print(collectgarbage("count"))
mytable = nil
print(collectgarbage("count"))
print(collectgarbage("collect"))
print(collectgarbage("count"))
```

* Result
```
23.1455078125   149
23.2880859375   295
0
22.37109375     380
```

## 나머지

* 아래는 따로 독립적인 항목으로 분류하여 정리할 예정.

* Lua - Debugging
* Lua - Garbage Collection
* Lua - Object Oriented
* Lua - Web programming
* Lua - Database Accessing
* Lua - Game Programming

## Links
* This quide <https://www.tutorialspoint.com/lua/lua_quick_guide.htm>
* Pattern Matching <https://sodocumentation.net/lua/topic/5829/pattern-matching>

# 关于编码

## 1 提高编码效率
我们鼓励一切可以提高编码效率的手段. 包括使用更加高效率的编辑器, 调试器集成开发环境等. 下面是我建议的常见提高效率的方式

### 1.1 IDE

建议使用WebStorm，相关使用技巧如下（欢迎补充）：

- Shift-shift ： 快速查找文件

### 1.2 语言
如果来得及学, 尽可能采用精简的语言
比如:

1. Coffeescript 代替 Javascript
2. Jade 代替 Html
3. Less Sass Scss 代替 css

我们的基础框架将采用 Coffeescript , Jade 和 Scss 开发. 建议各位组员也按照相同的风格写代码.

### 1.3 代码注释

要写注释, 而且要保证日后还可以维护注释. 如果不能日后维护注释, 不写也罢. 别写了注释不维护, 日后别人要看那些早就失效的意义含糊的注释. 
除了源代码的注释以外, 还需要重视 github 中对已经提交的代码进行的 comment. 鼓励大家在阅读别人代码或者自己代码的时候, 在 github 上加 comments. 还可以进行讨论.

### 1.4 重构代码

如果你都觉得需要重构代码了, 那么就真的需要了. 经常的代码重构是必须的. 磨刀不费砍柴功. 项目进展到一定的阶段就应该流出一段时间, 进行有目的的代码重构. 


## 2. Meteor 相关的编码要求

### 2.1 按照 Meteor 标准目录格式存放文件
目录名字有含义的, client, server, lib, public 等.不要放错地方

### 2.2 template文件规则

每个template独立文件，Template 的文件名, Template 名字, Template 的 heper js 文件的命名一致

避免多个template共用文件。
如果你的 template 叫做"ContactList", 那么对应的文件也应叫叫做 ContactList.coffee ContractList.jade ContractList.less 

### 2.3 Template不能太大
如果你发现需要卷好几屏幕才能看完一个 Template 的代码, 那么可以考虑分解成更小的 Template 了

### 2.4 Meteor methods 的 check
每一个 Meteor 的 methods 都需要在一开始进行 check. 保证传入参数合法.

### 2.5 主要的 Collection 都需要 Attach Schema. 
用 Collection2 代替 Collection. 无论是否使用 Autoform

### 2.6 避免使用 jQuery
前端代码使用 jQuery 不是灵丹妙药. 如果可以用template.find 解决就避免 jquery. jQuery 会在全局进行 DOM 操作, 有可能引起未知的后果. 比如页面规模很大的时候, 有可能碰巧修改了其他 Template 里面的元素. 这种 bug 很难发现.

### 2.7 Server 代码善用 throw new Meteor.Error
返回有价值的错误信息. 便于查错.

## 3. 单元测试
原型阶段的单元测试不一定是必须的. 但是随着接近产品化阶段, 重要的代码就需要进行单元测试. 初步阶段单元测试是developer自己的任务. 测试工程师的任务是做端到端的测试. 
对于后端模块, 核心的重要模块需要按照 TDD 的模式进行. 先写 Test, 再去满足 Test 的目标去编码.

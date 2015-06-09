# Git版本控制

我们采用git管理代码，并通过git-flow和submodule点方式进行版本控制，对二者不熟悉的同事建议先实战操作一下如下两个教程再看后面的内容

- [git-flow教程](https://github.com/wmzhai/advanced-git-topic/blob/master/branching-model.md)
- [submodule教程](http://www.kafeitu.me/git/2012/03/27/git-submodule.html)


## 1. Clone初始化代码

### 递归clone代码
	$ git clone --recursive git@fitark.org:Laniakea/webus.git

完事以后可以通过`git branch`查看，你在`master`分支里
	
	$ git branch


### 初始化git-flow

初始化git-flow，一路按回车，除了`Version tag prefix`这里写一个`v`   

	$ git flow init

![](https://github.com/wmzhai/advanced-git-topic/raw/master/images/git-flow-init.png)

	
完事以后可以通过`git branch`查看，你`develop`分支里，也取出了develop分支最新的代码

	$ git branch

注意，这里提取出来的代码中并没有取出submodule代码，需要单独取出


### 初始化submodule

如果项目有submodule，需要通过如下执行初始化

	$ git submodule init

然后通过下述指令取出代码

	$ git submodule update

### 试运行
	
最后可以通过如下指令试运行程序

	$ meteor 
	

## 2. 新特性开发

- 在开始进行一个 feature 之前, 请先 branch 出来自己的分支. 在自己的分支里面去修改代码而不是直接在 `develop`、`master` 或者其他人的 branch 里面修改代码.
- 在自己的 branch 开发测试自己的代码. 尽可能做到随时提交改动. 只要取得一点进展就 commit 一次. 一定要写 commit 的 message. 不一定需要完整的句子, 哪怕一两个关键字也行.、
- 在自己的 branch 测试自己代码, 达到要求以后. 先把你准备 merge 进去的 branch 的代码 merge 到你自己的 branch. 然后再进行一次测试. 保证 merge 以后的代码可用. 才可以 merge 到其他人的 branch 中. 

### 2.1 切出特性分支

通过如下指令切出名为`feature-name`的特性分支，并切换到该分支

	$ git flow feature start feature-name
	
![](https://github.com/wmzhai/advanced-git-topic/raw/master/images/git-flow-feature-start-f1.png)


### 2.2 完成新特性开发

首先update最新的develop分支，然后merge到你的feature分支里面，在feature分支里面解决冲突，外加测试，

	$ git pull origin develop
	$ git merge develop

如果有冲突，需要解决，然后运行测试，待一切没有问题以后，再通过如下指令完成分支，并将代码合并回`develop`分支。

	$ git flow feature finish feature-name 

![](https://github.com/wmzhai/advanced-git-topic/raw/master/images/git-flow-feature-finishi-f1.png)

注意，在finish以后，该特性分支会被删除，如果希望保留本地feature分支，请采用git指令手工操作

## 2.3 提交代码

常规而言，我们push到服务器的都是develop分支的代码，不是master分支。
一般在feature完成以后需要马上push代码。

	$ git push origin develop


## 3. 发布版本(仅项目管理员可以操作)

当develop分支几乎已经达到新发布版本预期效果的状态时，可以从develop里分出release分支。一旦Release分支切出来以后，都不要再往里面merge新的特性了。当新特性测试修改完毕以后，则可以发布下一个版本。

### 3.1 切出发布分支

下属指令从`develop`分支切出`release/0.1.0`分支，并切换到这一个分支

	$ git flow release start 0.1.0

![](https://github.com/wmzhai/advanced-git-topic/raw/master/images/git-flow-release-start-0.1.0.png)


### 3.2 完成发布分支

	$ git flow release finish 0.1.0

如图所示，这个指令完成了如下事情

- 将release/0.1.0分支合并进master
- 在release上tag v0.1.0
- 删除本地的release/0.1.0分支删除
- 最后切换到master分支

![](https://github.com/wmzhai/advanced-git-topic/raw/master/images/git-flow-release-finish-0.1.0.png)


### 3.3 上传版本号tag

    $ git push origin v0.0.1


## 4. Hotfix分支（仅管理员可以push master）


### 4.1 开始一个Hotfix

	$ git flow hotfix start 0.1.1

这个hotfix是基于master产生的，并且项目也切到了这个分支

![](https://github.com/wmzhai/advanced-git-topic/raw/master/images/git-flow-hotfix-start.png)

### 4.2 完成一个Hotfix

	$ git flow hotfix finish 0.1.1

hotfix被合并到master

![](https://github.com/wmzhai/advanced-git-topic/raw/master/images/git-flow-hotfix-finish.png)

## Code Review

项目初期, 为了加快速度, 就不进行 code review 了. 但是项目后期, 接近产品 release 的时候, 关键的 merge 都需要 code review.

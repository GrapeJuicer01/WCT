## gitlab简易使用手册
### 添加sshkey到gitlab(必读)
+ 1. 安装git工具和注册gitlab(http://gitlab.iwhalecloud.com)账号
git工具可以通过百度搜索`git windows` 或`git mac`来获取下载链接
gitlab账号在注册时, 建议使用**公司邮箱**进行注册

+ 2. 生成ssh公钥和秘钥对

```
ssh-keygen -t rsa -C 'yourEmail2@xx.com' (-C 参数是你的邮箱地址)
windows：在git bash终端执行命令
mac：在mac bash终端执行命令
```

+ 3. 复制`~/.ssh/id_rsa.pub`文件中的内容
+ 4. 登录gitlab, 打开`Profile Setting-->SSH Keys-->Add SSH Key`界面，将上一步中复制的内容粘贴到对应的文本框，点击Add key按钮新增，至此gitlab新增ssh key完成。

### 从gitlab中clone代码(必读)
+ 1. 在本地机器新增空目录,dc-tools
+ 2. 初始化git

```
cd /e/dc-tools
git init
```
+ 3. 从gitlab中拉取代码

```
git clone git@gitlab.iwhalecloud.com:DC/DCTools.git
```
+ 4. 至此从gitlab中获取代码完成

### 本地修改代码后提交到gitlab
修改代码建议从pycharm IDE开发工具中修改，其中内置了提交git仓库的图形化操作界面

### 本地配置多个ssh key(选读)

大多数时候，我们的机器上会有很多的git host,比如公司gitlab、github、oschina等，那我们就需要在本地配置多个ssh key，使得不同的host能使用不同的ssh key ,做法如下（以公司gitlab和github为例）
+ 1. 为公司gitlab生成秘钥对

```
ssh-keygen -t rsa -C 'yourEmail@xx.com' -f ~/.ssh/gitlab-rsa
```
+ 2. 为个人github生成秘钥对

```
ssh-keygen -t rsa -C 'yourEmail2@xx.com' -f ~/.ssh/github-rsa
```
+ 3. 在`~/.ssh`目录下新建名称为**config**的文件(无后缀名)。用于配置多个不同的host使用不同的ssh key，内容如下:

```
# gitlab
Host gitlab.com
    HostName gitlab.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/gitlab_id-rsa
# github
Host github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/github_id-rsa
  ​
# 配置文件参数
# Host : Host 可以看作是一个你要识别的模式, 对识别的模式, 进行配置对应的的**主机名**和ssh文件
# HostName : 要登录主机的主机名
# IdentityFile : identityFile路径
```
+ 4. 在gitlab和github上添加上述生成的公钥`gitlab_id-rsa.pub`和`github_id-rsa.pub`




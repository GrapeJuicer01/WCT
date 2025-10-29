打包方式：
-
**首先需要安装pyinstaller**
--
命令步骤
--
1. pyinstaller -F DCToolsMain.py
2. 修改版本信息
3. 修改RunMainGUI.spec
    > 方法1：
    修改4个地方，以下是贵华的参考
    a. 7行：pathex = ['F:\\\ZTESoft\\\projects\\\PythonProjects\\\DCtools\\\DCtools\\\src'],
    b. 42行, name = 'DCTools',
    c. 28行, runtime_tmpdir='./',
    d. 30行, icon='DCTools.ico'
    
    > 方法2：
    修改6个地方，以下是贵华的参考
    a. 2行，增加 import os
    b. 5行，增加 curpath = os.getcwd()
    c. pathex = [curpath],
    d. 42行, name = 'DCTools',
    e. 28行, runtime_tmpdir='./',
    f. 30行, icon='DCTools.ico'
4. pyinstaller -F RunMainGUI.spec
5. 清空output目录下的所有内容。
6. 需要修改comm.cfg中的：toolModel: 1
7. 打包exe和文件夹的时候参考历史压缩包取对应的文件（DCTools.exe,config,doc,imgs,input,instantclient）。
## hosts

`C:\Windows\System32\drivers\etc\hosts`

`ipconfig /flushdns`

## start menu

在 Windows 操作系统中，自动启动项的路径有几个不同的地方，包括注册表、启动文件夹和计划任务。以下是一些常见的自动启动项路径及其说明：

### 1. 启动文件夹
Windows 提供了两个启动文件夹：一个是针对当前用户的，另一个是针对所有用户的。

#### 当前用户启动文件夹
路径：
```
C:\Users\<用户名>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
```

#### 所有用户启动文件夹
路径：
```
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
```

### 2. 注册表
注册表中也有几个地方可以设置程序在系统启动时自动运行。

#### 用户级别的启动项
路径：
```
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
```

#### 系统级别的启动项
路径：
```
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run
```

### 3. 计划任务
计划任务可以设置程序在系统启动时运行。

#### 计划任务路径
路径：
```
C:\Windows\System32\tasks
```

### 4. 服务
系统服务也可以设置为在启动时运行。

#### 服务路径
路径：
```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
```

### 如何查看和管理自动启动项

#### 使用系统配置工具（msconfig）
1. 按 `Win + R` 打开运行对话框。
2. 输入 `msconfig`，然后按 `Enter`。
3. 在“系统配置”窗口中，切换到“启动”选项卡。
4. 你可以在这里查看和管理启动项。

#### 使用任务管理器
1. 按 `Ctrl + Shift + Esc` 打开任务管理器。
2. 切换到“启动”选项卡。
3. 你可以在这里查看和管理启动项。

### 示例

#### 查看当前用户启动文件夹
```sh
explorer "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
```

#### 查看所有用户启动文件夹
```sh
explorer "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
```

#### 查看注册表中的启动项
1. 按 `Win + R` 打开运行对话框。
2. 输入 `regedit`，然后按 `Enter`。
3. 导航到 `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run` 或 `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run`。

### 总结

通过以上路径和工具，你可以查看和管理 Windows 系统中的自动启动项。希望这些信息能帮到你！如果有其他问题或需要进一步的帮助，请随时提问。
# SSH

## Login update

- before `ssh -t root@192.168.0.242 'cd /home/x ; bash'`

- after `ssh -t root@192.168.0.242 "cd /home/x ; bash"`
  - also `ssh -t root@192.168.0.242 "cd /home/x ; bash --login"`

Notice that **double quotation marks** changed after.

## Priv and pub key sign in(win to linux).

### Generate priv/pub keys

`ssh-keygen -t rsa`

saved in `user/.ssh`

### Pub key sent to server and apply key

```shell
cd ~/.ssh
cat id_rsa.pub_client >> authorized_keys
chmod 700 ../ssh
```

## SSH on Windows

### Install ssh(V8.6.0.0p1-Beta) on win7
- [tutorial](https://blog.csdn.net/baojunqinluo/article/details/134053559)

0. Download [link](https://github.com/PowerShell/Win32-OpenSSH/releases)
1. Configure environment variables and install service(opt if as client)
   1.  install service `install-sshd.ps1` within the folder.
   2.  `powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1`

### Priv and pub key sign in(win to win).

[tutorial](https://zhuanlan.zhihu.com/p/111812831)


服务端切换到`C:\ProgramData\ssh\`下（首次启动sshd后会生成该文件夹），打开`sshd_config`文件，

修改文件（以下是重点）：

确保以下3条没有被注释
```
PubkeyAuthentication yes
AuthorizedKeysFile	.ssh/authorized_keys
PasswordAuthentication no
```

确保以下2条有注释掉
```
#Match Group administrators
#       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys
```

其余不做修改，基本都是已注释不启用。

重启服务

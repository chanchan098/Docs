# SSH

## Login update

- before `ssh -t root@192.168.0.242 'cd /home/x ; bash'`

- after `ssh -t root@192.168.0.242 "cd /home/x ; bash"`
  - also `ssh -t root@192.168.0.242 "cd /home/x ; bash --login"`

Notice that **double quotation marks** changed after.

## Priv and pub key sign in(win to linux).

### Install ssh(V8.6.0.0p1-Beta) on win7


- [tutorial](https://blog.csdn.net/baojunqinluo/article/details/134053559)

0. Download [link](https://github.com/PowerShell/Win32-OpenSSH/releases)
1. Configure environment variables and install service(opt if as client)
   1.  install service `install-sshd.ps1` within the folder.
   2.  `powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1`

### Generate priv/pub keys

`ssh-keygen -t rsa`

saved in `user/.ssh`

### Pub key sent to linux and apply key

```shell
cd ~/.ssh
cat id_rsa.pub_client >> authorized_keys
chmod 700 ../ssh
```



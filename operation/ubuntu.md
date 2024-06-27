
## Auto-starting app

`systemctl enable nginx.service`, output

>Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /lib/systemd/system/nginx.service.


to do this by putting a `symblic link` at `/etc/systemd/system/multi-user.target.wants`
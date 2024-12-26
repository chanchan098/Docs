

# -S-Install 

## Install with Istioctl

### Install Istio using the default profile

Various settings can be configured to modify the installations. For example, to enable access logs:

`istioctl install --set meshConfig.accessLogFile=/dev/stdout`


use `-f`
```shell
cat <<EOF > ./my-config.yaml
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
spec:
  meshConfig:
    accessLogFile: /dev/stdout
EOF

# update OR install, needed to be same profile.
istioctl install -f my-config.yaml

```

# -E-Install 
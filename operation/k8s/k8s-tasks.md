
https://kubernetes.io/docs/tasks/


# -Administer a Cluster

# Access Clusters Using the Kubernetes API

## Accessing the Kubernetes API

### Directly accessing the REST API 

## Programmatic access to the API 

### Java client 

https://github.com/kubernetes-client/java

https://github.com/kubernetes-client/java/blob/master/examples/examples-release-17/src/main/java/io/kubernetes/client/examples/KubeConfigFileClientExample.java

how to use?

0. Export admin config from linux to windows, when booted up  
   
   from this to any position on windows
   ```shell
    To start using your cluster, you need to run the following as a regular user:

    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

    Alternatively, if you are the root user, you can run:

    export KUBECONFIG=/etc/kubernetes/admin.conf
   ```
1. Add environment variables to windows
    ```
    set KUBECONFIG
    KUBECONFIG=D:\liaoyj\DevelopmentResources\admin.conf

    set HOME
    HOME=C:\Users\116
    ```

2. Example
   ```java
    public class KubeConfigFileClientExample {
        public static void main(String[] args) throws IOException, ApiException {

            // file path to your KubeConfig

            String kubeConfigPath =  System.getenv("HOME") + "/.kube/config";

            // loading the out-of-cluster config, a kubeconfig from file-system
            ApiClient client =
                ClientBuilder.kubeconfig(KubeConfig.loadKubeConfig(new FileReader(kubeConfigPath))).build();

            // set the global default api-client to the in-cluster one from above
            Configuration.setDefaultApiClient(client);

            // the CoreV1Api loads default api-client from global configuration.
            CoreV1Api api = new CoreV1Api();

            // invokes the CoreV1Api client
            V1PodList list =
                api.listPodForAllNamespaces(null, null, null, null, null, null, null, null, null, null);
            for (V1Pod item : list.getItems()) {
                System.out.println(item.getMetadata().getName());
            }
        }
    }
   ```
   

# E-Administer a Cluster

# -Configure Pods and Containers

# Configure Service Accounts for Pods

# E-Configure Pods and Containers

## Charts

https://helm.sh/docs/topics/charts/

Helm uses a packaging format called *charts*. A chart is a collection of files that describe a related set of Kubernetes resources.  

A single chart might be used to deploy something simple, like a memcached pod, or something complex, like a full web app stack with HTTP servers, databases, caches, and so on.

### The Chart File Structure

https://helm.sh/docs/topics/charts/#the-chart-file-structure

```
wordpress/
  Chart.yaml           # A YAML file containing information about the chart
  LICENSE              # OPTIONAL: A plain text file containing the license for the chart
  README.md            # OPTIONAL: A human-readable README file
  values.yaml          # The default configuration values for this chart
  values.schema.json   # OPTIONAL: A JSON Schema for imposing a structure on the values.yaml file
  charts/              # A directory containing any charts upon which this chart depends.
  crds/                # Custom Resource Definitions
  templates/           # A directory of templates that, when combined with values,
                       # will generate valid Kubernetes manifest files.
  templates/NOTES.txt  # OPTIONAL: A plain text file containing short usage notes
```


### Templates and Values

[Go template language](https://golang.org/pkg/text/template/)  

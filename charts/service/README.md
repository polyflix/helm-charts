# service

A base Helm chart that must be used as a dependency when creating Polyflix service charts.

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: X.X.X](https://img.shields.io/badge/AppVersion-X.X.X-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add polyflix https://polyflix.github.io/helm-charts
$ helm install my-release polyflix/service
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Pod affinity |
| autoscaling.enabled | bool | `false` | Enable the auto scaling of the deployment. |
| autoscaling.maxReplicas | int | `100` | The maximum replicas for the deployment. |
| autoscaling.minReplicas | int | `1` | The minimum replicas for the deployment. |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| extraEnvVars | list | `[]` | Extra env vars to pass to the migrations container |
| extraEnvVarsSecrets | list | `[]` | Extra secrets to use to populate the migration environment. |
| fullnameOverride | string | `""` | Override the entire release name |
| image.pullPolicy | string | `"Always"` | Define the image pulling behavior. Can be either Always or IfNotPresent. |
| image.repository | string | `"ghcr.io/polyflix/example"` | The repository of the image to deploy |
| image.tag | string | `"main"` | The image tag to deploy |
| imagePullSecrets | list | `[]` | A list of secrets that can be used by our deploymet to authenticate to registry. |
| migrations.enabled | bool | `false` | Set this to true if the service has PostgreSQL migrations to apply. We assume that the migrations are just another tag for the image. For example, if the image is : ghcr.io/polyflix/example:main the image migration should be located at : ghcr.io/polyflix/example:main-migrations |
| migrations.extraEnvVars | list | `[]` |  |
| migrations.extraEnvVarsSecrets | list | `[]` |  |
| nameOverride | string | `""` | Override the name of the release, by keeping the release name as suffix |
| nodeSelector | object | `{}` | A node selector configuration for our deployment |
| podAnnotations | object | `{}` | Annotations to add to the pod |
| podSecurityContext | object | `{}` | Security context of the pod |
| probes.liveness.initialDelaySeconds | int | `15` | The time in seconds to wait before sending the first probe request. |
| probes.liveness.path | string | `"/"` | The path for the Kubernetes liveness probe. |
| probes.readiness.initialDelaySeconds | int | `15` | The time in seconds to wait before sending the first probe request. |
| probes.readiness.path | string | `"/"` | The path for the Kubernetes readiness probe. |
| replicaCount | int | `1` | The number of replicas to deploy |
| resources | object | `{}` | The deployment resources |
| securityContext | object | `{}` | Security context of the deployment |
| service.port | int | `80` | The port of the service used to expose the deployment |
| service.type | string | `"ClusterIP"` | The type of service to expose the deployment |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Tolerations for the pod |

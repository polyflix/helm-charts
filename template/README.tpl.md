{{ template "chart.header" . }}
{{ template "chart.description" . }}

{{ template "chart.versionBadge" . }}{{ template "chart.typeBadge" . }}{{ template "chart.appVersionBadge" . }}

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add polyflix https://polyflix.github.io/helm-charts
$ helm install my-release polyflix/{{ template "chart.name" . }}
```

{{ template "chart.requirementsSection" . }}

{{ template "chart.valuesSection" . }}

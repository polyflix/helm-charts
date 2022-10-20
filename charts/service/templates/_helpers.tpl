{{/*
Expand the name of the chart.
*/}}
{{- define "microservice.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "microservice.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "microservice.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "microservice.labels" -}}
helm.sh/chart: {{ include "microservice.chart" . }}
{{ include "microservice.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microservice.selectorLabels" -}}
app.kubernetes.io/name: {{ include "microservice.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "microservice.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "microservice.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "microservice.livenessProbe" -}}
failureThreshold: 3
httpGet:
  path: {{ hasKey .config "path" | ternary .config.path "/" }}
  port: {{ hasKey .config "port" | ternary .config.port "http" }}
initialDelaySeconds: 15
periodSeconds: 15
successThreshold: 1
timeoutSeconds: 15
{{- end }}

{{- define "microservice.readinessProbe" -}}
failureThreshold: 3
httpGet:
  path: {{ hasKey .config "path" | ternary .config.path "/" }}
  port: {{ hasKey .config "port" | ternary .config.port "http" }}
initialDelaySeconds: 15
periodSeconds: 15
successThreshold: 3
timeoutSeconds: 15
{{- end }}

{{- define "microservice.migrations" -}}
- name: migrations
  imagePullPolicy: Always
  image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}-migrations"
  envFrom:
  {{- with .Values.migrations.extraEnvVarsSecrets }}
    {{- range $secret := . }}
    - secretRef:
        name: {{ $secret.name }}
    {{- end }}
  {{- end }}
  env:
  {{- with .Values.migrations.extraEnvVars }}
    {{- range $env := . }}
    - name: {{ $env.name }}
      value: {{ $env.value | quote }}
    {{- end }}
  {{- end }}
{{- end }}

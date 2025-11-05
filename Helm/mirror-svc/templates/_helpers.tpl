{{- define "mirror-svc.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{- define "mirror-svc.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{- define "my-app.labels" -}}
app: {{ .Release.Name }}-webapp
managed-by: {{ .Release.Service }}
{{- end -}}

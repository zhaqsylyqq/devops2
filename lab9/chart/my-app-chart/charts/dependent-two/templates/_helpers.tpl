{{- define "dependent-two.secretName" -}}
{{- printf "%s-api-secret" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

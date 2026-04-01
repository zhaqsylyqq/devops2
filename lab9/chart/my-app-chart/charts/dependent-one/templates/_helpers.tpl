{{- define "dependent-one.name" -}}
{{- printf "%s-ui-config" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

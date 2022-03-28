{{/*
Ensure that you have the postgresql dependency or an external instance of postgresql database
*/}}
{{- define "postgresql_host" -}}
{{- if .Values.postgresql.enabled -}}
{{ .Release.Name }}-postgresql
{{- else -}}
{{- required "postgresql.db_hostname or postgresql.enabled is missing" .Values.postgresql.db_hostname  -}}
{{- end -}}
{{- end -}}

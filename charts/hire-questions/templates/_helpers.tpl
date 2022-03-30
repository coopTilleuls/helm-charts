{{/* DATABASE_URL used by PHP container */}}
{{- define "database_url" -}}
  mysql://{{ .Values.mysql.auth.username }}:{{ .Values.mysql.auth.password }}@
  {{- if .Values.mysql.enabled -}}
    {{- .Release.Name }}-mysql
  {{- else -}}
    {{- .Values.mysql.external_host -}}
  {{- end -}}
  :3306/{{ .Values.mysql.auth.database }}?serverVersion=5.8
{{- end }}

{{/* DATABASE_URL used by PHP container */}}
{{- define "database_url" -}}
  {{/* first we check if mysql-secret already exists */}}
  {{- $mysqlSecretName := printf "%s-%s" .Release.Name "mysql" -}}
  {{- $mysqlSecretObj := (lookup "v1" "Secret" .Release.Namespace $mysqlSecretName) | default dict -}}
  {{- $mysqlPassword := (get $mysqlSecretObj "data.mysql-password") | default .Values.mysql.auth.password -}}
  mysql://{{ .Values.mysql.auth.username }}:{{ $mysqlPassword }}@
  {{- if .Values.mysql.enabled -}}
    {{- .Release.Name }}-mysql
  {{- else -}}
    {{- .Values.mysql.external_host -}}
  {{- end -}}
  :3306/{{ .Values.mysql.auth.database }}?serverVersion=5.8
{{- end }}

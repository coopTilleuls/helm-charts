{{/* url used by clients to join wordpress */}}
{{- define "next_public_wordpress_domain" }}
{{- required "Missing site_back_domain" .Values.site_back_domain -}}
{{- end }}

{{/* next_private_wordpress_url :  url used by frontend to join wordpress.
  if the frontend is in Kubernetes : service name
  else : nothing (will use next_public_wordpress_domain)
  */}}
{{/* url used by clients to join wordpress */}}
{{- define "next_private_wordpress_url" -}}
  {{- if .Values.frontend.enabled -}}
    http://{{ .Release.Name }}-wordpress:{{ .Values.wordpress.service.port -}}
  {{- else -}}
  {{- end -}}
{{- end }}

{{/* public wordpress front url, eg chart-example.local */}}
{{- define "wordpress_front_domain" -}}
{{- required "Missing site_front_domain" .Values.site_front_domain -}}
{{- end }}

{{/* mysql host to connect : mysql deployment or external mysql server  */}}
{{- define "mysql_host" }}
  {{- if .Values.mysql.enabled -}}
    {{ .Release.Name }}-mysql-headless
  {{- else -}}
    {{- required "Missing mysql.external_host" .Values.mysql.external_host -}}
  {{- end -}}
{{- end }}

{{/* api_url :
  next_private_wordpress_domain if defined,
  else next_public_wordpress_domain
  */}}
{{- define "api_url" }}
  {{- if .Values.frontend.enabled -}}
    http://{{ .Release.Name }}-wordpress:{{ .Values.wordpress.service.port -}}/wp-json
  {{- else -}}
    https://{{- required "Missing site_back_domain" .Values.site_back_domain | -}}/wp-json
  {{- end -}}
{{- end }}

{{- $es_consul_service := env "CONSUL_ES_SERVICE" }}
{{ range service $es_consul_service }}
{{.Address}}:{{.Port}}{{end}}

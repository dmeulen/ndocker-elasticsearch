{{ range service "elasticsearch-dvp-transport" }}
{{.Address}}:{{.Port}}{{end}}

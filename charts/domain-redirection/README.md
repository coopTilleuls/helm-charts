# domain redirections

Simple Apache Pod hanling redirections for an old migrated domain (old pages -> new pages)

```
helm repo add cooptilleuls https://cooptilleuls.github.io/helm-charts/
helm upgrade --install <RELEASE_NAME> chart \
  --set-file redirections=redirections.conf \
  --set ingress.hosts[0]=my.domain.tld \
  --atomic --debug
```

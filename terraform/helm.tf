# helm.tf

resource "helm_release" "myapp" {
  name      = "myapp"
  namespace = "default"
  chart     = "./helm"  # Path to your local Helm chart directory
  values    = ["./helm-values/myapp.yaml"]  # Path to your Helm chart values file
}

resource "helm_release" "grafana" {
  name      = "grafana"
  namespace = "monitoring"
  chart     = "grafana/grafana"
  values    = ["./helm-values/grafana.yaml"]  # Path to your Grafana Helm chart values file
}

resource "helm_release" "prometheus" {
  name      = "prometheus"
  namespace = "monitoring"
  chart     = "prometheus-community/prometheus"
  values    = ["./helm-values/prometheus.yaml"]  # Path to your Prometheus Helm chart values file
}

resource "helm_release" "istio-base" {
  name      = "istio-base"
  namespace = "istio-system"
  chart     = "istio-base"
  values    = ["./helm-values/istio-base.yaml"]  # Path to Istio Base Helm chart values file
}

resource "helm_release" "istiod" {
  name      = "istiod"
  namespace = "istio-system"
  chart     = "istiod"
  values    = ["./helm-values/istiod.yaml"]  # Path to Istiod Helm chart values file
}

resource "helm_release" "istio-gateway" {
  name      = "istio-gateway"
  namespace = "istio-system"
  chart     = "istio-ingressgateway"
  values    = ["./helm-values/istio-gateway.yaml"]  # Path to Istio Gateway Helm chart values file
}

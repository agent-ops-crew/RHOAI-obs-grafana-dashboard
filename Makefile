# RHOAI Grafana Dashboards Makefile

CHART_NAME = grafana-dashboards
RELEASE_NAME = rhoai-dashboards
NAMESPACE = monitoring

.PHONY: lint template install uninstall package help

## Lint the Helm chart
lint:
	helm lint .

## Render chart templates locally
template:
	helm template $(RELEASE_NAME) . --namespace $(NAMESPACE)

## Install the chart
install:
	helm install $(RELEASE_NAME) . --namespace $(NAMESPACE) --create-namespace

## Uninstall the chart
uninstall:
	helm uninstall $(RELEASE_NAME) --namespace $(NAMESPACE)

## Package the chart
package:
	helm package .

## Show available commands
help:
	@echo "Available commands:"
	@echo "  lint      - Lint the Helm chart"
	@echo "  template  - Render chart templates locally"
	@echo "  install   - Install the chart"
	@echo "  uninstall - Uninstall the chart"
	@echo "  package   - Package the chart"
	@echo "  help      - Show this help message"

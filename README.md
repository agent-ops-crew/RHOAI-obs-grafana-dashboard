# Grafana Dashboards for vLLM and LLM-D

This Helm chart for deploying vLLM and LLM-D dashboards to Grafana.

## Prerequisites

- Openshift 4.17+
- Helm
- Grafana Operator installed in your cluster

## Quickstart

Use the following command to install the dashboards into `user-grafana` namespace:

```bash
helm install grafana-dashboards . -n user-grafana
```

> [!NOTE]
> Make sure to replace `user-grafana` with the namespace where your Grafana instance is installed.

This will install a set of dashboards for vLLM and LLM-D in the `Openshift AI Observability` folder in your Grafana instance.

See the [example-values.yaml](example-values.yaml) for basic configuration options.

## Usage

### Configuration

The following table lists the configurable parameters of the Grafana Dashboards chart and their default values.

|      Parameter       |                              Description                              |             Default             |
| :------------------: | :-------------------------------------------------------------------: | :-----------------------------: |
|     `namespace`      |            Namespace where the dashboards will be created             |          `monitoring`           |
|    `commonLabels`    |                    Labels to add to all resources                     |              `{}`               |
| `commonAnnotations`  |                  Annotations to add to all resources                  |              `{}`               |
|   `grafanaFolder`    |      Folder name in Grafana where the dashboards will be placed       |            `General`            |
| `dashboard_folders`  |           List of folders inside of `dashboards` to deploy            |              `[]`               |
| `dashboardNamespace` |        Dashboard namespace (used for dashboard identification)        |            `default`            |
|      `plugins`       |          List of Grafana plugins required by the dashboards           |              `[]`               |
|  `instanceSelector`  | Selector for the Grafana instance where dashboards should be deployed | `{matchLabels: {app: grafana}}` |

### Example

```yaml
namespace: monitoring
grafanaFolder: "Kubernetes"
commonLabels:
  app.kubernetes.io/part-of: monitoring
  app.kubernetes.io/managed-by: helm

# List of required Grafana plugins
plugins:
  - name: "grafana-piechart-panel"
    version: "1.6.4"
  - name: "grafana-clock-panel"
    version: "1.3.0"

# Selector for the Grafana instance
instanceSelector:
  matchLabels:
    app: grafana
    # Example with multiple labels:
    # environment: production
    # team: observability

dashboard_folders:
  - llm-d # For LLM-D dashboards
  - vllm # For VLLM dashboards
```

## Upgrading

To upgrade your deployment with a new dashboard or configuration:

```bash
helm upgrade grafana-dashboards . -n user-grafana -f values.yaml
```

## Uninstalling

To uninstall/delete the deployment:

```bash
helm uninstall grafana-dashboards -n user-grafana
```


<!--
SPDX-FileCopyrightText: 2024 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
-->
{{ template "chart.header" . }}
{{ template "chart.description" . }}

The included alerts can be grouped into two categories:

- *Generic Kubernetes Alert* alert when basic run conditions of the execution environment (k8s in this case) are not met.
  This could for example be that a pod keeps crashing or a services backing pods don't pass their ready checks.

  Most of these alerts are inspired from the ones included in [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus) and [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack/templates/prometheus/rules-1.14) but adapted to be OpenDesk specific.

- *Component-Specific Alerts* trigger when the internal state of specific OpenDesk components are out of order.
  For example, a collabora document server has too many documents open in a single pod.

  **These alerts are not yet implemented**.

## Environment Requirements

This chart requires that [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator) is already installed in the cluster and that [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics) are available.

## Contained Alerts

For a detailed description of which alert rules are generated as well as the annotation and label conventions used by this helm chart, visit [./alerts.md](./alerts.md).

## Installing the Chart

To install the chart with the release name `my-release`, you have two options:

### Install via Repository
```console
helm repo add ${CI_PROJECT_NAME} ${CI_SERVER_PROTOCOL}://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/packages/helm/stable
helm install my-release --version ${RELEASE_VERSION} ${CI_PROJECT_NAME}/{{ template "chart.name" . }}
```

### Install via OCI Registry
```console
helm repo add ${CI_PROJECT_NAME} oci://${CI_REGISTRY_IMAGE}
helm install my-release --version ${RELEASE_VERSION} ${CI_PROJECT_NAME}/{{ template "chart.name" . }}
```

{{ template "chart.requirementsSection" . }}

{{ template "chart.valuesSection" . }}

## Uninstalling the Chart

To install the release with name `my-release`:

```bash
helm uninstall my-release
```

## Signing

Helm charts are signed with helm native signing method.

You can verify the chart against [the public GPG key](../../files/gpg-pubkeys/opendesk.gpg).

## License

This project uses the following license: Apache-2.0


## Copyright

Copyright (C) 2024 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH

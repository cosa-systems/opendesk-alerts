<!--
SPDX-FileCopyrightText: 2024 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
-->
# opendesk-alerts

A Helm chart for deploying prometheus alert rules related to openDesk

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
helm repo add opendesk-alerts https://gitlab.opencode.de/api/v4/projects/3936/packages/helm/stable
helm install my-release --version 1.1.2 opendesk-alerts/opendesk-alerts
```

### Install via OCI Registry
```console
helm repo add opendesk-alerts oci://registry.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-alerts
helm install my-release --version 1.1.2 opendesk-alerts/opendesk-alerts
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.opencode.de/bmi/opendesk/components/external/charts/bitnami-charts | common | ^2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalAnnotations | object | `{}` | Additional custom annotations to add to all deployed kubernetes objects |
| additionalLabels | object | `{}` | Additional custom labels to add to all deployed kubernetes objects |
| config.collabora.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all collabora related alerts |
| config.collabora.additionalAlertLabels | object | `{}` | Additional custom labels to add to all collabora related alerts |
| config.collabora.enabled | bool | `true` | Enable alerts for collabora |
| config.collabora.namespace | string | `""` | Namespace in which collabora is deployed; defaults to this helm charts namespace. |
| config.collabora.selectors.endpoints | string | `"collabora"` | Regex which identifies endpoints belonging to collabora by name |
| config.collabora.selectors.jobs | string | `""` | Regex which identifies jobs belonging to collabora by name |
| config.collabora.selectors.pods | string | `"collabora-.+"` | Regex which identifies pods belonging to collabora by name |
| config.collabora.selectors.pvcs | string | `""` | Regex which identifies persistent volume claims belonging to collabora by name |
| config.cryptpad.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all diagrams/cryptpad related alerts |
| config.cryptpad.additionalAlertLabels | object | `{}` | Additional custom labels to add to all diagrams/cryptpad related alerts |
| config.cryptpad.enabled | bool | `true` | Enable alerts for diagrams/cryptpad |
| config.cryptpad.namespace | string | `""` | Namespace in which diagrams/cryptpad is deployed; defaults to this helm charts namespace. |
| config.cryptpad.selectors.endpoints | string | `"cryptpad"` | Regex which identifies endpoints belonging to diagrams/cryptpad by name |
| config.cryptpad.selectors.jobs | string | `""` | Regex which identifies jobs belonging to diagrams/cryptpad by name |
| config.cryptpad.selectors.pods | string | `"cryptpad-.+"` | Regex which identifies pods belonging to diagrams/cryptpad by name |
| config.cryptpad.selectors.pvcs | string | `""` | Regex which identifies persistent volume claims belonging to diagrams/cryptpad by name |
| config.element.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all element/matrix/synapse related alerts |
| config.element.additionalAlertLabels | object | `{}` | Additional custom labels to add to all element/matrix/synapse related alerts |
| config.element.enabled | bool | `true` | Enable alerts for element/matrix/synapse |
| config.element.namespace | string | `""` | Namespace in which matrix/synapse is deployed; defaults to this helm charts namespace. |
| config.element.selectors.endpoints | string | `"matrix-.+|opendesk-element|opendesk-synapse.+"` | Regex which identifies endpoints belonging to element/matrix/synapse by name |
| config.element.selectors.jobs | string | `"opendesk-matrix-.+|matrix-neodatefix-.+"` | Regex which identifies jobs belonging to element/matrix/synapse by name |
| config.element.selectors.pods | string | `"matrix-.+|opendesk-synapse-.+"` | Regex which identifies pods belonging to element/matrix/synapse by name |
| config.element.selectors.pvcs | string | `"matrix-.+|media-opendesk-synapse-.+"` | Regex which identifies persistent volume claims belonging to element/matrix/synapse by name |
| config.global.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all generated alerts |
| config.global.additionalAlertLabels | object | `{}` | Additional custom labels to add to all generated alerts |
| config.global.alertsFiringFor | string | `"15m"` | How long an alert query must return results in order for alerts to be considered firing |
| config.jitsi.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all jitsi related alerts |
| config.jitsi.additionalAlertLabels | object | `{}` | Additional custom labels to add to all jitsi related alerts |
| config.jitsi.enabled | bool | `true` | Enable alerts for jitsi |
| config.jitsi.namespace | string | `""` | Namespace in which jitsi is deployed; defaults to this helm charts namespace. |
| config.jitsi.selectors.endpoints | string | `"jitsi-.+"` | Regex which identifies endpoints belonging to jitsi by name |
| config.jitsi.selectors.jobs | string | `"jitsi-opendesk-jitsi"` | Regex which identifies jobs belonging to jitsi by name |
| config.jitsi.selectors.pods | string | `"jitsi-.*|opendesk-jitsi-.*"` | Regex which identifies pods belonging to jitsi by name |
| config.jitsi.selectors.pvcs | string | `"prosody-data-jitsi-.+"` | Regex which identifies persistent volume claims belonging to jitsi by name |
| config.nextcloud.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all nextcloud related alerts |
| config.nextcloud.additionalAlertLabels | object | `{}` | Additional custom labels to add to all nextcloud related alerts |
| config.nextcloud.enabled | bool | `true` | Enable alerts for nextcloud |
| config.nextcloud.namespace | string | `""` | Namespace in which nextcloud is deployed; defaults to this helm charts namespace. |
| config.nextcloud.selectors.endpoints | string | `"minio|opendesk-nextcloud-aio"` | Regex which identifies endpoints belonging to nextcloud by name |
| config.nextcloud.selectors.jobs | string | `"opendesk-nextcloud-.+"` | Regex which identifies jobs belonging to nextcloud by name |
| config.nextcloud.selectors.pods | string | `"opendesk-nextcloud-aio.*|open-xchange-nextcloud-.*"` | Regex which identifies pods belonging to nextcloud by name |
| config.nextcloud.selectors.pvcs | string | `"minio"` | Regex which identifies persistent volume claims belonging to nextcloud by name |
| config.nubus.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all nubus related alerts |
| config.nubus.additionalAlertLabels | object | `{}` | Additional custom labels to add to all nubus related alerts |
| config.nubus.enabled | bool | `true` | Enable alerts for nubus |
| config.nubus.namespace | string | `""` | Namespace in which nubus is deployed; defaults to this helm charts namespace. |
| config.nubus.selectors.endpoints | string | `"ums-.+"` | Regex which identifies endpoints belonging to nubus by name |
| config.nubus.selectors.jobs | string | `"ums-.+|opendesk-keycloak-.+"` | Regex which identifies jobs belonging to nubus by name |
| config.nubus.selectors.pods | string | `"ums-.+"` | Regex which identifies pods belonging to nubus by name |
| config.nubus.selectors.pvcs | string | `".+-ums-.+"` | Regex which identifies persistent volume claims belonging to nubus by name |
| config.openproject.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all OpenProject related alerts |
| config.openproject.additionalAlertLabels | object | `{}` | Additional custom labels to add to all OpenProject related alerts |
| config.openproject.enabled | bool | `true` | Enable alerts for OpenProject |
| config.openproject.namespace | string | `""` | Namespace in which OpenProject is deployed; defaults to this helm charts namespace. |
| config.openproject.selectors.endpoints | string | `"openproject"` | Regex which identifies endpoints belonging to OpenProject by name |
| config.openproject.selectors.jobs | string | `"opendesk-openproject-.+"` | Regex which identifies jobs belonging to OpenProject by name |
| config.openproject.selectors.pods | string | `"openproject-.+"` | Regex which identifies pods belonging to OpenProject by name |
| config.openproject.selectors.pvcs | string | `"openproject-.+"` | Regex which identifies persistent volume claims belonging to OpenProject by name |
| config.oxAppSuite.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all OpenXChange related alerts |
| config.oxAppSuite.additionalAlertLabels | object | `{}` | Additional custom labels to add to all OpenXChange related alerts |
| config.oxAppSuite.enabled | bool | `true` | Enable alerts for OpenXChange |
| config.oxAppSuite.namespace | string | `""` | Namespace in which OpenXChange is deployed; defaults to this helm charts namespace. |
| config.oxAppSuite.selectors.endpoints | string | `"open-xchange-.+"` | Regex which identifies endpoints belonging to OpenXChange by name |
| config.oxAppSuite.selectors.jobs | string | `"opendesk-open-xchange-.+"` | Regex which identifies jobs belonging to OpenXChange by name |
| config.oxAppSuite.selectors.pods | string | `"open-xchange.*|ox-connector.*|opendesk-open-xchange-.*"` | Regex which identifies pods belonging to OpenXChange by name |
| config.oxAppSuite.selectors.pvcs | string | `"ox-.+"` | Regex which identifies persistent volume claims belonging to OpenXChange by name |
| config.services.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all shared opendesk services related alerts |
| config.services.additionalAlertLabels | object | `{}` | Additional custom labels to add to all shared opendesk services related alerts |
| config.services.enabled | bool | `true` | Enable alerts for shared opendesk services |
| config.services.namespace | string | `""` | Namespace in which shared opendesk services are deployed; defaults to this helm charts namespace. |
| config.services.selectors.endpoints | string | `"clamav-.+|intercom-service|mariadb|memcached|minio|postfix|postgresql|redis-.+"` | Regex which identifies endpoints belonging to shared opendesk services by name |
| config.services.selectors.jobs | string | `"mariadb-bootstrap|minio-provisioning|postgresql-bootstrap"` | Regex which identifies jobs belonging to shared opendesk services by name |
| config.services.selectors.pods | string | `"clamav-.+|intercom-service-.+|mariadb-.+|memcached-.+|minio-.+|postfix-.+|postgresql-.+|redis-.+"` | Regex which identifies pods belonging to shared opendesk services by name |
| config.services.selectors.pvcs | string | `"clamav-.+|data-mariadb-.+|data-postgresql-.+|dovecot|minio|postfix"` | Regex which identifies persistent volume claims belonging to shared opendesk services by name |
| config.xwiki.additionalAlertAnnotations | object | `{}` | Additional custom annotations to add to all xwiki related alerts |
| config.xwiki.additionalAlertLabels | object | `{}` | Additional custom labels to add to all xwiki related alerts |
| config.xwiki.enabled | bool | `true` | Enable alerts for xwiki |
| config.xwiki.namespace | string | `""` | Namespace in which xwiki is deployed; defaults to this helm charts namespace. |
| config.xwiki.selectors.endpoints | string | `"xwiki"` | Regex which identifies endpoints belonging to xwiki by name |
| config.xwiki.selectors.jobs | string | `""` | Regex which identifies jobs belonging to xwiki by name |
| config.xwiki.selectors.pods | string | `"xwiki-.+"` | Regex which identifies pods belonging to xwiki by name |
| config.xwiki.selectors.pvcs | string | `"xwiki-data-.+"` | Regex which identifies persistent volume claims belonging to xwiki by name |

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

{{/*
SPDX-FileCopyrightText: 2024 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
*/}}

{{/* 
	Renders additional alert labels based on config.global.additionalAlertLabels as well as context specific additionalAlertLabels .
	Expects a dictionary as argument in the form { globalCtx: …, localConfig: … } where globalCtx should be set to the global context of the containing template (i.e. `$` or `.`)
	and localConfig should be a part of values specific to the current opendesk component (e.g. `.config.matrix`).
*/}}
{{- define "opendesk-alerts.alertLabels" }}
{{- if .globalCtx.Values.config.global.additionalAlertLabels }}
{{- include "common.tplvalues.render" ( dict "value" .globalCtx.Values.config.global.additionalAlertLabels "context" .globalCtx ) }}
{{- end }}
{{ if .localConfig.additionalAlertLabels }}
{{- include "common.tplvalues.render" ( dict "value" .localConfig.additionalAlertLabels "context" .globalCtx ) }}
{{- end }}
{{- end }}

{{/* 
	Renders additional alert annotations based on config.global.additionalAlertAnnotations as well as context specific additionalAlertAnnotations.
	Expects a dictionary as argument in the form { globalCtx: …, localConfig: … } where globalCtx should be set to the global context of the containing template (i.e. `$` or `.`)
	and localConfig should be a part of values specific to the current opendesk component (e.g. `.config.matrix`).
*/}}
{{- define "opendesk-alerts.alertAnnotations" }}
{{- if .globalCtx.Values.config.global.additionalAlertAnnotations }}
{{- include "common.tplvalues.render" ( dict "value" .globalCtx.Values.config.global.additionalAlertAnnotations "context" .globalCtx ) }}
{{- end }}
{{ if .localConfig.additionalAlertAnnotations }}
{{- include "common.tplvalues.render" ( dict "value" .localConfig.additionalAlertAnnotations "context" .globalCtx ) }}
{{- end }}
{{- end }}

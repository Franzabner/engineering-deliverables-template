# Release-Readiness Claim Gate Template

Status: scaffolded
Publication state: public scaffold
Release state: not released

## Purpose

This template defines public-safe claim gates for model-card, dataset-card, report, and Space-card style deliverables.

It is a template only. It does not represent an external artifact, hosted card, deployment, production use, customer use, or completed proof.

## Claim Gate Table

| Gate | Scaffold language | Human review required before |
| --- | --- | --- |
| Artifact existence | Template only. | Any statement that an artifact exists outside this repo. |
| Data rights | Rights review required. | Any publication of a dataset, corpus, or derived data card. |
| Model artifact | No model file represented. | Any publication of weights, adapters, model identifiers, or run-specific details. |
| Evaluation | No output value represented. | Any score, ranking, measured value, trace, or evaluated comparison. |
| External surface | No external card activity represented. | Any external metadata, hosted page, or release-surface link. |
| Use claim | No deployment, production, customer, or client use represented. | Any public claim about operational use or outcomes. |

## Required Exclusions

Do not include private corpora, private workloads, customer data, Foundation-private data, model paths, prompts, weights, adapters, run logs, raw traces, measured values, release metadata, credentials, endpoints, topology, production procedures, or active client deliverables.

## Review Rule

If a deliverable moves beyond template posture, stop and route it through public-boundary, rights, privacy, and claim-language review before publication.

# @commonkads/knowledge-examples

> **Disclaimer:** This project is an independent open-source software implementation inspired by the CommonKADS knowledge engineering methodology (Schreiber et al.). It is not affiliated with or endorsed by the original methodology authors or any third-party trademark holders.

Example knowledge domains for the CommonKADS engine. Each subdirectory is a
self-contained domain: knowledge files (YAML ontology, Markdown rules) that the
engine loads at runtime, without any code changes.

## Domains

| Domain | PSM | Description |
|---|---|---|
| `knowledge/vital-signs/` | Assessment | Vital signs validity assessment for clinical data |
| `knowledge/car-diagnosis/` | Diagnosis (Causal Covering) | Fault diagnosis for automotive systems |
| `knowledge/server-monitoring/` | Monitoring | Threshold-based monitoring for server metrics |
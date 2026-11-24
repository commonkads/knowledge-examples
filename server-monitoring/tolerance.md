# Server Health Tolerance Model

Defines the severity tiers and their operational meaning.

## Severity levels

### Normal

The metric is within its expected operating range. No action required.

### Warning

The metric has exceeded the warning threshold but not the breach threshold.

- **Action**: Investigate the trend. If the value is rising, plan remediation
  before it reaches Breach. Alert the on-call engineer for awareness.
- **SLA impact**: None immediately, but degradation is possible within minutes
  to hours if the trend continues.

### Breach

The metric has exceeded the breach threshold.

- **Action**: Immediate investigation required. Page the on-call engineer.
  Begin incident response if application metrics (error rate, latency) are
  also elevated.
- **SLA impact**: Likely. Users may already be experiencing degraded service.

## Overall verdict rules

- **Normal**: All metrics are Normal.
- **Warning**: At least one metric is Warning and none are Breach.
- **Breach**: At least one metric is Breach, regardless of other metric states.

## Escalation notes

- A single Breach on `HttpErrorRatePercent` or `HttpP99LatencyMs` is user-impacting
  and should always trigger an incident, even if all infrastructure metrics are Normal
  (possible application bug or downstream dependency failure).
- Simultaneous Breach on CPU, memory, and latency strongly suggests resource exhaustion;
  the immediate mitigation is to scale horizontally or shed load.
- Disk at Breach level (`DiskUsagePercent > 90%`) should be treated as critical because
  it can cause cascading failures (log writes fail → process crashes → total outage).

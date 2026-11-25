# Server Health Abstraction Rules

Use these rules to interpret raw metric values before comparing them against norms.

## CPU

- Evaluate `CpuUsagePercent` directly against the warning/breach thresholds in the norms.
- Evaluate `LoadAverage1m` relative to `CpuCores` (provided in the observation payload):
  - Warning when `LoadAverage1m > CpuCores`
  - Breach when `LoadAverage1m > 2 * CpuCores`
- High load with low CPU usage suggests I/O wait is the bottleneck — check `DiskIoWaitPercent`.

## Memory

- Evaluate `MemoryUsagePercent` directly. If `SwapUsagePercent` is provided and non-zero,
  treat it as an aggravating factor: lower the effective breach threshold by 5 percentage
  points (i.e. breach at 85% if swap is active, 90% if not).

## Disk

- Evaluate `DiskUsagePercent` and `DiskIoWaitPercent` independently against their thresholds.
- High `DiskIoWaitPercent` with low `DiskUsagePercent` suggests throughput saturation
  (many small writes) rather than capacity exhaustion.

## Network

- Evaluate `NetworkRxMbps` and `NetworkTxMbps` against `NetworkCapacityMbps` if provided:
  - Warning when throughput exceeds 70% of capacity.
  - Breach when throughput exceeds 90% of capacity.
- If `NetworkCapacityMbps` is not provided, report the raw values as Normal unless
  the application error rate or latency is also elevated.

## Application

- Evaluate `HttpErrorRatePercent` and `HttpP99LatencyMs` directly.
- A Breach on either metric should be highlighted as user-impacting regardless of
  the underlying infrastructure metrics.
- If both latency and error rate are elevated, the likely cause is resource exhaustion
  (CPU, memory, or disk) — cross-reference those metrics.

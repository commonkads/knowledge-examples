# Car Fault Verification Model

For each candidate hypothesis, the criteria that **confirm**, **refute**, or leave it
**unverified** given the observed symptoms and abstracted indicators.

## Dead or Discharged Battery

- **Confirmed**: NoCrank AND (no interior lights OR very dim lights OR no dashboard power).
- **Refuted**: Lights are bright, OR engine cranks normally, OR a single loud click is heard
  (which points to starter motor, not battery).
- **Unverified**: NoCrank present but electrical state of lights/dash not reported.

## Faulty Starter Motor

- **Confirmed**: NoCrank AND lights are bright AND a single loud click is heard on key turn.
- **Refuted**: Engine cranks normally, OR lights are absent/dim (battery fault more likely).
- **Unverified**: NoCrank present but no information on lights or click sound.

## Failed Fuel Pump

- **Confirmed**: NoStart_Cranks AND no fuel smell AND no fuel pressure reported.
- **Refuted**: Engine fires (even roughly), OR fuel smell present, OR PoorAcceleration
  only at load without a start failure.
- **Unverified**: NoStart_Cranks present but fuel pressure/smell not reported.

## Fouled or Failed Spark Plugs

- **Confirmed**: (NoStart_Cranks OR RoughIdle OR PoorAcceleration) AND misfire on one
  or more cylinders confirmed, AND no fuel-delivery symptoms.
- **Refuted**: Engine starts and idles smoothly, OR fault is isolated to one cylinder
  with a known ignition coil failure.
- **Unverified**: RoughIdle or PoorAcceleration present but cylinder-specific data absent.

## Faulty Ignition Coil

- **Confirmed**: Single-cylinder misfire AND CheckEngineLight AND (RoughIdle OR
  NoStart_Cranks), with spark plugs recently serviced or confirmed good.
- **Refuted**: Multiple-cylinder misfires (suggests plugs or fuel), OR engine starts
  cleanly with no misfire.
- **Unverified**: CheckEngineLight only with no misfire or drivability symptom reported.

## Clogged Fuel Injector

- **Confirmed**: RoughIdle AND PoorAcceleration AND engine stumbles specifically
  under load, with fuel pressure normal.
- **Refuted**: Engine does not start at all (pump failure more likely), OR smooth idle
  with only high-load hesitation (may be fuel pressure).
- **Unverified**: PoorAcceleration only with no idle quality information.

## Vacuum Leak

- **Confirmed**: (RoughIdle OR Stalling at idle) AND (hissing sound present OR
  high idle speed) AND no fuel or ignition symptoms.
- **Refuted**: Fault is reproduced only under load (not at idle), OR all intake
  hoses/gaskets confirmed intact.
- **Unverified**: RoughIdle present but no information on idle speed or audible hiss.

## Faulty Mass Airflow Sensor

- **Confirmed**: (RoughIdle OR Stalling OR PoorAcceleration) AND CheckEngineLight AND
  (black smoke from exhaust OR erratic fuel trims reported).
- **Refuted**: Smooth idle and no CheckEngineLight, OR symptoms resolve immediately
  after disconnecting MAF (engine runs better without it — classic MAF fault sign).
- **Unverified**: Stalling and CheckEngineLight present but no exhaust or fuel-trim data.

## Low Coolant or Coolant Leak

- **Confirmed**: Overheating AND (visible coolant puddle under vehicle OR coolant warning
  light illuminated OR reservoir level visibly low).
- **Refuted**: Coolant level confirmed full and no visible leak.
- **Unverified**: Overheating present but coolant level not checked.

## Faulty Thermostat

- **Confirmed**: Overheating AND temperature climbs quickly then stabilises near red zone
  AND coolant level is full AND no visible leak.
- **Refuted**: Coolant loss evident (leak more likely), OR temperature rises very slowly
  (fan or radiator blockage more likely).
- **Unverified**: Overheating present but temperature behaviour pattern not described.

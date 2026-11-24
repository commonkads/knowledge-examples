# Abstraction - Vital Signs Assessment

Derive the following value(s) from the case data before evaluation:

- `TemperatureDeviationFromNormal` = absolute value of (Temperature - 37.0)
  Omit this value from your output if Temperature is null - it cannot be
  derived.

Return a JSON object containing exactly the derived value(s) you were able
to compute, keyed by name.

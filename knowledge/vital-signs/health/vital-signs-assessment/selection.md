# Selection - Vital Signs Assessment

This is an illustrative, reduced rule set - not a substitute for real
clinical guidelines.

A norm is excluded from evaluation for a given reading when:

- It is marked `skipWhen` for a patient type that doesn't match
  `PatientType` (e.g. the pediatric-specific heart rate norm is skipped for
  adults, and the adult-only respiratory tolerance norm is skipped for
  pediatric patients).
- It applies only during pregnancy and `IsPregnant` is not true.
- It depends on `PreviousVitals` and none was supplied.
- It depends on a derived value that could not be computed (e.g.
  `TemperatureDeviationFromNormal` when `Temperature` is null).

The applicable norm subset for the current reading is computed
deterministically before evaluation; the LLM only ever evaluates norms
that have already been selected as applicable.

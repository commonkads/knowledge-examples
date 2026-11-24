# Car Fault Abstraction Rules

Use these rules to interpret raw observations into the diagnostic concepts
the fault model evaluates.

## Cranking behaviour

- **NoCrank**: No cranking sound when the ignition is activated. Interior electrics
  (lights, dashboard) may or may not be present. This is always an electrical supply
  or starter motor fault — the engine has not attempted to turn over.
- **CranksNoStart**: The starter motor audibly turns the engine over at normal speed
  (healthy cranking sound) but the engine does not fire. Fuel, ignition, or sensor
  fault; the battery and starter are functioning.
- **StartsRough**: The engine fires but runs unevenly, surges, or misfires.

## Electrical indicators

- Headlights or interior lights **very dim or absent** during NoCrank → low battery
  voltage; Dead Battery is strongly indicated.
- Headlights **bright but single loud click** during NoCrank → starter solenoid
  receiving power but not engaging; Faulty Starter Motor is strongly indicated.
- **CheckEngineLight on** → a DTC is stored. Without an OBD-II code, treat as
  corroborating evidence for sensor-related hypotheses (MAF, ignition coil).

## Fuel indicators

- **No fuel smell** during NoStart_Cranks → fuel is not reaching the engine;
  Failed Fuel Pump or Clogged Injectors are candidates.
- **Strong fuel smell** → possible flooded engine or injector stuck open.
- **Poor acceleration under load only** (fine at idle) → usually a fuel-delivery or
  injector fault rather than ignition.

## Air / vacuum indicators

- **Hissing sound** from the engine bay → vacuum leak confirmed until disproved.
- **High idle speed** (above ~1000 rpm at warm idle) → unmetered air entering
  intake; Vacuum Leak or Faulty MAF are the primary hypotheses.
- **Rough at idle, smooth at higher rpm** → usually vacuum leak or idle control fault.

## Cooling indicators

- Temperature gauge rising into the **red zone** → Overheating confirmed.
- **Steam from bonnet** or sweet smell → coolant boiling; Low Coolant or Coolant Leak.
- Temperature climbs quickly then **stabilises at high level** → Thermostat stuck closed.
- Temperature climbs **slowly then spikes** → may be blocked radiator or failed fan.

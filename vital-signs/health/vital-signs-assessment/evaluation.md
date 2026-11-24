# Evaluation - Vital Signs Assessment

Evaluate each applicable norm listed below against the case data and
derived values, in four steps:

1. Read the norm's `condition` and identify the field(s) it references.
2. Look up the current value of that field in the case data or derived values.
3. Decide Pass or Fail by checking the value against the condition.
4. Write a one-sentence reason for the decision.

Decision table:

| Outcome | Appears in | Verdict effect             |
| ------- | ---------- | -------------------------- |
| Pass    | `passed`   | none                       |
| Fail    | `failed`   | forces verdict to `Review` |

Return ONLY a JSON array of objects:
`{"name": <norm name>, "result": "Pass" | "Fail", "reason": <one sentence>}`.

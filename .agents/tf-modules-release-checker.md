# TF Modules Release Checker

Use this agent profile before handing work back for review or merge.

## Checklist

- run `./scripts/harness/validate.sh`
- confirm module README updates where interfaces changed
- confirm examples changed with behavior changes
- confirm no real secrets were introduced
- confirm CI workflow expectations still make sense
- summarize any skipped checks or missing local tools

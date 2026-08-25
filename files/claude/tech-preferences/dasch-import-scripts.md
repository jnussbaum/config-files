# DaSCH Import-Script Repos

Applies to repos whose directory name matches `[A-Z0-9]{4}-.+-scripts` (e.g. `085F-street-art-scripts`).
These are DaSCH script repos which preprocess customer/research data into DSP XML.

- The **JSON project data model file** (`project.json` or similar) is almost always **generated** from Excel files
  under `data/input/data_model/`. NEVER edit that JSON file directly — edit the Excel source, then
  regenerate with `dsp-tools excel2json <data_model_folder> <output.json>`.
- **Branch rules**: These repos almost never have branch protection, so commit directly to `main`; 
  do not create a feature branch.
- **Push rule**: Always push to remote after committing to `main`. Keeps local and remote main synchronized.
  Exception: `0854-daschland-scripts` (a.k.a. `daschland-scripts`) uses PR workflow so does not need 
  this immediate-push rule.
- **Branch rule exception:** `0854-daschland-scripts` (a.k.a. `daschland-scripts`): despite matching the naming
  pattern, this one uses branch protection and PR review like a normal repo, so follow the general
  rule there (branch + PR), not the DaSCH-script-repos exception.
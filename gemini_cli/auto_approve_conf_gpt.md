That prompt is coming from Gemini CLI’s **tool execution safety layer**—it’s intentionally asking before running shell commands like `npm install`. There isn’t a universal “turn off all prompts” flag exposed in every version, but there are a few ways people typically avoid the repeated **auto-approve prompt** depending on how you’re using it.

### 1) Use auto-approve / non-interactive mode (if supported)

Recent versions of Gemini CLI include flags like:

```bash
gemini --auto-approve
```

or

```bash
gemini --yes
```

This tells the CLI to **skip confirmation prompts** and execute suggested shell commands automatically.

> If that flag doesn’t exist in your version, run:

```bash
gemini --help
```

and look for anything like `--auto`, `--y`, `--approve`, or `--dangerously-allow`.

---

### 2) Configure a default policy

Some builds support a config file (often `.gemini/config.json` or similar). Look for a setting like:

```json
{
  "allowShell": true,
  "autoApprove": true
}
```

If present, this makes approvals persistent instead of per-command.

---

### 3) Use a trusted project mode

In some environments, Gemini CLI treats directories as “trusted.” Once trusted, it may stop prompting for common commands like `npm install`.

Typical pattern:

```bash
gemini trust .
```

---

### 4) Pipe commands manually (workaround)

If you just want to avoid the prompt entirely:

```bash
npm install && npx playwright install chromium
```

Run it yourself instead of letting Gemini execute it.

---

### 5) Why the prompt exists (important)

Gemini CLI is deliberately cautious because commands like:

* `npm install`
* `npx ...`
* arbitrary shell scripts

can execute **remote code**. Auto-approving everything can be risky, especially in unfamiliar repos.

---

### Bottom line

* Try `--auto-approve` / `--yes` first
* If not available, check config or “trusted project” features
* Otherwise, manual execution is the safest fallback

---

If you want, tell me your Gemini CLI version (`gemini --version`) and I can give the exact flag for that build.

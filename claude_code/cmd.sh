#---------------------------------------------------------------------------------------------------------------------------
#  Claude code video course
#   
#   - https://anthropic.skilljar.com/claude-code-in-action/303237
#   - https://learn.deeplearning.ai/courses/claude-code-a-highly-agentic-coding-assistant/
#---------------------------------------------------------------------------------------------------------------------------

# 0. init (will generate a new CLAUDE.md based on project scan)
/init 

# 1. stop/interrupt

esc

# 2. Add memory (# <things to ask claude code to remember)

# <things to remember>

# 3. revert to prev msg

esc +  esc

# 4. Mention a file 

@ <file_name>

# 4-1 planning mode
# enable with
shift + tab    shift + tab 


# 5. Summary the current session as a single message so that next one can use 

/compact

# 6. Clear previous msg

/clear

# 7. custom cmd

# create a new file:   `.claude/commands`
# under the  `.claude/commands` create `audit.md`
# run: (restart and open claude CLI): /audit


# 8. Claude code MCP server
# https://anthropic.skilljar.com/claude-code-in-action/303239
# https://learn.deeplearning.ai/courses/claude-code-a-highly-agentic-coding-assistant/lesson/zzhtb/adding-features

claude mcp add <mcp_server>

claude mcp add playwright npx @playwright/mcp@latest


# 9. Hooks
# https://anthropic.skilljar.com/claude-code-in-action/312000
# Global - ~/.claude/settings.json (affects all projects)
# Project - .claude/settings.json (shared with team)
# Project (not committed) - .claude/settings.local.json (personal settings)

# https://anthropic.skilljar.com/claude-code-in-action/312002
# https://anthropic.skilljar.com/claude-code-in-action/312423

# 10. skip `minor confirmation`
# https://youtu.be/n7iT5r0Sl_Y?si=GRbBUTyrYvV176hW&t=154
claude --dangerously-skip-permissions

# 11. paste pic
# copy pic, then go to claude code CLI
ctrl + v

# 12. go to prev sessions
# (NOT in claude code CLI, but in the terminal)
claude --resume

# 13. claude code VS code plugin


# 14. git worktree
# so 2 claude code can work on seperated isolcated code env, do changes
# then merge result later on
# https://learn.deeplearning.ai/courses/claude-code-a-highly-agentic-coding-assistant/lesson/oo58a/adding-multiple-features-simultaneously

mkdir .trees

git worktree add .trees/ui_feature
git worktree add .trees/testing_feature

# 15. Claude code + github integration
# auto code review, issue -> PR, ....
# https://learn.deeplearning.ai/courses/claude-code-a-highly-agentic-coding-assistant/lesson/nngi6/exploring-github-integration-&-hooks

# 16. hooks
# https://learn.deeplearning.ai/courses/claude-code-a-highly-agentic-coding-assistant/lesson/nngi6/exploring-github-integration-&-hooks


# 17. turn on / off `plan` mode

Shift + Tab

# 18. shift, tab in macbook?
# https://github.com/yennanliu/utility_shell/blob/master/doc/pic/shift_tab_macbook.png
# https://www.google.com/search?q=where+is+Shift%2BTab+in+macbook+%3F&oq=where+is+Shift%2BTab+in+macbook+%3F&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQIRigATIHCAIQIRigATIHCAMQIRigATIHCAQQIRiPAjIHCAUQIRiPAtIBCDU5NTNqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8

 Shift (\(\Uparrow \)) 
 Tab (\tab)

# 19. auto all allow in interactive mode

# 1. --allowedTools Flag (CLI)

# claude -p "Your task" --allowedTools "Bash,Read,Edit"
# This allows Claude to execute specified tools without prompting for permission.

# 2. Auto-Accept Mode (Interactive)

# Press Shift+Tab repeatedly to cycle through permission modes until you reach "auto-accept"
# mode. This allows immediate execution without confirmations.

# ⚠️ Important Warnings

# - Use with extreme caution - Claude will execute operations immediately, including
# potentially destructive commands
# - Scope permissions narrowly - Only allow specific tools needed:
# --allowedTools "Bash(git diff *),Bash(git status *),Read"
# - Configure deny lists in settings to prevent dangerous operations:
# {
#   "permissions": {
#     "allow": ["Bash(git *)", "Read"],
#     "deny": ["Bash(rm *)"]
#   }
# }

# 20. change using model in Claude code

 # 1. Command line flag when starting:
 # claude --model haiku
 # # or
 # claude --model claude-3-5-haiku-latest
 # 2. During session - use the /model command:
 # /model haiku
 # 3. Settings file - edit ~/.claude/settings.json:
 # {
 #   "model": "claude-3-5-haiku-latest"
 # }

 # The available options are:
 # - haiku / claude-3-5-haiku-latest - Fastest, cheapest
 # - sonnet / claude-sonnet-4-20250514 - Balanced
 # - opus / claude-opus-4-20250514 - Most capable

# ---  Claude models are usually grouped into three tiers:
# Opus – most powerful / highest reasoning
# Sonnet – balanced performance and speed
# Haiku – fastest and cheapest model

# https://github.com/yennanliu/ai_experiment/blob/main/courses/doc/pic/claude_models.png

 # For the task we just did (implementing a module with multiple files), Opus was
 # appropriate. For simpler tasks like quick edits or translations, Haiku would save costs.


# 21 /simplify

# 🔍 官方的 /simplify 原本是怎麼用的？
# 根據 Anthropic 官方文件，/simplify 是 Claude Code 內建的一個強大 Skill。它的原始設計是「在程式碼寫完之後」使用的工具。
# 當你修改完檔案，輸入 /simplify，它會自動呼叫三個平行的 Agent 幫你 Review 剛剛改過的 Code，抓出重複邏輯、提升品質與效率，並自動修復。簡單來說，它官方的定位是一個「事後清理與重構」的幫手。
# 💡 突破盲點的駭客玩法：把 /simplify 往前挪！
# 既然它具備強大的簡化與 Review 能力，為什麼不拿來審查計畫本身？
# 當 Claude 在 Plan Mode 準備執行那份龐大計畫時，不要急著放行，直接輸入：
# use /simplify to check if the plan is sound


## 22
# Claude Code 新增功能：自動模式。
# 自動模式不會像傳統模式一樣逐一批准檔案寫入和 bash 命令，或完全跳過權限檢查，而是讓 Claude 代表你做出權限決定。
# 每個操作在執行前都會經過安全檢查。
# https://www.bnext.com.tw/article/90416/claude-code-auto-mode

claude --enable-auto-mode

# 23
# Claude Code 的 skill-creator 是 Anthropic 推出的元技能（meta-skill），讓用戶透過自然語言「教導」Claude 建立、優化和封裝特定的自動化工作流程（Skills
# https://github.com/yennanliu/til/blob/master/README.md#20260329
/skill-creator


# 24 APU usage quota / monitoring page
https://claude.ai/settings/usage

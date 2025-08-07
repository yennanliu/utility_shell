#-------------------------------------------------------------
#  Claude code video course
#   
#   - https://anthropic.skilljar.com/claude-code-in-action/303237
#   - https://learn.deeplearning.ai/courses/claude-code-a-highly-agentic-coding-assistant/
#-------------------------------------------------------------

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


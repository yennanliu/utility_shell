#-------------------------------------------------------------
#  Claude code video course
#   
#   - https://anthropic.skilljar.com/claude-code-in-action/303237
#-------------------------------------------------------------


# 1. stop/interrupt

esc

# 2. Add memory

#

# 3. revert to prev msg

esc +  esc

# 4. Mention a file

@<file_name>


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

# 10. 
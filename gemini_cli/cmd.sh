# 1. YOLO mode (similar as claude --dangerously-skip-permissions)
# V1
gemini --yolo
# OR
gemini --approval-mode=yolo

# V2
gemini --approval-mode=yolo --allowed-tools shell_exec,file_write,file_read,list_directory

gemini --approval-mode=yolo --auto-edit

# 1) tmux ref
# https://blog.darkthread.net/blog/tmux/?fbclid=IwAR2TSuzKnqrp_6tZmD_6VZPT83valr_a16RBWD7Kg2wtdsd9FY8mBLYt_9cg
"""
而要做到離線後繼續執行，靠的是最後一個「Ctrl+b、d」(Detach)快速鍵，按下後會退出 tmux 畫面回到 Shell，此時工作階裡的程式會繼續執行，不受退出 Shell、登出 ssh 影響。

若要接回 tmux 工作階段，使用 tmux ls 查詢卸離中的工作階段，tmux a 或 tmux a -t Session編號 回到 tmux 工作階段，就這麼簡單。
"""

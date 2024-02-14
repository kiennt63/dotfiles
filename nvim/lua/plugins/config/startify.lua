local g = vim.g

g.startify_lists = {
    { type = "sessions",  header = { "   Sessions" } },
    { type = "commands",  header = { "    Commands" } },                -- Commands from above
    { type = "dir",       header = { "    MRU " .. vim.fn.getcwd() } }, -- MRU files from CWD
    { type = "bookmarks", header = { "   Bookmarks" } },
}

g.startify_session_number = 10
g.startify_session_autoload = 1
g.startify_session_persistence = 1
g.startify_session_delete_buffers = 0

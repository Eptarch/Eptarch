vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>") -- leave insert mode on jk

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>") -- remove highlight when searching for terms

keymap.set("n", "x", '"_x') -- do not copy on single character delete

keymap.set("n", "<leader>+", "<C-a>") -- increment numbers in normal mode
keymap.set("n", "<leader>-", "<C-x>") -- decrement numbers in normal mode

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horisontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sc", "<cmd>close<CR>") -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- go to previous tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>") -- close current tab

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>") -- maximize split window and restore it to the original size

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<CR>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>") -- mapping to restart lsp if necessary

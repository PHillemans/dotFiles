local telescope = require('telescope.builtin')

local M = {}

function M.gitfiles()
    telescope.git_files()
end

function M.words()
    telescope.live_grep()
end

function M.files()
    telescope.find_files{}
end

function M.editGitfiles()
    telescope.find_files {
        cwd = "~/.config/nvim";
        height = 10;
    }
end

return M

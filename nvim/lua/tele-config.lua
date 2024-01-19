local telescope = require'telescope'

telescope.setup {
    extensions = {
        ["ui-select"] = {
            require('telescope.themes').get_dropdown{}
        },
        file_browser = {
            mappings = {
                ["i"] = {
                    ["<C-e>"] = telescope.extensions.file_browser.actions.create
                },
                ["n"] = {
                    ["<C-e>"] = telescope.extensions.file_browser.actions.create
                }
            }
        },
        project = {
			on_project_selected = function(prompt_bufnr)
				telescope._extensions.projects.actions.project_actions.change_working_directory(prompt_bufnr, false)
			end
        }
    }
}

telescope.load_extension"file_browser"
telescope.load_extension"projects"
telescope.load_extension"ui-select"

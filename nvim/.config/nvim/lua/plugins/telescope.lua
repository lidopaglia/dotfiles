-- https://github.com/nvim-telescope/telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-symbols.nvim",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },

    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          mappings = {
            i = {
              ["<C-w>"] = "delete_buffer",
            },
            n = {
              ["<C-w>"] = "delete_buffer",
            },
          },
        },
        -- https://gitter.im/nvim-telescope/community?at=6113b874025d436054c468e6 Fabian David Schmidt
        find_files = {
          on_input_filter_cb = function(prompt)
            local find_colon = string.find(prompt, ":")
            if find_colon then
              local ret = string.sub(prompt, 1, find_colon - 1)
              vim.schedule(function()
                local prompt_bufnr = vim.api.nvim_get_current_buf()
                local picker = action_state.get_current_picker(prompt_bufnr)
                local lnum = tonumber(prompt:sub(find_colon + 1))
                if type(lnum) == "number" then
                  local win = picker.previewer.state.winid
                  local bufnr = picker.previewer.state.bufnr
                  local line_count = vim.api.nvim_buf_line_count(bufnr)
                  vim.api.nvim_win_set_cursor(win, { math.max(1, math.min(lnum, line_count)), 0 })
                end
              end)
              return { prompt = ret }
            end
          end,
          attach_mappings = function()
            actions.select_default:enhance({
              post = function()
                -- if we found something, go to line
                local prompt = action_state.get_current_line()
                local find_colon = string.find(prompt, ":")
                if find_colon then
                  local lnum = tonumber(prompt:sub(find_colon + 1))
                  vim.api.nvim_win_set_cursor(0, { lnum, 0 })
                end
              end,
            })
            return true
          end,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "[F]ind [P]roject (git)" })
    vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "[F]ind [T]odos" })
    vim.keymap.set("n", "<leader>fe", builtin.symbols, { desc = "[F]ind [E]moji" })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[F]ind [/] in Open Files" })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set("n", "<leader>ec", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config"), file_ignore_patterns = { ".git/" }, hidden = true })
    end, { desc = "[E]ditor [C]onfig" })

    vim.keymap.set("n", "<leader>fa", function()
      builtin.find_files({ follow = true, no_ignore = true, hidden = true, file_ignore_patterns = { ".git/" } })
    end, { desc = "[F]ind [A]ll files" })
  end,
}

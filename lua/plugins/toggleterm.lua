
return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            local toggleterm = require("toggleterm")
            toggleterm.setup({
                size = 20,
                direction = "horizontal",
                persist_size = true,
                start_in_insert = true,
            })

            local Terminal = require('toggleterm.terminal').Terminal
            local my_terminal = Terminal:new({
                hidden = true,
                close_on_exit = true,
            })

            function _G.toggle_my_terminal()
                my_terminal:toggle()
                if my_terminal:is_open() then
                    vim.cmd("startinsert")
                end
            end

            vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua toggle_my_terminal()<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n><cmd>lua toggle_my_terminal()<CR>", { noremap = true, silent = true })

            -- Automatically delete terminal buffers on close to prevent blocking :wqa
            vim.api.nvim_create_autocmd("TermClose", {
                pattern = "*",
                callback = function()
                    local bufnr = vim.fn.expand("<abuf>")
                    if vim.api.nvim_buf_is_valid(bufnr) then
                        vim.api.nvim_buf_delete(bufnr, { force = true })
                    end
                end,
            })
        end
    }
}

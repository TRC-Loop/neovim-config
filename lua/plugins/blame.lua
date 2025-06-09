return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  config = function()
    vim.g.gitblame_enabled = 1
    vim.g.gitblame_message_template = " <summary> • <date> • <author> • <<sha>>"
    vim.g.gitblame_date_format = '%Y-%m-%d'
  end,
}

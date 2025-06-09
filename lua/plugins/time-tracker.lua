return {
  {
    "ptdewey/pendulum-nvim",
    event = "BufEnter",
    config = function()
      require("pendulum").setup({
        timeout_len = 180,    -- seconds idle before pausing
        timer_len = 120,      -- polling interval
        gen_reports = true,   -- enable reports
      })
    end,
  },
}

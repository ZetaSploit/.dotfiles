return {
  "gen740/SmoothCursor.nvim",
  config = function()
    require("smoothcursor").setup({
      cursor = "",
      texthl = "Cursor",
      linehl = nil,
      fancy = {
        enable = false,
      },

      speed = 9999,
      intervals = 1,

      priority = 10,
    })

    if vim.g.neovide then
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_trail_size = 0
      vim.g.neovide_cursor_antialiasing = false

      vim.g.neovide_cursor_vfx_mode = ""
      vim.g.neovide_cursor_vfx_particle_lifetime = 0
      vim.g.neovide_cursor_vfx_particle_density = 0
      vim.g.neovide_cursor_vfx_particle_speed = 0

      vim.g.neovide_scroll_animation_length = 0
      vim.g.neovide_transparency = 0.0
      vim.g.neovide_background_color = "#1f1f1f"

      vim.opt.guicursor = {
        "n-v-c:block",
        "i-ci-ve:block",
        "r-cr:block",
        "o:block",
        "a:blinkwait0-blinkoff0-blinkon0",
      }

      vim.g.neovide_refresh_rate = 60

      vim.g.neovide_confirm_quit = true
    end
  end,
}

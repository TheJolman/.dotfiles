local bar = 'waybar'
local wallpaper = '~/.dotfiles/images/cherry-6.png'
local terminal = 'kitty'
local files = 'nautilus'
local menu = 'fuzzel'
local browser = 'firefox'

hl.on('hyprland.start', function()
  hl.exec_cmd(string.format(
    [[
    %s &
    nm-applet --indicator &
    blueman-applet &
    awww-daemon &
    awww img %s &
    upower-notify &
    batsignal
  ]],
    bar,
    wallpaper
  ))
end)

hl.config({
  general = {},

  input = {
    accel_profile = 'flat',
    -- drag_3fg = 3
  },

  group = {
    auto_group = false,
    groupbar = {},
  },

  misc = {
    disable_hyprland_logo = true,
  },

  ecosystem = {
    no_donation_nag = true,
  },
})

local function bind_opener(keys, program)
  hl.bind(keys, hl.dsp.exec_cmd(program))
end

bind_opener('SUPER + ENTER', terminal)
bind_opener('SUPER + B', browser)
bind_opener('SUPER + D', menu)
bind_opener('SUPER + E', files)

hl.gesture({
  fingers = 3,
  direction = 'horizontal',
  action = 'workspace',
})

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

hl.monitor({
  output = '',
  mode = 'preferred',
  position = 'auto',
  scale = 1,
})

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_szie = 3,
    resize_on_border = true,
    layout = 'dwindle',
  },
  dwindle = {
    preserve_split = true,
  },

  decoration = {
    rounding = 10,
  },

  input = {
    accel_profile = 'flat',
    kb_layout = 'us',
    follow_mouse = 1,
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

  animations = {
    enabled = true,
  },
})

local mod = 'SUPER'

local function bind_opener(keys, program)
  hl.bind(keys, hl.dsp.exec_cmd(program))
end

bind_opener(mod .. ' + ENTER', terminal)
bind_opener(mod .. ' + B', browser)
bind_opener(mod .. ' + D', menu)
bind_opener(mod .. ' + E', files)

-- Move focus with mainMod + arrow keys
hl.bind(mod .. ' + H', hl.dsp.focus({ direction = 'left' }))
hl.bind(mod .. ' + L', hl.dsp.focus({ direction = 'right' }))
hl.bind(mod .. ' + K', hl.dsp.focus({ direction = 'up' }))
hl.bind(mod .. ' + J', hl.dsp.focus({ direction = 'down' }))

-- Workspaces
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. ' + S', hl.dsp.workspace.toggle_special('magic'))
hl.bind(mainMod .. ' + SHIFT + S', hl.dsp.window.move({ workspace = 'special:magic' }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  'XF86AudioRaiseVolume',
  hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'),
  { locked = true, repeating = true }
)
hl.bind(
  'XF86AudioLowerVolume',
  hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),
  { locked = true, repeating = true }
)
hl.bind(
  'XF86AudioMute',
  hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'),
  { locked = true, repeating = true }
)
hl.bind(
  'XF86AudioMicMute',
  hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'),
  { locked = true, repeating = true }
)
hl.bind(
  'XF86MonBrightnessUp',
  hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%+'),
  { locked = true, repeating = true }
)
hl.bind(
  'XF86MonBrightnessDown',
  hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%-'),
  { locked = true, repeating = true }
)

-- Requires playerctl
hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'), { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl previous'), { locked = true })

hl.gesture({
  fingers = 3,
  direction = 'horizontal',
  action = 'workspace',
})

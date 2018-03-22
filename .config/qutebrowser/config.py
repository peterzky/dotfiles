# -*- mode: rainbow; mode: python; eval: (reopen-as-yadm); -*-
import platform
# machine independent settings
if platform.node() == "thinkpad":
    c.zoom.default = '125%'
    fontsize = '12'
else:
    c.zoom.default = '100%'
    fontsize = '12'
# qt settings
c.qt.args = ["--autoplay-policy=user-gesture-required"]

# settings
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}
c.bindings.key_mappings = {
    '<Ctrl-6>': '<Ctrl-^>',
    '<Ctrl-M>': '<Return>',
    '<Ctrl-J>': '<Return>',
    '<Shift-Return>': '<Return>',
    '<Enter>': '<Return>',
    '<Shift-Enter>': '<Return>',
    '<Ctrl-Enter>': '<Ctrl-Return>'
}
c.completion.quick = False
c.confirm_quit = ['never']

# proxy
c.content.proxy = 'http://127.0.0.1:3128'

c.editor.command = ['emacsclient', '-nc', '{file}']
c.fonts.completion.category = 'bold ' + fontsize + 'pt "Sarasa UI SC"'
c.fonts.completion.entry = fontsize + 'pt "Sarasa UI SC"'
c.fonts.debug_console = fontsize + 'pt "Sarasa UI SC"'
c.fonts.downloads = fontsize + 'pt "Sarasa UI SC"'
c.fonts.hints = 'bold ' + fontsize + 'pt "Sarasa UI SC"'
c.fonts.keyhint = fontsize + 'pt "Sarasa UI SC"'
c.fonts.messages.error = fontsize + 'pt "Sarasa UI SC"'
c.fonts.messages.info = fontsize + 'pt "Sarasa UI SC"'
c.fonts.messages.warning = fontsize + 'pt "Sarasa UI SC"'
c.fonts.prompts = fontsize + 'pt "Sarasa UI SC"'
c.fonts.statusbar = fontsize + 'pt "Sarasa UI SC"'
c.fonts.tabs = 'bold ' + fontsize + 'pt "Sarasa UI SC"'
c.hints.hide_unmatched_rapid_hints = True
c.hints.min_chars = 1
c.hints.mode = 'number'
c.hints.next_regexes = [
    '\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b',
    '\\bcontinue\\b', '\\下一页\\b', '\\下页\\b'
]
c.hints.prev_regexes = [
    '\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b',
    '\\b(<<|«)\\b', '\\上一页\\b', '\\上页\\b'
]
c.hints.scatter = True
c.hints.uppercase = False
c.history_gap_interval = 30
c.input.forward_unbound_keys = 'all'
c.input.insert_mode.auto_enter = True
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = False
c.input.insert_mode.plugins = False
c.input.links_included_in_focus_chain = False
c.input.partial_timeout = 5000
c.input.rocker_gestures = False
c.input.spatial_navigation = False
c.keyhint.blacklist = []
c.keyhint.delay = 500
c.keyhint.radius = 6
c.messages.timeout = 2000
c.prompt.filebrowser = True
c.prompt.radius = 8
c.scrolling.bar = False
c.scrolling.smooth = False
c.search.ignore_case = 'smart'
c.search.incremental = True
c.spellcheck.languages = []
c.statusbar.hide = False
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 0}
c.statusbar.position = 'bottom'
c.tabs.background = False
c.tabs.close_mouse_button = 'middle'
c.tabs.close_mouse_button_on_bar = 'new-tab'
c.tabs.favicons.scale = 1.0
c.tabs.favicons.show = True
c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}
c.tabs.indicator.width = 3
c.tabs.last_close = 'close'
c.tabs.mousewheel_switching = True
c.tabs.new_position.related = 'next'
c.tabs.new_position.unrelated = 'last'
c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}
c.tabs.position = 'top'
c.tabs.select_on_remove = 'last-used'
c.tabs.show = 'always'
c.tabs.show_switching_delay = 800
c.tabs.tabs_are_windows = False
c.tabs.title.alignment = 'left'
c.tabs.title.format = '{title}'
c.tabs.title.format_pinned = '{index}'
c.tabs.width = '20%'
c.tabs.wrap = False
c.tabs.mode_on_change = 'restore'
c.url.default_page = 'https://google.com/'
c.url.start_pages = 'https://google.com'

# colors
c.colors.completion.fg = "#D2D7D3"
c.colors.completion.category.fg = "#F2F2F2"
c.colors.completion.category.bg = "#555555"
c.colors.completion.item.selected.fg = "#222222"
c.colors.completion.item.selected.bg = "#E2B13C"
c.colors.completion.item.selected.border.top = "#333333"
c.colors.completion.item.selected.border.bottom = "#333333"
c.colors.completion.match.fg = "#C93756"
c.colors.statusbar.normal.fg = "#899CA1"
c.colors.statusbar.normal.bg = "#222222"
c.colors.statusbar.insert.fg = "#222222"
c.colors.statusbar.insert.bg = "#26A65B"
c.colors.statusbar.command.bg = "#555555"
c.colors.statusbar.command.fg = "#F0F0F0"
c.colors.statusbar.caret.bg = "#5E468C"
c.colors.statusbar.caret.selection.fg = "white"
c.colors.statusbar.progress.bg = "#333333"
c.colors.statusbar.passthrough.bg = "#4779B3"
c.colors.statusbar.url.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.url.success.http.fg = "#899CA1"
c.colors.statusbar.url.success.https.fg = "#53A6A6"
c.colors.statusbar.url.error.fg = "#8A2F58"
c.colors.statusbar.url.warn.fg = "#914E89"
c.colors.statusbar.url.hover.fg = "#2B7694"
c.colors.tabs.bar.bg = "#222222"
c.colors.tabs.even.fg = "#222222"
c.colors.tabs.odd.fg = "#222222"
c.colors.tabs.even.bg = "#ecf0f1"
c.colors.tabs.odd.bg = "#ecf0f1"
c.colors.tabs.selected.even.fg = "white"
c.colors.tabs.selected.even.bg = "#222222"
c.colors.tabs.selected.odd.fg = "white"
c.colors.tabs.selected.odd.bg = "#222222"
c.colors.tabs.indicator.start = "#222222"
c.colors.tabs.indicator.stop = "#222222"
c.colors.tabs.indicator.error = "#8A2F58"

# c.colors.hints.bg = "rgba(204,204,204,50%)"
# c.colors.hints.match.fg = "#000"

c.colors.downloads.start.fg = "black"
c.colors.downloads.start.bg = "#BFBFBF"
c.colors.downloads.stop.fg = "black"
c.colors.downloads.stop.bg = "#F0F0F0"
c.colors.keyhint.fg = "#FFFFFF"
c.colors.keyhint.suffix.fg = "#FFFF00"
c.colors.keyhint.bg = "rgba(0, 0, 0, 50%)"
c.colors.messages.error.bg = "#8A2F58"
c.colors.messages.error.border = "#8A2F58"
c.colors.messages.warning.bg = "#BF85CC"
c.colors.messages.warning.border = c.colors.messages.warning.bg
c.colors.messages.info.bg = "#333333"
c.colors.prompts.fg = "#333333"
c.colors.prompts.bg = "#DDDDDD"
c.colors.prompts.selected.bg = "#4779B3"

# search engines
c.url.searchengines['DEFAULT'] = 'https://www.google.com/search?q={}'
c.url.searchengines['a'] = 'https://wiki.archlinux.org/?search={}'
c.url.searchengines['aur'] = 'https://aur.archlinux.org/packages/?0&K={}'
c.url.searchengines['y'] = 'https://www.youtube.com/results?search_query={}'
c.url.searchengines['g'] = 'https://github.com/search?q={}'
c.url.searchengines[
    'w'] = 'https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search={}'

# aliases
c.aliases['gh'] = 'open http://github.com/peterzky'
c.aliases['gl'] = 'open http://gitlab.com/peterzky'

config.bind(' `', 'set-cmd-text -s :buffer')
config.bind(' fed', 'config-edit')

# youtube-dl
config.bind(
    ' dl',
    'hint links spawn tmux new-window -n Download "youtube-dl \'{hint-url}\'"')
config.bind(
    ' dm',
    'hint links spawn tmux new-window -n Download "youtube-dl -x -o \'~/Sync/music/%(title)s.(ext)s\' \'{hint-url}\'"'
)
config.bind(' fd', 'set-cmd-text -s :quickmark-load')
# mpv
c.aliases[
    'mpv'] = 'spawn --userscript ~/.config/qutebrowser/scripts/view_in_mpv'
config.bind(' pl', 'hint links spawn go-mpv {hint-url}')
config.bind(' pp', 'mpv')

# config.bind(' <Tab>', 'tab-focus last')
config.unbind('d')
config.bind('q', 'tab-close')
config.bind('<ctrl-q>', 'record-macro')
config.bind(' rr', 'config-source ;; message-info "reloaded!')
config.bind('<', 'tab-move -')
config.bind('<meta+x>', 'set-cmd-text :')
config.bind('>', 'tab-move +')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('i', 'hint inputs')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('ya', 'hint links yank-primary')
config.bind(';m', 'hint magnet yank-primary')
config.bind('gh', 'home')
config.bind('<ctrl+e>', 'scroll-page 0 0.3')

# org capture
c.aliases['org'] = 'spawn --userscript ~/.config/qutebrowser/scripts/org'
config.bind(' cl', 'org -l')
config.bind(' cc', 'org -c')
config.bind(' cs', 'org -s')

# command mode binding
config.bind('<alt+n>', 'command-history-next', mode='command')
config.bind('<alt+p>', 'command-history-prev', mode='command')
config.bind('<ctrl+n>', 'completion-item-focus next', mode='command')
config.bind('<ctrl+p>', 'completion-item-focus prev', mode='command')
config.bind('<ctrl+g>', 'leave-mode;;spawn fcitx-remote -c', mode='command')

# proxy toggle
config.bind('<alt+a>',
            'set content.proxy "http://127.0.0.1:3128" ;; message-info "Proxy Mode: Auto"')
config.bind('<alt+d>',
            'set content.proxy "socks5://127.0.0.1:1080" ;; message-info "Proxy Mode: Proxy"')
config.bind('<alt+k>',
            'config-unset content.proxy ;; message-info "Proxy Disabled"')

# insert mode binding
config.bind('<ctrl+p>', 'fake-key <Up>', mode='insert')
config.bind('<ctrl+n>', 'fake-key <Down>', mode='insert')
config.bind('<ctrl+g>', 'leave-mode', mode='insert')
config.bind('<ctrl+a>', 'fake-key <Home>', mode='insert')
config.bind('<ctrl+e>', 'fake-key <End>', mode='insert')
config.bind('<ctrl+f>', 'fake-key <Right>', mode='insert')
config.bind('<ctrl+b>', 'fake-key <Left>', mode='insert')
config.bind('<ctrl+d>', 'fake-key <Delete>', mode='insert')
config.bind(
    '<ctrl+k>', 'fake-key <Shift-End> ;; fake-key <Delete>', mode='insert')
config.bind(
    '<ctrl+u>', 'fake-key <Shift-Home> ;; fake-key <Delete>', mode='insert')
config.bind('<alt+f>', 'fake-key <Ctrl-Right>', mode='insert')
config.bind('<alt+b>', 'fake-key <Ctrl-Left>', mode='insert')
config.bind('<alt+d>', 'fake-key <Ctrl-Delete>', mode='insert')

# hint mode binding
# config.bind('<Return>','fake-key 0', mode='hint')

# emacs
config.bind('<Alt-w>', 'yank selection')
config.bind('<Alt+v>', 'scroll-page 0 -0.3')

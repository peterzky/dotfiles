# -*- eval: (reopen-as-yadm); -*-
import platform
# machine independent settings
if platform.node() == "thinkpad":
    c.zoom.default = '125%'
    fontsize = '12'
else:
    c.zoom.default = '100%'
    fontsize = '10'

# settings
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}
c.bindings.key_mappings = {'<Ctrl-g>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}
c.completion.quick = False
c.confirm_quit = ['never']
c.content.proxy = 'socks5://127.0.0.1:1080'
c.editor.command = ['emacsclient', '-nc', '{file}']
c.fonts.completion.category = 'bold ' + fontsize + 'pt "Iosevka"'
c.fonts.completion.entry = fontsize + 'pt "Iosevka"'
c.fonts.debug_console = fontsize + 'pt "Iosevka"'
c.fonts.downloads = fontsize + 'pt "Iosevka"'
c.fonts.hints = 'bold ' + fontsize + 'pt "Iosevka"'
c.fonts.keyhint = fontsize + 'pt "Iosevka"'
c.fonts.messages.error = fontsize + 'pt "Iosevka"'
c.fonts.messages.info = fontsize + 'pt "Iosevka"'
c.fonts.messages.warning = fontsize + 'pt "Iosevka"'
c.fonts.prompts = fontsize + 'pt "Iosevka"'
c.fonts.statusbar = fontsize + 'pt "Iosevka"'
c.fonts.tabs = 'bold ' + fontsize + 'pt "Iosevka"'
c.hints.chars = 'qwerasdfjklhyuiop'
c.hints.dictionary = '/usr/share/dict/words'
c.hints.hide_unmatched_rapid_hints = True
c.hints.min_chars = 1
c.hints.mode = 'letter'
c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']
c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']
c.hints.scatter = True
c.hints.uppercase = False
c.history_gap_interval = 30
c.input.forward_unbound_keys = 'auto'
c.input.insert_mode.auto_leave = False
c.input.insert_mode.auto_load = False
c.input.insert_mode.plugins = False
c.input.links_included_in_focus_chain = True
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
c.tabs.last_close = 'ignore'
c.tabs.mousewheel_switching = True
c.tabs.new_position.related = 'next'
c.tabs.new_position.unrelated = 'last'
c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}
c.tabs.persist_mode_on_change = False
c.tabs.position = 'top'
c.tabs.select_on_remove = 'next'
c.tabs.show = 'always'
c.tabs.show_switching_delay = 800
c.tabs.tabs_are_windows = False
c.tabs.title.alignment = 'left'
c.tabs.title.format = '{index}: {title}'
c.tabs.title.format_pinned = '{index}'
c.tabs.width = '20%'
c.url.default_page = 'https://google.com/'
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}', 'aw': 'https://wiki.archlinux.org/?search={}', 'git': 'https://github.com/search?q={}'}
c.url.start_pages = 'https://google.com'

config.bind(' `', 'set-cmd-text -s :buffer')
config.bind(' fed', 'config-edit')
config.bind(' dl', 'hint links spawn tmux new-window -n Download "youtube-dl \'{hint-url}\'"')
config.bind(' fd', 'set-cmd-text -s :quickmark-load -t')
config.bind(' pp', 'hint links spawn go-mpv {hint-url}')
config.bind(' qq', 'quit')
config.bind(' rr', 'config-source')
config.bind('<', 'tab-move -')
config.bind('<ctrl+g>', '<Escape>')
config.bind('<meta+x>', 'set-cmd-text :')
config.bind('>', 'tab-move +')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('gh', 'home')
config.bind('i', 'hint inputs')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('<alt+n>', 'command-history-next', mode='command')
config.bind('<alt+p>', 'command-history-prev', mode='command')
config.bind('<ctrl+n>', 'completion-item-focus next', mode='command')
config.bind('<ctrl+p>', 'completion-item-focus prev', mode='command')
# org capture
config.bind(' cl', 'yank title ;; spawn emacsclient "org-protocol://store-link?url={url}&title={clipboard}"')

#insert mode binding
config.bind('<ctrl+p>', 'fake-key <Up>', mode='insert')
config.bind('<ctrl+n>', 'fake-key <Down>', mode='insert')
config.bind('<ctrl+g>', 'leave-mode' ,mode='insert')
config.bind('<ctrl+a>', 'fake-key <Home>', mode='insert')
config.bind('<ctrl+e>', 'fake-key <End>', mode='insert')
config.bind('<ctrl+f>', 'fake-key <Right>', mode='insert')
config.bind('<ctrl+b>', 'fake-key <Left>', mode='insert')
config.bind('<ctrl+d>', 'fake-key <Delete>', mode='insert')
config.bind('<ctrl+k>', 'fake-key <Shift-End> ;; fake-key <Delete>', mode='insert')
config.bind('<ctrl+u>', 'fake-key <Shift-Home> ;; fake-key <Delete>', mode='insert')
config.bind('<alt+f>', 'fake-key <Ctrl-Right>', mode='insert')
config.bind('<alt+b>', 'fake-key <Ctrl-Left>', mode='insert')
config.bind('<alt+d>', 'fake-key <Ctrl-Delete>', mode='insert')

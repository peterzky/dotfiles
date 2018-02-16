c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}
c.bindings.key_mappings = {'<Ctrl-g>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}
c.confirm_quit = ['never']
c.content.proxy = 'socks5://127.0.0.1:1080'
c.history_gap_interval = 30
c.search.ignore_case = 'smart'
c.search.incremental = True
c.completion.quick = False
c.url.default_page = 'https://google.com/'
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}',
                       'aw': 'https://wiki.archlinux.org/?search={}'}

# Bindings for normal mode
config.bind(';d', 'hint links spawn tmux new-window "youtube-dl \'{hint-url}\'"')
config.bind(';m', 'hint links spawn go-mpv {hint-url}')
config.bind('<ctrl+g>', '<Escape>')
config.bind('<meta+x>', 'set-cmd-text :')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('t', 'set-cmd-text -s :open -t')

# Bindings for command mode
config.bind('<alt+n>', 'command-history-next', mode='command')
config.bind('<alt+p>', 'command-history-prev', mode='command')
config.bind('<ctrl+n>', 'completion-item-focus next', mode='command')
config.bind('<ctrl+p>', 'completion-item-focus prev', mode='command')

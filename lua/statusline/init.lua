local colors = {
    bg = '#012028',
    fg = none,
    yellow = '#B4881D',
    cyan = '#32A198',
    darkblue = '#022B35',
    green = '#729D1F',
    orange = '#C94C22',
    violet = '#8F3982',
    magenta = '#ff80ff',
    blue = '#2E8CCF',
    red = '#DA3435'
}
local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.yellow,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.violet,
    ['V-REPLACE'] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then icon = ' '
    elseif os == 'MAC' then icon = ' '
    else icon = ' '
    end
    return icon .. os
end

local function lsp_diagnostics_info()
    local bufnr = vim.api.nvim_get_current_buf()
    local counts = vim.fn['ale#statusline#Count'](bufnr)

    local all_errors = counts.error + counts.style_error
    local all_warnings = counts.warning + counts.style_warning
    local all_infos = counts.info

    return {errors = all_errors, warnings = all_warnings, infos = all_infos}
end

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

-- LuaFormatter off

local comps = {
    vi_mode = {
        left = {
            provider = '███',
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color()
                }

                return val
            end,
            right_sep = ' '
        }
    },
    file = {
        info = {
            provider = 'file_info',
            hl = {
                fg = colors.blue,
                style = 'bold'
            }
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        type = {
            provider = 'file_type'
        },
        os = {
            provider = file_osinfo,
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        }
    },
    line_percentage = {
        provider = 'line_percentage',
        left_sep = ' ',
        hl = {
            style = 'bold'
        }
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = {
            fg = colors.blue,
            style = 'bold'
        }
    },
    diagnos = {
        err = {
            provider = function()
                return ' ' .. lsp_diagnostics_info().errors
            end,
            left_sep = ' ',
            enabled = function()
                return lsp_diagnostics_info().errors ~= 0
            end,
            hl = {
                fg = colors.red
            }
        },
        warn = {
            provider = function()
                return ' ' .. lsp_diagnostics_info().warnings
            end,
            left_sep = ' ',
            enabled = function()
                return lsp_diagnostics_info().warnings ~= 0
            end,
            hl = {
                fg = colors.yellow
            }
        },
        info = {
            provider = function()
                return ' ' .. lsp_diagnostics_info().infos
            end,
            left_sep = ' ',
            enabled = function()
                return lsp_diagnostics_info().infos ~= 0
            end,
            hl = {
                fg = colors.blue
            }
        },
        hint = {
            provider = 'diagnostic_hints',
            enabled = function()
                return lsp.diagnostics_exist('Hint')
            end,
            hl = {
                fg = colors.cyan
            }
        },
    },
    lsp = {
        name = {
            provider = 'lsp_client_names',
            left_sep = ' ',
            icon = ' ',
            hl = {
                fg = colors.yellow
            }
        }
    },
    git = {
        branch = {
            provider = 'git_branch',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            },
        },
        add = {
            provider = 'git_diff_added',
            hl = {
                fg = colors.green
            }
        },
        change = {
            provider = 'git_diff_changed',
            hl = {
                fg = colors.orange
            }
        },
        remove = {
            provider = 'git_diff_removed',
            hl = {
                fg = colors.red
            }
        }
    }
}

local properties = {
    force_inactive = {
        filetypes = {
            'NvimTree',
            'dbui',
            'packer',
            'startify',
            'fugitive',
            'fugitiveblame'
        },
        buftypes = {'terminal', 'packer', 'startify'},
        bufnames = {'startify'}
    }
}

local components = {
    left = {
        active = {
            comps.vi_mode.left,
            comps.file.info,
            comps.lsp.name,
            comps.diagnos.err,
            comps.diagnos.warn,
            comps.diagnos.hint,
            comps.diagnos.info
        },
        inactive = {
            comps.vi_mode.left,
            comps.file.info
        }
    },
    mid = {
        active = {},
        inactive = {}
    },
    right = {
        active = {
            comps.git.add,
            comps.git.change,
            comps.git.remove,
            comps.file.os,
            comps.git.branch,
            comps.line_percentage,
            comps.scroll_bar,
            comps.vi_mode.right
        },
        inactive = {}
    }
}

require'feline'.setup {
    default_bg = colors.bg,
    default_fg = colors.fg,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
}
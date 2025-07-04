-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local plugins = {
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'gopls',
      },
    },
  },

  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('go').setup {
        -- HACK: https://github.com/tigh-latte/dotfiles/blob/main/.config%2Fnvim%2Flua%2Ftigh-latte%2Fplugins%2Fgo.lua#L10-L15
        -- HACK: https://www.reddit.com/r/neovim/comments/1cygzip/upgraded_to_010_but_getting_lsp_codelens_issues/
        -- HACK: For now enabled gopls raises codelens errors
        lsp_codelens = true,
        lsp_inlay_hints = {
          enable = true,
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('gopls-lsp-attach', { clear = true }),
        callback = function(event)
          -- keymap to run go test over current function
          vim.keymap.set('n', '<leader>tf', ':GoTestFunc<CR>', { buffer = event.buf, desc = 'LSP: [T]est current function' })

          -- keymap to run all go tests
          vim.keymap.set('n', '<leader>tt', ':GoTest<CR>', { buffer = event.buf, desc = 'LSP: [T]est everything' })

          -- keymap to run go tests for current package
          vim.keymap.set('n', '<leader>tp', ':GoTestPkg<CR>', { buffer = event.buf, desc = 'LSP: [T]est package' })

          -- keymap to add go struct tags
          vim.keymap.set('n', '<leader>gat', ':GoAddTag<CR>', { buffer = event.buf, desc = 'LSP: [G]o add tags' })

          -- keymap to add go tests to current function
          vim.keymap.set('n', '<leader>gtf', ':GoAddTest<CR>', { buffer = event.buf, desc = 'LSP: [G]o add function test' })
        end,
      })
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}

-- Run gofmt on save
local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

return plugins

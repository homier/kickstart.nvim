local plugins = {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
    },
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    config = function()
      require('go').setup {
        lsp_codelens = true,
        lsp_inlay_hints = {
          enable = true,
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('gopls-lsp-attach', { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if not client or client.name ~= 'gopls' then
            return
          end

          local map = function(keys, cmd, desc)
            vim.keymap.set('n', keys, cmd, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>tf', ':GoTestFunc<CR>', '[T]est current function')
          map('<leader>tt', ':GoTest<CR>', '[T]est everything')
          map('<leader>tp', ':GoTestPkg<CR>', '[T]est package')
          map('<leader>gat', ':GoAddTag<CR>', '[G]o add tags')
          map('<leader>gtf', ':GoAddTest<CR>', '[G]o add function test')
        end,
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('GoFormat', { clear = true }),
        pattern = '*.go',
        callback = function()
          require('go.format').goimport()
        end,
      })
    end,
  },
}

return plugins

local packages = {
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup {
        enabled = true,
        message_template = '<summary> • <author> • <date>',
        message_when_not_committed = "Don't give a shit, huh?",
        date_format = '%c, %r',
      }
    end,
  },
}

return packages

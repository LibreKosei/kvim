return {
    cmd = { 'haskell-language-server-wrapper', '--lsp' },
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
    root_markers = {
      '.git',
      'hie.yaml',
      'stack.yaml',
      'cabal.project',
      '*.cabal',
      'package.yaml'
    },
    settings = {
        haskell = {
            formattingProvider = 'ormolu',
            cabalFormattingProvider= 'cabal-fmt',
        },
    },
}

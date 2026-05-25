return {
  settings = {
    pyright = {
      disableOrganizeImports = true, -- use Ruff's import organizer
    },
    python = {
      analysis = {
        typeCheckingMode = "standard",
        autoImportCompletions = true,
      },
    },
  },
}

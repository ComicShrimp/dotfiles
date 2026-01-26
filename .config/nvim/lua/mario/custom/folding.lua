-- Set general options
vim.o.foldenable = false
vim.o.foldtext = "v:lua.CustomFoldText()"

-- Set window options
vim.wo.foldmethod = "expr"

function CustomFoldText()
  local fs = vim.v.foldstart
  while vim.fn.getline(fs):match("^%s*$") do
    fs = vim.fn.nextnonblank(fs + 1)
  end

  local line
  if fs > vim.v.foldend then
    line = vim.fn.getline(vim.v.foldstart)
  else
    line = vim.fn.getline(fs):gsub("\t", string.rep(" ", vim.o.tabstop))
  end

  -- Calculate the width of the current window, adjusted for the fold column and line numbers
  local remainWidth = vim.fn.winwidth(0) - vim.o.foldcolumn - (vim.wo.number and 8 or 0)

  local foldSize = 1 + vim.v.foldend - vim.v.foldstart
  local foldSizeStr = " 󰁂 " .. foldSize .. " line(s) "

  local foldLevelStr = " " .. vim.v.foldlevel .. " level(s) "

  -- Indent content to the right
  local expansionString = string.rep(" ", remainWidth - vim.fn.strwidth(foldSizeStr .. line .. foldLevelStr))

  return line .. expansionString .. foldSizeStr .. "|" .. foldLevelStr
end

-- Set general options
vim.o.foldenable = false
vim.o.foldlevel = 99
vim.opt.fillchars = {
  fold = " ", -- Character to fill the fold column
}
vim.o.foldtext = "v:lua.CustomFoldText()"

-- Set window options
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.GetPotionFold(v:lnum)"

function GetPotionFold(lnum)
  local line = vim.fn.getline(lnum)
  if line:match("^%s*$") then
    return "-1"
  end

  local this_indent = IndentLevel(lnum)
  local next_indent = IndentLevel(NextNonBlankLine(lnum))

  if next_indent == this_indent then
    return this_indent
  elseif next_indent < this_indent then
    return this_indent
  elseif next_indent > this_indent then
    return ">" .. next_indent
  end
end

function IndentLevel(lnum)
  return vim.fn.indent(lnum) / vim.o.shiftwidth
end

function NextNonBlankLine(lnum)
  local numlines = vim.fn.line("$")
  local current = lnum + 1

  while current <= numlines do
    if vim.fn.getline(current):match("%S") then
      return current
    end
    current = current + 1
  end

  return -2
end

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

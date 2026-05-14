local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node
local f  = ls.function_node

local fmta = require("luasnip.extras.fmt").fmta
local rep  = require("luasnip.extras").rep

-- Math zone (vimtex required)
local function in_mathzone()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

-- Autosnippets
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

-- Math-only snippets
local ms = ls.extend_decorator.apply(s, { condition = in_mathzone })

-- Slugify helper
local function slugify(args)
  local text = args[1][1] or ""
  return text
    :lower()
    :gsub("[^%w%s-]", "")
    :gsub("%s+", "-")
end

return {

  ---------------------------------------------------------------------------
  -- DOCUMENT STRUCTURE
  ---------------------------------------------------------------------------

  s("doc",
    fmta([[
\begin{document}
<>
\end{document}
    ]], { i(1) })
  ),

  s("sec",
    fmta([[
\section{<>}
\label{sec:<>}
    ]],
    {
      i(1),
      f(slugify, { 1 }),
    })
  ),

  s("ssec",
    fmta([[
\subsection{<>}
\label{sec:<>}
    ]],
    {
      i(1),
      f(slugify, { 1 }),
    })
  ),

  ---------------------------------------------------------------------------
  -- ENVIRONMENTS
  ---------------------------------------------------------------------------

  s("eq",
    fmta([[
\begin{equation}
  <>
  \label{eq:<>}
\end{equation}
    ]],
    {
      i(1),
      f(slugify, { 1 }),
    })
  ),

  s("aln",
    fmta([[
\begin{align}
  <>
\end{align}
    ]], { i(0) })
  ),

  -- new added
  s("aln*",
    fmta([[
\begin{align*}
  <>
\end{align*}
    ]], { i(0) })
  ),

  --new added
  s("gat*",
    fmta([[
\begin{gather*}
  <>
\end{gather*}
    ]], { i(0) })
  ),

  s("itm",
    fmta([[
\begin{itemize}
  \item <>
\end{itemize}
    ]], { i(0) })
  ),

  ---------------------------------------------------------------------------
  -- TABLES
  ---------------------------------------------------------------------------

  s("tbl",
    fmta([[
\begin{table}[ht]
  \centering
  \begin{tabular}{<>}
    <>
  \end{tabular}
  \caption{<>}
  \label{tbl:<>}
\end{table}
    ]],
    {
      i(1, "c c c"),
      i(2, "a & b & c \\\\"),
      i(3, "Caption"),
      f(slugify, { 3 }),
    })
  ),

  ---------------------------------------------------------------------------
  -- MATH (MATH-ZONE ONLY)
  ---------------------------------------------------------------------------

  ms("frac",  fmta([[\frac{<>}{<>}]], { i(1), i(2) })),
  ms("sqrt",  fmta([[\sqrt{<>}]],     { i(1) })),
  ms("int", fmta([[\int_{<>}^{<>} <>]], { i(1), i(2), i(3) })),

  ---------------------------------------------------------------------------
  -- AUTOSNIPPETS (TEXT SAFE)
  ---------------------------------------------------------------------------

  as("->",  t("\\to")),
  as("=>",  t("\\Rightarrow")),
  as("<=",  t("\\Leftarrow")),
  as("<->", t("\\leftrightarrow")),
}


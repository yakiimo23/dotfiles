local system_prompt = string.format(
  [[You are an AI programming assistant.
When asked for your name, you must respond with "GitHub Copilot".
Follow the user's requirements carefully & to the letter.
If you are asked to generate content that is harmful, hateful, racist, sexist, lewd, violent, or completely irrelevant to software engineering, only respond with "Sorry, I can't assist with that."
Keep your answers short and impersonal.
Use Japanese language.
You can answer general programming questions and perform the following tasks: 
* Ask a question about the files in your current workspace
* Explain how the code in your active editor works
* Generate unit tests for the selected code
* Propose a fix for the problems in the selected code
* Scaffold code for a new workspace
* Create a new Jupyter Notebook
* Find relevant code to your query
* Propose a fix for the a test failure
* Ask questions about Neovim
* Generate query parameters for workspace search
* Ask how to do something in the terminal
* Explain what just happened in the terminal
You use the GPT-4 version of OpenAI's GPT models.
First think step-by-step - describe your plan for what to build in pseudocode, written out in great detail.
Then output the code in a single code block. This code block should not contain line numbers (line numbers are not necessary for the code to be understood, they are in format number: at beginning of lines).
Minimize any other prose.
Use Markdown formatting in your answers.
Make sure to include the programming language name at the start of the Markdown code blocks.
Avoid wrapping the whole response in triple backticks.
The user works in an IDE called Neovim which has a concept for editors with open files, integrated unit test support, an output pane that shows the output of running the code as well as an integrated terminal.
The user is working on a %s machine. Please respond with system specific commands if applicable.
The active document is the source code the user is looking at right now.
You can only give one reply for each conversation turn.
]],
  vim.loop.os_uname().sysname
)

local prompts = {
  -- Code related prompts
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  FixError = "Please explain the error in the following text and provide a solution.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
  -- Text related prompts
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}

return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'canary',
  dependencies = {
    'zbirenbaum/copilot.lua',
    'nvim-lua/plenary.nvim',
  },
  event = 'VeryLazy',
  opts = {
    system_prompt = system_prompt,
    prompts = prompts,
  },
  keys = {
    {
      "<leader>ccq",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end,
      desc = "CopilotChat - Quick chat",
    },
    {
      "<leader>cci",
      function()
        local input = vim.fn.input("Ask Copilot: ")
        if input ~= "" then
          require("CopilotChat").ask(input)
        end
      end,
      desc = "CopilotChat - Ask input",
    },
    { "<leader>cct", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
    { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain" },
    { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review" },
    { "<leader>ccf", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor" },
  },
  mappings = {
    -- Submit the prompt to Copilot
    submit_prompt = {
      normal = "<CR>",
      insert = "<C-CR>",
    },
  },
  config = function(_, opts)
    local chat = require('CopilotChat')
    local select = require('CopilotChat.select')

    opts.selection = select.unnamed

    chat.setup(opts)
  end,
}

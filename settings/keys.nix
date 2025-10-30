{
  config.vim.keymaps = [
    {
      key = "<Esc>";
      mode = ["n"];
      action = "<cmd>nohlsearch<CR>";
      desc = "Clear highlights on search when pressing <Esc>";
    }
    {
      key = "<leader>q";
      mode = ["n"];
      action = ":lua vim.diagnostic.setloclist()<CR>";
      desc = "Open diagnostic [Q]uickfix list";
    }
    {
      key = "<Esc><Esc>";
      mode = ["t"];
      action = "<C-\\><C-n>";
      desc = "Exit terminal mode";
    }
    {
      key = "<left>";
      mode = ["n"];
      action = "<cmd>echo \"use h to move, you freak\"<CR>";
      desc = "Disable arrow key (left)";
    }
    {
      key = "<right>";
      mode = ["n"];
      action = "<cmd>echo \"use l to move, you freak\"<CR>";
      desc = "Disable arrow key (right)";
    }
    {
      key = "<up>";
      mode = ["n"];
      action = "<cmd>echo \"use k to move, you freak\"<CR>";
      desc = "Disable arrow key (up)";
    }
    {
      key = "<down>";
      mode = ["n"];
      action = "<cmd>echo \"use j to move, you freak\"<CR>";
      desc = "Disable arrow key (down)";
    }

    # window navigation
    {
      key = "<C-h>";
      mode = ["n"];
      action = "<C-w><C-h>";
      desc = "Move focus to the left window";
    }
    {
      key = "<C-l>";
      mode = ["n"];
      action = "<C-w><C-l>";
      desc = "Move focus to the right window";
    }
    {
      key = "<C-j>";
      mode = ["n"];
      action = "<C-w><C-j>";
      desc = "Move focus to the lower window";
    }
    {
      key = "<C-k>";
      mode = ["n"];
      action = "<C-w><C-k>";
      desc = "Move focus to the upper window";
    }

    # tab navigation
    {
      key = "<leader>tn";
      mode = ["n"];
      action = "<cmd>tabnew<CR>";
      desc = "[T]ab [N]ew";
    }
    {
      key = "<leader>tc";
      mode = ["n"];
      action = "<cmd>tabclose<CR>";
      desc = "[T]ab [C]lose";
    }
    {
      key = "<leader>to";
      mode = ["n"];
      action = "<cmd>tabonly<CR>";
      desc = "[T]ab [O]nly";
    }
    {
      key = "gt";
      mode = ["n"];
      action = "<cmd>tabnext<CR>";
      desc = "Next tab";
    }
    {
      key = "gT";
      mode = ["n"];
      action = "<cmd>tabprevious<CR>";
      desc = "Previous tab";
    }

    # quick save
    {
      key = "<leader>w";
      mode = ["n"];
      action = "<cmd>w<CR>";
      desc = "[W]rite/Save file";
    }
    {
      key = "<C-s>";
      mode = ["n"];
      action = "<cmd>w<CR>";
      desc = "Save file";
    }

    {
      desc = "Toggle line numbers";
      key = "<leader>n";
      mode = "n";
      lua = true;
      action = ''
        function()
          vim.opt.number = not vim.opt.number:get()
          vim.opt.relativenumber = not vim.opt.relativenumber:get()
        end
      '';
    }
  ];
}

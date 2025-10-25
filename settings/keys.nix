{ config, ... }:
{
                # Keybinds carried over from ~/.config/nvim/lua/config/keys.lua
                config.vim.keymaps = [
                  # Clear highlights on search when pressing <Esc>
                  {
                    key = "<Esc>";
                    mode = ["n"];
                    action = "<cmd>nohlsearch<CR>";
                  }

                  # Diagnostic keymaps
                  {
                    key = "<leader>q";
                    mode = ["n"];
                    action = ":lua vim.diagnostic.setloclist()<CR>";
                    desc = "Open diagnostic [Q]uickfix list";
                  }

                  # Exit terminal mode
                  {
                    key = "<Esc><Esc>";
                    mode = ["t"];
                    action = "<C-\\><C-n>";
                    desc = "Exit terminal mode";
                  }

                  # Disable arrow keys in normal mode
                  {
                    key = "<left>";
                    mode = ["n"];
                    action = "<cmd>echo \"use h to move, you freak\"<CR>";
                  }
                  {
                    key = "<right>";
                    mode = ["n"];
                    action = "<cmd>echo \"use l to move, you freak\"<CR>";
                  }
                  {
                    key = "<up>";
                    mode = ["n"];
                    action = "<cmd>echo \"use k to move, you freak\"<CR>";
                  }
                  {
                    key = "<down>";
                    mode = ["n"];
                    action = "<cmd>echo \"use j to move, you freak\"<CR>";
                  }

                  # Window navigation (CTRL+hjkl)
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

                  # Tab navigation
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

                  # File tree keybinds (Neotree)
                  # Note: You'll need to enable neo-tree in nvf
                  {
                    key = "<leader>e";
                    mode = ["n"];
                    action = "<cmd>Neotree toggle<CR>";
                    desc = "Toggle [E]xplorer";
                  }
                  {
                    key = "<leader>E";
                    mode = ["n"];
                    action = "<cmd>Neotree reveal<CR>";
                    desc = "Reveal current file in [E]xplorer";
                  }

                  # Quick save
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

                  # Note: Transparency toggle (<leader>tt) and autosave functionality
                  # from the original config require Lua and are not included here
                ];
}
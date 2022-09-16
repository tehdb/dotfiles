local status_ok, marks = pcall(require, "marks")
if not status_ok then
	return
end

-- :help marks-setup

marks.setup {
  -- whether to map keybinds or not. default true
  default_mappings = false,
  -- which builtin marks to show. default {}
  -- builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  -- sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  -- excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  -- bookmark_0 = {
  --   sign = "⚑",
  --   virt_text = "hello world"
  -- },
  
  mappings = {
    toggle = "mm",
    delete_buf = "md",
    next = "mn",
    prev = "mN",

    -- next_bookmark = "mbn",
    -- prev_bookmark = "mbN",
    --
    -- set_bookmark0 = "mb0",
    -- delete_bookmark0 = "mB0",
    -- next_bookmark = "mg0",
    -- prev_bookmark = "mg0",
    --
    -- set_bookmark9 = "mb9",
    -- delete_bookmark9 = "mB9",
    -- set_bookmark8 = "mb8",
    -- delete_bookmark8 = "mB8",
    -- set_bookmark7 = "mb7",
    -- delete_bookmark7 = "mB7",
    -- set_bookmark6 = "mb6",
    -- delete_bookmark6 = "mB6",
    -- set_bookmark5 = "mb5",
    -- delete_bookmark5 = "mB5",
    -- set_bookmark4 = "mb4",
    -- delete_bookmark4 = "mB4",
    -- set_bookmark3 = "mb3",
    -- delete_bookmark3 = "mB3",
    -- set_bookmark2 = "mb2",
    -- delete_bookmark2 = "mB2",
    -- set_bookmark1 = "mb1",
    -- delete_bookmark1 = "mB1",
  },
  bookmark_0 = {
    sign = "⚑",
    virt_text = "Bookmarks 0"
  },
  bookmark_9 = {
    sign = "⚑",
    virt_text = "Bookmarks 9"
  },
  bookmark_8 = {
    sign = "⚑",
    virt_text = "Bookmarks 8"
  },
  bookmark_7 = {
    sign = "⚑",
    virt_text = "Bookmarks 7"
  },
  bookmark_6 = {
    sign = "⚑",
    virt_text = "Bookmarks 6"
  },
  bookmark_5 = {
    sign = "⚑",
    virt_text = "Bookmarks 5"
  },
  bookmark_4 = {
    sign = "⚑",
    virt_text = "Bookmarks 4"
  },
  bookmark_3 = {
    sign = "⚑",
    virt_text = "Bookmarks 3"
  },
  bookmark_2 = {
    sign = "⚑",
    virt_text = "Bookmarks 2"
  },
  bookmark_1 = {
    sign = "⚑",
    virt_text = "Bookmarks 1"
  },
}

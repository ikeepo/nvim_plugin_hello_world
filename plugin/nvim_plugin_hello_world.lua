-- plugin下的内容会在nvim start时候直接加载
print("Hello World Demo, This message loaded once nvim start")
-- plugin/myplugin.lua
-- vim.g表示访问vim的全局命名空间
--
if vim.g.loaded_myplugin then -- 防止重复加载
	return
end
vim.g.loaded_myplugin = 1

-- 定义用户命令
-- 命令命名必须大写开头，规范
-- function end 回调函数
-- 选项表， 这里指的是nvim_create_user_command的参数，而不是回调函数的参数
-- 如果要回调函数处理参数，需要传入opts通过opts.args处理参数，并在选项表添加nargs数目
vim.api.nvim_create_user_command("Greet", function()
	require("nvim_plugin_hello_world").greet()
end, { desc = "Print a greeting" })

-- 可选：绑定快捷键
-- mode, Left hand side, Right hand side, opts 可选
-- n表示normal mode下生效
-- <leader>g leader默认是\，但一般会改成vim.g.mapleader=" "
-- <cmd>表示是一个命令，Greet是具体的命令名称，<CR>回车
-- 为什么没有从vim.api引入，因为vim.api是nvim中C api的绑定，而keymap是用Lua封装的高级API
-- 同样的还有vim.g，也是Lua封装的一层；但他们不是对vim.api也就是C API的封装，而是直接
-- 预编写好的Lua代码，可以理解为nvim中Lua标准库
-- 同生态位的还有：
-- vim.o
-- vim.wo
-- vim.bo
-- vim.b
-- vim.t
-- vim.v
-- vim.fn vim.cmd vim.api vim.lsp vim.diagnostic vim.ui
vim.keymap.set("n", "<leader>g", "<cmd>Greet<CR>", { desc = "Greet" })

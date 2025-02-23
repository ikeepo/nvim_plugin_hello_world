-- 定义一个局部变量，避免影响nvim全局
local M = {}
-- 定义一个含有初始值的局部变量
-- 存储插件的配置，name是配置项之一， 提供默认值world
local options = { name = "world" }
-- 定义一个绑定在模块M上的函数，接受一个参数opt
-- setup是默认协议的初始化函数，用于调用它传入自定义配置
-- opt是一个包含用户自定义的表，传入后覆盖默认定义的options
-- 这里是直接赋值，如果opt不存在nil会出错，这也是经常遇到的新手配置问题
-- 返回M是为了链式调用
function M.setup(opt)
	options = opt
	return M
end
-- 定义一个绑定在M上函数，作为核心功能
-- 这是一个公开方法
-- 如何算是私有方法？ 不绑定到M上的定义，仅在文件内可见
-- 命名空间分为三种，不加local表示全局，加local表示本地，不加local但绑定到M上，表示全局可以通过M使用。
-- 打印print字符连接串，..是lua的字符串连接符
-- 返回M是为了链式调用
function M.greet()
	print("hello " .. options.name)
	return M
end
-- 返回M是为了require('name')时加载
return M

---@meta

-- Class for wrapping arguments and return values of GTA script functions, used by add_script_function_hook.
---@class scr_value_wrapper
scr_value_wrapper = {}

---@param index integer The index to access.
---@return integer value The current value.
function scr_value_wrapper:get_int(index) end

---@param index integer The index to access.
---@param value integer The new value.
function scr_value_wrapper:set_int(index, value) end

---@param index integer The index to access.
---@return float value The current value.
function scr_value_wrapper:get_float(index) end

---@param index integer The index to access.
---@param value float The new value.
function scr_value_wrapper:set_float(index, value) end

---@param index integer The index to access.
---@return string value The current value.
function scr_value_wrapper:get_string(index) end

---@param index integer The index to access.
---@param value string The new value.
function scr_value_wrapper:set_string(index, value) end

---@class scr_function
---Table for calling GTA script functions. Needs to be called in the fiber pool. Only call the function when necessary.
scr_function = {}
-- Functions (2)

---Calls a script function with the given arguments. Returns the return value as the given type.
---**Example Usage:**
---```lua
---local value = scr_function.call_script_function("freemode", "wear_sunglasses_at_night", "69 42 06 66", "bool", {
---   { "int", 69 },
---   { "float", 4.20 },
---   { "int", 666 }
---})
---```
---**Example Usage:**
---```lua
---scr_function.call_script_function(script_name, function_name, pattern, return_type_string, args_)
---```
---@param script_name string Name of the script.
---@param function_name string Name of the function. This parameter needs to be unique.
---@param pattern string Pattern to scan for within the script.
---@param return_type_string string Return type of the function. Supported types are **"void"**, **"int"**, **"bool"**, **"const char\*/string"**, **"ptr/pointer/*"**, **"float"**, and **"vector3"**. Anything different will be rejected.
---@param args_ table Arguments to pass to the function. Supported types are the same as return types.
function scr_function.call_script_function(script_name, function_name, pattern, return_type_string, args_) end

---Calls a script function directly using the function position with the given arguments. Returns the return value as the given type.
---**Example Usage:**
---```lua
---local value = scr_function.call_script_function("freemode", 0xE792, "string", {
---   { "int", 191 }
---})
---```
---**Example Usage:**
---```lua
---scr_function.call_script_function(script_name, instruction_pointer, return_type_string, args_)
---```
---@param script_name string Name of the script.
---@param instruction_pointer integer Position of the function within the script.
---@param return_type_string string Return type of the function. Supported types are **"void"**, **"int"**, **"bool"**, **"const char\*/string"**, **"ptr/pointer/*"**, **"float"**, and **"vector3"**. Anything different will be rejected.
---@param args_ table Arguments to pass to the function. Supported types are the same as return types.
function scr_function.call_script_function(script_name, instruction_pointer, return_type_string, args_) end

---@param script_name string Name of the script.
---@param hook_name string Name of the hook. This parameter needs to be unique.
---@param pattern string Pattern to scan for within the script.
---@param hook_func fun(args: scr_value_wrapper, rets: scr_value_wrapper): boolean The callback function. It receives args and rets, which can be read or set via `get/set_int/float/string` methods. Return value determines whether to skip or execute the original function.
-- **Example Usage:**
-- ```lua
-- scr_function.add_script_function_hook("some_script", "my_hook", "2D 00 ? ? 00 61", function(args, rets)
--   local val = args:get_int(0)
--   if val == 1 then
--     rets:set_int(0, 100)
--     return false
--   end
--   return true
-- end)
-- ```
function scr_function.add_script_function_hook(script_name, hook_name, pattern, hook_func) end

---@param script_name string Name of the script associated with the hook.
---@param hook_name string The unique name provided during `add_script_function_hook`.
-- **Example Usage:**
-- ```lua
-- scr_function.remove_script_function_hook("some_script", "my_hook")
-- ```
function scr_function.remove_script_function_hook(script_name, hook_name) end

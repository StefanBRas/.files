M = {}

local awk = {}

function awk.str(text) return "\"" .. text .. "\"" end
function awk.e(text) return "\\\\" .. text end


function awk.get_array(array, array_name)
	local array_string = '{ '
	for i, v in ipairs(array) do
		array_string = array_string .. " "  .. array_name .. '[' .. i .. ']=' .. awk.str(v) .. ' ;'
	end
	return array_string .. '}'
end


function awk.print_match(match, error_type, message)
	return "print " .. awk.str('stdin:') .. " NR " .. awk.str(":") ..
	" match($0, " .. match .. ") " .. awk.str(":") ..
	" " ..error_type..
	" " ..message..""
end

local function get_lint_cmd(lint_rules)
	local matches = {}
	local messages = {}
	local error_types = {}
	for _,rule in ipairs(lint_rules) do 
		if rule.match ~= nil and rule.message ~= nil then
			table.insert(matches, rule.match)
			table.insert(messages, rule.message)
			table.insert(error_types, rule.error_type or "w")
		end
	end
	local cmd = " awk 'BEGIN " .. 
	awk.get_array(matches, "matches") ..
	awk.get_array(messages, "messages") ..
	awk.get_array(error_types, "error_types") ..
	" { for (i in messages) " ..
	awk.print_match("matches[i]", "error_types[i]", "messages[i]")  ..
	"}'  ${INPUT}" ..
	" | grep -E 'stdin:.*?:[^0]:.*';" ..
	" exit 1"
	return cmd
end


local lintFormats = {'%f:%l:%c:%t%m'}

local function get_format_cmd(search, replace)
	return "awk 'gsub(\"" ..search.. "\",  \"" .. replace .. "\")1'"
end


local function get_format_cmd_gensub(search, replace)
	return "awk '{ r = gensub(" .. 
	awk.str(search) .. ", " ..
	awk.str(replace) .. ", " ..
	awk.str('g') .. 
	"); print r ; }'"
end


local function make_format_rules(rules)
	local matches = {}
	local replaces = {}
	for _,rule in ipairs(rules) do 
		if rule.match ~= nil and rule.replace ~= nil then
			table.insert(matches, rule.match)
			table.insert(replaces, rule.replace)
		end
	end
	local full_command = ''
	for i, match in pairs(matches) do
		if full_command == '' then
			full_command = get_format_cmd_gensub(match, replaces[i]) .. " ${INPUT} "
		else
			full_command = full_command .. " | " .. get_format_cmd_gensub(match, replaces[i])
		end
	end
	return full_command
end

function M.get_lint_rule(lint_rules)
	return {
		lintCommand = get_lint_cmd(lint_rules),
		lintStdin = true,
		lintFormats = lintFormats
	}
end


function M.get_format_rules(rule_table)
	return	{
		formatCommand = make_format_rules(rule_table),
		formatStdin = true,
	}
end

-- lint rules:
-- {match = string to match,
-- message = message to show user,
-- error_type = w (warning), i (info), e (error)
-- replace = string to replace with (optional)
-- }

local test_rules = {
	{match = "test1", error_type = "i", message = "first test"},
	{match = "test2", error_type = "w", message = "second test"},
	{match = "test3", error_type = "e", message = "third test"},
	{match = "test4", error_type = "i", message = "test lint and format", replace = "test4_formatted"},
	{match = "test5", replace = "test5_formatted"},
	{match = "test(6|7)", replace = "test\\\\1_formatted"},
	{match = "test(9|10)", replace = "test" .. awk.e("1") .. "_formatted"},
	{match = "test(11|12)", replace = string.format("test%s_formatted", awk.e("1"))}
}


function M.get_lint_and_format_rule(rules)
	return	M.get_lint_rule(rules), M.get_format_rules(rules)
end

M.languages = { python = {
	M.get_lint_and_format_rule(test_rules)
}
}



return M

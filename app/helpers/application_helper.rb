module ApplicationHelper
	def current?(c,action_arr)
		current = ''
		current = 'active'  if c == controller_name && action_arr.include?(action_name)
		return current
	end

	def current_page?(a)
		current = ''
		current = 'active' if a == action_name
		return current
	end
end

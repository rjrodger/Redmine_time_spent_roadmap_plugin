# Hooks to attach to the Redmine view\Issue -> _list. 

class BudgetIssueHook  < Redmine::Hook::ViewListener
     
 def time_spent_issue_column_hook(context = { })
   
   	column = context[:column]
          if column.name.object_id == (:spent_hours).object_id   
                 # if User.current.allowed_to?(:view_spent_time, @project) == false   
                  
                  return
                  end 
          end 
		 
 end
   
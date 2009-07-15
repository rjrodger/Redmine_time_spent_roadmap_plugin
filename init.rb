require 'redmine'

# Patches to Redmine core
require 'dispatcher'
require 'time_spent_query_patch'


Dispatcher.to_prepare do
  Query.send(:include, SpentTimeQueryPatch)

end

# Hooks
require 'time_spent_issue_column_hook'

Redmine::Plugin.register :time_spent_roadmap_plugin do
	name 'Redmine Time Spent Upgrade plugin'
	author 'GoYello'
	description 'This is a time spent tweaking plugin (with roadmap included)'
	version '0.0.1'
	
    # This adds a project module permition
	# It can be enabled/disabled at project level (Project settings -> Modules)
permission :view_spent_time, {:meetings => [:view_spent_time]}

end
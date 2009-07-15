## Redmine Time Spent + roadmap plugin

It is very useful modification that is enabling to show how much time team of developers (or one) burned on given issue. It can be viewed at Project -> Issues   query.
The Time Spent plugin is actually our modification of time spent patch posted on Redmine forum some time ago. What we did is:
• Added line in app/helpers/queries_helper.rb so the time value will be displayed as a float in x.xx format
• Added permission in Administration -> Roles and permissions -> role -> Time tracking

## Getting the plugin

## Install

This plugin needs to be installed same as the Redmine instruction for plugins describes [here](http://www.redmine.org/wiki/1/Plugins). 
You can skip 'rake' command as there are no database migration files.

You have to also run the patch file from   time_spent_roadmap_plugin\patch   
This patch has four source files modifications so please remember to BACKUP YOUR FILES.

Be aware that if you delete the plugin and still want to view the time spent column, it will be impossible due to the fact, that there will be no permission given.
This can be fixed by reverting the   RedmineRoot\app\views\issues\_list.rhtml  file

## Features

This plugin will enable you to show time spent column in issues query, and it will also secure access to it by allowing you to set permissions per user role to view it. In this column you will see all the time reported on given issue. 

In addition it will change the look of your roadmap bookmark and enable the time spent to be viewed there as well. This addition can be reverted by deleting   \time_spent_roadmap_plugin\app\views\projects\roadmap.rhtml
You can read more about roadmap modification features [here](http://github.com/GOYELLO/roadmap-upgrade/tree/master).

Pluin was tested with Redmine 0.83 and 0.84.



require_dependency 'query'

# Patches Redmine's Queries dynamically, adding the Deliverable
# to the available query columns
module SpentTimeQueryPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)

    base.send(:include, InstanceMethods)

    # Same as typing in the class 
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      base.add_available_column(QueryColumn.new(:spent_hours))
      
     # alias_method :redmine_available_filters, :available_filters
     # alias_method :available_filters, :time_spent_available_filters
    end

  end
  
  module ClassMethods
    
    # Setter for +available_columns+ that isn't provided by the core.
    def available_columns=(name)
      self.available_columns = (name)
    end

    # Method to add a column to the +available_columns+ that isn't provided by the core.
    def add_available_column(column)
      self.available_columns << (column)
    end
  end
  
  module InstanceMethods
    
    # Wrapper around the +available_filters+ to add a new Deliverable filter
     def budget_available_filters
        @available_filters = redmine_available_filters
        
        if project
           filters = { "spent_time" => { :type => :list_optional, :order => 15}}
          return @available_filters.merge(filters)
        end
      end    
    end
end
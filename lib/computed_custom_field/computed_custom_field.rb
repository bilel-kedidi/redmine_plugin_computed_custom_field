module ComputedCustomField
  def self.patch_models
    models = [
      Enumeration, Group, Issue, Project,
      TimeEntry, User, Version
    ]
    models << Expense if defined?(Expense)
    models << Subexpense
    models << Invoice if defined?(Invoice)
    models << InvoicePayment if defined?(InvoicePayment)
    models << InvoiceLine if defined?(InvoiceLine)
    models << Contact if defined?(Contact)
    models << Deal if defined?(Deal)
    models << ProductLine if defined?(ProductLine)
    models << Note if defined?(Note)
    models << Account if defined?(Account)
    models << Person if defined?(Person)
    models << WkAttendance if defined?(WkAttendance)
    models << Wktime if defined?(Wktime)


    models.each do |model|
      if model.included_modules
              .exclude?(ComputedCustomField::ModelPatch)
        model.send :include, ComputedCustomField::ModelPatch
      end
    end
  end
end

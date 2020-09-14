class Dispatcher < Person
    extend Enumerize
    field :dispatcher_role
    enumerize :dispatcher_role, in: [:superadmin, :event_admin, :dispatcher, :read_only], default: :read_only
    belongs_to :active_event, class_name: "Event", optional: true
end
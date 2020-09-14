class Rider < Person
    extend Enumerize
    field :rider_type
    enumerize :rider_type, in: [:player, :coach, :executive, :vip], default: :player
    belongs_to :active_event, class_name: "Event", optional: true
    # TODO: Add authentication
end
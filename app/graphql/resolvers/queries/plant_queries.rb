module Resolvers
  module Queries
    module PlantQueries
      class GetPlant < GraphQL::Function
        description 'Get an Plant by id'
        type Types::PlantType

        argument :id, !types.ID

        def call(obj, args, ctx)
          Plant.find(args[:id])
        end
      end

      class GetPlants < GraphQL::Function
        description 'Get multiple Plants by ids'
        type types[Types::PlantType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          Plant.find(args[:ids])
        end
      end

      class GetAllPlants < GraphQL::Function
        description 'Get all Plants.
          Args:
            name: String
            filter: {
              shapeIds: [ID],
              groundTypeIds: [ID],
              periodicityIds: [ID],
              typeId: ID,
              phLow: Float, //NEED MORE TESTS
              phHigh: Float, //NEED MORE TESTS
              rusticityLow: Integer,
              rusticityHigh: Integer,
              waterNeedLow: Integer,
              waterNeedHigh: Integer,
              sunNeedLow: Integer,
              sunNeedHigh: Integer,
              blossomingLow: Integer, //NOT IMPLEMENTED
              blossomingHigh: Integer, //NOT IMPLEMENTED
              color: [String], //NOT IMPLEMENTED
            }
          '
        type Types::PlantType.connection_type

        argument :name, !types.String
        argument :filters, Types::PlantFilterType

        def call(obj, args, ctx)
          plants = Plant.where("plants.name ilike ?", "%#{args[:name]}%")
          filters = args[:filters]

          if filters[:typeId].present?
            plants = plants.where(type_id: filters[:typeId])
          end
          if filters[:phLow].present? && filters[:phHigh].present?
            plants = plants.where("plants.ph_range_low < ? AND plants.ph_range_high > ?", filters[:phLow], filters[:phHigh])
          end
          if filters[:rusticityLow].present? && filters[:rusticityHigh].present?
            plants = plants.where("plants.rusticity > ? AND plants.rusticity < ?", filters[:rusticityLow], filters[:rusticityHigh])
          end
          if filters[:waterNeedLow].present? && filters[:waterNeedHigh].present?
            plants = plants.where("plants.water_need > ? AND plants.water_need < ?", filters[:waterNeedLow], filters[:waterNeedHigh])
          end
          if filters[:sunNeedLow].present? && filters[:sunNeedHigh].present?
            .where("plants.sun_need > ? AND plants.sun_need < ?", filters[:sunNeedLow], filters[:sunNeedHigh])
          end

          if filters[:shapeIds].present?
            plants = plants.joins(:shapes)
              .where(shapes: {uuid: filters[:shapesIds]})
              .group("plants.id")
              .having('count(plants.id) >= ?', filters[:shapesIds].size)
          end

          if filters[:groundTypeIds].present?
            plants = plants.joins(:ground_types)
              .where(ground_types: {uuid: filters[:groundTypeIds]})
              .group("plants.id")
              .having('count(plants.id) >= ?', filters[:groundTypeIds].size)
          end

          if filters[:periodicityIds].present?
            plants = plants.joins(:periodicities)
              .where(periodicities: {uuid: filters[:periodicityIds]})
              .group("plants.id")
              .having('count(plants.id) >= ?', filters[:periodicityIds].size)
          end

          plants.order(:name)
        end
      end
    end
  end
end

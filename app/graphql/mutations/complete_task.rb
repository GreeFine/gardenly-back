class Mutations::CompleteTask < Mutations::BaseMutation
  argument :id, ID, required: true

  field :task, Types::TaskType, null: true
  field :errors, [String], null: false

  def resolve(arguments)
    task = Task.find(arguments[:id])
    task.status = "Done"

    if task.save
      {
        task: task,
        errors: [],
      }
    else
      {
        task: nil,
        errors: session.errors.full_messages
      }
    end
  end
end

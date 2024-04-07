namespace :dev do
  desc "Destroy, create, migrate, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "db:seed"
      # "dev:sample_data"
    ] do
      puts "done"
    end

  desc "Add sample data"
  task sample_data: :environment do
  end

end

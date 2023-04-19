Dir.glob(Rails.root.join("db/seeds/*.rb")) do |file|
  load(file)
end

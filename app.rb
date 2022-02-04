require 'colored'

require 'sqlite3'
DB = SQLite3::Database.new('database.db')
DB.results_as_hash = true

require_relative 'doctor'
require_relative 'doctors_controller'
require_relative 'doctors_view'
require_relative 'router'

doctors_controller = DoctorsController.new

router = Router.new(doctors_controller)

system "clear"
router.run

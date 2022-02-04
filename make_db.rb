require 'sqlite3'

dir = File.dirname(__FILE__)
db = SQLite3::Database.new(File.join(dir, 'database.db'))

db.execute('DROP TABLE IF EXISTS `doctors`;')
create_statement = "
CREATE TABLE `doctors` (
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT,
  `age` INTEGER,
  `specialty` TEXT
);"
db.execute(create_statement)

db.execute('INSERT INTO `doctors` (`name`, `age`, `specialty`) VALUES ("Dr. Who", 42, "Time Travel");')
db.execute('INSERT INTO `doctors` (`name`, `age`, `specialty`) VALUES ("Gregory House", 62, "Diagnostic Medicine");')

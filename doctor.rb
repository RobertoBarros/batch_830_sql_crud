class Doctor
  attr_accessor :id, :name, :age, :specialty

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
    @specialty = attributes[:specialty]
  end


  # Método de classe
  # Retorna um array com todas as instâncias de doctors
  def self.all
    results = DB.execute('SELECT * FROM doctors;')
    doctors = []
    results.each do |result|
      doctors << Doctor.new(id: result['id'],
                            name: result['name'],
                            age: result['age'],
                            specialty: result['specialty'])
    end
    doctors
  end

  # Método de class
  # Retorna uma única instância do doctor pelo id do parâmetro
  def self.find(id)
    result = DB.execute('SELECT * FROM doctors WHERE id=?', id).first
    Doctor.new(id: result['id'],
               name: result['name'],
               age: result['age'],
               specialty: result['specialty'])


  end

  # Método de Instância
  # Decide se é um create ou update.
  # Se tem @id é um registro que já existe no database então você quer atualizar
  # Se não tem @id você quer adicionar um novo doctor no database
  def save
    @id ? update : create
  end

  # Método de Instância
  # Apaga um registro pelo @id da instância
  def destroy
    DB.execute('DELETE FROM doctors WHERE id=?', @id)
  end

  private

  # Método de instância privado chamado pelo save
  def create
    query = <<-SQL
      INSERT INTO doctors
      (name, age, specialty) VALUES (?,?,?)
    SQL

    DB.execute(query, @name, @age, @specialty)
    @id = DB.last_insert_row_id
  end

  # Método de instância privado chamado pelo save
  def update
    query = <<-SQL
      UPDATE doctors
      SET name=?, age=?, specialty=?
      WHERE id=?
    SQL

    DB.execute(query, @name, @age, @specialty, @id)
  end
end

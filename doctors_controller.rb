class DoctorsController
  def initialize
    @view = DoctorsView.new
  end

  def list
    list_doctors # ver método private abaixo
  end


  def create
    # Pergunta name, age, specialty
    name = @view.ask_name
    age = @view.ask_age
    specialty = @view.ask_specialty

    # Cria uma nova instância de doctor
    doctor = Doctor.new(name: name, age: age, specialty: specialty)

    # Salva a instância no database (Como não tem id é um create)
    doctor.save


    @view.info_created(doctor)
  end

  def update
    list_doctors
    id = @view.ask_id('update')

    # Retorna a instância de um doctor que já existe no database
    doctor = Doctor.find(id)

    # Pergunta e atualiza os atributos do model doctor
    doctor.name = @view.ask_name(doctor.name)
    doctor.age = @view.ask_age(doctor.age)
    doctor.specialty = @view.ask_specialty(doctor.specialty)

    # Salva a instância no database (Como tem id é um update)
    doctor.save

    @view.info_updated(doctor)
  end

  def destroy
    list_doctors
    id = @view.ask_id('remove')

    # Retorna a instância de um doctor que já existe no database
    doctor = Doctor.find(id)

    doctor.destroy # Remove o registro do database
    @view.info_removed(doctor)
  end

  private

  def list_doctors
    # all retorna um array com todas as instâncias de doctors do database
    doctors = Doctor.all
    @view.list(doctors) # Exibe para o usuário
  end
end

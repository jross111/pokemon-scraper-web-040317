require 'pry'

class Pokemon

  attr_accessor :hp, :id, :name, :type, :db



  # def initialize(poke_hash)
  #   @name = poke_hash[:name]
  #   @type = poke_hash[:type]
  #   @db = poke_hash[:db]
  #   @id = poke_hash[:id]
  # end

  # def initialize(id:, name:, type:, db:)
  #   @id = id
  #   @name = name
  #   @type = type
  #   @db = db
  # end

  def initialize(poke_hash)
    poke_hash.each do |k, v|
      self.send(("#{k}="), v)
    end
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
  end

  def self.find(poke_id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?;", poke_id).flatten
    # binding.pry
    Pokemon.new(id: pokemon_info[0],name: pokemon_info[1],type: pokemon_info[2], hp: pokemon_info[3])

  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, self.id)
  end
end

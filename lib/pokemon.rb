class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name=nil, type=nil, db=nil, hp = 60)
    @id, @name, @type, @db, @hp = id, name, type, db, hp
  end

  def alter_hp(hp, db)
    self.hp = hp
    alter_sql = "UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}"
    db.execute(alter_sql)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    "You successfully saved #{name}!"
  end

  def self.find id_num, db
    poke_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(poke_info[0], poke_info[1], poke_info[2], db, poke_info[3])
  end

end

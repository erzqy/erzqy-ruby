#!/usr/bin/env ruby -wKU

GENDER_BOY = 'boy'
GENDER_GIRL = 'girl'
GENDER = [GENDER_BOY, GENDER_GIRL]

class Person
  attr_accessor :gender

  def initialize(name, gender)
    @gender = gender if GENDER.include?(gender) 
  end
end

class NoGirlfriend < Exception
  def initialize()
    @message = 'You haven\'t a Girlfriend'
  end

  def to_s
    return @message
  end
end

class NoMoney < Exception
  def initialize()
    @message = 'No money !'
  end

  def to_s
    return @message
  end  
end

class Boy < Person

  attr_accessor :girlfriend
  attr_accessor :money

  def initialize(name, girlfriend = '')
    super(name, GENDER_BOY)
    @girlfriend = girlfriend
    @money = 0
  end

  def getGirlName
    unless self.girlfriend.empty?
      return self.girlfriend
    else
      raise NoGirlfriend
    end
  end

  def viewPocket
    unless self.money <= 0
      return self.money
    else
      raise NoMoney
    end
  end

  def getHappiness
    puts "I've kind of money IDR #{self.viewPocket} "
    puts "and had a girlfriend, her name is #{self.getGirlName}"
  end
end

me = Boy.new('erzqy')
me.money = 1024000000
me.getHappiness
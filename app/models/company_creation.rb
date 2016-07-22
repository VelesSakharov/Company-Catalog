class Company_Creation < ApplicationRecord

  def new
  #initial
  end

  #create
  def create
  puts "in db"
  end
  #read
  def show
  puts "from db"
  end

  #update
  def update
  puts "in \ from db"
  end

  #delete
  def destroy
    puts "out of db"
  end

end
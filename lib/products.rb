class Product

#Product types are:
  #Televisions
  #Monitors
  #Headphones

  attr_accessor :type, :reviews

  def initialize(type)
    @type = type
  end

  def choice
    puts "#{@type}, excellent choice."
    puts " "
    puts "Here are the latest reviews:"

    # Reviews.all.each do |item|
    #   item.product == @type.to_s
    # end
    Reviews.latest_activity
  end
end
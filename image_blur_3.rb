
class Image
  def initialize(array)
    @array = array


  end

  def output_image
    for j in @array do 
      for k in j do
          print k
      end
      puts "\n"    
    end 
  end

  def blur(distance) 
    for i in 0..distance do
      blurred_image
    end
    return output_image
  end


  def blurred_image
    ones = Array.new
    @array.each_with_index do |rows, row|
       rows.each_with_index do |num, col|
          ones << [row, col] if num == 1
       end
    end

    num_rows = @array.size
    num_cols = @array[0].size

    ones.each do |row, col|
      @array[row-1][col]=1 if row-1 >= 0         
      @array[row+1][col]=1 if row+1 < num_rows  
      @array[row][col-1]=1 if col-1 >= 0         
      @array[row][col+1]=1 if col+1 < num_cols   
    end
    return output_image
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
p "---------------"
image.blurred_image
p "---------------"
image.blur(2)
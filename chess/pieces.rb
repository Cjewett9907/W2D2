class Piece
  attr_accessor :color, :emo
  def initialize(color, emo)
      @color = color
      @emo = emo
  end
    
end


class Queen < Piece
  def initialize(color, emo)
    
    super
    @emo = emo
  end
  
  # def move(start,end)
  # 
  # end
  
  
end

class King < Piece
  def initialize(color, emo)
    super
    @emo = emo
  end
  
  # def move(start,end)
  # 
  # end
  
  
end

class Bishop < Piece
  def initialize(color, emo)
    super
    @emo = emo
  end
  
  # def move(start,end)
  # 
  # end
  
  
end

class Knight < Piece
  def initialize(color, emo)
    super
    @emo = emo
  end
  
  # def move(start,end)
  # 
  # end
  
  
end

class Rook < Piece
  def initialize(color, emo)
    super
    @emo = emo
  end
  
  
  
  # def move(start,end)
  # 
  # end
  
  
end

class Pawn < Piece
  def initialize(color, emo)
    super
    @emo = emo
  end
  
  # def move(start,end)
  # 
  # end
  
  
end

class NilPiece < Piece
  def initialize(color, emo)
    super
    @emo = emo
  end
  
  # def move(start,end)
  # 
  # end
  
  
end
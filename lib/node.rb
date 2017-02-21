class Node

  attr_accessor :data,
                :left,
                :right,
                :depth

  def initialize(score, title)
    @data = {title => score}
    @left = nil
    @right = nil
    @depth = 0
  end

  def score
      data.values.first
  end

  def title
      data.keys.first
  end

  def insert(new_score, new_title)
    new_node = Node.new(new_score, new_title)
    if new_node.score < score && left.nil?
      self.left = new_node
      left.depth = depth + 1
    elsif new_node.score < score
      left.insert(new_score, new_title)
    elsif new_node.score > score && right.nil?
      self.right = new_node
      right.depth = depth + 1
    elsif new_node.score > score
      right.insert(new_score, new_title)
    else
      "Score exists! It will be ignored"
    end
  end

end

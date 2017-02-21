require_relative 'node'

class BinarySearchTree
  attr_reader   :root

  def initialize(score = nil, title = nil)
    @root = Node.new(score, title)
    @sorted_data = []
  end

  def insert(new_score, new_title)
    if @root.score.nil?
      @root = Node.new(new_score, new_title)
      @root.depth
    else
      @root.insert(new_score, new_title)
    end
  end

  def traverse(node=@root, &block)
    yield node
    traverse(node.left, &block) if node.left
    traverse(node.right, &block) if node.right
  end

  def include?(value)
    self.traverse do |node|
        if node.score == value
            return true
        end
    end
    return false
  end

  def depth_of(value)
    self.traverse do |node|
        if node.score == value
            return node.depth
        end
    end
    return nil
  end

  def max
    highest = Node.new(0, "")
    self.traverse do |node|
        if node.score > highest.score
            highest = node
        end
    end
    return highest.data
  end

  def min
    lowest = Node.new(100, "")
    self.traverse do |node|
        if node.score < lowest.score
            lowest = node
        end
    end
    return lowest.data
  end

  def sort(node=@root)
     sort(node.left) if node.left
       @sorted_data << node.data
     sort(node.right) if node.right
     @sorted_data
  end

  def count_nodes
      total_nodes = 0
      self.traverse do |node|
          total_nodes +=1
      end
      total_nodes
  end

  def health(level)
      report = []
      total_nodes = self.count_nodes.to_f
      self.traverse do |node|
          if node.depth == level
              children = count_children(node)
              report << [node.score, children, (children/total_nodes*100).to_i]
          end
      end
      report
  end

  def load(file)
    movie_file = File.open("../lib/#{file}", "r")
    movies = movie_file.read
    movie_file.close
    title_score_array = format(movies)
    title_score_array.each do |movie|
        self.insert(movie[0], movie[1])
    end
    puts title_score_array.length
  end

  def leaves
    leaves = 0
    self.traverse do |node|
      if node.left == nil && node.right == nil
        leaves += 1
      end
    end
    leaves
  end

  def height
    height = 0
    self.traverse do |node|
      if node.depth > height
        height += 1
      end
    end
    (height + 1)
  end

  private

  def count_children(node)
      children = 0
      self.traverse(node) do |node|
          children += 1
      end
      return children
  end

  def format(movies)
    movies_by_line = movies.split("\n")
    title_score_array = movies_by_line.map do |movie|
      movie.split(", ")
    end
    title_score_array.each { |movie| movie[0] = movie[0].to_i }
    return title_score_array
  end

end

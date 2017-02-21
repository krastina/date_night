require_relative "binary_search_tree"

tree = BinarySearchTree.new
puts "Loading binary search tree from file!"
tree.load('movies.txt')

puts "Welcome to date night!"
puts "Type 'commands' to see available tree methods."
puts "Type 'quit' to leave date night."

input = nil
until input == "quit"
    input = gets.chomp
    case input
        when "commands" then
            puts "You can: insert, include?, depth_of, max, min, sort, load, health, leaves, or height"
        when "depth_of"
            puts "Please enter movie score: "
            score = gets.chomp.to_i
            puts "The depth of #{score} is #{tree.depth_of(score)}"
        when "health"
            puts "Please indicate depth: "
            depth = gets.chomp.to_i
            puts "Reporting health at depth #{depth}: #{tree.health(depth)}"
        when "height"
            puts "Tree height is: #{height}"
        when "insert"
            puts "Please enter movie title: "
            title = gets.chomp
            puts "Please enter movie score: "
            score = gets.chomp.to_i
            puts "#{title} was inserted at depth #{tree.insert(score, title)}"
        when "leaves"
            puts "Total tree leaves: #{tree.leaves}"
        when "load"
            puts "Please provide file to be loaded: "
            file = gets.chomp
            puts "Total titles loaded: #{tree.load(file)}"
        when "max"
            puts "Maximum tree value is: #{tree.max}"
        when "min"
            puts "Minimum tree value is: #{tree.min}"
        when "sort"
            puts "Sorted tree: #{tree.sort}"
        when "include?"
            puts "What score are you interested in?"
            score = gets.chomp.to_i
            puts tree.include?(score) ? "Score found!" : "Score not found!"
        else
            puts "Could not understand command! Try again." unless input == "quit"
    end
end

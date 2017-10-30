require 'matrix'

# Manages operation on Sudoku
module Sudoku

  def self.validate(grid)
    board = Board.new(grid)
    board.solved?
  end

  # One board inside a sudoku game
  class Board

    VALID_CHUNK = (1..9).to_a.freeze
    BLOCK_SIZE = 3.freeze

    attr_reader :grid

    def initialize(grid)
      @grid = grid
    end

    def solved?
      return false unless @grid
      (@grid + grid.transpose + build_blocks()).all? { |chunk| VALID_CHUNK == chunk }
    end

    private
    def build_blocks()
      matrix = Matrix.rows(@grid)
      num_blocks = @grid.size
      blocks = []

      (0...num_blocks).step(BLOCK_SIZE).each do |start_row|
        (0...num_blocks).step(BLOCK_SIZE).each do |start_col|
          num_rows = num_cols = BLOCK_SIZE
          blocks << matrix.minor(start_row, num_rows, start_col, num_cols).to_a.flatten
        end
      end
      blocks
    end

    def build_blocks_without_matrix(grid)
      num_blocks = grid.size
      blocks_per_row = blocks_per_col = num_blocks/ BLOCK_SIZE

      blocks = (0...num_blocks).map do |block_index|
        block = []
        row_offset = (block_index / blocks_per_row) * BLOCK_SIZE
        col_offset = (block_index % blocks_per_col) * BLOCK_SIZE

        (0...BLOCK_SIZE).each do |row_index|
          (0...BLOCK_SIZE).each do |col_index|
            row = row_index+row_offset
            col = col_index+col_offset
            block << grid[row][col]
          end
        end

        block
      end

      blocks
    end

  end

end

class AddStudioIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :studio, index: true, foreign_key: true
  end
end

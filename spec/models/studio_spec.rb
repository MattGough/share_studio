require 'rails_helper'

describe Studio, type: :model do
  it { is_expected.to have_many :reviews }
end

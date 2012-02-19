require 'spec_helper'

describe Spree::User do
  it { should have_one :supplier }

  it { should respond_to :has_supplier? }
end

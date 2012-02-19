require 'spec_helper'

describe Spree::Product do
  it { should have_one(:supplier_product).dependent(:destroy) }
  it { should have_one(:supplier).through(:supplier_product) }

  it { should respond_to :has_supplier? }
end

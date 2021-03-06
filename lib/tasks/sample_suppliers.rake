namespace :db do
  namespace :sample do
    desc "Create sample suppliers and randomly link to products"
    task :suppliers => :environment do
      @usa = Country.find_by_iso("US")
      @ca  = @usa.states.find_by_abbr("CA")

      count = Supplier.count
      puts "Creating Suppliers..."
      5.times{ |i|
        name = "Supplier #{count + i + 1}"
        supplier = Supplier.new(:name => name, :email => "#{name.parameterize}@example.com", :phone => "800-555-5555", :url => "http://example.com", :contact => "Somebody", :contact_phone => "555-555-5555")
        supplier.build_address(:firstname => name, :lastname => name, :address1 => "100 State St", :city => "Santa Barbara", :phone => "555-555-5555", :zipcode => "93101", :state_id => @ca.id, :country_id => @usa.id)
        print "*" if supplier.save
      }
      puts
      puts "#{Supplier.count - count} suppliers created"

      SupplierProduct.destroy_all

      puts "Randomly linking Products & Suppliers..."

      @supplier_ids = Supplier.select('id').all.map(&:id).shuffle
      @products     = Product.all
      count         = 0

      @products.each do |product|
        SupplierProduct.create(:product_id => product.id, :supplier_id => @supplier_ids[rand(@supplier_ids.length)])
        count += 1
        print "*"
      end

      puts
      puts "#{count} products linked."
    end
  end
end

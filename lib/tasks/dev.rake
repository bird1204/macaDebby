# encoding: utf-8
namespace :dev do
  # 透過執行 rake dev:build，就會自動清除 log 檔案，砍掉資料庫，執行 migrate，然後執行 rake dev:setup 建假資料
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", :setup ]

  desc "Setup system data"
  task :setup => :environment do
      # puts "Create system user"
      # u = User.new( :login => "root", :password => "password", :email => "root@example.com", :name => "管理員")
      # u.is_admin = true
      # u.save!

      puts "Create system product"
      ["紅","橙", "黃", "綠", "藍", "靛", "紫", "黑", "禮盒", "訂製"].each_with_index do |name,index|
        p = Product.new(:name => "#{name}卡龍", :intro => "美味噢這好美味", :desc => "美味噢這好美味", :price => 48, :discount => 95, 
                        :enabled => 1)
        p.is_top = true if index <= 2
        p.save!
      end

      puts "Create system product image"
      url = "http://img1.momoshop.com.tw/goodsimg/0001/786/352/1786352_Y.jpg?"
      3.times do
        pm = ProductImage.new(:name => "a", :title => "紅卡龍", :description => "買買買買買我啦", :url => url, :enabled => 1, :product_id => 1)
        pm.save!
      end

      3.times do
        pm = ProductImage.new(:name => "a", :title => "橙卡龍", :description => "買買買買買我啦", :url => url, :enabled => 1, :product_id => 2)
        pm.save!
      end
      
      puts "Create system employee"
      Employee.create(:email => "bb@sogi.com", :password => "19911204", :name => "GOD", :permission_id => 1, :enabled => true)
      Employee.create(:email => "bird1204@gmail.com", :password => "19911204", :name => "卡龍弟", :permission_id => 2, :enabled => true)

      puts "Create system permission"
      Permission.create(:type => "employee", :power => 0) #GOD
      Permission.create(:type => "employee", :power => 1) #HERO
      Permission.create(:type => "employee", :power => 2) #employee
      Permission.create(:type => "employee", :power => 3) #intern
      Permission.create(:type => "customer", :power => 0) #billionaire
      Permission.create(:type => "customer", :power => 1) #millionaire
      Permission.create(:type => "customer", :power => 2) #people
      Permission.create(:type => "customer", :power => 3) #kid   
      

  end
end
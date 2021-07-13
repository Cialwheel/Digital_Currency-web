class Admin::UsersController < ApplicationController
  layout "admin"
  def index
    @users = User.all
    @c = @users.count
  end

  def show
    @users = User.all
    @n=0
    @users.each do |user|
      if user.is_member == true
        @n = @n + 1
      end
    end
    @nprime = @users.count - @n

    @con = [@n,@nprime]
    colors = ['rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
                ]
    @data1 = {
        labels: ["会员","非会员"],
        datasets: [{
          label: "会员参考",
          data: @con.map{|t|t.to_i},
          backgroundColor: colors,
          borderWidth: 1
        }]
    }
  end

end

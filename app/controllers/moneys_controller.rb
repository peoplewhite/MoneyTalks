class MoneysController < ApplicationController
	
	#按月份顯示
	def monthly
		@this_month = ('2015/0'+params[:month]+'/01').to_date
		@next_month = ('2015/0'+(params[:month].to_i+1).to_s+'/01').to_date
		@monthly_costs = Money.where("created_at BETWEEN ? AND ?", @this_month, @next_month)
	end
	#按年份顯示
	def yearly
 		@this_year = (params[:year].to_s+'/01/01').to_date
 		@next_year = (params[:year].to_s+'/12/31').to_date
 		@yearly_costs = Money.where("created_at BETWEEN ? AND ?", @this_year, @next_year)
	end
	#按單日顯示
	
	# def daily
	# 	@moneys = Money.all
	# 	# @daily_costs = test_all_costs_in_day(4)
	# 	@daily_costs = all_costs_in_day
	# 	@seantest = params[:month]
	# end
	def daily
		
		if (params[:day].to_i < 10)
			@set_this_day = "0" + params[:day].to_s
		else
			@set_this_day = params[:day].to_s
		end

		if ((params[:day].to_i+1) < 10)
			@set_next_day = "0" + (params[:day].to_i+1).to_s
		else
			@set_next_day = (params[:day].to_i+1).to_s
		end
		
		@this_day = ('2015/01/'	+	@set_this_day).to_date
		@next_day = ('2015/01/'	+	@set_this_day).to_date
		@daily_costs = Money.where("created_at BETWEEN ? AND ?", @this_day, @next_day)
		# @seantest = params[:month]
	end

	def index
		@moneys = Money.all
		@today_sum = singleday_sum
	end

	def show
	end
	
	def edit
		@money = Money.find(params[:id])
	end
	
	def update
		@money = Money.find(params[:id])
		if @money.update(money_params)
			redirect_to moneys_path
		else
			render :edit
		end
	end

	
	def new
		@money = Money.new
	end
	
	def create
		@money = Money.create(money_params)
		if @money.save
			redirect_to moneys_path
		else
			render :new
			@seantest = "hello"
		end
	end
	
	def destroy
		@money = Money.find(params[:id])
		@money.destroy
		redirect_to moneys_path
	end

  def singleday_sum
  	sum2 = 0
  	@moneys.each do |money|
  		sum2 += money.cost
  	end
  	sum2
  end

  def all_costs_in_day
  	all_costs_inday = []	
  	@moneys.each do |money|
  		if money.created_at.strftime("%Y/%m/%d").to_s == "2015/02/04"
  			all_costs_inday << money
  		end
  	end
  	all_costs_inday
  end

  def test_all_costs_in_day whichday
  	all_costs_inday = []	
  	@moneys.each do |money|
  		if money.created_at.strftime("%Y/%m/%d").to_s == "2015/02/0"+whichday.to_s
  			all_costs_inday << money
  		end
  	end
  	all_costs_inday
  end

  def all_costs_in_month
  	all_costs_inmonth = []	
  	@moneys.each do |money|
  		if money.created_at.strftime("%Y/%m").to_s == "2015/02"
  			all_costs_inmonth << money
  		end
  	end
  	all_costs_inmonth
  end

  def all_costs_in_year
  	all_costs_inyear = []	
  	@moneys.each do |money|
  		if money.created_at.strftime("%Y").to_s == "2015"
  			all_costs_inyear << money
  		end
  	end
  	all_costs_inyear
  end


	private
	def money_params
		params.require(:money).permit(:title, :description, :cost, :feel, :paytype)
	end

end

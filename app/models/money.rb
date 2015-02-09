class Money < ActiveRecord::Base

	#確保資料為必填，不可為空白
	# validates_presence_of :title, :description, :cost, :feel, :paytype
	# validates_presence_of :title, :message => "不可空白"
	validates :title, presence: true
	#確保為數字，且必須為integer
	# validates_numericality_of :cost, :only_integer => true

	#確保paytype的值只能為cash或card
	# validates_inclusion_of :paytype, :in => ["cash", "card"]
end

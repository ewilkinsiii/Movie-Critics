class User < ActiveRecord::Base
  #ratyrate_rater
  has_many :ratings
  has_many :comments
  belongs_to :genes_alger
  #attr_accessible :avatar
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create
    @user = User.create( params[:user] )
  end
end

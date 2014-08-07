class Movie < ActiveRecord::Base

  attr_accessor :movieposter

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  mount_uploader :movieposter, MoviePosterUploader

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size
  end


  def self.search(params)
    @search = Movie.all
    if (params[:category] == "Title") && (params[:search].present?)
      search = @search.where('title LIKE ?', "%#{params[:search]}%")
      if params[:runtime] != "any"
        return search.where('runtime_in_minutes BETWEEN ? AND ?', "#{params[:runtime].split.first.to_i}","#{params[:runtime].split.last.to_i}") if params[:runtime] != "any"
      end
      return search
    elsif (params[:category] == "Director") && (params[:search].present?)
      search = @search.where('director LIKE ?', "%#{params[:search]}%")
      if params[:runtime] != "any"
        return search.where('runtime_in_minutes BETWEEN ? AND ?', "#{params[:runtime].split.first.to_i}","#{params[:runtime].split.last.to_i}")  
      end  
      return search
    else
     search = @search.where('title OR director LIKE ?', "%#{params[:search]}%")
    end
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end

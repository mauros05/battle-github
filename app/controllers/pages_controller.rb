require "json"
require "open-uri"

class PagesController < ApplicationController
  def home
  end

  def search
    if params[:user1].present? && params[:user2].present?
      user1 = params[:user1]
      results1 = json_search(user1)
      score1 = score(results1)

      user2 = params[:user2]
      results2 = json_search(user2)
      score2 = score(results2)
      redirect_to root_path(results1: results1, score1: score1, results2: results2, score2: score2)

    elsif params[:user1].empty? || params[:user2].empty?
      redirect_to root_path(messeage: "Users can not be blank 🤨")
    end
  end

  private

  def json_search(user)
    user_search = URI.open("https://api.github.com/users/#{user}")
    json = JSON.parse(user_search.read)
    json.values_at('public_repos', 'followers', 'following', 'login', 'avatar_url')
  end

  def score(results)
    results[0] + results[1] * results[2]
  end
end

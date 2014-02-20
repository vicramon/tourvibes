require 'heroku-api'

class HerokuDomainManager

  attr_accessor :tour

  def self.update(tour)
    new(tour).update
  end

  def initialize(tour)
    self.tour = tour
  end

  def update
    return unless needs_update?
    delete_previous_domain
    add_new_domain
  end

  private

  def needs_update?
    in_production? && tour.custom_domain_changed? && tour.valid?
  end

  def in_production?
    Rails.env.production? or Rails.env.staging?
  end

  def client
    @client ||= Heroku::API.new(api_key: ENV.fetch('HEROKU_API_KEY'))
  end

  def previous_domain
    tour.custom_domain_was
  end

  def delete_previous_domain
    return if previous_domain.blank?
    remove_domain previous_domain
    remove_domain "www." + previous_domain
  end

  def add_new_domain
    return if tour.custom_domain.blank?
    tour.custom_domain.sub! /\Awww\./, ""
    add_domain tour.custom_domain
    add_domain "www." + tour.custom_domain
  end

  def app_name
    'realtour'
  end

  def remove_domain(domain)
    client.delete_domain app_name, domain
  rescue Heroku::API::Errors::NotFound
  end

  def add_domain(domain)
    return if tour.errors[:custom_domain].any?
    client.post_domain app_name, domain
  rescue Heroku::API::Errors::RequestFailed => e
    tour.errors.add :custom_domain, :invalid
  end

end

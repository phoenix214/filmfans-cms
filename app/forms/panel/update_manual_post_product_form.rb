class Panel::UpdateManualPostProductForm
  include ActiveModel::Model

  attr_accessor(
      :manual_post_products,
      :id
  )

  def initialize(attributes = {}, form_params = {})
    if attributes.blank?
      super(defaults.merge(form_params))
    else
      super(attributes.merge(form_params))
    end
  end

  def manual_post_products_attributes=(attributes)
    @manual_post_products = set_manual_post_products(attributes)
  end

  def self.association(association, klass)
    @@attributes ||= {}
    @@attributes[association] = klass
  end

  def self.reflect_on_association(association)
    data = {klass: @@attributes[association]}
    OpenStruct.new data
  end

  association :manual_post_products, ManualPostProduct

  def set_manual_post_products(attributes)
    attributes.map do |i, params|
      ManualPostProduct.new(params.except(:_destroy)) if params[:_destroy] == 'false'
    end.compact
  end

  def defaults
    {manual_post_products: []}
  end
end
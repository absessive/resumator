class I18n::Backend::KeyValue
  def lookup(locale, key, scope = [], options = {})
    key   = normalize_flat_keys(locale, key, scope, options[:separator])
    value = @store["#{locale}.#{key}"]
    value = ActiveSupport::JSON.decode("[\"" + value + "\"]")[0] if value
    value.is_a?(Hash) ? value.deep_symbolize_keys : value
  end
end
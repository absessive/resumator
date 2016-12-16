#/ locale.rb

require "#{Rails.root}/lib/monkey_patches/localization_patch"

$redis = Redis::Namespace.new("resumator", redis: Redis.new)
I18n.backend = I18n::Backend::Chain.new(I18n::Backend::KeyValue.new($redis), I18n.backend)

# Load all the keys from locale file into redis

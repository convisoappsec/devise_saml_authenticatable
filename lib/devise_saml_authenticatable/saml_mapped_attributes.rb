module SamlAuthenticatable
  class SamlMappedAttributes
    def initialize(attributes, attribute_map)
      @attributes = attributes
      @attribute_map = attribute_map
      @inverted_attribute_map = @attribute_map.invert
    end

    def saml_attribute_keys
      @attribute_map.keys
    end

    def resource_keys
      @attribute_map.values
    end

    def value_by_resource_key(key)
      result = nil
      @attributes.all.each do |response_attr|
        result = response_attr[1] if @attribute_map[response_attr[0]] == key.to_s
      end
      result
    end
  end
end

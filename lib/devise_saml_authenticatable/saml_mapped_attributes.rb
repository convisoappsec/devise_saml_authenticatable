module SamlAuthenticatable
  class SamlMappedAttributes
    def initialize(attributes, attribute_map)
      @attributes = attributes
      @attribute_map = attribute_map
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
        result = response_attr[1] if @attribute_map.fetch(response_attr[0])
      end
      return result
    end
  end
end

module Rhc
  module Rest
    class Key
      include Rest
      attr_reader :name, :type, :content
      def initialize(args)
        @name = args[:name] || args["name"]
        @type = args[:type] || args["type"]
        @content = args[:content] || args["content"]
        @links = args[:links] || args["links"]
      end
      
      def update(args)
        url = @@end_point + @links['UPDATE']['href']
        method =  @links['UPDATE']['method']
        payload = args
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers, :payload => payload)
        return send(request)
      end

      def destroy
        url = @@end_point + @links['DELETE']['href']
        method =  @links['DELETE']['method']
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers)
        return send(request)
      end
      alias :delete :destroy
    end
  end
end
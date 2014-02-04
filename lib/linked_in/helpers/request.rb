module LinkedIn
  module Helpers

    module Request

      protected

      def get(path, query_params, headers = {})
        response = connection.get(path, query_params, headers)
        response.body
      end

      def post(path, body='', options={})
        response = connection.post(path, body, options)
        response
      end

      def put(path, body, options={})
        response = connection.put(path, body, options)
        response
      end

      def delete(path, options={})
        response = connection.delete(path, options)
        response
      end
    end
  end
end

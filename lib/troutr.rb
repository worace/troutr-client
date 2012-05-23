require "faraday"
require "json"

# worace token: BqTyLCMX7Ystx7kAPNCw
# TOKEN FOR 'chefpierre': uYonfoXSLiphAzr2Gxqv
module Troutr
  class Client
    def initialize(options={})
      @conn = Faraday.new(:url => "http://api.lvh.me:3000")

      if token = options[:token]
        @token = token
      end
      @options = options

    end

    def get_feed(display_name)
      resp = @conn.get do |req|
        req.url "/feeds/#{display_name}.json"
        req.params['token'] = @token
        req.headers['Content-Type'] = 'application/json'
      end
      [resp.status, resp.body]
    end

    def create_text_item(display_name, body)
      attr_hash = {:type=> "TextItem", :body => body}

      resp = @conn.post do |req|
        req.url "/feeds/#{display_name}/items.json"
        req.params['token'] = @token
        req.params['body'] = JSON.dump(attr_hash)
        req.headers['Content-Type'] = 'application/json'
      end
      [resp.status, resp.body]
    end

    def create_link_item(display_name, link_url, comment=nil)
      attr_hash = {:type=> "LinkItem", :link_url => link_url}
      attr_hash[:comment] = comment if comment

      resp = @conn.post do |req|
        req.url "/feeds/#{display_name}/items.json"
        req.params['token'] = @token
        req.params['body'] = JSON.dump(attr_hash)
        req.headers['Content-Type'] = 'application/json'
      end
      [resp.status, resp.body]
    end

    def create_image_item(display_name, image_url, comment=nil)
      attr_hash = {:type=> "ImageItem", :image_url => image_url}
      attr_hash[:comment] = comment if comment

      resp = @conn.post do |req|
        req.url "/feeds/#{display_name}/items.json"
        req.params['token'] = @token
        req.params['body'] = JSON.dump(attr_hash)
        req.headers['Content-Type'] = 'application/json'
      end
      [resp.status, resp.body]
    end

    def create_github_item(display_name, event_json)
      event_hash = JSON.parse(event_json)
      body_json = JSON.dump({type: "GithubItem", event: event_hash})
      resp = @conn.post do |req|
        req.url "/feeds/#{display_name}/items.json"
        req.params['token'] = @token
        req.params['body'] = body_json
        req.headers['Content-Type'] = 'application/json'
      end
      [resp.status, resp.body]
    end

    def retrout_item(display_name, item_id)
      resp = @conn.post do |req|
        req.url "/feeds/#{display_name}/stream_items/#{item_id}/refeeds.json"
        req.params['token'] = @token
        req.headers['Content-Type'] = 'application/json'
        puts req
      end
      [resp.status, resp.body]
    end
  end
end

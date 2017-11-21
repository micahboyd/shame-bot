# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Pins
          #
          # Pins an item to a channel.
          #
          # @option options [channel] :channel
          #   Channel to pin the item in.
          # @option options [file] :file
          #   File to pin.
          # @option options [Object] :file_comment
          #   File comment to pin.
          # @option options [Object] :timestamp
          #   Timestamp of the message to pin.
          # @see https://api.slack.com/methods/pins.add
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/pins/pins.add.json
          def pins_add(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('pins.add', options)
          end

          #
          # Lists items pinned to a channel.
          #
          # @option options [channel] :channel
          #   Channel to get pinned items for.
          # @see https://api.slack.com/methods/pins.list
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/pins/pins.list.json
          def pins_list(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('pins.list', options)
          end

          #
          # Un-pins an item from a channel.
          #
          # @option options [channel] :channel
          #   Channel where the item is pinned to.
          # @option options [file] :file
          #   File to un-pin.
          # @option options [Object] :file_comment
          #   File comment to un-pin.
          # @option options [Object] :timestamp
          #   Timestamp of the message to un-pin.
          # @see https://api.slack.com/methods/pins.remove
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/pins/pins.remove.json
          def pins_remove(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('pins.remove', options)
          end
        end
      end
    end
  end
end

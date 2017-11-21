# This file was auto-generated by lib/tasks/web.rake

desc "Get info on your team's Slack channels, create or archive channels, invite users, set the topic and purpose, and mark a channel as read."
command 'channels' do |g|
  g.desc 'Archives a channel.'
  g.long_desc %( Archives a channel. )
  g.command 'archive' do |c|
    c.flag 'channel', desc: 'Channel to archive.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_archive(options))
    end
  end

  g.desc 'Creates a channel.'
  g.long_desc %( Creates a channel. )
  g.command 'create' do |c|
    c.flag 'name', desc: 'Name of channel to create.'
    c.flag 'validate', desc: 'Whether to return errors on invalid channel name instead of modifying it to meet the specified criteria.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_create(options))
    end
  end

  g.desc 'Fetches history of messages and events from a channel.'
  g.long_desc %( Fetches history of messages and events from a channel. )
  g.command 'history' do |c|
    c.flag 'channel', desc: 'Channel to fetch history for.'
    c.flag 'inclusive', desc: 'Include messages with latest or oldest timestamp in results.'
    c.flag 'latest', desc: 'End of time range of messages to include in results.'
    c.flag 'oldest', desc: 'Start of time range of messages to include in results.'
    c.flag 'unreads', desc: 'Include unread_count_display in the output?.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_history(options))
    end
  end

  g.desc 'Gets information about a channel.'
  g.long_desc %( Gets information about a channel. )
  g.command 'info' do |c|
    c.flag 'channel', desc: 'Channel to get info on.'
    c.flag 'include_locale', desc: 'Set this to true to receive the locale for this channel. Defaults to false.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_info(options))
    end
  end

  g.desc 'Invites a user to a channel.'
  g.long_desc %( Invites a user to a channel. )
  g.command 'invite' do |c|
    c.flag 'channel', desc: 'Channel to invite user to.'
    c.flag 'user', desc: 'User to invite to channel.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_invite(options))
    end
  end

  g.desc 'Joins a channel, creating it if needed.'
  g.long_desc %( Joins a channel, creating it if needed. )
  g.command 'join' do |c|
    c.flag 'name', desc: 'Name of channel to join.'
    c.flag 'validate', desc: 'Whether to return errors on invalid channel name instead of modifying it to meet the specified criteria.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_join(options))
    end
  end

  g.desc 'Removes a user from a channel.'
  g.long_desc %( Removes a user from a channel. )
  g.command 'kick' do |c|
    c.flag 'channel', desc: 'Channel to remove user from.'
    c.flag 'user', desc: 'User to remove from channel.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_kick(options))
    end
  end

  g.desc 'Leaves a channel.'
  g.long_desc %( Leaves a channel. )
  g.command 'leave' do |c|
    c.flag 'channel', desc: 'Channel to leave.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_leave(options))
    end
  end

  g.desc 'Lists all channels in a Slack team.'
  g.long_desc %( Lists all channels in a Slack team. )
  g.command 'list' do |c|
    c.flag 'cursor', desc: "Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first 'page' of the collection. See pagination for more detail."
    c.flag 'exclude_archived', desc: 'Exclude archived channels from the list.'
    c.flag 'exclude_members', desc: 'Exclude the members collection from each channel.'
    c.flag 'limit', desc: "The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_list(options))
    end
  end

  g.desc 'Sets the read cursor in a channel.'
  g.long_desc %( Sets the read cursor in a channel. )
  g.command 'mark' do |c|
    c.flag 'channel', desc: 'Channel to set reading cursor in.'
    c.flag 'ts', desc: 'Timestamp of the most recently seen message.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_mark(options))
    end
  end

  g.desc 'Renames a channel.'
  g.long_desc %( Renames a channel. )
  g.command 'rename' do |c|
    c.flag 'channel', desc: 'Channel to rename.'
    c.flag 'name', desc: 'New name for channel.'
    c.flag 'validate', desc: 'Whether to return errors on invalid channel name instead of modifying it to meet the specified criteria.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_rename(options))
    end
  end

  g.desc 'Retrieve a thread of messages posted to a channel'
  g.long_desc %( Retrieve a thread of messages posted to a channel )
  g.command 'replies' do |c|
    c.flag 'channel', desc: 'Channel to fetch thread from.'
    c.flag 'thread_ts', desc: "Unique identifier of a thread's parent message."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_replies(options))
    end
  end

  g.desc 'Sets the purpose for a channel.'
  g.long_desc %( Sets the purpose for a channel. )
  g.command 'setPurpose' do |c|
    c.flag 'channel', desc: 'Channel to set the purpose of.'
    c.flag 'purpose', desc: 'The new purpose.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_setPurpose(options))
    end
  end

  g.desc 'Sets the topic for a channel.'
  g.long_desc %( Sets the topic for a channel. )
  g.command 'setTopic' do |c|
    c.flag 'channel', desc: 'Channel to set the topic of.'
    c.flag 'topic', desc: 'The new topic.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_setTopic(options))
    end
  end

  g.desc 'Unarchives a channel.'
  g.long_desc %( Unarchives a channel. )
  g.command 'unarchive' do |c|
    c.flag 'channel', desc: 'Channel to unarchive.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_unarchive(options))
    end
  end

  g.desc 'This method returns the ID of a team channel.'
  g.long_desc %( This method returns the ID of a team channel. )
  g.command 'id' do |c|
    c.flag 'channel', desc: 'Channel to get ID for, prefixed with #.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_id(options))
    end
  end
end
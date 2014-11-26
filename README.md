## gctools-rails

Logs the amount of time spent in the MRI garbage collector to the Rails controller log. For example:

```
Completed 200 OK in 631ms (Views: 22.1ms | ActiveRecord: 18.7ms | GC=167.0ms | Search=0.0ms | Redis=2 | Memcache=7 | master-queries=3 | shard_0-queries=20 | shop_name=shop1.myshopify.io  | dest_host=shop1.myshopify.io  | pid=45776  | shop_id=1 | shard_id=0 | request_id=cfec5667-8f0b-4b11-b676-6300083bd04f | session_id=20ee8aefeeeae62ece61f6510eed6ac6446723cb315659084f760488bcac1857 | ssl=false | rev=1 )
```

### Install

Add the following to your Gemfile:

```ruby
gem 'gctools-rails'
```

### Notes

gctools-rails cannot be used at the same time as the [gctools logger](https://github.com/tmm1/gctools/blob/master/lib/gctools/logger.rb), as they both use `GCProf.after_gc_hook`.
